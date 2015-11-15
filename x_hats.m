function [ v ] = x_hats()
%Returns a vector v of MLE estimates of positions at different points in time.
%   Basically runs argmin (fminsearch) on x_hat_errors
M = [[0.18092487513008076, 0.11072056254850829, 0.11548324353044823, 0.14740965363718331, 0.052440578676188655]; [0.18085642784765654, 0.11172109090710736, 0.11870381837108762, 0.14423145396798284, 0.054676143632989539]; [0.18183337653975337, 0.11460538199354256, 0.12195392247876467, 0.14102071110426151, 0.057334034893181923]; [0.18182569735244739, 0.1180107254058962, 0.12523862367774111, 0.13775306985724164, 0.059724085620234527]; [0.18188534437901518, 0.12017640526270429, 0.12853870125885605, 0.13507274105648534, 0.062271800500420742]; [0.1822929528102365, 0.12333711931020667, 0.1323660201939299, 0.13201233809791779, 0.0650869526462102]; [0.1819326677752735, 0.1263088748427221, 0.13480364545066748, 0.12855879314100396, 0.068460227799641532]; [0.18427585232931426, 0.12944409014989336, 0.13803735999263791, 0.12613712676930203, 0.069771134874712926]; [0.18413017648054561, 0.13138767718877645, 0.14101737361725922, 0.1213268877660183, 0.07197966380796772]; [0.18527971591871026, 0.13472119035092014, 0.14437744826052257, 0.11907032078730187, 0.075360221133277006]; [0.18572564014894899, 0.13765005883492373, 0.14775739267448362, 0.11571814019067604, 0.077902283957751853]; [0.18704865045548105, 0.14043709557137474, 0.1509796012752192, 0.11223881592788226, 0.080862125442720506]; [0.18769761127120421, 0.14339314422971336, 0.15419003710234946, 0.10969194967186589, 0.084507074770295842]; [0.18941526859437416, 0.14736901559267471, 0.15528991948432572, 0.10616470191361667, 0.086102630423212562]; [0.18901378498779936, 0.14869455729228009, 0.16019543718474361, 0.10397316169500903, 0.089232154302476843]; [0.19057871995380204, 0.15178597992316514, 0.16369878543892372, 0.099955697068183136, 0.091978341759641771]; [0.1916219313593992, 0.15505207047883579, 0.16658561899768803, 0.097565944145254907, 0.095298689876633508]; [0.19251045300888375, 0.15781278318526157, 0.1700658609725271, 0.093879640374472148, 0.098060917077795101]; [0.19372976785566304, 0.16033389519540239, 0.17289567959847801, 0.091063743720272552, 0.10024420684822032]; [0.19396269359816179, 0.16450325636221749, 0.1781826387655821, 0.087546008162278199, 0.10397061618868761]; [0.19561196700913874, 0.16759297601729722, 0.17965115821240343, 0.084572433135827241, 0.10751536885641846]; [0.1969882651422285, 0.16949541904056212, 0.18196102790346005, 0.081403949795341102, 0.1095407609536953]; [0.19896209807962262, 0.17266053967650105, 0.18554910422438617, 0.078162028724375401, 0.11281853663606281]; [0.20047236152097164, 0.17608912923972564, 0.18882263835507154, 0.074638870785167427, 0.11559964156688472]; [0.20169265851832377, 0.17899525975385666, 0.19118298587506738, 0.07102693145409518, 0.11835846045065544]; [0.20186371425396912, 0.18326969571511331, 0.19426893389687078, 0.071125342075690184, 0.12143839495577738]; [0.20472695776210234, 0.18376255545229198, 0.19840954415239501, 0.066176678118726823, 0.12403180659384892]; [0.20593450858725831, 0.18693547313189016, 0.20038033326143526, 0.063595775546547578, 0.1277418240914566]; [0.20779265840660419, 0.19056300128505493, 0.20471714521620493, 0.05944819906677027, 0.13079093778976053]; [0.20936740913351592, 0.1940848659382908, 0.20770410684885429, 0.056652702807357479, 0.13418798200231533]; [0.21117541264211895, 0.19765616307847791, 0.2097088078454778, 0.053745645136496711, 0.13614495231793353]; [0.21222029673487641, 0.20085670851203202, 0.21372686146510844, 0.050169294168023432, 0.1403841187427789]; [0.2142582563343661, 0.20254922663132668, 0.21588874389818541, 0.045974311503579238, 0.1428795867870149]; [0.21561796806926858, 0.20653043204073498, 0.21947612865133603, 0.043902115534836868, 0.14549927487149558]; [0.21722868020912983, 0.20907150646548608, 0.22330061654645028, 0.041497541191181445, 0.14915917838745885]; [0.21902973073401996, 0.2120170323199225, 0.22658145185157338, 0.038448751687014296, 0.15202973456083529]; [0.22107197020267877, 0.21516341066940717, 0.22964406842908847, 0.035458749972292002, 0.15479899205866018]; [0.22297655347504181, 0.21887802519737506, 0.2324608786293749, 0.033418447986894091, 0.1584570276739074]; [0.22664718144272694, 0.22078512129310168, 0.23560568815276312, 0.029578251383426599, 0.15990485459889781]; [0.22697372332077109, 0.22489583515861583, 0.23925202529857045, 0.027028329488261699, 0.16406028947963694]; [0.22844634008187939, 0.22714279949276808, 0.24167163817263024, 0.024131883936034666, 0.1672607691901547]; [0.23089240275806536, 0.23036938813817998, 0.24563750776388227, 0.021382647543300784, 0.17048910059019473]; [0.23192451193582742, 0.23344898264337852, 0.2488703593217369, 0.020039170398504329, 0.17312904342639118]; [0.23446888941721883, 0.2362976639612544, 0.25247052544036336, 0.016463757469989498, 0.1764621394875163]; [0.23803183825354729, 0.23983193219391488, 0.25378340503661989, 0.015124779532628014, 0.18087011063138406]; [0.23967964738421182, 0.24184042365459113, 0.25779402570507909, 0.014450972361793015, 0.18358964369388475]; [0.2408244168914461, 0.24599867296016617, 0.26189338836316772, 0.013416726511648011, 0.18568656907685521]; [0.24297450603183898, 0.24879316512877703, 0.2642028172767325, 0.012542882696968833, 0.1890685497058906]; [0.24552312671934423, 0.25122092275983415, 0.26794092946536902, 0.013362621183512714, 0.19200684880144731]; [0.24682173286590067, 0.254134356476028, 0.27049720069931676, 0.016252211703171971, 0.19635709883771099]; [0.25043792825039979, 0.25801417311366925, 0.27334756300612045, 0.016645030112949204, 0.20003285721492364]; [0.25261521545937066, 0.26188482214272923, 0.27741073169554509, 0.020722829991911301, 0.20088831754349121]; [0.25349003055488684, 0.26434758482329901, 0.280108950619955, 0.022118858474842597, 0.20376640396756454]; [0.25587005314600786, 0.26740402721397422, 0.28357294432279762, 0.02423836820718224, 0.20752284176538258]; [0.25870055819967275, 0.26967755115073933, 0.28694285187731666, 0.026918656427935006, 0.21076567676254457]; [0.26177091332311941, 0.27265037177152512, 0.29031713828993916, 0.030142023165463248, 0.21416210750947084]; [0.26250457134537025, 0.27659637797986525, 0.29123357651024295, 0.031477836531228751, 0.21728726442254814]; [0.26431982859318243, 0.27927666679388552, 0.29651752435380452, 0.036087105459632278, 0.21987375182927008]; [0.26799264935216732, 0.28277237556065515, 0.2995622169905906, 0.039305905041416692, 0.22330314809921206]; [0.27008550281828547, 0.28590948790701548, 0.30252669082225164, 0.04156868150074864, 0.22609845693618913]; [0.27259126085837815, 0.28888981916952827, 0.30562284997045436, 0.044570007327231494, 0.22966754687671059]; [0.27448588815034181, 0.29238899953598552, 0.30825535811821414, 0.047930992236333507, 0.23177148407143522]; [0.27674105142454364, 0.29480112112424345, 0.31122524001325103, 0.050661185922385998, 0.23520109852186924]; [0.27992600888981134, 0.29907035814751459, 0.3152412578138219, 0.053094279568120538, 0.24075718554743381]; [0.28258101111590228, 0.30160468014115099, 0.31807131167599823, 0.056332300619393712, 0.24210032195336123]; [0.28497201552682544, 0.30375651782854934, 0.32184200950761727, 0.059782290062306849, 0.24512731568875479]; [0.28671703806022264, 0.30755489595079916, 0.32478347181819528, 0.063231850616162669, 0.24852307597630491]; [0.2893632563138227, 0.31124092592943348, 0.32800818842006596, 0.06607088880629515, 0.25199350853199209]; [0.29094116894310185, 0.31345526236269389, 0.33094492489585409, 0.069479354767775434, 0.25436442718990709]; [0.29435456127978854, 0.31653514791139309, 0.33295898016408987, 0.071296533204458112, 0.25684056462442367]; [0.29834852339262424, 0.31995520569233099, 0.33762945612535156, 0.075186590853383917, 0.26097995970194943]; [0.29956702199459934, 0.32303536168630448, 0.33968853640939262, 0.079501343321272455, 0.26422176785356394]; [0.30203413747642011, 0.32656169686114556, 0.34357465537318915, 0.081726302278657223, 0.26684512633838497]; [0.30475943938521455, 0.32932759626223612, 0.34653378619109271, 0.085130265531227101, 0.26959257170896544]; [0.30745973824796502, 0.33337478546436339, 0.34958575610598064, 0.087987246020435117, 0.27368430326997484]; [0.30924950393537565, 0.33462598591232467, 0.35234418110816929, 0.089754265046455242, 0.27610631202548963]; [0.31265378264457916, 0.33894819185082359, 0.35620914264426229, 0.095542284477165701, 0.27929965217714292]; [0.31382742282581416, 0.34081084567597741, 0.35912043107387481, 0.098383423248617513, 0.28282601170026517]; [0.317304878940459, 0.34499096401336804, 0.36190128916635372, 0.10113433700627801, 0.28587004468585525]; [0.32020229441482972, 0.34768604916221924, 0.36578283496183683, 0.10378955723803922, 0.28922980824142935]; [0.32209714437397047, 0.35127219844990354, 0.36883119802588843, 0.10725475735751867, 0.29170445521871569]; [0.32591447851019684, 0.35436404602815297, 0.37231771523195822, 0.11014312499652494, 0.29505739779406637]; [0.32795625717381877, 0.35737006078722633, 0.37372041256226141, 0.11481949637520138, 0.2971293357076189]; [0.33012085169274014, 0.36117296054944353, 0.37835538250772593, 0.11660312247788236, 0.30175730414744406]; [0.3334374262419002, 0.36401363438388584, 0.38091362703819232, 0.11984758173254288, 0.3045817877819787]; [0.33572985872515376, 0.36677603890224819, 0.38484838615600325, 0.12308869206303608, 0.30756036418626209]; [0.33811954822310164, 0.36968329101535763, 0.38799028676250624, 0.1260452788021264, 0.31071249602638079]; [0.34109675048119953, 0.37266653685132894, 0.39007374117583066, 0.12990815284686089, 0.31467145491215076]; [0.34395231844478868, 0.37703471615213097, 0.39578804765317532, 0.13199408650238825, 0.31765909054104424]; [0.34700050017894585, 0.37969277746271796, 0.39804838793956626, 0.13402074389334101, 0.32137304981934744]; [0.34904036495792923, 0.38205602459116561, 0.40030748900807217, 0.1383714853328665, 0.32355546851369565]; [0.35170871735659814, 0.38536374333594065, 0.40382995313872666, 0.14203230663829933, 0.32672364633806633]; [0.35468376001465879, 0.38855170038643205, 0.40678678741104335, 0.14498731152350811, 0.3299863965117556]; [0.35746808893994719, 0.39076537366252373, 0.40935460620733538, 0.14725112831128512, 0.33201504506959889]; [0.35890713339236857, 0.39524049698199487, 0.41363366554976205, 0.15110089952220024, 0.33556467975948379]; [0.36287055080155561, 0.39904546947452363, 0.41567466942924031, 0.1543114018192186, 0.33923876889383847]; [0.36529803938412103, 0.40075932804576087, 0.41920417047217673, 0.15648807886864119, 0.34093441076734898]; [0.36826839271971967, 0.40434321391066269, 0.42259745639684215, 0.16040200792193332, 0.34577375862188831]; [0.37104414089452364, 0.40724805882920068, 0.42537982773864524, 0.16322779288267006, 0.34837881298010731]; [0.37365133845521903, 0.4099345962058058, 0.42961129221283711, 0.1670372891560509, 0.35169085159540625]];
for i = 1:100
    v(i,:) = fminsearch(@(x) x_hat(x, M(i,:)), [37, -122]);
end
