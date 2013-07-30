import "dart:async" as nB;import "dart:collection" as wB;import "dart:html" as CB;import "dart:isolate" as JE;class nD{static const  oD="Chrome";static const  pD="Firefox";static const  qD="Internet Explorer";static const  rD="Safari";final  gD;final  minimumVersion;const nD(this.gD,[this.minimumVersion]);}class sD{const sD();}class tD{final  name;const tD(this.name);}class uD{const uD();}class vD{const vD();}var TC='ambidextrous';var xB=TC.split("");var yB=FC(TC.replaceAll(new RegExp('.'),'-').split(""));var NB=FC(new List());var oB;final LB=new u();var zB=''; get ZB{if(o){v(LB,k.n,'guessedletter');}return zB;}set ZB( g){if(GB(LB)){m(LB,k.n,'guessedletter',zB,g);}zB=g;}var AC=false; get UC{if(o){v(LB,k.n,'dead');}return AC;}set UC( g){if(GB(LB)){m(LB,k.n,'dead',AC,g);}AC=g;}var BC=false; get VC{if(o){v(LB,k.n,'won');}return BC;}set VC( g){if(GB(LB)){m(LB,k.n,'won',BC,g);}BC=g;} oC(){sC();} pC(){const  g=7;if(xB.contains(ZB)){qC();if(!yB.contains('-')){VC=true;}}else{rC();NB.add(ZB);if(NB.length==g){UC=true;}}ZB='';} qC(){for(int g=0;g<xB.length;g++ ){if(xB[g]==ZB){yB[g]=ZB;}}} rC(){var g=[[1,4,'0'],[2,3,'\/'],[2,4,'\|'],[2,5,'\\'],[3,4,'\|'],[4,3,'\/'],[4,5,'\\']];var h=g[NB.length][0];var i=g[NB.length][1];oB[h][i]=g[NB.length][2];} sC(){var h=['+---+  ','\|      ','\|      ','\|      ','\|      '];oB=new List(h.length);for(int g=0;g<h.length;g++ ){var i=h[g].split("");oB[g]=FC(i);}} tC(){var RE=CB.document.body;final SE=new CB.TableRowElement(),TE=new CB.Element.tag('td'),UE=new CB.InputElement(),VE=new CB.Element.html('<p>\n            <template></template>\n          </p>'),WE=new CB.Element.html('<p id="wrong">\n            <template></template>\n          </p>');var XE,YE,ZE,aE,bE;var cE=new HC(RE);aE=RE.nodes[3].nodes[1].nodes[1];cE.lC(aE,()=>oB,(h,g,cE){var JB=h[g];var dE;dE=SE.clone(true);cE.lC(dE,()=>JB,(h,g,cE){var UB=h[g];var eE;eE=TE.clone(true);var fE=cE.MC(()=>UB,false);eE.nodes.add(fE);cE.addAll([new CB.Text('\n            '),eE,new CB.Text('\n          ')]);});cE.addAll([new CB.Text('\n          '),dE,new CB.Text('\n        ')]);});bE=RE.nodes[5].nodes[1];cE.loop(bE,()=>yB,(h,g,cE){var l=h[g];var gE=cE.MC(()=>l,false);cE.addAll([new CB.Text(' '),gE,new CB.Text(' ')]);});XE=RE.nodes[7].nodes[1];cE.uB(XE,()=>!UC&&!VC,(cE){var hE,iE,jE,kE,lE;jE=UE.clone(true);cE.listen(jE.onInput,(i){ZB=jE.value;});cE.listen(jE.onKeyUp,(i){i=new CB.KeyEvent(i);pC();});cE.lD(()=>ZB,(j){if(jE.value!=j)jE.value=j;},false,false);lE=VE.clone(true);kE=lE.nodes[1];cE.uB(kE,()=>NB.length!=0,(cE){cE.add(new CB.Text(' Sorry! The word contains no: '));});iE=WE.clone(true);hE=iE.nodes[1];cE.loop(hE,()=>NB,(h,g,cE){var w=h[g];var mE=cE.MC(()=>w,false);cE.addAll([new CB.Text(' '),mE,new CB.Text(' ')]);});cE.addAll([new CB.Text('\n          Guess a letter...\n          '),jE,new CB.Text('\n          '),lE,new CB.Text('\n          '),iE,new CB.Text('\n        ')]);});YE=RE.nodes[7].nodes[3];cE.uB(YE,()=>UC,(cE){cE.add(new CB.Text(' You\'re dead! '));});ZE=RE.nodes[7].nodes[5];cE.uB(ZE,()=>VC,(cE){cE.add(new CB.Text(' You Win! '));});cE.TB();cE.insert();}main(){cC=true;MB.DC.kD.listen((g){print('${g.lB.name.toLowerCase()}: ${g.message}');});oC();tC();}var CC=false;var uC=s.WC;class MB{final  name; get jC=>(parent==null||parent.name=='')?name:'${parent.jC}.${name}';final  parent;var nE;var children;var oE;var pE;factory MB( g){if(g.startsWith('.')){throw new ArgumentError("name shouldn't start with a '.'");}if(aB==null)aB=<String,MB>{};if(aB.containsKey(g))return aB[g];var j=g.lastIndexOf('.');var h=null;var i;if(j==-1){if(g!='')h=new MB('');i=g;}else{h=new MB(g.substring(0,j));i=g.substring(j+1);}final l=new MB.KE(i,h);aB[g]=l;return l;}MB.KE(this.name,this.parent):children=new Map<String,MB>(){if(parent!=null)parent.children[name]=this;} get lB{if(CC){if(nE!=null)return nE;if(parent!=null)return parent.lB;}return uC;} get kD=>qE(); iD( g)=>(g>=lB); log( i, l,[j]){if(iD(i)){var h=new bB(i,l,jC,j);if(CC){var g=this;while (g!=null){g.rE(h);g=g.parent;}}else{DC.rE(h);}}} info( h,[g])=>log(s.WC,h,g); QC( h,[g])=>log(s.vC,h,g); qE(){if(CC||parent==null){if(oE==null){oE=new nB.StreamController<bB>.broadcast(sync:true);pE=oE.stream;}return pE;}else{return DC.qE();}} rE( g){if(oE!=null){oE.add(g);}}static  get DC=>new MB('');static var aB;}class s implements Comparable<s>{final  name;final  value;const s(this.name,this.value);static const  WC=const s('INFO',800);static const  vC=const s('WARNING',900); operator==( g)=>g!=null&&value==g.value; operator<( g)=>value<g.value; operator<=( g)=>value<=g.value; operator>( g)=>value>g.value; operator>=( g)=>value>=g.value; compareTo( g)=>value-g.value; get hashCode=>value; toString()=>name;}class bB{final  lB;final  message;final  jD;final  time;final  mD;static var wC=0;var exception;bB(this.lB,this.message,this.jD,[this.exception]):time=new DateTime.now(),mD=bB.wC++ ;}class wD<OB> extends RD with u implements List<OB>{final  sE;wD([ g]):sE=g!=null?new List<OB>(g):<OB>[] ;factory wD.LE( g)=>new wD<OB>()..addAll(g); get length{if(o)v(this,k.n,'length');return sE.length;}set length( h){var i=sE.length;if(i==h)return;if(GB(this)){if(h<i){for(int g=i-1;g>=h;g-- ){m(this,k.QB,g,sE[g],null);}m(this,k.n,'length',i,h);}else{m(this,k.n,'length',i,h);for(int g=i;g<h;g++ ){m(this,k.PB,g,null,null);}}}sE.length=h;} operator[]( g){if(o)v(this,k.FB,g);return sE[g];}operator[]=( g, h){var i=sE[g];if(GB(this)){m(this,k.FB,g,i,h);}sE[g]=h;} add( h){var g=sE.length;if(GB(this)){m(this,k.n,'length',g,g+1);m(this,k.PB,g,null,h);}sE.add(h);} toString(){if(o){for(int g=0;g<length;g++ ){v(this,k.FB,g);}}return sE.toString();}}typedef  cB<t,q>();class VB<t,q> extends u implements Map<t,q>{final  tE;var uE;var vE;VB({ createMap}):tE=createMap!=null?createMap():new Map<t,q>(){uE=new xC<t,q>(this);vE=new yC<t,q>(this);}factory VB.ME( i,{ createMap}){var g=new VB<t,q>(createMap:createMap);i.forEach(( h, j){g[h]=j;});return g;} get keys=>uE; get values=>vE; get length{if(o)v(this,k.n,'length');return tE.length;} get isEmpty=>length==0; get isNotEmpty=>length!=0; wE( g)=>v(this,k.FB,g); xE(){v(this,k.n,'length');tE.keys.forEach(wE);} containsKey( g){if(o)wE(g);return tE.containsKey(g);} operator[]( g){if(o)wE(g);return tE[g];} operator[]=( h, g){var j=tE.length;var i=tE[h];tE[h]=g;if(GB(this)){if(j!=tE.length){m(this,k.n,'length',j,tE.length);m(this,k.PB,h,i,g);}else if(i!=g){m(this,k.FB,h,i,g);}}} putIfAbsent( g, j()){if(o)wE(g);var h=tE.length;var i=tE.putIfAbsent(g,j);if(GB(this)&&h!=tE.length){m(this,k.n,'length',h,tE.length);m(this,k.PB,g,null,i);}return i;} remove( g){if(o)wE(g);var h=tE.length;var i=tE.remove(g);if(GB(this)&&h!=tE.length){m(this,k.QB,g,i,null);m(this,k.n,'length',h,tE.length);}return i;} addAll( h)=>h.forEach((g,i){this[g]=i;}); clear(){var g=tE.length;if(GB(this)&&g>0){tE.forEach((i,h){m(this,k.QB,i,h,null);});m(this,k.n,'length',g,0);}tE.clear();} forEach( g( key, value)){if(o)xE();tE.forEach(g);} toString()=>wB.Maps.mapToString(this);}class xC<t,q> extends wB.IterableBase<t>{final  tE;xC(this.tE); get iterator=>new xD<t,q>(tE);}class xD<t,q> implements Iterator<t>{final  tE;final  uE;var yE=false;xD( g):tE=g,uE=g.tE.keys.iterator; moveNext(){if(o)v(tE,k.n,'length');return yE=uE.moveNext();} get current{var g=uE.current;if(o&&yE)tE.wE(g);return g;}}class yC<t,q> extends wB.IterableBase<q>{final  tE;yC(this.tE); get iterator=>new yD<t,q>(tE);}class yD<t,q> implements Iterator<q>{final  tE;final  uE;final  vE;var yE;yD( g):tE=g,uE=g.tE.keys.iterator,vE=g.tE.values.iterator; moveNext(){if(o)v(tE,k.n,'length');var h=uE.moveNext();var g=vE.moveNext();if(h!=g){throw new StateError('keys and values should be the same length');}return yE=g;} get current{if(o&&yE)tE.wE(uE.current);return vE.current;}}typedef  KB( e);typedef  zC( changes);typedef  IB();typedef  AD();class pB{final oldValue;final newValue;final  changes;pB(this.oldValue,this.newValue,[this.changes]); operator==(g){return g is pB&&oldValue==g.oldValue&&newValue==g.newValue&&changes==g.changes;} get hashCode=>ND(oldValue,newValue,changes); toString(){if(changes!=null)return '#<ChangeNotification to ${newValue}: ${changes}>';return '#<ChangeNotification from ${oldValue} to ${newValue}>';}}class k{static const n=1;static const FB=2;static const PB=FB|4;static const QB=FB|8;final  type;final key;final oldValue;final newValue;k(this.type,this.key,this.oldValue,this.newValue); operator==(g){return g is k&&type==g.type&&key==g.key&&oldValue==g.oldValue&&newValue==g.newValue;} get hashCode=>OD(type,key,oldValue,newValue); toString(){var g;switch (type){case n:g='field';break;case FB:g='index';break;case PB:g='insert';break;case QB:g='remove';break;}return '#<ChangeRecord ${g} ${key} from ${oldValue} to ${newValue}>';}} BD(g, i,[ l]){if(g is u){var h=g;return EC(h,(w){i(new pB(h,h,w));});}var j=new qB(g,i,l);if(!j.zE()){return DD;}return j.AF;} EC( g, i){if(g.YB==null)g.YB=new GC();var h=g.YB.add(i);return h.remove;}FC(g){if(g is Map){var h=null;if(g is wB.SplayTreeMap){h=()=>new wB.SplayTreeMap();}else if(g is wB.LinkedHashMap){h=()=>new wB.LinkedHashMap();}return new VB.ME(g,createMap:h);}if(g is Set)return new YC.NE(g);if(g is Iterable)return new wD.LE(g);return g;}class u{var YB;var XB;final  hashCode= ++u.CD;static var CD=0;} GB( g)=>g.YB!=null&&g.YB.head!=null; get o=>WB!=null; v( g, h,i)=>WB.BF(g,h,i); m( g, j,l, h, i){if((j&(k.PB|k.QB))==0){if(h==i)return;}if(RB==null){RB=[] ;PD(ED);}if(g.XB==null){g.XB=[] ;RB.add(g);}g.XB.add(new k(j,l,h,i));} DD(){}var WB;var XC=100;var RB;var SB; ED(){var w=0;while (RB!=null||SB!=null){var j=RB;RB=null;var i=SB;SB=null;if(w++ ==XC){FD(j,i);return;}if(j!=null){for(var h in j){var UB=h.XB;h.XB=null;for(var g=h.YB.head;g!=null;g=g.next){var l=g.value;try {l(UB);}catch (SC,JB){dB(SC,JB,l,'from ${h}');}}}}if(i!=null){i.forEach((nC,RC){RC.CF();});}}} FD( l, j){var g=[] ;if(l!=null){for(var i in l){var UB=i.XB;g.add('${i} ${UB}');}}if(j!=null){for(var w in j.values){var h=w.CF();if(h!=null)g.add('${w} ${h}');}}RB=null;SB=null;var JB='exceeded notifiction limit of ${XC}, possible ' 'circular reference in observer callbacks: ${g.take(10).join(", ")}';ID(JB);}class qB{static var GD=0;final  DF= ++qB.GD;final  EF;final  FF;final  GF;final  HF=new Map();final  IF=[] ;var JF=false;var KF;qB(this.EF,this.FF,this.GF); toString()=>GF!=null?'<observer ${DF}: ${GF}>':'<observer ${DF}>'; zE(){var h=WB;WB=this;try {KF=EF();if(KF is Iterable&&KF is !List&&KF is !u){KF=(KF as Iterable).toList();}}catch (g,i){dB(g,i,EF,'from ${this}');KF=null;}HF.forEach(LF);HF.clear();assert(WB==this);WB=h;MF();return IF.length>0;} NF( i){try {FF(i);}catch (g,h){dB(g,h,FF,'from ${this}');}} MF(){var g=KF;if(g is !u)return;IF.add(EC(g,(h){NF(new pB(g,g,h));}));} BF( w, JB,g){var i=HF.putIfAbsent(w,()=>new Map());try {var h=i[g];if(h==null)h=0;i[g]=h|JB;}catch (j,l){dB(j,l,g,'hashCode or operator == from ${this}');}} LF( i, j){IF.add(EC(i,(l){if(JF)return;for(var g in l){var h=j[g.key];if(h!=null&&(h&g.type)!=0){JF=true;if(SB==null){SB=new wB.SplayTreeMap();}SB[DF]=this;return;}}}));} AF(){for(var g in IF){g();}JF=false;} CF(){if(!JF)return null;var g=KF;AF();zE();try {if(g==KF)return null;}catch (i,j){dB(i,j,g,'operator == from ${this}');return null;}var h=new pB(g,KF);NF(h);return h;}}typedef  HD( message);var ID=(g)=>print(g);typedef  JD(error,stackTrace,obj, message);var dB=KD; KD(i,g,h, j){print('web_ui.observe: unhandled error calling ${h} ${j}.\n' 'error:\n${i}\n\nstack trace:\n${g}');}class YC<HB> extends QD with u implements Set<HB>{final  OF;final  PF;YC({ createMap}):OF=createMap!=null?createMap():new Map<HB,Object>(),PF=createMap;factory YC.NE( g,{ createMap}){return new YC<HB>(createMap:createMap)..addAll(g);} contains( g){if(o)v(this,k.FB,g);return OF.containsKey(g);} add( g){var h=OF.length;OF[g]=const Object();if(h!=OF.length){m(this,k.n,'length',h,OF.length);m(this,k.PB,g,null,g);}} remove( g){if(o)v(this,k.FB,g);var h=OF.length;OF.remove(g);if(h!=OF.length){if(GB(this)){m(this,k.QB,g,g,null);m(this,k.n,'length',h,OF.length);}return true;}return false;} clear(){if(GB(this)){for(var g in OF.keys){m(this,k.QB,g,g,null);}m(this,k.n,'length',OF.length,0);}OF.clear();} get length{if(o)v(this,k.n,'length');return OF.length;} get isEmpty=>length==0; get iterator=>new zD<HB>(this); addAll( g)=>g.forEach(add); toString(){if(o){for(HB g in OF.keys){v(this,k.FB,g);}}return OF.keys.toSet().toString();}}class zD<HB> implements Iterator<HB>{final  QF;final  RF;var SF=false;zD( g):QF=g,RF=g.OF.keys.iterator; moveNext(){QF.length;return SF=RF.moveNext();} get current{var g=RF.current;if(o&&SF)v(QF,k.FB,g);return g;}}class LD{}class MD{}class DB<EB>{var TF;var UF;var VF;var WF;DB.OE( g,this.VF):WF=g{if(VF!=null)VF.XF++ ;} get next=>UF; get value=>WF;set value( g)=>WF=g; YF( g, h){UF=h;TF=g;if(g!=null)g.UF=this;if(h!=null)h.TF=this;return this;} append( g)=>new DB<EB>.OE(g,VF).YF(this,UF); remove(){if(VF==null)return;VF.XF-- ;if(TF!=null){TF.UF=UF;}else{VF.ZF=UF;}if(UF!=null){UF.TF=TF;}else{VF.aF=TF;}UF=null;TF=null;VF=null;}}class GC<EB> extends wB.IterableBase<EB>{var ZF;var aF; get length=>XF;var XF=0;GC(){} get head=>ZF; add( h){var g=new DB<EB>.OE(h,this);if(aF==null)return ZF=aF=g;return aF=g.YF(aF,null);} addLast( g)=>add(g); addAll( g)=>g.forEach(add); get iterator=>new AE<EB>(this);}class AE<EB> implements Iterator<EB>{var bF;var VF;var cF;var dF=-1;AE(this.VF){bF=new List<DB>(VF.length);var h=0;var g=VF.head;while (g!=null){bF[h++ ]=g;g=g.next;}} get current=>cF; moveNext(){do{dF++ ;}while(dF<bF.length&&bF[dF].VF!=VF);if(dF<bF.length){cF=bF[dF].value;return true;}else{cF=null;return false;}}}eB(h,g)=>h.hashCode*31+g.hashCode;ND(h,g,i)=>eB(eB(h,g),i);OD(g,i,h,j)=>eB(eB(g,i),eB(h,j)); PD( h()){var g=new JE.ReceivePort();g.receive((i,j){g.close();h();});g.toSendPort().send(null);}abstract class QD extends wB.IterableBase<dynamic>{}abstract class RD extends wB.ListMixin<dynamic>{} SD(i, g,[ h]){var j=i is LD;if(h==null){h=i.toString();}if(!j&&g is CB.Text){g.text=h;}else{var l=g;g=j?new CB.Element.html(h):new CB.Text(h);l.replaceWith(g);}return g;} TD(g){if(g is MD)return g.toString();g=g.toString();return VD(g)?g:'#';}const UD=const["http","https","ftp","mailto"]; VD( h){var g=Uri.parse(h).scheme;if(g=='')return true;return UD.contains(g.toLowerCase())||"MAILTO"==g.toUpperCase();}abstract class rB{ TB(){} insert(); remove();}class BE extends rB{final  iC;var eF;final  listener;BE(this.iC,this.listener); insert(){eF=iC.listen(listener);} remove(){eF.cancel();eF=null;}}abstract class ZC extends rB{final exp;final  isFinal;final  NC;var AB;ZC(this.exp,this.isFinal):NC=IC&&sB!=null?sB():null; insert(){if(isFinal){OC();}else if(AB!=null){throw new StateError('binding already attached');}else{AB=PC();}} remove(){if(!isFinal){AB();AB=null;}} OC(); PC();}class CE extends ZC{final  action;CE(g,this.action, h):super(g,h); OC()=>action(new pB(null,exp())); PC()=>gB(exp,action,'generic-binding',NC);}class DE extends ZC{final  mC;final  kC;DE( g,this.mC,this.kC, h):super(g,h); fF(g){mC(kC?TD(g):g);} OC()=>fF(exp()); PC()=>gB(exp,(g)=>fF(g.newValue),'dom-property-binding',NC);}class HC extends rB{final  mB;final  children=[] ;final  nodes=[] ;HC(this.mB); listen( i, h){children.add(new BE(i,(g){h(g);bD();}));} MC( h,i){var g=new CB.Text('');children.add(new CE(()=>'${h()}',(j){g=SD(h(),g,j.newValue);},i));return g;} lD(g,j,h,[i=false]){children.add(new DE(g,j,i,h));} uB( h,g,i){children.add(new XD(h,g,i));} loop( h,g,i){children.add(new EE(h,g,i));} lC( h,g,i){children.add(new FE(h,g,i));} add( g)=>nodes.add(g); addAll( g)=>nodes.addAll(g); TB(){for(var g=0,h=children.length;g<h;g++ ){children[g].TB();}} insert(){for(var g=0,h=children.length;g<h;g++ ){children[g].insert();}} remove(){for(var g=children.length-1;g>=0;g-- ){children[g].remove();}children.clear();}}abstract class aC extends HC{final exp;var AB;aC( g,this.exp):super(g); TB(){} insert(){super.TB();if(nodes.length>0){var i=mB.parentNode;var j=mB.nextNode;for(var g=0,h=nodes.length;g<h;g++ ){i.insertBefore(nodes[g],j);}}super.insert();} remove(){super.remove();for(var g=nodes.length-1;g>=0;g-- ){nodes[g].remove();}nodes.clear();}}typedef  WD( template);class XD extends aC{var vB=false;final  gC;XD( h,g,this.gC):super(h,g); insert(){AB=gB(exp,(g){if(!vB&&g.newValue){gC(this);super.insert();vB=true;}else if(vB&&!g.newValue){super.remove();vB=false;}},'conditional-binding');} remove(){super.remove();AB();AB=null;}}typedef  bC( list, index, template);class EE extends aC{final  kB;EE( h,g,this.kB):super(h,g); insert(){AB=gB(exp,(i){super.remove();var h=i.newValue;for(int g=0;g<h.length;g++ ){kB(h,g,this);}super.insert();},'loop-binding');} remove(){super.remove();AB();AB=null;}}class FE extends HC{final  kB;final exp;var AB;FE( g,this.exp,this.kB):super(g); TB(){} insert(){AB=gB(exp,(i){gF();var h=i.newValue;for(int g=0;g<h.length;g++ ){kB(h,g,this);}super.TB();mB.nodes.addAll(nodes);super.insert();},'loop-attribute-binding');} gF(){super.remove();mB.nodes.clear();nodes.clear();} remove(){gF();AB();AB=null;}}var cC=false;var IC=false;var sB=(){try {throw "";}catch (h,g){return g.toString();}};final  fB=new MB('watcher'); YD(g, JB,[ j, w]){if(cC)return BD(g,JB);if(JB==null)return (){};if(hB==null)hB=new GC<iB>();j=j==null?'<unnamed>':j;var i;var h=BB.fD;if(g is fC){i=(g as fC).hF;}else if(g is Function){i=g;try {var l=g();if(l is List){h=BB.jB;}else if(l is Iterable){h=BB.jB;i=()=>g().toList();}else if((l is wB.LinkedHashMap)||(l is wB.SplayTreeMap)){h=BB.LC;}else if(l is Map){h=BB.KC;}}catch (UB,RC){fB.QC('evaluating ${j} watcher threw error (${UB}, ${RC})');}}else if(g is List){i=()=>g;h=BB.jB;}else if(g is Iterable){i=()=>g.toList();h=BB.jB;}else if((g is wB.LinkedHashMap)||(g is wB.SplayTreeMap)){i=()=>g;h=BB.LC;}else if(g is Map){i=()=>g;h=BB.KC;}if(IC&&w==null&&sB!=null){w=sB();}var nC=ZD(h,i,JB,j,w);var SC=hB.add(nC);return SC.remove;} ZD( l, g, j, h, i){switch (l){case BB.jB:return new GE(g,j,h,i);case BB.LC:return new IE(g,j,h,i);case BB.KC:return new HE(g,j,h,i);default:return new iB(g,j,h,i);}} gB(h, i,[ j, l]){var w=YD(h,i,j,l);var g=h;if(g is Function){g=g();}if(g is Iterable&&g is !List){g=g.toList();}i(new pB(null,g));return w;}var hB;class iB{final  hC;var location;final  iF;static var aD=0;final  hF;final  jF;var kF;iB(this.hF,this.jF,this.hC,this.location):iF=aD++ {kF=hF();} toString()=>'${hC} (id: #${iF})'; hD(){var g=lF();if(mF(g)){var h=kF;nF(g);jF(new pB(h,g));return true;}return false;} mF(g)=>kF!=g; nF(g){if(IC){if(location!=null){fB.info('watcher updated: ${this}, defined at:\n${location}');location=null;}else{fB.info('watcher updated: ${this}');}}kF=g;}lF(){try {return hF();}catch (g,h){fB.QC('${this} watcher threw an exception: ${g}, ${h}');}return kF;}}final  dC=10; bD(){if(hB==null)return;var g;var h=0;do{g=false;for(var i in hB){if(i.hD()){g=true;}}}while(g&& ++h<dC);if(h==dC){fB.QC('Possible loop in watchers propagation, stopped dispatch.');}}typedef  eC<cD>();typedef  dD<cD>( value);class fC<cD>{}class GE<cD> extends iB{GE(g, j, h, i):super(g,j,h,i){nF(lF());} mF( g){return JC(kF,g);} nF(g){kF=new List<cD>.from(g);}}class HE<tB,eD> extends iB{HE(g, j, h, i):super(g,j,h,i){nF(lF());} mF( g){var i=kF.keys;if(i.length!=g.keys.length)return true;var j=i.iterator;while (j.moveNext()){var h=j.current;if(!g.containsKey(h))return true;if(kF[h]!=g[h])return true;}return false;} nF(g){kF=new Map<tB,eD>.from(g);}}class IE<tB,eD> extends iB{IE(g, j, h, i):super(g,j,h,i){nF(lF());} mF( g){return JC(g.keys,kF.keys)||JC(g.values,kF.values);} nF(g){kF=new wB.LinkedHashMap.from(g);}} JC( i, j){var h=i.iterator;var g=j.iterator;while (h.moveNext()){if(!g.moveNext())return true;if(h.current!=g.current)return true;}return g.moveNext();}class BB{final oF;const BB.PE(this.oF);toString()=>'Enum.${oF}';static const jB=const BB.PE('LIST');static const KC=const BB.PE('HASH_MAP');static const LC=const BB.PE('ORDERED_MAP');static const fD=const BB.PE('OTHER');}//@ sourceMappingURL=hangman.html_bootstrap.dart.map