require("regenerator-runtime");it("will generate an error if toolbardata is not an object",(async()=>{globalThis.hlA11yHelper={};chrome.extension.onMessage=jest.fn();chrome.extension.onMessage.addListener=jest.fn();require("../../../assets/svg_icons");require("../../../modules/exam_tools");console.error=jest.fn();jest.spyOn(hlExamTools,"_getExamToolbarLocalStorageData").mockImplementation((()=>({})));await hlExamTools.init({});expect(console.error).toHaveBeenCalled()}));