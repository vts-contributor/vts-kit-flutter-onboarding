'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "7acb80d9557f79871c2fa7fc2ff8a40a",
"assets/FontManifest.json": "8a518ce4db37f4062cca291d1b74e5b0",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/images/image.png": "41fe795808422e88254bc85da04ed2fa",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansPro.ttf": "94d097726bac3e682cf58866199e06b1",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProBbook.ttf": "321f8c1b66d83e121cfbbd4bb11f6826",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProBbookItalic.ttf": "561df9383e156fe25e7495356023a26a",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProBlack.ttf": "d0989de451d72c02f485b1e40f0fa715",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProBlackItalic.ttf": "12609abc5c67d6cded4257cec5a228dd",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProBold.ttf": "1dcd8e6cd0eb1fd650ea920ffe6727fb",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProBoldItalic.ttf": "0b237d4b3df306d45cb79975ea62db05",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProItalic.ttf": "04c70bdd56ee21ccb3629f44faad4868",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProLight.ttf": "cdfcf0a1098c2251dfd5385e7dc6716f",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProLightItalic.ttf": "fc3de0caef9eda2d89f6791d73219ea5",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProSemiBold.ttf": "741e3af1f9e74acd126a54ada6d4890d",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProSemiBoldItalic.ttf": "022c60add47ac52d03605a7dc1ea5540",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProThin.ttf": "982272547fad04137b32f39bdf131e87",
"assets/lib/assets/fonts/BeauSansPro/FSPFBeauSansProThinItalic.ttf": "43e5a11f0214ae93c14b30dcdb5e4b95",
"assets/lib/assets/fonts/gfFontIcon.ttf": "91fe441cc105d2ac3d99dac6b72e0356",
"assets/lib/assets/fonts/gfFontIcons2.ttf": "c9ef8acf5e1ace6c92a0e10a248d1301",
"assets/lib/assets/fonts/gfIconFonts.ttf": "91fe441cc105d2ac3d99dac6b72e0356",
"assets/lib/assets/fonts/gfSocialFonts.ttf": "5a1143342f752421c630287be36ae69f",
"assets/lib/assets/fonts/loader.ttf": "9396dc647e6477f7cda08a483e15ef22",
"assets/lib/assets/fonts/new.ttf": "ccaf51a99c12842917c815105e0e2254",
"assets/lib/assets/fonts/newcomp.ttf": "53913d674b8d188b08746ef81dfe1931",
"assets/lib/assets/fonts/Sarabun/Sarabun-Bold.ttf": "f5d49309871097d7f93345a22e52763a",
"assets/lib/assets/fonts/Sarabun/Sarabun-BoldItalic.ttf": "90acdf8d0012e39edfb3b52a72d2760e",
"assets/lib/assets/fonts/Sarabun/Sarabun-ExtraBold.ttf": "d4af0dde3938d4677c1b6cc36b9df0a5",
"assets/lib/assets/fonts/Sarabun/Sarabun-ExtraBoldItalic.ttf": "35c6bea5664149764f9db5e7ba822224",
"assets/lib/assets/fonts/Sarabun/Sarabun-ExtraLight.ttf": "06d5fbfd3b0d94becf8cc6d00d31afc2",
"assets/lib/assets/fonts/Sarabun/Sarabun-ExtraLightItalic.ttf": "4e8834e55f5e06ab45d108ecc77059dd",
"assets/lib/assets/fonts/Sarabun/Sarabun-Italic.ttf": "3c55bdf5de16b4bbd87756afd799e27c",
"assets/lib/assets/fonts/Sarabun/Sarabun-Light.ttf": "7642779e1942ec3999da9aea29b4765c",
"assets/lib/assets/fonts/Sarabun/Sarabun-LightItalic.ttf": "715f547900749a3256490344c614e11b",
"assets/lib/assets/fonts/Sarabun/Sarabun-Medium.ttf": "dcae4be1b91467867108a72142d134e7",
"assets/lib/assets/fonts/Sarabun/Sarabun-MediumItalic.ttf": "c9a6c5255c98b4e5f48b26393d67de49",
"assets/lib/assets/fonts/Sarabun/Sarabun-Regular.ttf": "9dfa7459525c5dd9f4da8b4040cb4d02",
"assets/lib/assets/fonts/Sarabun/Sarabun-SemiBold.ttf": "83af3900b9e5b6277d5a445822ac3f5b",
"assets/lib/assets/fonts/Sarabun/Sarabun-SemiBoldItalic.ttf": "5b842ed2fc576e2b38d42ae7ed15b399",
"assets/lib/assets/fonts/Sarabun/Sarabun-Thin.ttf": "4dbeaa99ca5b5e2a90f2a3920ad9eb27",
"assets/lib/assets/fonts/Sarabun/Sarabun-ThinItalic.ttf": "749fa1c254c131e563295b5df8c2fe4a",
"assets/lib/assets/gif/success1.gif": "7bd1c7b13375ee3f3a920813e7542777",
"assets/lib/assets/icons/allign.png": "baa83ecfb8090f30bf47920d2e824be5",
"assets/lib/assets/icons/big_smile.svg": "bde5dcd81c8b1b25d7b5e9b73b757618",
"assets/lib/assets/icons/bottom_icon_tab.svg": "b545ce24514d080c197918dd46e83ecb",
"assets/lib/assets/icons/bottom_labeled_tab.svg": "b1280249d97759a6d061ed9d3cfb7603",
"assets/lib/assets/icons/gflogo.png": "5aae5e6009c7edd48cfc3a87dbafbb8d",
"assets/lib/assets/icons/icon_button.svg": "2fd12814060aa5e8b6aa851a2487bc38",
"assets/lib/assets/icons/icon_tab.svg": "cd6408552c6dd34b9dc4b195b02f76ea",
"assets/lib/assets/icons/labeled_tab.svg": "9bce7e8a7a8a76083d232ffc8f338cd4",
"assets/lib/assets/icons/link_button.svg": "68ac9e9a136ea1474bb711263c44a86a",
"assets/lib/assets/icons/pill_button.svg": "68c6af03e0b5c4180d8e4c41972f0dc2",
"assets/lib/assets/icons/Rotation.png": "eefd5fb7e73232129fb9a62d2d794009",
"assets/lib/assets/icons/sad.svg": "3c55c5a89c4502ae0e85985be628e9c7",
"assets/lib/assets/icons/scaling.png": "0a7d35039a84218dd4b21d0860c7f1f5",
"assets/lib/assets/icons/segment_tab.svg": "7c665bfdf4862cab5ecfe1856ca3d657",
"assets/lib/assets/icons/size.png": "7cba1be9a69efa2a89264a05c4408da7",
"assets/lib/assets/icons/slide.png": "33dc78e8959bbde2f23ff21bfd6283fa",
"assets/lib/assets/icons/smile.svg": "8784845828c0420bf7b789d586f56d1b",
"assets/lib/assets/icons/social_button.svg": "779f82ee5802dc40f75c2f92c5893dc7",
"assets/lib/assets/icons/standard_button.svg": "9fa8824271272fdcf76b603286a78131",
"assets/lib/assets/images/card1.png": "567236e50514346cf68c33eb87f7482b",
"assets/lib/assets/images/gflogo.png": "3de21daa0f3786271be9ebf504585fdc",
"assets/lib/assets/images/avatar1.png": "417ca1e7c2e4c314e3cc5158f28f868e",
"assets/lib/assets/images/avatar10.png": "6c877e7e4f78b781542cc1799d649226",
"assets/lib/assets/images/avatar11.png": "395b633f4e79f932d44d3e98bd0a8f08",
"assets/lib/assets/images/avatar12.png": "3f37d9e56589b3e2322d1be7057d61d8",
"assets/lib/assets/images/avatar2.png": "a511346e698e2db2321a93f02f152bc3",
"assets/lib/assets/images/avatar3.png": "087106515e87184cfe61d7b2fb69d204",
"assets/lib/assets/images/avatar4.png": "e81e2572ed424f60ab58d3f3c0341920",
"assets/lib/assets/images/avatar5.png": "7f7d935b024eceaf622cfe15b0251458",
"assets/lib/assets/images/avatar6.png": "3a14e44027a207806742fc267e896997",
"assets/lib/assets/images/avatar7.png": "5fb1556b2db6068fbb156f27189fe7ba",
"assets/lib/assets/images/avatar8.png": "1c8a9564f422f21cb2795e1b61535004",
"assets/lib/assets/images/avatar9.png": "048cbe49fe8510b74b6edf900ed50c2a",
"assets/lib/assets/images/card-image-1.png": "91f9db91b96e75896aa47567edcd17c5",
"assets/lib/assets/images/card-image-2.png": "fbef8bb38f2d12fe9c8ae76fd310d42b",
"assets/lib/assets/images/card-image-3.png": "09c5254a7a4450116f751bccf88c1e4a",
"assets/lib/assets/images/card-image-4.png": "2223d55ac15dbe5fab133633adef43da",
"assets/lib/assets/images/card-image-5.png": "2ceb339b24da0895925c67136b250d3e",
"assets/lib/assets/images/card.png": "9f9e951085c76c9bc78e22e3011b0e3d",
"assets/lib/assets/images/i1.png": "0c177ef172fddb4d28c8ef0102f88425",
"assets/lib/assets/images/i2.png": "c3a4c555a3f22ec8721d97b04116e003",
"assets/lib/assets/images/i3.png": "30c4aac4f475af62da292d9b49255c63",
"assets/lib/assets/images/i4.png": "6aebf6e04ccc484fcc4cf20fb808e192",
"assets/lib/assets/images/image-1.png": "b18a8a3e88c0c3753e7089d059d1fef4",
"assets/lib/assets/images/image-10.png": "f69cc2d70aca25b3cfca64ce457c5ff8",
"assets/lib/assets/images/image-11.png": "ea7ec0150bfa3ecc2e5c488eaaebd836",
"assets/lib/assets/images/image-12.png": "c22d239fb29ff7e2d6174f880e74fbb4",
"assets/lib/assets/images/image-13.png": "1e761d8dad1e8b4ab13653bd48d89b9d",
"assets/lib/assets/images/image-14.png": "7a8d6f12768b37d5d966d6c4c40d7848",
"assets/lib/assets/images/image-15.png": "3a925ee54a2d167fad86d167b87ce8c1",
"assets/lib/assets/images/image-16.png": "a504bced4c1045fedd2d8c71196f428b",
"assets/lib/assets/images/image-17.png": "86ffec391d0fb8958093cd0eb4bdafd7",
"assets/lib/assets/images/image-2.png": "b71726c97498394702330930b2a0c565",
"assets/lib/assets/images/image-3.png": "97f51db5a771b08bbc7b079c771da4c2",
"assets/lib/assets/images/image-4.png": "2a03dbee53cee542fa39161a11e4a8bc",
"assets/lib/assets/images/image-5.png": "09a9f013a6ff4eb9f32c3646399bbcfd",
"assets/lib/assets/images/image-6.png": "dee2437e168f628afc7f060979bb1746",
"assets/lib/assets/images/image-7.png": "b199e6836fad74cce7707467c0e2202b",
"assets/lib/assets/images/image-8.png": "2c995105edc12c5daef700b9461f654b",
"assets/lib/assets/images/image-9.png": "5317310fd6628cf0d475a3ee5a62e813",
"assets/lib/assets/images/image.png": "3eb34f864965bfaf9160f826440a607f",
"assets/lib/assets/images/image1.png": "56aa3e67728dd2d07d925de31aaa1714",
"assets/lib/assets/images/image2.png": "6a00bfe0b0c50f0be10830c5026baea9",
"assets/lib/assets/images/img.png": "b0b8ee63d4f6d910a28ade1b5beb9bad",
"assets/lib/assets/images/img1.png": "292096bb7c7d6f825ddf075fad0ff05c",
"assets/lib/assets/images/img2.png": "969ca951b459278ace4ba486cf5cfcef",
"assets/lib/assets/images/orange.png": "86e7cfb109b64c5789d947e11b221076",
"assets/lib/assets/images/pink.png": "0664cd7e75c65f931da7c3c483f489bc",
"assets/lib/assets/images/purple.png": "029dd59f2ae8341fc5d640fcccbe1447",
"assets/lib/assets/images/red.png": "8a6a835dd2526ef01aec07f4ca8792d8",
"assets/lib/assets/images/s1.png": "c4bed48b6d6bc21248ef5c53c97dc82f",
"assets/lib/assets/images/s2.png": "8e49821a4b3b885dfdf0d5c6035c1534",
"assets/lib/assets/images/s3.png": "7def28d2cef6c4a6807845102b525475",
"assets/lib/assets/images/s4.png": "065d2f8890d084214d5fe25506bf16c1",
"assets/lib/assets/images/s5.png": "bac18c287da83eb39be609153c29aa33",
"assets/lib/assets/images/story.jpg": "f9ae374b68fa428428853ac3ffb871e2",
"assets/lib/assets/images/card2.png": "9970da5163bf4e64bd34092ac6a5dcaa",
"assets/lib/assets/images/card3.png": "67e41d3a7039cc457ebc8ee43173779b",
"assets/lib/assets/images/card4.png": "040d69ccd720f48f647a0e053535bc4a",
"assets/lib/assets/images/card5.png": "d511850917d87790ba9a952b01ff8df6",
"assets/lib/assets/images/carousel-image-1.png": "f8a0d025945536a7864ec080574e02af",
"assets/lib/assets/images/carousel-image-2.png": "9c9c1c1d86c5771339efe7ebe806db4e",
"assets/lib/assets/images/carousel-image-3.png": "9312367069ff076904d071d8a75e81e4",
"assets/lib/assets/images/carousel-image-4.png": "c8f61e4d0d9f2da91989101e17dffd05",
"assets/lib/assets/images/carousel-image-5.png": "a30aa073a8829df570b184f6bc0531eb",
"assets/lib/assets/images/carousel-image-6.png": "5420a9996aff7ec75c8d92bafbb081c9",
"assets/lib/assets/images/default-avatar-1.png": "8317f3a439d83e81abb45dfebc95e70a",
"assets/lib/assets/images/default-avatar-2.png": "e44e172d836930d31cf955d8ba958459",
"assets/lib/assets/images/e1.png": "4f15642bd2e7971af55ce4d8f1ce75b2",
"assets/lib/assets/images/e2.png": "33bd98f5f1ca9346d0d51291f634acb6",
"assets/lib/assets/images/e3.png": "7d40970fa613789fe5f6d85f0ef60656",
"assets/lib/assets/images/e4.png": "e96a6b484658ef4d78e442970617a5a4",
"assets/lib/assets/images/e5.png": "f7c688dfa6e42b5c119d1652fabb61c4",
"assets/lib/assets/images/exam-avatar-1.png": "cec7c1325e39bb1547486d9e5a5b8156",
"assets/lib/assets/images/exam-avatar-2.png": "774df02e857e8ac39478eda880e36943",
"assets/lib/assets/images/exam-avatar-3.png": "be9b856a1c3bd7e52156e4afc6f458d4",
"assets/lib/assets/images/exam-avatar-4.png": "23b57d43953dd85894030daef5c94022",
"assets/lib/assets/images/exam-avatar-5.png": "3fab212c6903932857cf22a474cdd362",
"assets/lib/assets/images/exam-avatar-6.png": "21a9216d59d96d89353cf4693e96c942",
"assets/NOTICES": "9e62b4849b9aae7a7a3f082d0875da3c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b00363533ebe0bfdb95f3694d7647f6d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "0a94bab8e306520dc6ae14c2573972ad",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "9cda082bd7cc5642096b56fa8db15b45",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "83f2a9918ba0f00a241587c610e2694d",
"/": "83f2a9918ba0f00a241587c610e2694d",
"main.dart.js": "8c75270f91eceaeb30658c74ecfc748c",
"manifest.json": "8836bc035984c10a2b3625e8bfe2a287",
"version.json": "b18124681094b7e6244bf611deb120b1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
