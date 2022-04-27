chrome.runtime.sendMessage({message:"check_update_available"});let env_variables=$("#env");let exam_id=env_variables.data("eid");let student_id=env_variables.data("sid");let session_id=env_variables.data("sessionid");let display_count=0;let cameraBladeDimensions=null;let translations;chrome.runtime.sendMessage({message:"display_count"});chrome.storage.local.set({launch_url:window.location.href});chrome.runtime.sendMessage({message:"launch_page_opened"});window.addEventListener("message",(function(event){if(event.data.type){if("from_page"==event.data.type)chrome.storage.local.set({launch_meta:event.data.data,usat:event.data.data.usat});else if("page_msg"==event.data.type)if("opencalculatorsci"==event.data.message)chrome.runtime.sendMessage({message:"opencalculatorsci"});else if("opencalculator"==event.data.message)chrome.runtime.sendMessage({message:"opencalculator"});else if("closecalculators"==event.data.message)chrome.runtime.sendMessage({message:"closecalculators"});else if("open_guide"==event.data.message)chrome.runtime.sendMessage({message:"open_canvas_universal_guide"});chrome.storage.local.get(["launch_meta"],(storage=>{cameraBladeDimensions=storage.hasOwnProperty("launch_meta")?storage.launch_meta.camera_blade_dimensions:null}))}}),false);chrome.storage.local.get(null,(function(result){if(result.launch_message)$("#launch-message").text(result.launch_message).parent().parent().show();if("active"==result.exam_state)passwordInsertSuccess()}));let launchButton=document.getElementById("launch-btn");$(document).on("click touchstart",(function(event){if(!launchButton)launchButton=document.getElementById("launch-btn");if(event.target===launchButton)launchWebcam()}));chrome.extension.onMessage.addListener((function(msg,sender,sendResponse){if("insert_password_ready"==msg.action){chrome.runtime.sendMessage({message:"focus_page"});insertPasswordReady()}else if("custom_msg"==msg.action){void 0;void 0}else if("password_insert_success"==msg.action)passwordInsertSuccess();else if("exam_submitted"==msg.action)chrome.storage.local.get(["exam_state"],(function(result){var value=result[Object.keys(result)[0]];if("undefined"==typeof value||null===value||"submitted"===value)insertExamSubmittedMessage()}));else if("reset_state"==msg.action){chrome.runtime.sendMessage({message:"focus_page"});resetState()}else if("camera_window_closed"==msg.action)chrome.storage.local.get(["exam_state"],(function(result){var key=Object.keys(result)[0];var value=result[key];void 0;if("active"===value||"paused"===value){relaunchWebcam();chrome.runtime.sendMessage({message:"pause_all_tabs"})}}));else if("webcam_restarted"==msg.action)chrome.runtime.sendMessage({message:"resume_all_tabs"});else if("display_count"==msg.action)display_count=msg.data;else if("send_chat"===msg.action)sendLivechatMsgUniversal(msg.message);else if("showcalculator"===msg.action||"showcalculatorsci"===msg.action)showCalculator();else if("hidecalculators"===msg.action)hideCalculators();else if("open_support_chat"===msg.action){hlChat.destroy();chrome.storage.local.get(null,(function(result){const examData=result.launch_meta;const lmsId=parseInt(examData.lms_id);const examId=examData.exam_id;const studentId=examData.student_id;const lmsStudentName=examData.student_name;const lmsStudentEmail=examData.student_email;const hlChatParameters={lmsSchoolId:lmsId,examId:examId,studentId:studentId,lmsStudentName:lmsStudentName,lmsStudentEmail:lmsStudentEmail,license:livechat_license,groupId:msg.group_id,withExamTools:false};hlChat.init(hlChatParameters);hlChat.maximizeWindow()}))}}));function launchWebcam(){chrome.runtime.sendMessage({message:"webcam_launch_external",session_id:session_id,lms_id:5,relaunch:0,display_count:display_count,current_url:window.location.href,camera_blade_dimensions:cameraBladeDimensions});void 0;externalWebcamLaunched()}function relaunchWebcam(){chrome.runtime.sendMessage({message:"webcam_launch_external",session_id:session_id,lms_id:5,relaunch:1,display_count:display_count,current_url:window.location.href,camera_blade_dimensions:cameraBladeDimensions});void 0}function closeAllWebcamWindows(){chrome.runtime.sendMessage({message:"close_all_webcam_windows"})}function externalWebcamLaunched(){externalWebcamLaunched=_=>{};$("#hl-relaunch-webcam").click((function(){launchWebcam()}));window.addEventListener("beforeunload",closeAllWebcamWindows)}function insertPasswordReady(){void 0;let injection=`goToStep('insert-password');`;let script=document.createElement("script");script.textContent=injection;(document.head||document.documentElement).appendChild(script);script.remove()}function stopNavigation(event){event.preventDefault();event.returnValue=""}function passwordInsertSuccess(){let injection=`goToStep('in-progress');`;let script=document.createElement("script");script.textContent=injection;(document.head||document.documentElement).appendChild(script);script.remove();$("#exit-honorlock").off("click");$("#exit-honorlock").click((_=>{chrome.runtime.sendMessage({message:"exit_honorlock_clicked"})}));window.removeEventListener("beforeunload",closeAllWebcamWindows);window.addEventListener("beforeunload",stopNavigation)}function insertExamSubmittedMessage(){$("#next-step").click();$("#uninstall-ext").click((function(){uninstallExtension()}));window.removeEventListener("beforeunload",stopNavigation);$("#launch-message").parent().parent().hide();let post_exam_text=`\n\t\t<div style="font-size: 18px;">\n\t\t\t<ul style="text-align: left;">\n\t\t\t\t<li>${translations.universal.post_exam_text}</li>\n\t\t\t\t<li>${translations.universal.extension_remove}</li>\n\t\t\t</ul>\n\t\t</div>\n\t\t<button class="btn btn-primary btn-lg btn-block mt-4" onclick="$('#uninstall-ext').click()">${translations.universal.uninstall_extension}</button>\n\t`;insertPromptUniversal(translations.universal.post_exam_title,post_exam_text,hlIcons.acceptCircle,true)}function resetState(){location.reload()}function uninstallExtension(){chrome.runtime.sendMessage({message:"uninstall_self"},(function(response){if(response){$("#launch-instructions-text").html(`<span style="color:green">✓</span> ${translations.universal.uninstall_success}`);insertPromptUniversal(translations.universal.uninstall_success,null,hlIcons.acceptCircle,true);setTimeout((function(){removePrompts()}),2500)}}))}function insertPromptUniversal(header,text,icon,dismissable){removePrompts();var header=header||"";var text=text||"";var icon=icon||"";var dismiss_icon=dismissable?'<div id="hl-close-prompt" class="hl-close-prompt btn">X</div>':"";$("body").append('<div class="hl-prompt-overlay"></div>');jQuery("body").append(`\n\t\t<div id="hl-prompt" class="hl-prompt">\n\t\t\t<div id="hl-prompt-container">\n\t\t\t\t${dismiss_icon}\n\t\t\t    <div class="hl-prompt-header">\n\t\t\t        <h2 id="hl-prompt-header-text">${icon} ${header}</h2>\n\t\t\t        <p id="hl-prompt-body">${text}</p>\n\t\t\t    </div>\n\t\t\t</div>\n\t\t</div>\n\t`);if(dismissable)jQuery("#hl-close-prompt").click((function(){removePrompts()}))}function removePrompts(){jQuery(".hl-prompt").each((function(){jQuery(this).remove()}));jQuery(".hl-prompt-overlay").each((function(){jQuery(this).remove()}))}function sendLivechatMsgUniversal(msg){$("head").append(`\n        <script>\n\t\t\tLiveChatWidget.call('maximize')\n        <\/script>\n    `)}function showCalculator(){const $toolCalculator=$("#tool-calculator");$toolCalculator.removeClass("d-none");$toolCalculator.addClass("d-flex")}function hideCalculators(){const $toolCalculator=$("#tool-calculator");$toolCalculator.removeClass("d-flex");$toolCalculator.addClass("d-none")}document.addEventListener("cyclevideo",(()=>chrome.runtime.sendMessage({message:"cyclevideo"})));document.addEventListener("disableguard",(()=>chrome.runtime.sendMessage({message:"disable_browser_guard"})));document.addEventListener("enableguard",(()=>{chrome.runtime.sendMessage({message:"enable_browser_guard"});chrome.runtime.sendMessage({message:"disable_new_tabs"});chrome.runtime.sendMessage({message:"begin_fullscreen"});chrome.runtime.sendMessage({message:"to_camera",msg:"enable_guard_camera"})}));document.addEventListener("exitfullscreen",(()=>chrome.runtime.sendMessage({message:"exit_fullscreen"})));document.addEventListener("focuschat",(()=>chrome.runtime.sendMessage({message:"focus_page"})));document.addEventListener("launchcam",(()=>launchWebcam()));document.addEventListener("nextstep",(()=>chrome.runtime.sendMessage({message:"livechat_command_nextstep"})));document.addEventListener("opensesame",(()=>chrome.runtime.sendMessage({message:"bypass_payment"})));document.addEventListener("showcalculator",(()=>chrome.runtime.sendMessage({message:"showcalculator"})));document.addEventListener("showcalculatorsci",(()=>chrome.runtime.sendMessage({message:"showcalculatorsci"})));document.addEventListener("hidecalculators",(()=>{chrome.runtime.sendMessage({message:"hidecalculators"})}));document.addEventListener("opencalculator",(()=>{chrome.runtime.sendMessage({message:"opencalculator"})}));document.addEventListener("closecalculators",(()=>{chrome.runtime.sendMessage({message:"closecalculators"})}));document.addEventListener("showwebcam",(()=>{chrome.runtime.sendMessage({message:"showwebcam"})}));document.addEventListener("hidewebcam",(()=>{chrome.runtime.sendMessage({message:"hidewebcam"})}));document.addEventListener("compresswebcam",(()=>{chrome.runtime.sendMessage({message:"compresswebcam"})}));document.addEventListener("expandwebcam",(()=>{chrome.runtime.sendMessage({message:"expandwebcam"})}));document.addEventListener("relaunchcam",(()=>closeAllWebcamWindows()));