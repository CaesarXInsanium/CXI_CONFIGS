// *****************************************************************************
// Copyright (c) 2014, 2015, 2016, 2017 Pay With Privacy, Inc. All rights reserved.
// Authors:
// Jason Kruse   (jason@privacy.com)
// David Nichols (david@privacy.com)
// Boling Jiang  (boling@privacy.com)
// Felippe Nardi (felippe@privacy.com)
// *****************************************************************************
var Store={set:function(a,b,c){var d={};d[a]=b;chrome.storage.sync.set(d,function(){c&&c()})},get:function(a,b){chrome.storage.sync.get(a,function(c){c&&a&&b(c[a])})},remove:function(a,b){chrome.storage.sync.remove(a,function(){b&&b()})},clear:function(a){chrome.storage.sync.clear(function(){a&&a()})}};
