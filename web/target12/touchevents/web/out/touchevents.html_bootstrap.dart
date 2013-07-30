import "dart:isolate" as GE;import "dart:async" as v;import "dart:collection" as tB;import "dart:html" as l;class rD{static const  sD="Chrome";final  WD;final  minimumVersion;const rD(this.WD,[this.minimumVersion]);}class tD{const tD();}class uD{final  name;const uD(this.name);}class vD{const vD();}class wD{const wD();}var OC=5; PC(){} QC(){var KE=l.document.body;var LE;var ME=new uC(KE);LE=KE.nodes[5].nodes[1];ME.jD(()=>OC,(g){if(LE.xtag.count!=g)LE.xtag.count=g;},false,false);ME.JB(new xD()..host=LE);ME.UB();ME.insert();}main(){zB=true;BB.cB.iD.listen((g){print('${g.VB.name.toLowerCase()}: ${g.message}');});PC();QC();}class xD extends EC with o{var NE;static final RC=new l.DocumentFragment.html('''
        <div>
          <button>Click me</button><br>
          <span></span>
        </div>
      ''');var OE;var PE;var QE;var RE; bD(){var SE=createShadowRoot("x-click-counter");nD("x-click-counter",new nB({"x-click-counter":"[is=\"x-click-counter\"]"}));NE=cD("x-click-counter");RE=new uC(SE);SE.nodes.add(RC.clone(true));PE=SE.nodes[1];OE=PE.nodes[1];RE.listen(OE.onClick,(g){JC();});QE=PE.nodes[4];var TE=RE.ZD(()=>count,false);QE.nodes.addAll([new l.Text('(click count: '),TE,new l.Text(')')]);RE.listen(PE.onTouchCancel,(g){MC(g);});RE.listen(PE.onTouchEnd,(g){oD(g);});RE.listen(PE.onTouchLeave,(g){MC(g);});RE.listen(PE.onTouchMove,(g){pD(g);});RE.listen(PE.onTouchStart,(g){qD(g);});RE.UB();} eD(){RE.insert();} lD(){RE.remove();RE=PE=OE=QE=null;}var UE=0; get count{if(aC){bC(this,CB.dB,'count');}return UE;}set count( g){if(ZC(this)){cC(this,CB.dB,'count',UE,g);}UE=g;} JC(){count++ ;}var WE;qD( g){(g.currentTarget as l.Element).classes.add('touched');WE=g.timeStamp;}pD( g){g.preventDefault();}oD( g){(g.currentTarget as l.Element).classes.remove('touched');if(g.timeStamp>WE+700){g.preventDefault();print('touch ended');JC();}} MC( g){g.preventDefault();}}var bB=false;var SC=n.uB;class BB{final  name; get IC=>(parent==null||parent.name=='')?name:'${parent.IC}.${name}';final  parent;var XE;var children;var YE;var ZE;factory BB( g){if(g.startsWith('.')){throw new ArgumentError("name shouldn't start with a '.'");}if(LB==null)LB=<String,BB>{};if(LB.containsKey(g))return LB[g];var j=g.lastIndexOf('.');var h=null;var i;if(j==-1){if(g!='')h=new BB('');i=g;}else{h=new BB(g.substring(0,j));i=g.substring(j+1);}final k=new BB.HE(i,h);LB[g]=k;return k;}BB.HE(this.name,this.parent):children=new Map<String,BB>(){if(parent!=null)parent.children[name]=this;} get VB{if(bB){if(XE!=null)return XE;if(parent!=null)return parent.VB;}return SC;} get iD=>aE(); fD( g)=>(g>=VB); log( i, k,[j]){if(fD(i)){var h=new MB(i,k,IC,j);if(bB){var g=this;while (g!=null){g.bE(h);g=g.parent;}}else{cB.bE(h);}}} info( h,[g])=>log(n.uB,h,g); rB( h,[g])=>log(n.TC,h,g); aE(){if(bB||parent==null){if(YE==null){YE=new v.StreamController<MB>.broadcast(sync:true);ZE=YE.stream;}return ZE;}else{return cB.aE();}} bE( g){if(YE!=null){YE.add(g);}}static  get cB=>new BB('');static var LB;}class n implements Comparable<n>{final  name;final  value;const n(this.name,this.value);static const  uB=const n('INFO',800);static const  TC=const n('WARNING',900); operator==( g)=>g!=null&&value==g.value; operator<( g)=>value<g.value; operator<=( g)=>value<=g.value; operator>( g)=>value>g.value; operator>=( g)=>value>=g.value; compareTo( g)=>value-g.value; get hashCode=>value; toString()=>name;}class MB{final  VB;final  message;final  gD;final  time;final  mD;static var UC=0;var exception;MB(this.VB,this.message,this.gD,[this.exception]):time=new DateTime.now(),mD=MB.UC++ ;}typedef  w( e);typedef  VC( changes);typedef  AB();typedef  WC();class WB{final oldValue;final newValue;final  changes;WB(this.oldValue,this.newValue,[this.changes]); operator==(g){return g is WB&&oldValue==g.oldValue&&newValue==g.newValue&&changes==g.changes;} get hashCode=>nC(oldValue,newValue,changes); toString(){if(changes!=null)return '#<ChangeNotification to ${newValue}: ${changes}>';return '#<ChangeNotification from ${oldValue} to ${newValue}>';}}class CB{static const dB=1;static const eB=2;static const vB=eB|4;static const wB=eB|8;final  type;final key;final oldValue;final newValue;CB(this.type,this.key,this.oldValue,this.newValue); operator==(g){return g is CB&&type==g.type&&key==g.key&&oldValue==g.oldValue&&newValue==g.newValue;} get hashCode=>oC(type,key,oldValue,newValue); toString(){var g;switch (type){case dB:g='field';break;case eB:g='index';break;case vB:g='insert';break;case wB:g='remove';break;}return '#<ChangeRecord ${g} ${key} from ${oldValue} to ${newValue}>';}} XC(g, i,[ k]){if(g is o){var h=g;return fB(h,(m){i(new WB(h,h,m));});}var j=new XB(g,i,k);if(!j.cE()){return dC;}return j.dE;} fB( g, i){if(g.IB==null)g.IB=new gB();var h=g.IB.add(i);return h.remove;}class o{var IB;var HB;final  hashCode= ++o.YC;static var YC=0;} ZC( g)=>g.IB!=null&&g.IB.head!=null; get aC=>GB!=null; bC( g, h,i)=>GB.eE(g,h,i); cC( g, j,k, h, i){if((j&(CB.vB|CB.wB))==0){if(h==i)return;}if(EB==null){EB=[] ;pC(eC);}if(g.HB==null){g.HB=[] ;EB.add(g);}g.HB.add(new CB(j,k,h,i));} dC(){}var GB;var xB=100;var EB;var FB; eC(){var m=0;while (EB!=null||FB!=null){var j=EB;EB=null;var i=FB;FB=null;if(m++ ==xB){fC(j,i);return;}if(j!=null){for(var h in j){var DB=h.HB;h.HB=null;for(var g=h.IB.head;g!=null;g=g.next){var k=g.value;try {k(DB);}catch (KB,s){NB(KB,s,k,'from ${h}');}}}}if(i!=null){i.forEach((NC,sB){sB.fE();});}}} fC( k, j){var g=[] ;if(k!=null){for(var i in k){var DB=i.HB;g.add('${i} ${DB}');}}if(j!=null){for(var m in j.values){var h=m.fE();if(h!=null)g.add('${m} ${h}');}}EB=null;FB=null;var s='exceeded notifiction limit of ${xB}, possible ' 'circular reference in observer callbacks: ${g.take(10).join(", ")}';iC(s);}class XB{static var gC=0;final  gE= ++XB.gC;final  hE;final  iE;final  jE;final  kE=new Map();final  lE=[] ;var mE=false;var nE;XB(this.hE,this.iE,this.jE); toString()=>jE!=null?'<observer ${gE}: ${jE}>':'<observer ${gE}>'; cE(){var h=GB;GB=this;try {nE=hE();if(nE is Iterable&&nE is !List&&nE is !o){nE=(nE as Iterable).toList();}}catch (g,i){NB(g,i,hE,'from ${this}');nE=null;}kE.forEach(oE);kE.clear();assert(GB==this);GB=h;pE();return lE.length>0;} qE( i){try {iE(i);}catch (g,h){NB(g,h,iE,'from ${this}');}} pE(){var g=nE;if(g is !o)return;lE.add(fB(g,(h){qE(new WB(g,g,h));}));} eE( m, s,g){var i=kE.putIfAbsent(m,()=>new Map());try {var h=i[g];if(h==null)h=0;i[g]=h|s;}catch (j,k){NB(j,k,g,'hashCode or operator == from ${this}');}} oE( i, j){lE.add(fB(i,(k){if(mE)return;for(var g in k){var h=j[g.key];if(h!=null&&(h&g.type)!=0){mE=true;if(FB==null){FB=new tB.SplayTreeMap();}FB[gE]=this;return;}}}));} dE(){for(var g in lE){g();}mE=false;} fE(){if(!mE)return null;var g=nE;dE();cE();try {if(g==nE)return null;}catch (i,j){NB(i,j,g,'operator == from ${this}');return null;}var h=new WB(g,nE);qE(h);return h;}}typedef  hC( message);var iC=(g)=>print(g);typedef  jC(error,stackTrace,obj, message);var NB=kC; kC(i,g,h, j){print('web_ui.observe: unhandled error calling ${h} ${j}.\n' 'error:\n${i}\n\nstack trace:\n${g}');}class lC{}class mC{}class t<u>{var rE;var sE;var tE;var uE;t.IE( g,this.tE):uE=g{if(tE!=null)tE.vE++ ;} get next=>sE; get value=>uE;set value( g)=>uE=g; wE( g, h){sE=h;rE=g;if(g!=null)g.sE=this;if(h!=null)h.rE=this;return this;} append( g)=>new t<u>.IE(g,tE).wE(this,sE); remove(){if(tE==null)return;tE.vE-- ;if(rE!=null){rE.sE=sE;}else{tE.xE=sE;}if(sE!=null){sE.rE=rE;}else{tE.yE=rE;}sE=null;rE=null;tE=null;}}class gB<u> extends tB.IterableBase<u>{var xE;var yE; get length=>vE;var vE=0;gB(){} get head=>xE; add( h){var g=new t<u>.IE(h,this);if(yE==null)return xE=yE=g;return yE=g.wE(yE,null);} addLast( g)=>add(g); addAll( g)=>g.forEach(add); get iterator=>new yD<u>(this);}class yD<u> implements Iterator<u>{var zE;var tE;var AF;var BF=-1;yD(this.tE){zE=new List<t>(tE.length);var h=0;var g=tE.head;while (g!=null){zE[h++ ]=g;g=g.next;}} get current=>AF; moveNext(){do{BF++ ;}while(BF<zE.length&&zE[BF].tE!=tE);if(BF<zE.length){AF=zE[BF].value;return true;}else{AF=null;return false;}}}OB(h,g)=>h.hashCode*31+g.hashCode;nC(h,g,i)=>OB(OB(h,g),i);oC(g,i,h,j)=>OB(OB(g,i),OB(h,j)); pC( h()){var g=new GE.ReceivePort();g.receive((i,j){g.close();h();});g.toSendPort().send(null);} qC(i, g,[ h]){var j=i is lC;if(h==null){h=i.toString();}if(!j&&g is l.Text){g.text=h;}else{var k=g;g=j?new l.Element.html(h):new l.Text(h);k.replaceWith(g);}return g;} rC(g){if(g is mC)return g.toString();g=g.toString();return tC(g)?g:'#';}const sC=const["http","https","ftp","mailto"]; tC( h){var g=Uri.parse(h).scheme;if(g=='')return true;return sC.contains(g.toLowerCase())||"MAILTO"==g.toUpperCase();}abstract class PB{ UB(){} insert(); remove();}class zD extends PB{final  HC;var CF;final  listener;zD(this.HC,this.listener); insert(){CF=HC.listen(listener);} remove(){CF.cancel();CF=null;}}abstract class yB extends PB{final exp;final  isFinal;final  oB;var aB;yB(this.exp,this.isFinal):oB=hB&&YB!=null?YB():null; insert(){if(isFinal){pB();}else if(aB!=null){throw new StateError('binding already attached');}else{aB=qB();}} remove(){if(!isFinal){aB();aB=null;}} pB(); qB();}class AE extends yB{final  action;AE(g,this.action, h):super(g,h); pB()=>action(new WB(null,exp())); qB()=>AC(exp,action,'generic-binding',oB);}class BE extends yB{final  LC;final  KC;BE( g,this.LC,this.KC, h):super(g,h); DF(g){LC(KC?rC(g):g);} pB()=>DF(exp()); qB()=>AC(exp,(g)=>DF(g.newValue),'dom-property-binding',oB);}class CE extends PB{final JB;CE(this.JB); UB(){JB..bD()..aD()..YD();} insert(){JB..dD()..eD();} remove(){JB..lD()..kD();}}class uC extends PB{final  hD;final  children=[] ;final  nodes=[] ;uC(this.hD); listen( i, h){children.add(new zD(i,(g){h(g);yC();}));} ZD( h,i){var g=new l.Text('');children.add(new AE(()=>'${h()}',(j){g=qC(h(),g,j.newValue);},i));return g;} jD(g,j,h,[i=false]){children.add(new BE(g,j,i,h));} JB( g){children.add(new CE(g));} add( g)=>nodes.add(g); addAll( g)=>nodes.addAll(g); UB(){for(var g=0,h=children.length;g<h;g++ ){children[g].UB();}} insert(){for(var g=0,h=children.length;g<h;g++ ){children[g].insert();}} remove(){for(var g=children.length-1;g>=0;g-- ){children[g].remove();}children.clear();}}var zB=false;var hB=false;var YB=(){try {throw "";}catch (h,g){return g.toString();}};final  QB=new BB('watcher'); vC(g, s,[ j, m]){if(zB)return XC(g,s);if(s==null)return (){};if(RB==null)RB=new gB<SB>();j=j==null?'<unnamed>':j;var i;var h=q.CD;if(g is DC){i=(g as DC).EF;}else if(g is Function){i=g;try {var k=g();if(k is List){h=q.TB;}else if(k is Iterable){h=q.TB;i=()=>g().toList();}else if((k is tB.LinkedHashMap)||(k is tB.SplayTreeMap)){h=q.kB;}else if(k is Map){h=q.jB;}}catch (DB,sB){QB.rB('evaluating ${j} watcher threw error (${DB}, ${sB})');}}else if(g is List){i=()=>g;h=q.TB;}else if(g is Iterable){i=()=>g.toList();h=q.TB;}else if((g is tB.LinkedHashMap)||(g is tB.SplayTreeMap)){i=()=>g;h=q.kB;}else if(g is Map){i=()=>g;h=q.jB;}if(hB&&m==null&&YB!=null){m=YB();}var NC=wC(h,i,s,j,m);var KB=RB.add(NC);return KB.remove;} wC( k, g, j, h, i){switch (k){case q.TB:return new DE(g,j,h,i);case q.kB:return new FE(g,j,h,i);case q.jB:return new EE(g,j,h,i);default:return new SB(g,j,h,i);}} AC(h, i,[ j, k]){var m=vC(h,i,j,k);var g=h;if(g is Function){g=g();}if(g is Iterable&&g is !List){g=g.toList();}i(new WB(null,g));return m;}var RB;class SB{final  GC;var location;final  FF;static var xC=0;final  EF;final  GF;var HF;SB(this.EF,this.GF,this.GC,this.location):FF=xC++ {HF=EF();} toString()=>'${GC} (id: #${FF})'; XD(){var g=IF();if(JF(g)){var h=HF;KF(g);GF(new WB(h,g));return true;}return false;} JF(g)=>HF!=g; KF(g){if(hB){if(location!=null){QB.info('watcher updated: ${this}, defined at:\n${location}');location=null;}else{QB.info('watcher updated: ${this}');}}HF=g;}IF(){try {return EF();}catch (g,h){QB.rB('${this} watcher threw an exception: ${g}, ${h}');}return HF;}}final  BC=10; yC(){if(RB==null)return;var g;var h=0;do{g=false;for(var i in RB){if(i.XD()){g=true;}}}while(g&& ++h<BC);if(h==BC){QB.rB('Possible loop in watchers propagation, stopped dispatch.');}}typedef  CC<zC>();typedef  AD<zC>( value);class DC<zC>{}class DE<zC> extends SB{DE(g, j, h, i):super(g,j,h,i){KF(IF());} JF( g){return iB(HF,g);} KF(g){HF=new List<zC>.from(g);}}class EE<ZB,BD> extends SB{EE(g, j, h, i):super(g,j,h,i){KF(IF());} JF( g){var i=HF.keys;if(i.length!=g.keys.length)return true;var j=i.iterator;while (j.moveNext()){var h=j.current;if(!g.containsKey(h))return true;if(HF[h]!=g[h])return true;}return false;} KF(g){HF=new Map<ZB,BD>.from(g);}}class FE<ZB,BD> extends SB{FE(g, j, h, i):super(g,j,h,i){KF(IF());} JF( g){return iB(g.keys,HF.keys)||iB(g.values,HF.values);} KF(g){HF=new tB.LinkedHashMap.from(g);}} iB( i, j){var h=i.iterator;var g=j.iterator;while (h.moveNext()){if(!g.moveNext())return true;if(h.current!=g.current)return true;}return g.moveNext();}class q{final LF;const q.JE(this.LF);toString()=>'Enum.${LF}';static const TB=const q.JE('LIST');static const jB=const q.JE('HASH_MAP');static const kB=const q.JE('ORDERED_MAP');static const CD=const q.JE('OTHER');}abstract class EC implements l.Element{var MF;var NF;var OF={};var PF=new nB({}); cD( g)=>PF; nD( h,var g){PF=g;} get host{if(MF==null)throw new StateError('host element has not been set.');return MF;}set host( g){if(g==null){throw new ArgumentError('host must not be null.');}var h=g.xtag;if(h!=null&&h!=g){throw new ArgumentError('host must not have its xtag property set.');}if(MF!=null){throw new StateError('host can only be set once.');}g.xtag=this;MF=g;}createShadowRoot([ g]){var h=QF();if(g!=null){OF[g]=h;}return h;}QF(){if(FC){return host.createShadowRoot();}if(NF==null)NF=[] ;NF.add(new l.DivElement());return NF.last;} aD(){} dD(){} kD(){} YD(){if(FC)return;if(NF.length==0){throw new StateError('Distribution algorithm requires at least one shadow' ' root and can only be run once.');}var j=NF;var g=j.removeLast();var s=g;var m=new List.from(nodes);var k=[] ;var DB=[] ;while (true){m=RF(g,m);var h=g.query('shadow');if(h!=null){if(j.length>0){g=j.removeLast();k.add(h);DB.add(g);}else{mB(h,m);break;}}else{break;}}for(int i=0;i<k.length;i++ ){var h=k[i];var g=DB[i];mB(h,g.nodes);}nodes.clear();nodes.addAll(s.nodes);for(var KB in OF.keys){if(OF[KB]==s){OF[KB]=this;break;}}} RF( s, j){for(var g in s.queryAll('content')){if(!ED(g))continue;var i=g.attributes['select'];if(i==null||i=='')i='*';var h=[] ;var m=[] ;for(var k in j){(DD(k,i)?h:m).add(k);}if(h.length==0){h=g.nodes;}mB(g,h);j=m;}return j;}static  DD( h, g){if(h is !l.Element)return g=='*';return (h as l.Element).matches(g);}static  lB( g)=>g.tagName=='CONTENT'||g.tagName=='SHADOW';static  ED( g){assert(lB(g));for(g=g.parent;g!=null;g=g.parent){if(lB(g))return false;}return true;}static  mB( g, h){assert(lB(g));g.parent.insertAllBefore(h,g);g.remove();} get nodes=>host.nodes; replaceWith( g){host.replaceWith(g);} remove()=>host.remove();set text( g){host.text=g;} contains( g)=>host.contains(g); insertBefore( g, h)=>host.insertBefore(g,h); insertAllBefore( g, h)=>host.insertAllBefore(g,h); get attributes=>host.attributes; get children=>host.children; get classes=>host.classes; clone( g)=>host.clone(g); get parent=>host.parent; get parentNode=>host.parentNode; get nodeValue=>host.nodeValue; get id=>host.id;set id( g){host.id=g;} set innerHtml( g){host.innerHtml=g;} get tagName=>host.tagName; matches( g)=>host.matches(g); query( g)=>host.query(g); queryAll( g)=>host.queryAll(g); get JD=>host.JD; get className=>host.className;set className( g){host.className=g;} get KD=>host.KD; get ND=>host.ND; LD( g)=>host.LD(g); MD( g)=>host.MD(g); QD( g)=>host.QD(g); RD( g)=>host.RD(g); VD( h, g)=>host.VD(h,g);get HD=>host.HD; get ID=>host.ID; get firstChild=>host.firstChild; get localName=>host.localName; get OD=>host.OD; get PD=>host.PD; GD( i, g,[ h]){host.GD(i,g,h);} SD( g)=>host.SD(g); TD( i, g,[ h]){host.TD(i,g,h);} UD( g, h)=>host.UD(g,h);get xtag=>host.xtag;set xtag(g){host.xtag=g;} append( g)=>host.append(g); get onClick=>host.onClick; get onTouchCancel=>host.onTouchCancel; get onTouchEnd=>host.onTouchEnd; get onTouchLeave=>host.onTouchLeave; get onTouchMove=>host.onTouchMove; get onTouchStart=>host.onTouchStart;}class nB{final  SF;nB(this.SF); operator[]( g)=>SF[g];}var FD=false; get FC=>FD&&l.ShadowRoot.supported;//@ sourceMappingURL=touchevents.html_bootstrap.dart.map
