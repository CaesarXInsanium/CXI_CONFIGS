let extensionContextFlagThrown=false;let studentData=null;chrome.storage.local.get(["http_ref","session_id","student_attempt","exam_state"],(storage=>{studentData=storage;studentData["extension_version"]=chrome.runtime.getManifest().version}));chrome.storage.onChanged.addListener((function(changes){const newData={};for(const key in changes)newData[key]=changes[key].newValue;Object.assign(studentData,newData)}));chrome.runtime.sendMessage({message:"webcam_open"});window.addEventListener("message",(function(event){if(event.source!=window)return;if(event.data.type&&"from_webcam"==event.data.type)try{if(event.data.data&&event.data.data.event_type&&"Exam Submit"===event.data.data.event_type){chrome.runtime.sendMessage({message:"close_webcam",type:"submit"});return}if(event.data.context&&"proctoring"==event.data.context){chrome.runtime.sendMessage({type:event.data.context,message:event.data.text,data:event.data.data});return}if(event.data.var)chrome.runtime.sendMessage({message:event.data.text,var:event.data.var});else if("check_browser_guard"==event.data.text)chrome.storage.local.get("guardModeStatus",(function(result){if(result.guardModeStatus)window.postMessage({type:"from_extension",text:"browser_guard_enabled"},"*")}));else if("pause_all_tabs"==event.data.text)chrome.runtime.sendMessage({message:event.data.text,reason:event.data.reason,relaunch:event.data.relaunch});else if("open_support_chat"===event.data.text)chrome.runtime.sendMessage({message:event.data.text,chat_group:event.data.chat_group});else chrome.runtime.sendMessage({message:event.data.text})}catch(error){if(!extensionContextFlagThrown&&error.message.indexOf("Extension context invalidated")>-1){extensionContextFlagThrown=true;window.postMessage({type:"from_extension",text:"extension_context_invalidated_during_exam",data:studentData},"*")}}}),false);chrome.extension.onMessage.addListener((function(msg,sender,sendResponse){if("undefined"!=typeof msg.data)window.postMessage({type:"from_extension",text:msg.action,data:msg.data},"*");else window.postMessage({type:"from_extension",text:msg.action},"*")}));