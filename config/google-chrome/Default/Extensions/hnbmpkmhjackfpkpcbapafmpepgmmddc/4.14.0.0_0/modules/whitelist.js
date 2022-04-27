export default class Whitelist{_active=false;_regexProtocol=/^(?:https?:\/\/)?(?:www\.)?/i;constructor(defaults){this._defaults=new Set(defaults);this.items=new Set(defaults)}isEnabled(){return this._active}isAllowed(element,strict=false){if(strict)return this.items.has(element);element=element.toLowerCase().replace(this._regexProtocol,"");return this.getList().some((item=>{let normalizedListItem=item.toLowerCase().replace(this._regexProtocol,"");return element.includes(normalizedListItem)}))}isDefault(element){element=element.toLowerCase().replace(this._regexProtocol,"");return this.getDefaultList().some((item=>element.includes(item)))}getList(){return Array.from(this.items)}getDefaultList(){return Array.from(this._defaults)}enable(){this._active=true;return this}disable(){this._active=false;return this}add(item){if(Array.isArray(item))this.items=new Set([...this.items,...item]);else this.items.add(item);return this}remove(item){this.items.delete(item);return this}reset(){this.items=new Set(this._defaults);return this}}