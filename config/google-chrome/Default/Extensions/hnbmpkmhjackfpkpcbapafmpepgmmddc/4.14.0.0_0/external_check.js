var password_el=document.querySelectorAll("[type=password]");password_el=[...password_el].filter((x=>x.offsetWidth>0&&x.offsetHeight>0));if(!password_el.length){const passwordExceptionsExamUris=["app.edulastic.com"];for(const uri of passwordExceptionsExamUris)if(window.location.href.indexOf(uri)>-1){password_el=document.querySelectorAll("input[type=text]");password_el=[...password_el].filter((field=>field.offsetWidth>0&&field.offsetHeight>0&&field.id.toLowerCase().indexOf("password")>-1||field.className.toLowerCase().indexOf("password")>-1||field.placeholder.toLowerCase().indexOf("password")>-1));break}}var timeout=self!=top?100:0;setTimeout((()=>{if(password_el.length)chrome.runtime.sendMessage({message:"inject_password_module"})}),timeout);password_el.length;