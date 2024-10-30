'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "4bf9848e84e65b0b633acaeb8eee69aa",
"assets/AssetManifest.bin.json": "272f7bc3ca3584cbb2018c4cdbc4c0a3",
"assets/AssetManifest.json": "0de8a9fe622d09b869499a8005195667",
"assets/assets/images/auth_back.png": "319b02068d946fddec2999fa8c3a3d86",
"assets/assets/images/burger.jpg": "e94ddb87579c2eb51c7857cf9e9301d1",
"assets/assets/images/burger1.png": "b2a191c223cf4a2844c1c699d0af615d",
"assets/assets/images/burger2.jpg": "ccbfecbcf4210f4df1563a9f9fd2e72d",
"assets/assets/images/burger3.jpg": "2ac1f6aae4f2e9c5ef2d1b294b515f31",
"assets/assets/images/burger4.jpg": "423995f25acee3651a80383634147f0d",
"assets/assets/images/burger5.jpg": "7d9388cf204a8a1ce548c7a1c4936609",
"assets/assets/images/burger6.jpg": "ae7de940bdcea19e8f8a7b466a05837a",
"assets/assets/images/burgerking.png": "7987f00b4e6b4e89c35bce428758a581",
"assets/assets/images/burger_king.jpg": "87a2b4c563a0abce008f5a83e7ea97aa",
"assets/assets/images/burger_king.png": "2e89dee4000013981af15b3e5da5678d",
"assets/assets/images/dish.png": "51f7d6ff2c1c3b52a304d5af6fa35a43",
"assets/assets/images/email.png": "1d0d4195a1fa86fca9b9b60972a4d812",
"assets/assets/images/facebook.png": "f050e0269d745f2423bbfc7e88285850",
"assets/assets/images/food.png": "ace218a4f4b81019717b67dffe6dfa45",
"assets/assets/images/google-icon.png": "1214cc6c68987d8cd09d62e08d96a824",
"assets/assets/images/grocery.png": "3f390e2eeae3a7b75c23a0545b249607",
"assets/assets/images/Indian.jpg": "36cca79b0be9add11aae5f3717af189e",
"assets/assets/images/Italian.png": "db5bbfa2cf6d3dccc417baf9c6982b0b",
"assets/assets/images/location.png": "f30141001817ca0742c3c0ef53005007",
"assets/assets/images/login.png": "e56b841924ac729935e858cb59535fb7",
"assets/assets/images/logo.png": "46516bc9c5c06fd91356055c2b076963",
"assets/assets/images/meal.jpg": "7f48454a6cb43b602a6ede95172687e9",
"assets/assets/images/meal.png": "82ea22131d7041d5b3cf6869b7736b6c",
"assets/assets/images/percentage.png": "b91822d7503e378221102467e6bc8ccc",
"assets/assets/images/percentange_icon.png": "b91822d7503e378221102467e6bc8ccc",
"assets/assets/images/profile.png": "03e4ac18069f3840b335f4308f091352",
"assets/assets/images/salad.jpg": "17547b143c874fab7b825a4b91398c95",
"assets/assets/images/shop.png": "129065b49283503545c7ad65b9914653",
"assets/assets/images/voucher.png": "612bfe6e82749e5abbe54967e982974d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "035a3ad70de121861a3161e3bdf74997",
"assets/NOTICES": "27ed164f72811eea2357805977a9efd7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "49a31a5b6491d5046875675fc03ad0c8",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "69ee0c2325c19b20d619c7954e214f2f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "aa35eebe702b1c1024b99c0115ae4c76",
"/": "aa35eebe702b1c1024b99c0115ae4c76",
"main.dart.js": "67dc3babbb33f4400de93f822399345d",
"manifest.json": "0fc55f85b28dce937dcc9bf9fb00916c",
"version.json": "6dd609dbc63c78e9dc4740e24d34e241"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
