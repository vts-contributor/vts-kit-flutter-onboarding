@Library('jenkins-shared-lib')_
import groovy.transform.Field

@Field def useImage = true
@Field def useArtifact = false
@Field def isBackend = false

// ------------------------------------ VTS KIT ----------------------------------------

def initVTSKit() {
    // Load environment
    try {
        // Load remote environment
        if (env.remoteConfigFile != null && env.remoteConfigFile != '') {
            try {
                echo 'Load remote environment: Loading'
                configFileProvider([configFile(fileId: "${env.remoteConfigFile}", targetLocation: 'cicd/')]) {
                    load "cicd/${env.remoteConfigFile}"
                    echo 'Load remote environment: Loaded'
                }
            } catch (Exception e) {
                echo 'Load remote environment: Error'
            }
        }
    } catch (Exception e) {
        echo 'Load environment: Error'
    }

    // Extra project environments
    env.gitlabUrl = sh(script: "echo ${env.gitlabSourceRepoHttpUrl} | cut -d/ -f1-3", returnStdout:true).trim()

    def project = getProject()
    env.gitProjectApiUrl= "${env.gitlabUrl}/api/v4/projects/${project.id}"

    // Compability fix
    env.GITLAB_TOKEN_CREDENTIALS = env.gitTokenSecret
    env.GITLAB_PROJECT_API_URL = env.gitProjectApiUrl
    env.harborProject = env.harborFolder

    // Dump environments
    echo 'Environments:'
    sh 'env'
}

def getProject() {
    def current = ""
    withCredentials([string(credentialsId: "${env.gitTokenSecret}", variable: 'token')]) {
        def response = httpRequest([
            acceptType: 'APPLICATION_JSON',
            httpMode: 'GET',
            contentType: 'APPLICATION_JSON',
            customHeaders: [
                [name: 'Private-Token', value: token]
            ],
            url: "${env.gitlabUrl}/api/v4/projects?search=${env.gitlabSourceRepoName}"
        ])
        def projects = jenkinsfile_utils.jsonParse(response.content)
        for (project in projects) {
            if (project['web_url'] == env.gitlabSourceRepoHomepage) {
                current = project
                return
            }
        }
        return
    }
    if (current == "") {
        error "Unable to find project from gitlab API"
    } else {
        return current
    }
}


// ------------------------------------ PRE DEFINED -------------------------------------
// WARNING! DO NOT MODIFY NAME/PARAMS OF ORIGINAL FUNCTIONS

def getServiceList(){
    def listService = []
    return listService
}

def buildService() {
    stage('Build service') {
        sh """
            sh cicd/scripts/dev-build-script.sh
        """
    }
}

def unitTestAndCodeCoverage(buildType) {
    stage("Checkout source code"){
        jenkinsfile_utils.checkoutSourceCode(buildType)
    }
    stage("Unit Test & Code Coverage") {
        echo "Not implemented Unit test"
    }
}

def deployDevTest(version) {
    echo "Deploy to development server"
    echo "Test server: ${env.imageRegistry}"
    echo "Version to deploy: $version"
	env.imageName = "${env.harborServer}/${env.harborProject}/${env.appName}:${version}"
	withCredentials([file(credentialsId: "${env.devKubeConfigFileSecret}", variable: 'kubeconfig')]){
		sh """
			sh cicd/scripts/dev-deploy-script.sh $kubeconfig
		"""
	}
}

def deployProduct(service,version) {}

def fortifyScan() {
    echo "Fortify scan"
    jenkinsfile_utils.fortifyScanStage(
        [
            serviceName : "${env.appName}",
            sourcePathRegex : '\\apps\\*|\\libs\\*'
        ]
    )
}

def pushImage() {
    echo "Push image to harbor"
    jenkinsfile_utils.pushImageToHarbor(
        [
            repo_name : "${env.harborProject}",
            image_name : "${env.appName}"
        ]
    )
}

def pushArtifact() {
    echo "Not implemented pushArtifact()"
    return true
}

def selfCheckService() {
    echo "Not implemented selfCheckService()"
    return true
}

def rollback() {
    echo "Not implemented rollback()"
    return true
}

def autotestProduct() {
    echo "Not implemented autotestProduct()"
    return true
}

return this