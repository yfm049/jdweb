package com.jdconveyor.web.translator;

import com.jdconveyor.web.data.Language;
import com.jdconveyor.web.data.TransResult;
import com.jdconveyor.web.utils.Utils;

import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONUtil;
import jdk.internal.org.objectweb.asm.tree.IntInsnNode;
import okhttp3.*;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by lenovo on 2017/2/22.
 */
public class GoogleTransApi implements TranslatorApi{
	
	private static final String TransUrl="https://translate.googleapis.com/translate_a/single";
	
	private static int sleepTime=30000;//睡眠时间

    public static Map<String,Language> language=new LinkedHashMap<>();

    private static GoogleTransApi transApi;
    public static OkHttpClient client=new OkHttpClient();

    public synchronized static GoogleTransApi getTransApi(){
        if(transApi==null){
            transApi=new GoogleTransApi();
        }
        return transApi;
    }

    public Map<String, String> getTransResult(String query, String from, String to ) {
        return toTrans(query,from,to);
    }

    public Map<String, String> toTrans(String query, String from, String to) {
    	Map<String, String> rsMap=new LinkedHashMap<String, String>();
    	query= query.replaceAll("\n","").replaceAll("\r","");
    	System.out.println("翻译内容："+query);
        if(query.endsWith(".com")){
        	rsMap.put(query, query);
        }else {
	    	ThreadUtil.sleep(RandomUtil.randomInt(sleepTime,sleepTime*2));
	        Map<String, Object> paramMap=new HashMap<String, Object>();
	        paramMap.put("format", "html");
	        paramMap.put("client", "gtx");
	        paramMap.put("sl", from);
	        paramMap.put("tl", to);
	        paramMap.put("dt", "t");
	        paramMap.put("q", query);
	        String transRs=HttpUtil.post(TransUrl, paramMap);
	        JSONArray root=JSONUtil.parseArray(transRs).getJSONArray(0);
			for(int i=0;i<root.size();i++) {
				JSONArray item=root.getJSONArray(i);
				rsMap.put(StrUtil.replace(item.getStr(1)," ",""), item.getStr(0));
			}
        }
		System.out.println("翻译结果："+JSONUtil.toJsonStr(rsMap));
        return rsMap;
    }

