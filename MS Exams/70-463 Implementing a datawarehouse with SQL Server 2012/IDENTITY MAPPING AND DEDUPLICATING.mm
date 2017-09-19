<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1505567330260" ID="ID_1782114761" MODIFIED="1505567342903" TEXT="IDENTITY MAPPING AND DEDUPLICATING">
<node CREATED="1505570185277" ID="ID_239849337" MODIFIED="1505570193747" POSITION="right" TEXT="MDS">
<node CREATED="1505570195275" ID="ID_543415660" MODIFIED="1505570203866" TEXT="STRING SIMILARITY ALGORITHMS">
<node CREATED="1505570103879" ID="ID_1226067705" MODIFIED="1505570113258" TEXT="LEVENSHTEIN DISTANCE"/>
<node CREATED="1505570117670" ID="ID_788599582" MODIFIED="1505570123130" TEXT="JACCARD INDEX"/>
<node CREATED="1505570123446" ID="ID_829747928" MODIFIED="1505570131290" TEXT="ARO-WINKLER DISTANCE"/>
<node CREATED="1505570131878" ID="ID_1933515042" MODIFIED="1505570137011" TEXT="SIMIL">
<node CREATED="1505570140886" ID="ID_988374153" MODIFIED="1505570153426" TEXT="AKA RATCLIFF/OBERSHELP"/>
</node>
</node>
<node CREATED="1505570229613" ID="ID_604118477" MODIFIED="1505570234666" TEXT="MDQ.NGRAMS"/>
<node CREATED="1505570234941" ID="ID_1927980916" MODIFIED="1505570249098" TEXT="MDQ.SIMILARITYDATE"/>
</node>
<node CREATED="1505567427778" ID="ID_1809014163" MODIFIED="1505582207291" POSITION="right" TEXT="DQS">
<node CREATED="1505582179999" ID="ID_18301734" MODIFIED="1505582191188" TEXT="DQS (server)">
<node CREATED="1505582291310" ID="ID_221079812" MODIFIED="1505582298099" TEXT="DQS MATCHING">
<node CREATED="1505582299150" ID="ID_1789553491" MODIFIED="1505582312291" TEXT="PREPARE SEPARATE MATCHING POLICY KB">
<node CREATED="1505582362046" ID="ID_1847206919" MODIFIED="1505582368954" TEXT="DEFINE ONE OR MORE MATCHING RULES"/>
<node CREATED="1505582384046" ID="ID_445464937" MODIFIED="1505582403642" TEXT="COMPOSITE DOMAINS ARE USEFUL FOR MATCHING ">
<node CREATED="1505582406053" ID="ID_1310884928" MODIFIED="1505582631461" TEXT="E.G. USING NAME AND ADDRESS TOGETHER TO IDENTIFY A"/>
</node>
</node>
<node CREATED="1505582337254" ID="ID_340543022" MODIFIED="1505582357370" TEXT="CANT USE KBS CREATED FOR DOMAIN POLICY"/>
<node CREATED="1505583522998" ID="ID_3304941" MODIFIED="1505583530537" TEXT="MATCHING PROCESS">
<node CREATED="1505583536598" ID="ID_1091323565" MODIFIED="1505583548592" TEXT="SPECIFYING WEIGHT EACH DOMAIN CARRIES"/>
<node CREATED="1505583557206" ID="ID_77739835" MODIFIED="1505583573522" TEXT="CAN IDENTIFY CERTAIN DOMAINS AS REQUIRING EXACT MATCHES"/>
<node CREATED="1505583596877" ID="ID_919125816" MODIFIED="1505583602649" TEXT="RULES FOR INITIAL MATCHING"/>
<node CREATED="1505583602925" ID="ID_1819171640" MODIFIED="1505583626121" TEXT="RULES / THRESHOLDS CAN BE SPECIFIED FOR SUBSEQUENT MATCHING"/>
</node>
<node CREATED="1505583688356" ID="ID_1907654379" MODIFIED="1505583706656" TEXT="WHEN BUILDING A MATCHING KB...">
<node CREATED="1505583716788" ID="ID_734829395" MODIFIED="1505583724712" TEXT="USE SAMPLE DATA "/>
<node CREATED="1505583725276" ID="ID_1480767040" MODIFIED="1505583732960" TEXT="DEFINE DIFFERENT RULES AND TEST THEM"/>
<node CREATED="1505583737203" ID="ID_320649437" MODIFIED="1505583745720" TEXT="DO NOT NEED TO RELOAD DATA FOR EACH TEST"/>
<node CREATED="1505583764076" ID="ID_1672525251" MODIFIED="1505583785423" TEXT="WHEN FINISHED MATCHING RESULTS ARE GROUPED IN CLUSTERS FOR AN OVERVIEW"/>
<node CREATED="1505583799900" ID="ID_1592168346" MODIFIED="1505583832368" TEXT="MATCHING RESULTS ARE NOT ADDED TO THE KB - USE INTERACTIVELY TO FIND THE BEST MATCHING RULE"/>
</node>
<node CREATED="1505583855315" ID="ID_572752881" MODIFIED="1505583857871" TEXT="DATA TYPES">
<node CREATED="1505583858778" ID="ID_1709245918" MODIFIED="1505583860136" TEXT="STRINGS">
<node CREATED="1505583967994" ID="ID_1578960552" MODIFIED="1505583981190" TEXT="SHOULD BE NORMALISED WHEN YOU LOAD DATA"/>
</node>
<node CREATED="1505583862627" ID="ID_1223548002" MODIFIED="1505583864791" TEXT="NUMBERS"/>
<node CREATED="1505583865082" ID="ID_1840362883" MODIFIED="1505583866101" TEXT="DATES"/>
</node>
<node CREATED="1505583875786" ID="ID_575379787" MODIFIED="1505583889216" TEXT="DEFINE MINIMUM SCORE FOR MATCHING">
<node CREATED="1505583889899" ID="ID_991479252" MODIFIED="1505583966351" TEXT="DEFAULT 80%"/>
</node>
<node CREATED="1505584017314" ID="ID_995534143" MODIFIED="1505584035102" TEXT="CAN EXPORT MATCHING AND SURVIVORSHIP RESULTS ">
<node CREATED="1505584036489" ID="ID_367632515" MODIFIED="1505584043166" TEXT="SQL SERVER TABLE"/>
<node CREATED="1505584043409" ID="ID_578550048" MODIFIED="1505584050926" TEXT=".CSV FILE"/>
</node>
</node>
</node>
<node CREATED="1505582191438" ID="ID_1682065380" MODIFIED="1505582200971" TEXT="DQS CLEANSING TRANSFORMATION">
<node CREATED="1505582223261" ID="ID_434204201" MODIFIED="1505582242523" TEXT="STARTING POINT FOR IDENTITY MAPPING AND DEDUPLICATION"/>
<node CREATED="1505582252151" ID="ID_1927584927" MODIFIED="1505582258394" TEXT="USES DATA QUALITY SERVICES"/>
<node CREATED="1505582654540" ID="ID_683157657" MODIFIED="1505582656600" TEXT="PROCESS">
<node CREATED="1505582759987" ID="ID_973560339" MODIFIED="1505582789935" TEXT="CREATE CONNECTION TO DQS SERVICE"/>
<node CREATED="1505582790211" ID="ID_476914828" MODIFIED="1505582796103" TEXT="SELECT KB"/>
<node CREATED="1505582658194" ID="ID_616488906" MODIFIED="1505582678641" TEXT="CONNECT TO DATA SOURCE"/>
<node CREATED="1505582678956" ID="ID_1367919207" MODIFIED="1505582683944" TEXT="SELECT COLUMNS TO CORRECT">
<node CREATED="1505582808067" ID="ID_1233135975" MODIFIED="1505582841231" TEXT="REMEMBER THAT YOU HAVE SINGLE OR COMPOSITE DOMAINS">
<node CREATED="1505582875299" ID="ID_1703731247" MODIFIED="1505582909871" TEXT="IF YOU MAP MULTIPLE COLUMNS OF A COMPOSITE DOMAIN THEN COMPOSITE DOMAIN RULES ARE APPLIED"/>
<node CREATED="1505582910218" ID="ID_1031788856" MODIFIED="1505582966398" TEXT="IF YOU DONT MAP TO ALL DOMAINS FROM A COMPOSITE DOMAIN THEN SINGLE DOMAIN RULES ARE APPLIED AND EACH COLUMN IS PROCESSED AND CLEANSED INDIVIDUALLY"/>
</node>
</node>
<node CREATED="1505582684354" ID="ID_142590664" MODIFIED="1505582728655" TEXT="MAP TO APPROPRIATE DQS KB DOMAINS"/>
</node>
<node CREATED="1505582978514" ID="ID_847864341" MODIFIED="1505582986638" TEXT="ADVANCED CONFIGURATION">
<node CREATED="1505582987817" ID="ID_1333088794" MODIFIED="1505582993702" TEXT="STANDARDIZE OUTPUT">
<node CREATED="1505583098625" ID="ID_704595590" MODIFIED="1505583104205" TEXT="FOLLOWING DOMAIN SETTINGS"/>
</node>
<node CREATED="1505582993954" ID="ID_1024508763" MODIFIED="1505582996942" TEXT="CONFIDENCE"/>
<node CREATED="1505582997209" ID="ID_1513387242" MODIFIED="1505582999837" TEXT="REASON"/>
<node CREATED="1505583000113" ID="ID_1771512589" MODIFIED="1505583003877" TEXT="APPENDED DATA"/>
<node CREATED="1505583004329" ID="ID_1423661965" MODIFIED="1505583010966" TEXT="APPENDED DATA SCHEMA"/>
</node>
<node CREATED="1505583147520" ID="ID_1147523266" MODIFIED="1505583159660" TEXT="ERROR OUTPUT FOR HANDLING ROW LEVEL ERRORS"/>
<node CREATED="1505583166567" ID="ID_830924845" MODIFIED="1505583175868" TEXT="ALWAYS CLEANSE DATA BEFORE MATCHING!!!"/>
</node>
</node>
<node CREATED="1505569144429" ID="ID_1276386464" MODIFIED="1505584350116" POSITION="right" TEXT="FUZZY TOOLS">
<node CREATED="1505584338423" ID="ID_1477237992" MODIFIED="1505584562707" TEXT="MDS ADD IN FOR EXCEL W/ DQS MATCHING KB FOR INTERACTIVE MATCHING"/>
<node CREATED="1505584582222" ID="ID_852957887" MODIFIED="1505584602515" TEXT="LIMITED TO CHARACTER DATA COMPARISONS"/>
<node CREATED="1505584707814" ID="ID_1195580412" MODIFIED="1505585016733" TEXT="FUZZY TRANSFORMATIONS">
<node CREATED="1505569741761" ID="ID_225793109" MODIFIED="1505584359229" TEXT="FUZZY LOOKUP (SSIS)">
<node CREATED="1505585040587" ID="ID_1342325337" MODIFIED="1505585044071" TEXT="IDENTITY MAPPING"/>
<node CREATED="1505585051053" ID="ID_1136409444" MODIFIED="1505585053575" TEXT="PARAMETERS">
<node CREATED="1505585055466" ID="ID_584764429" MODIFIED="1505585067607" TEXT="MAX NUMBER OF MATCHES PER ROW"/>
<node CREATED="1505585067931" ID="ID_996508600" MODIFIED="1505585074328" TEXT="TOKEN DELIMITERS"/>
<node CREATED="1505585074731" ID="ID_389235715" MODIFIED="1505585081231" TEXT="SIMILARITY THRESHOLDS">
<node CREATED="1505585123522" ID="ID_1506533910" MODIFIED="1505585131518" TEXT="START HIGH"/>
</node>
</node>
<node CREATED="1505585134537" ID="ID_31858954" MODIFIED="1505585140724" TEXT="OUTPUT">
<node CREATED="1505585142185" ID="ID_900993693" MODIFIED="1505585148377" TEXT="TWO ADDITIONAL COLUMNS">
<node CREATED="1505585149954" ID="ID_1082567385" MODIFIED="1505585154158" TEXT="_SIMILARITY"/>
<node CREATED="1505585154633" ID="ID_1378835347" MODIFIED="1505585158558" TEXT="_CONFIDENCE"/>
</node>
</node>
</node>
<node CREATED="1505569745353" ID="ID_885778346" MODIFIED="1505584362556" TEXT="FUZZY GROUPING (SSIS)">
<node CREATED="1505585180370" ID="ID_1272278571" MODIFIED="1505585185238" TEXT="DEDUPLICATION"/>
<node CREATED="1505585186089" ID="ID_1637320820" MODIFIED="1505585187782" TEXT="OUTPUT">
<node CREATED="1505585196833" ID="ID_907348509" MODIFIED="1505585210181" TEXT="THREE ADDITIONAL COLUMNS">
<node CREATED="1505585211384" ID="ID_455178131" MODIFIED="1505585219438" TEXT="_KEY_IN">
<node CREATED="1505585255297" ID="ID_1425334488" MODIFIED="1505585274341" TEXT="UNIQUELY IDENTIFIES ROW AS INPUT"/>
</node>
<node CREATED="1505585219864" ID="ID_689210896" MODIFIED="1505585224270" TEXT="_KEY_OUT">
<node CREATED="1505585277736" ID="ID_296676100" MODIFIED="1505585286070" TEXT="UNIQUELY IDENTIFIES ROW AS OUTPUT"/>
</node>
<node CREATED="1505585224801" ID="ID_455046638" MODIFIED="1505585229013" TEXT="_SCORE">
<node CREATED="1505585287872" ID="ID_890219516" MODIFIED="1505585310965" TEXT="0-1 INDICATING SIMILARITY TO CANONICAL ROW "/>
<node CREATED="1505585311617" ID="ID_117337492" MODIFIED="1505585321125" TEXT="CANONICAL ROW HAS A VALUE OF 1"/>
</node>
</node>
<node CREATED="1505585373977" ID="ID_527278394" MODIFIED="1505585381333" TEXT="EXTRA COLUMNS">
<node CREATED="1505585396160" ID="ID_1342595878" MODIFIED="1505585422420" TEXT="COLS USED FOR APPROXIMATE STRING COMPARISOM WITH CLEAN VALUES"/>
</node>
</node>
</node>
<node CREATED="1505584673056" ID="ID_1137092166" MODIFIED="1505585020971" TEXT="EXCEL FUZZY LOOKUP ADD IN"/>
<node CREATED="1505584724661" ID="ID_1158785383" MODIFIED="1505584728384" TEXT="ALGORITHM">
<node CREATED="1505584729757" ID="ID_66868509" MODIFIED="1505584741402" TEXT="STARTS WITH JACCARD">
<node CREATED="1505584750149" ID="ID_214746226" MODIFIED="1505584756520" TEXT="USES WEIGHTINGS"/>
</node>
<node CREATED="1505584826340" ID="ID_233095248" MODIFIED="1505584836928" TEXT="TOKENISED ACCORDING TO LANGUAGE">
<node CREATED="1505584837947" ID="ID_636503275" MODIFIED="1505584841751" TEXT="DEFAULT = ENGLISH"/>
</node>
<node CREATED="1505584871156" ID="ID_1257561419" MODIFIED="1505584881072" TEXT="TOKENS ARE WEIGHTED ACCORDING TO FREQUENCY">
<node CREATED="1505584884715" ID="ID_942459619" MODIFIED="1505584894792" TEXT="HIGH FREQUENCY = LESS WEIGHT"/>
</node>
<node CREATED="1505584940308" ID="ID_1825663290" MODIFIED="1505584955361" TEXT="ALSO USES LEVENSCHTEIN DISTANCE"/>
<node CREATED="1505584973084" ID="ID_282951828" MODIFIED="1505584987952" TEXT="ALSO USES INTERNAL COMPONENTS (ONLY KNOWN TO MICROSOFT)"/>
</node>
<node CREATED="1505585453360" ID="ID_1196911020" MODIFIED="1505585510436" TEXT="BOTH SSIS TRANSFORMATIONS USE  CONNECTION TO SQL SERVER TO CREATE TEMPORARY TABLES  THAT THE MATCHING ALGORITHM USES"/>
</node>
</node>
<node CREATED="1505567418202" ID="ID_264205353" MODIFIED="1505582151424" POSITION="left" TEXT="IDENTITY MAPPING">
<node CREATED="1505569266213" ID="ID_222984125" MODIFIED="1505569279376" TEXT="WHICH RECORDS FROM ONE SYSTEM MATCH THOSE IN ANOTHER"/>
<node CREATED="1505569280428" ID="ID_363348438" MODIFIED="1505569288009" TEXT="TWO+ DATA SETS"/>
<node CREATED="1505569306620" ID="ID_1841965069" MODIFIED="1505569316657" TEXT="100% AUTOMATED SOLUTION IS NOT POSSIBLE"/>
<node CREATED="1505569337732" ID="ID_1967453446" MODIFIED="1505569354240" TEXT="MANUAL INTERVENTION USUALLY NECESSARY"/>
<node CREATED="1505569720441" ID="ID_1090147304" MODIFIED="1505569725301" TEXT="FUZZY LOOKUP"/>
<node CREATED="1505569921944" ID="ID_694684219" MODIFIED="1505569933100" TEXT="WHAT IS THE AUTHORITATIVE SOURCE?">
<node CREATED="1505569934056" ID="ID_1701809189" MODIFIED="1505569949132" TEXT="IDEALLY YOU WOULD HAVE MDS TO BE THE AUTHORITATIVE SOURCE"/>
</node>
</node>
<node CREATED="1505567423457" ID="ID_1050527895" MODIFIED="1505567426414" POSITION="left" TEXT="DEDUPLICATING">
<node CREATED="1505569632202" ID="ID_1193505271" MODIFIED="1505569638838" TEXT="SINGLE TABLE OF DATA"/>
<node CREATED="1505569639249" ID="ID_1423610543" MODIFIED="1505569643829" TEXT="DUPLICATES EXIST IN IT"/>
<node CREATED="1505569644289" ID="ID_485491072" MODIFIED="1505569649254" TEXT="WHICH ARE THE DUPLICATES"/>
<node CREATED="1505569649730" ID="ID_1214930112" MODIFIED="1505569679270" TEXT="WHICH IS THE CANONICAL ROW IN A SET OF DUPLICATES"/>
<node CREATED="1505569687257" ID="ID_945304964" MODIFIED="1505569689429" TEXT="DQS">
<node CREATED="1505569690329" ID="ID_102268116" MODIFIED="1505569699197" TEXT="NGRAMS ALGORITHM"/>
</node>
<node CREATED="1505569729129" ID="ID_1652924427" MODIFIED="1505569740053" TEXT="FUZZY GROUPING"/>
</node>
<node CREATED="1505570029415" ID="ID_1232342867" MODIFIED="1505570035195" POSITION="left" TEXT="ALGORITHMS">
<node CREATED="1505570036111" ID="ID_642677017" MODIFIED="1505570038387" TEXT="NGRAMS">
<node CREATED="1505570039215" ID="ID_505449062" MODIFIED="1505570052819" TEXT="TOKENISES SUBSTRINGS"/>
<node CREATED="1505570053567" ID="ID_1661431317" MODIFIED="1505570078195" TEXT="COMPARES THE SUBSTRINGS"/>
<node CREATED="1505570081934" ID="ID_875414238" MODIFIED="1505570094259" TEXT="GIVES COEFFICIENT BETWEEN 0 AND 1"/>
</node>
<node CREATED="1505570103879" ID="ID_978079309" MODIFIED="1505570113258" TEXT="LEVENSHTEIN DISTANCE"/>
<node CREATED="1505570117670" ID="ID_1250332769" MODIFIED="1505570123130" TEXT="JACCARD INDEX"/>
<node CREATED="1505570123446" ID="ID_1622131366" MODIFIED="1505570131290" TEXT="ARO-WINKLER DISTANCE"/>
<node CREATED="1505570131878" ID="ID_33093319" MODIFIED="1505570137011" TEXT="SIMIL">
<node CREATED="1505570140886" ID="ID_82788536" MODIFIED="1505570153426" TEXT="AKA RATCLIFF/OBERSHELP"/>
</node>
</node>
<node CREATED="1505570274997" ID="ID_1044606003" MODIFIED="1505570284329" POSITION="left" TEXT="SEARCH SPACE REDUCTION TECHNIQUES">
<node CREATED="1505570288405" ID="ID_639133276" MODIFIED="1505570296578" TEXT="PARTITIONING OR BLOCKING TECHNIQUE">
<node CREATED="1505570380876" ID="ID_1904040935" MODIFIED="1505570386993" TEXT="CREATING SMALLER DATA SETS"/>
</node>
<node CREATED="1505570297053" ID="ID_1646873579" MODIFIED="1505570305969" TEXT="SORTING NEIGHBOURHOOD">
<node CREATED="1505570347381" ID="ID_1895662420" MODIFIED="1505570350857" TEXT="SORTS BOTH SETS"/>
<node CREATED="1505570351141" ID="ID_123953877" MODIFIED="1505570363391" TEXT="COMPARES THEM IN WINDOWS SO NOT ALL DATA IS COMPARED AT ONCE"/>
</node>
<node CREATED="1505570306317" ID="ID_1299090098" MODIFIED="1505570312186" TEXT="PRUNING OR FILTERING">
<node CREATED="1505570397004" ID="ID_244555829" MODIFIED="1505570414824" TEXT="INTELLIGENTLY PRESELECT POSSIBLE MATCHING ROWS"/>
<node CREATED="1505570480820" ID="ID_774153294" MODIFIED="1505570489016" TEXT="HOW DO YOU PRESELECT?"/>
</node>
</node>
<node CREATED="1505570533835" ID="ID_946924825" MODIFIED="1505570542576" POSITION="left" TEXT="STEPS TO MATCH OR DEPDUPLICATE">
<node CREATED="1505570543531" ID="ID_1023702289" MODIFIED="1505570551359" TEXT="STANDARDIZE"/>
<node CREATED="1505570551691" ID="ID_417161318" MODIFIED="1505570554495" TEXT="CLEAN THE DATA"/>
<node CREATED="1505570563435" ID="ID_1997097250" MODIFIED="1505570567663" TEXT="REMOVE EXACT MATCHES"/>
<node CREATED="1505570581019" ID="ID_981877830" MODIFIED="1505570586615" TEXT="THEN...">
<node CREATED="1505570587571" HGAP="43" ID="ID_518338657" MODIFIED="1505583446554" TEXT="DQS" VSHIFT="26">
<node CREATED="1505570649043" ID="ID_1135473092" MODIFIED="1505570653335" TEXT="PARTITIONING METHODS"/>
<node CREATED="1505570656754" ID="ID_1396891738" MODIFIED="1505570662455" TEXT="MANUALLY INTERVENE"/>
<node CREATED="1505570672881" ID="ID_53238130" MODIFIED="1505570676454" TEXT="DQS MATCHING">
<node CREATED="1505571010976" ID="ID_1937766666" MODIFIED="1505571029125" TEXT="USED BY MDS ADDIN FOR EXCEL"/>
</node>
<node CREATED="1505570853242" ID="ID_1724976844" MODIFIED="1505570865717" TEXT="BETTER IF YOU HAVE A REFERENCE DATA SOURCE"/>
</node>
<node CREATED="1505570605458" ID="ID_675347869" MODIFIED="1505570607582" TEXT="or"/>
<node CREATED="1505570592291" HGAP="29" ID="ID_208998820" MODIFIED="1505583450347" TEXT="SSIS FUZZY TRANSFORMATIONS" VSHIFT="21">
<node CREATED="1505570696795" ID="ID_31746401" MODIFIED="1505570706398" TEXT="MORE BUILT IN HEURISTICS"/>
<node CREATED="1505570706657" ID="ID_1866690218" MODIFIED="1505570718695" TEXT="FILTERING METHOD">
<node CREATED="1505570720610" ID="ID_504166027" MODIFIED="1505570731053" TEXT="SIMILARITY THRESHOLD PARAMETER"/>
<node CREATED="1505570737826" ID="ID_1330664517" MODIFIED="1505570756574" TEXT="INCREASING THRESHOLD INCREASES SPEED OF MATCHING"/>
<node CREATED="1505570771146" ID="ID_14307706" MODIFIED="1505570777574" TEXT="START WITH HIGH THRESHOLD"/>
<node CREATED="1505570778121" ID="ID_1190198079" MODIFIED="1505570788078" TEXT="THEN LOWER WHEN THERE ARE FEWER ROWS TO MATCH"/>
</node>
<node CREATED="1505570813713" ID="ID_74982714" MODIFIED="1505570842118" TEXT="BETTER FOR LARGE DATA SOURCES AND WHEN YOU DONT HAVE A REFERENCE DATA SOURCE"/>
</node>
</node>
</node>
</node>
</map>