    static {
        language.put("en",new Language("en","英语","English"));
        language.put("ru",new Language("ru","俄语","русский"));
        language.put("sq",new Language("sq","阿尔巴尼亚语","shqiptar"));
        language.put("ar",new Language("ar","阿拉伯语","العربية"));
        language.put("am",new Language("am","阿姆哈拉语","አማርኛ"));
        language.put("az",new Language("az","阿塞拜疆语","Azərbaycan"));
        language.put("ga",new Language("ga","爱尔兰语","Gaeilge"));
        language.put("et",new Language("et","爱沙尼亚语","eesti"));
        language.put("eu",new Language("eu","巴斯克语","Euskal"));
        language.put("be",new Language("be","白俄罗斯语","беларускі"));
        language.put("bg",new Language("bg","保加利亚语","български"));
        language.put("is",new Language("is","冰岛语","icelandic"));
        language.put("pl",new Language("pl","波兰语","polski"));
        language.put("bs",new Language("bs","波斯尼亚语","bosanski"));
        language.put("fa",new Language("fa","波斯语","فارسی"));
        language.put("af",new Language("af","布尔语(南非荷兰语)","Boole taal (Afrikaans)"));
        language.put("da",new Language("da","丹麦语","dansk"));
        language.put("de",new Language("de","德语","Deutsch"));
        language.put("fr",new Language("fr","法语","français"));
        language.put("tl",new Language("tl","菲律宾语","Pilipino"));
        language.put("fi",new Language("fi","芬兰语","suomalainen"));
        language.put("fy",new Language("fy","弗里西语","Frysk"));
        language.put("km",new Language("km","高棉语","ភាសាខ្មែរ"));
        language.put("ka",new Language("ka","格鲁吉亚语","ქართული"));
        language.put("gu",new Language("gu","古吉拉特语","ગુજરાતી"));
        language.put("kk",new Language("kk","哈萨克语","Қазақ тілі"));
        language.put("ht",new Language("ht","海地克里奥尔语","kreyòl ayisyen"));
        language.put("ko",new Language("ko","韩语","한국의"));
        language.put("ha",new Language("ha","豪萨语","Hausa"));
        language.put("nl",new Language("nl","荷兰语","Nederlands"));
        language.put("ky",new Language("ky","吉尔吉斯语","киргизский тили"));
        language.put("gl",new Language("gl","加利西亚语","galego"));
        language.put("ca",new Language("ca","加泰罗尼亚语","català"));
        language.put("cs",new Language("cs","捷克语","český"));
        language.put("kn",new Language("kn","卡纳达语","ಕನ್ನಡ"));
        language.put("co",new Language("co","科西嘉语","Corsican"));
        language.put("hr",new Language("hr","克罗地亚语","hrvatski"));
        language.put("ku",new Language("ku","库尔德语","Kurdish"));
        language.put("la",new Language("la","拉丁语","Latinae"));
        language.put("lv",new Language("lv","拉脱维亚语","Latvijas"));
        language.put("lo",new Language("lo","老挝语","ພາສາລາວ"));
        language.put("lt",new Language("lt","立陶宛语","Lietuvos"));
        language.put("lb",new Language("lb","卢森堡语","Lëtzebuergesch"));
        language.put("ro",new Language("ro","罗马尼亚语","românesc"));
        language.put("mg",new Language("mg","马尔加什语","Malagasy"));
        language.put("mt",new Language("mt","马耳他语","Malti"));
        language.put("mr",new Language("mr","马拉地语","मराठी"));
        language.put("ml",new Language("ml","马拉雅拉姆语","മലയാളം"));
        language.put("ms",new Language("ms","马来语","Malay"));
        language.put("mk",new Language("mk","马其顿语","Македонски"));
        language.put("mi",new Language("mi","毛利语","Maori"));
        language.put("mn",new Language("mn","蒙古语","Монгол"));
        language.put("bn",new Language("bn","孟加拉语","বাংলা ভাষা"));
        language.put("my",new Language("my","缅甸语","မြန်မာ"));
        language.put("hmn",new Language("hmn","苗语","Hmong"));
        language.put("xh",new Language("xh","南非科萨语","South Africa isiXhosa"));
        language.put("zu",new Language("zu","南非祖鲁语","South Africa Zulu"));
        language.put("ne",new Language("ne","尼泊尔语","नेपाली"));
        language.put("no",new Language("no","挪威语","norsk språk"));
        language.put("pa",new Language("pa","旁遮普语","ਪੰਜਾਬੀ ਦੇ"));
        language.put("pt",new Language("pt","葡萄牙语","português"));
        language.put("ps",new Language("ps","普什图语","پښتو"));
        language.put("ny",new Language("ny","齐切瓦语","Chichewa"));
        language.put("ja",new Language("ja","日语","日本の"));
        language.put("sv",new Language("sv","瑞典语","svenska"));
        language.put("sm",new Language("sm","萨摩亚语","Samoa"));
        language.put("sr",new Language("sr","塞尔维亚语","srpski језик"));
        language.put("st",new Language("st","塞索托语","Sesotho"));
        language.put("si",new Language("si","僧伽罗语","සිංහල"));
        language.put("eo",new Language("eo","世界语","esperanto"));
        language.put("sk",new Language("sk","斯洛伐克语","slovenský jazyk"));
        language.put("sl",new Language("sl","斯洛文尼亚语","Slovenski"));
        language.put("sw",new Language("sw","斯瓦希里语","lugha ya Kiswahili"));
        language.put("gd",new Language("gd","苏格兰盖尔语","Gàidhlig na h-Alba"));
        language.put("ceb",new Language("ceb","宿务语","Cebuano"));
        language.put("so",new Language("so","索马里语","Soomaali"));
        language.put("tg",new Language("tg","塔吉克语","забони тоҷикӣ"));
        language.put("te",new Language("te","泰卢固语","తెలుగు"));
        language.put("ta",new Language("ta","泰米尔语","தமிழ் மொழி"));
        language.put("th",new Language("th","泰语","ไทย"));
        language.put("tr",new Language("tr","土耳其语","Türk"));
        language.put("cy",new Language("cy","威尔士语","Cymraeg"));
        language.put("ur",new Language("ur","乌尔都语","اردو زبان"));
        language.put("uk",new Language("uk","乌克兰语","український"));
        language.put("uz",new Language("uz","乌兹别克语","O'zbekiston"));
        language.put("es",new Language("es","西班牙语","español"));
        language.put("iw",new Language("iw","希伯来语","עברי"));
        language.put("el",new Language("el","希腊语","ελληνικά"));
        language.put("haw",new Language("haw","夏威夷语","Hawaiian"));
        language.put("sd",new Language("sd","信德语","سنڌي"));
        language.put("hu",new Language("hu","匈牙利语","magyar"));
        language.put("sn",new Language("sn","修纳语","Shona"));
        language.put("hy",new Language("hy","亚美尼亚语","հայերեն"));
        language.put("ig",new Language("ig","伊博语","Igbo"));
        language.put("it",new Language("it","意大利语","lingua italiana"));
        language.put("ji",new Language("ji","意第绪语","ייִדיש"));
        language.put("hi",new Language("hi","印地语","हिन्दी"));
        language.put("su",new Language("su","印尼巽他语","Sunda Indonesian"));
        language.put("in",new Language("in","印尼语","Indonesia"));
        language.put("jw",new Language("jw","印尼爪哇语","Jawa Indonesia"));
        language.put("yo",new Language("yo","约鲁巴语","yorùbá"));
        language.put("vi",new Language("vi","越南语","tiếng việt"));
        language.put("zh-TW",new Language("zh-TW","中文(繁体)","中文(繁體)"));
        language.put("zh-CN",new Language("zh-CN","中文(简体)","中文(简体)"));

    }
    
    
    public static void main(String[] args) {
    	Map<String, String> rsMap=new LinkedHashMap<String, String>();
    	
		String jsonString="[[[\"Because the belt core selects cotton-duck, nylon-duck or EP-duck, the belt has good elasticity,excellent troughability,and low elongation, The rubber cover, which is made from chemical resistant materials, has fine anti-chemical corrosiveness and good physical properties.\",\"Because the belt core selects cotton-duck, nylon-duck or EP-duck, the belt has good elasticity,excellent troughability,and low elongation, The rubber cover, which is made from chemical resistant materials, has fine anti-chemical corrosiveness and good physical properties.\",null,null,7],[\"類別\",\"类别\",null,null,7],[\"浸泡溶液\",\"浸泡溶液\",null,null,7],[\"濃度()\",\"浓度()\",null,null,7],[\"浸泡條件溫度x時間\",\"浸泡条件温度x时间\",null,null,7],[\"浸泡前後性能變化率\",\"浸泡前后性能变化率\",null,null,7],[\"體積膨脹率\",\"体积膨胀率\",null,null,7],[\"強度變化率\",\"强度变化率\",null,null,7],[\"A1\",\"A1\",null,null,7],[\"鹽酸(HCI)\",\"盐酸(HCI)\",null,null,7],[\"18%\",\"18%\",null,null,7],[\"50°C x 96h\",\"50°C x 96h\",null,null,7],[\"+10%以下\",\"+10%以下\",null,null,7],[\"-10%以內\",\"-10%以内\",null,null,7],[\"A2\",\"A2\",null,null,7],[\"硫酸(H2SO4)\",\"硫酸(H2SO4)\",null,null,7],[\"50%\",\"50%\",null,null,7],[\"50°C x 96h\",\"50°C x 96h\",null,null,7],[\"+10%以下\",\"+10%以下\",null,null,7],[\"-10%以內\",\"-10%以内\",null,null,7],[\"A3\",\"A3\",null,null,7],[\"氫氧化鈉(NaOH)\",\"氢氧化钠(NaOH)\",null,null,7],[\"48%\",\"48%\",null,null,7],[\"50°C x 96h\",\"50°C x 96h\",null,null,7],[\"+10%以下\",\"+10%以下\",null,null,7],[\"-10%以內\",\"-10%以内\",null,null,7]],null,\"zh-CN\",null,null,null,0.96145004,[],[[\"zh-CN\"],null,[0.96145004],[\"zh-CN\"]]]";
		JSONArray root=JSONUtil.parseArray(jsonString).getJSONArray(0);
		for(int i=0;i<root.size();i++) {
			JSONArray item=root.getJSONArray(i);
			rsMap.put(StrUtil.trim(item.getStr(1)), item.getStr(0));
		}
		System.out.println(JSONUtil.toJsonStr(rsMap));
		System.out.println(StrUtil.replace("a  ba D"," ","_"));
		
		System.out.println(StrUtil.trim(" a ba D ",0));
		System.out.println(" a ba D ".replaceAll(" ", ""));
		
		System.out.println(StrUtil.replace(" a ba D "," ",""));
	}


}
