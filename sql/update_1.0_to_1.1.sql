--
-- PostgreSQL database dump
--

-- Started on 2006-06-08 07:31:21 Eastern Daylight Time

SET client_encoding = 'SQL_ASCII';
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1352 (class 1259 OID 41127)
-- Dependencies: 5
-- Name: names; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

DROP VIEW V_TICKERS CASCADE;
DROP FUNCTION GetPreviousClose(VARCHAR, VARCHAR, int, int) CASCADE;
DROP TABLE NAMES;

CREATE TABLE "names" (
    stockexchange character(10) NOT NULL,
    ticker character(20) NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public."names" OWNER TO postgres;

--
-- TOC entry 1678 (class 0 OID 41127)
-- Dependencies: 1352
-- Data for Name: names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "names" (stockexchange, ticker, name) FROM stdin;
NYSE      	IHF                 	ISHARES DOW JONES U.S. HEALTH
NYSE      	JKE                 	iShares Morningstar Large Growth Index Fund
NASDAQ    	ACTL                	Actel Corporation
AMEX      	MNM                 	Merrill Lynch & Co., Inc.
NASDAQ    	RAME                	RAM ENERGY RESOURCES
INDEX     	DYO                 	AMEX Dynamic Otc Intellidex
NASDAQ    	CREE                	Cree, Inc.
NASDAQ    	FNBP                	FNB Corporation
AMEX      	PTT                 	VCG Holding Corporation
NYSE      	AKO.B               	Embotelladora Andina S.A.
NYSE      	KTE                 	Lehman ABS Corporation
INDEX     	SXX                 	PHLX Semiconductor Index
TSE       	YGC.TO              	YGC Resources Ltd
NYSE      	KSK                 	Lehman ABS Corporation
INDEX     	DOT                 	TheStreet.com Internet Index
TSE       	IPA.TO              	Integrated Paving Concepts Inc
NYSE      	AMO                 	Alliance All-Market Advantage Fund, Inc.
NASDAQ    	HOFT                	Hooker Furniture Corporation
INDEX     	PXV                 	Consumer Staples Sector Funds SPDR UTV
AMEX      	RDR                 	RMR Preferred Dividend Fund
NASDAQ    	RTIX                	Regeneration Technologies, Inc.
NYSE      	CGT                 	CAE INC
NYSE      	EFX                 	Equifax, Inc.
TSE       	TFR.UN.TO           	Lakeport Brewing Income Fund
NYSE      	CBR                 	Ciber, Inc.
AMEX      	ILE                 	ISOLAGEN INC
NYSE      	STA                 	St. Paul Companies, Inc. (The)
TSE       	SLF.PR.A.TO         	Sun Life Financial Inc Pfd A
NASDAQ    	QCCO                	QC Holdings, Inc.
AMEX      	TCX                 	TUCOWS INC
NYSE      	VAR                 	Varian Medical Systems, Inc.
NYSE      	TLI                 	Citigroup Investments Corporate Loan Fund Inc
NYSE      	MXO                 	Maxtor Corporation
AMEX      	SVI.U               	SERVICE ACQUISITION CORP INTL UNIT
NYSE      	ELS                 	Equity Lifestyle Properties, Inc.
INDEX     	IPM                 	iShares Goldman Sachs Technology Index Fund
NASDAQ    	GGBM                	GIGABEAM CORP
NASDAQ    	STIZ                	Scientific Technologies, Incorporated
NASDAQ    	ADPT                	Adaptec, Inc.
TSE       	BAE.UN.TO           	Barclays Advantaged Equal Wt
NYSE      	LSI                 	LSI Logic Corporation
INDEX     	TSX                 	TSX COMPOSITE INDEX
NASDAQ    	CHSCP               	CHS Inc
NASDAQ    	ERTS                	Electronic Arts Inc.
NASDAQ    	SOMH                	Somerset Hills Bancorp
INDEX     	PSI                 	PSE Composite - Phillipines
TSE       	CVP.UN.TO           	Centerplate Inc IDS Units
NASDAQ    	SONS                	Sonus Networks, Inc.
TSE       	TH.TO               	Theratechnologies Inc
NASDAQ    	RSTO                	Restoration Hardware, Inc.
NYSE      	WSM                 	Williams-Sonoma, Inc.
AMEX      	MGP                 	Merchants Group, Inc.
NYSE      	SM                  	St. Mary Land
NASDAQ    	PCBK                	Pacific Continental Corporation (Ore)
NYSE      	CLB                 	Core Laboratories N.V.
TSE       	CTR.TO              	Canadian Tire Cp Ltd
NYSE      	ALK                 	Alaska Air Group, Inc.
NASDAQ    	VSEA                	Varian Semiconductor Equipment Associates, Inc.
NASDAQ    	SIAL                	Sigma-Aldrich Corporation
AMEX      	CGR                 	Claude Resources, Inc.
NASDAQ    	ESCC                	Evans & Sutherland Computer Corporation
NASDAQ    	ELMG                	EMS Technologies, Inc.
NASDAQ    	GMST                	Gemstar-TV Guide International Inc.
NASDAQ    	MEND                	Micrus Endovascular Corporation
NASDAQ    	MOCC                	Moscow CableCom Corp.
NYSE      	RCL                 	Royal Caribbean Cruises Ltd.
NYSE      	BLI                 	Big Lots, Inc.
AMEX      	DIG                 	MORGAN STANLEY
INDEX     	HHI                 	Merrill Lynch Internet Holders
NASDAQ    	LRNSE               	Excelligence Learning Corporation
NASDAQ    	ONNN                	ON Semiconductor Corporation
NASDAQ    	SHEN                	Shenandoah Telecommunications Co
NASDAQ    	GSTL                	Genco Shipping & Trading
NASDAQ    	DISK                	Image Entertainment, Inc.
NASDAQ    	ANST                	Ansoft Corporation
NASDAQ    	ELAM                	Elamex S.A. de C.V.
TSE       	VLE.TO              	Valiant Energy Inc
TSE       	EXL.TO              	Exall Resources Ltd
NASDAQ    	MTOX                	MEDTOX SCIENTFIC INC
NYSE      	WFR                 	MEMC Electronic Materials, Inc.
TSE       	GO.B.TO             	Galleon Energy Inc Cl B
NASDAQ    	POTP                	Point Therapeutics Inc
TSE       	KBL.UN.TO           	K-Bro Linen Income Fund
NYSE      	GUI                 	Gulf Power Company
TSE       	FLM.UN.TO           	Movie Distribution Income Fund
NASDAQ    	SNBT                	SNB Bancshares, Inc. (Texas)
NASDAQ    	BXXX                	Brooke Corporation
NASDAQ    	FISI                	Financial Institutions, Inc.
NYSE      	TNB                 	Thomas & Betts Corporation
NASDAQ    	NEOG                	Neogen Corporation
NYSE      	HUG                 	Hughes Supply, Inc.
NASDAQ    	PNFP                	Pinnacle Financial Partners, Inc.
NYSE      	NNC                 	Nuveen North Carolina Premium Income Municipal Fund
TSE       	RLC.TO              	Royal Laser Corporation
NYSE      	HYL                 	Lehman ABS Corporation
NYSE      	IWC                 	iShares Trust Russell Microcap
NYSE      	MTW                 	Manitowoc Company, Inc.
NYSE      	NCP                 	Nuveen California Performance Plus Municipal Fund, Inc.
NASDAQ    	FBEI                	First Bancorp of Indiana, Inc.
NASDAQ    	BSQRD               	BSQUARE CORP NEW
NASDAQ    	INPC                	InPhonic, Inc.
NYSE      	BMY.P               	BRISTOL MYER SQUI PF
NASDAQ    	PNNW                	Pennichuck Corporation
NASDAQ    	SAVB                	Savannah Bancorp, Inc. (The)
NASDAQ    	HELX                	Helix Technology Corporation
NASDAQ    	BRKR                	Bruker BioSciences Corporation
AMEX      	NKP                 	MORGAN STANLEY PLUS
NYSE      	SLM                 	SLM Corporation
NASDAQ    	NDAQ                	Nasdaq Stock Market, Inc. (The)
NYSE      	FDC                 	First Data Corporation
NASDAQ    	WITS                	Witness Systems, Inc.
NASDAQ    	SMSI                	Smith Micro Software, Inc.
TSE       	ITF.TO              	Freegold Ventures Ltd
AMEX      	EFP                 	Morgan Stanley Dean Witter & Co.
NASDAQ    	BANF                	BancFirst Corporation
NASDAQ    	DOWT                	Merrill Lynch & Co., Inc.
INDEX     	EUX                 	Major 11 International Index
NASDAQ    	SFNC                	Simmons First National Corporation
NASDAQ    	AMTD                	Ameritrade Holding Corporation
NASDAQ    	MWAV                	M-WAVE, Inc.
NASDAQ    	SMBC                	Southern Missouri Bancorp, Inc.
NYSE      	RIN                 	Rinker Group
NASDAQ    	MATV                	Matav-Cable Systems Media Ltd.
NASDAQ    	BRLCD               	BRILLIAN CORP
NASDAQ    	IFSB                	Independence Federal Savings Bank
AMEX      	EVM                 	Eaton Vance Insured California Municipal Bond Fund
NASDAQ    	TRAK                	DEALERTRACK HOLDINGS
TSE       	IBG.UN.TO           	IBI Income Fund
NASDAQ    	CVBF                	CVB Financial Corporation
NYSE      	NRP                 	Natural Resource Partners LP
INDEX     	XIT                 	AMEX Information Techonlogies Sub Index
NASDAQ    	WBNK                	Waccamaw Bankshares Inc
NYSE      	RPT                 	Ramco-Gershenson Properties Trust
INDEX     	FLG                 	streetTRACKS Dow Jones US LargeCap Growth Index Fund
AMEX      	NRK                 	Nuveen Insured New York Tax-Free Advantage Municipal Fund
NASDAQ    	IDWK                	International DisplayWorks Inc
TSE       	BCE.PR.C.TO         	BCE Inc Series A C Pfd C
NYSE      	CT                  	Capital Trust, Inc.
NASDAQ    	WEDC                	White Electronic Designs Corporation
AMEX      	AVN                 	AVANIR PHARMACEUTICALS
TSE       	SXI.TO              	Synex Internationall Inc
NASDAQ    	DEAR                	Dearborn Bancorp, Inc.
NASDAQ    	LAUR                	Laureate Education, Inc.
NYSE      	CIF                 	Colonial Intermediate High Income Fund
NASDAQ    	INTL                	Inter-Tel, Incorporated
NYSE      	NIF                 	Nuveen Premier Insured Municipal Income Fund, Inc.
NYSE      	SMF                 	Smart and Final, Inc.
NASDAQ    	FBNW                	FirstBank NW Corp.
NYSE      	LAD                 	Lithia Motors, Inc.
NASDAQ    	PWAV                	Powerwave Technologies, Inc.
NASDAQ    	CLBK                	Commercial Bankshares, Inc.
NASDAQ    	INFT                	Inforte Corp.
NASDAQ    	MSDXP               	BB&T Corporation
NYSE      	BLX                 	Banco Latinoamericano de Exportaciones, S.A.
NYSE      	OLN                 	Olin Corporation
INDEX     	XGC                 	iShares S&P Global Energy Sector
NASDAQ    	RCOM                	Register.com, Inc.
NYSE      	MJT                 	MS DW Structured Asset Corp SATUR
TSE       	AGE.TO              	Agnico-Eagle Mines Ltd
AMEX      	ALY                 	Allis-Chalmers Corporation
AMEX      	IWP                 	iShares Russell MidCap Growth Index Fund
NYSE      	GRB                 	Gerber Scientific, Inc.
NYSE      	WMK                 	Weis Markets, Inc.
NYSE      	MFI                 	MicroFinancial Incorporated
TSE       	SDM.TO              	Southernera Diamonds Inc
INDEX     	BJD                 	POWERSHARES DYNAMIC BIOTEC & GE
NYSE      	BBG                 	Bill Barrett Corporation
INDEX     	FGB                 	ISH MTR MID
NASDAQ    	WRLS                	Telular Corporation
NASDAQ    	PDLI                	Protein Design Labs, Inc.
TSE       	DG.UN.TO            	Global Diversified Investment
NASDAQ    	FDRY                	Foundry Networks, Inc.
NYSE      	JAS                 	Jo-Ann Stores, Inc.
AMEX      	MTT                 	Merrill Lynch & Co., Inc.
NASDAQ    	RCKB                	Rockville Financial, Inc.
NASDAQ    	RBNF                	Rurban Financial Corp
NASDAQ    	AVID                	Avid Technology, Inc.
NASDAQ    	APRS                	Apropos Technology, Inc.
NYSE      	RIO.P               	COMPANHIA VALE DO RIO DOC PFD
NASDAQ    	VOLV                	VOLVO AB CL B ADR
INDEX     	BWH                 	POWERSHARES WILDERHILL CLEAN EN
NASDAQ    	SOSA                	Stolt Offshore S.A.
TSE       	DIV.PR.A.TO         	Coastal Income Cp Pfd A
AMEX      	VCC                 	Veri-Tek International, Corp.
NYSE      	SFE                 	Safeguard Scientifics, Inc.
TSE       	XIN.TO              	iUnits International Equity C$ Index Fund
NASDAQ    	BNHNA               	Benihana Inc.
NYSE      	CWF                 	Chartwell Dividend and Income Fund, Inc.
NASDAQ    	COOP                	Cooperative Bankshares, Inc.
NASDAQ    	PETC                	PETCO Animal Supplies, Inc.
AMEX      	ETI                 	Citigroup Global Markets Txs Instmt
NASDAQ    	SRNA                	SERENA Software Inc.
TSE       	MID.UN.TO           	Mint Income Fund
NYSE      	LLL                 	L-3 Communications Holdings, Inc.
AMEX      	DOC                 	Digital Angel Corporation
NYSE      	LHO                 	LaSalle Hotel Properties
NYSE      	GGC                 	Georgia Gulf Corporation
NYSE      	IDR                 	Intrawest Corporation
NYSE      	NYM                 	Nymagic, Inc.
NASDAQ    	ABCW                	Anchor BanCorp Wisconsin Inc.
TSE       	OSI.TO              	Offshore Systems International
NASDAQ    	PEBK                	Peoples Bancorp of North Carolina, Inc.
NASDAQ    	PDCO                	Patterson Companies Inc.
NYSE      	MAA                 	Mid-America Apartment Communities, Inc.
NASDAQ    	PSEM                	Pericom Semiconductor Corporation
NASDAQ    	WSSI                	WebSideStory, Inc.
NYSE      	PEP                 	Pepsico, Inc.
NASDAQ    	VNWK                	Visual Networks, Inc.
NASDAQ    	DCEL                	Dobson Communications Corporation
NASDAQ    	EXFO                	EXFO Electro-Optical Engineering
NYSE      	NFP                 	National Financial Partners Corporation
NYSE      	REV                 	Revlon, Inc.
NYSE      	BCS                 	Barclays PLC
TSE       	LIV.UN.TO           	Livingston International
NYSE      	ZNH                 	China Southern Airlines Company
NASDAQ    	TLGD                	Tollgrade Communications, Inc.
NYSE      	CME                 	Chicago Mercantile Exchange Holdings
INDEX     	KHE                 	STREET TRACKS KBW BANK INDEX FU
NASDAQ    	CATY                	Cathay General Bancorp
NYSE      	MHD                 	MuniHoldings Fund, Inc.
NYSE      	GCI                 	Gannett Co., Inc.
TSE       	BMO.PR.I.TO         	Bank Of Montreal Pfd I
NASDAQ    	YDIW                	YDI Wireless, Inc.
NASDAQ    	PCIS                	Precis Inc.
NYSE      	TYW                 	TS&W/Claymore Tax-Advantaged Balanced Fund
NYSE      	CCS                 	Lehman ABS Corporation
NASDAQ    	WVFC                	WVS Financial Corp.
NYSE      	BDC                 	Belden CDT Inc
NYSE      	DLM                 	Del Monte Foods Company
AMEX      	PPY                 	MS 2.8 Mrk Participation Sec linked to DJ High
NASDAQ    	BHIP                	Natural Health Trends Corporation
NASDAQ    	DSGX                	Descartes Systems Group Inc. (The)
NYSE      	CTV                 	CommScope, Inc.
NASDAQ    	ITMN                	InterMune, Inc.
NASDAQ    	SEAB                	SeaBright Insurance Holdings, Inc.
NASDAQ    	STSA                	Sterling Financial Corporation
TSE       	SRX.TO              	SR Telecom Inc
NASDAQ    	SDIXE               	STRATEGIC DIAGNOST
NYSE      	ASH                 	Ashland Inc.
NYSE      	HPF                 	John Hancock Pfd Income Fund II
AMEX      	MCF                 	Contango Oil & Gas Company
TSE       	XMD.TO              	iUnits S&P/TSX Midcap
TSE       	AXP.TO              	Axcan Pharma Inc
NYSE      	BER                 	W.R. Berkley Corporation
NASDAQ    	MLHR                	Herman Miller, Inc.
INDEX     	DMT                 	AMEX Internet Index
TSE       	RUS.TO              	Russel Metals Inc
NASDAQ    	PARS                	Pharmos Corporation
NASDAQ    	BBOX                	Black Box Corporation
TSE       	FCO.TO              	Formation Capital Cp
AMEX      	BPF.P               	CTBI PFD CAP TR II
AMEX      	EHD                 	Citigroup Global Funding
NASDAQ    	IGTE                	iGATE Corporation
NASDAQ    	ZONS                	Zones Inc.
NASDAQ    	BDOG                	Big Dog Holding, Inc.
NYSE      	IYR                 	iShares Dow Jones US Real Estate Index
TSE       	GIB.SV.A.TO         	CGI Group Inc Cl A
NASDAQ    	GFIG                	GFI Group Inc.
NASDAQ    	LBIX                	Leading Brands Inc
NASDAQ    	HTCO                	Hickory Tech Corporation
NASDAQ    	ICDG                	ICOP Digital, Inc.
NYSE      	MLG                 	MetLife, Inc.
NYSE      	EVC                 	Entravision Communications Corporation
NYSE      	COY                 	Corporate High Yield Fund, Inc.
AMEX      	EFA                 	iShares MSCI EAFE Index Fund
NYSE      	PBG                 	Pepsi Bottling Group, Inc. (The)
INDEX     	SIS                 	AMEX Semiconductor Index
NYSE      	LZB                 	La-Z-Boy Incorporated
NASDAQ    	CRGN                	CuraGen Corporation
TSE       	CMT.TO              	Compton Petroleum Cp
AMEX      	SNT                 	Senesco Technologies Inc
NASDAQ    	CTRP                	Ctrip.com International, Ltd.
NYSE      	MTE                 	Mahanagar Telephone Nigam Ltd
NYSE      	TCP                 	Telesp Celular Participacoes S.A.
NASDAQ    	SUMX                	Summa Industries
NASDAQ    	ALFC                	Atlantic Liberty Financial Corporation
NYSE      	CRL                 	Charles River Laboratories International, Inc.
NYSE      	LLY                 	Eli Lilly and Company
NYSE      	ALJ                 	Alon USA Energy, Inc.
NYSE      	O                   	Realty Income Corporation
NYSE      	PJH                 	Merrill Lynch Dep Preferred Plus Trust Series BLC-2 Trust Ctf
INDEX     	FSQ                 	PHLX SIG FOOTWEAR & AT    HLETIC
NASDAQ    	AROW                	Arrow Financial Corporation
NYSE      	CMP                 	Compass Minerals Intl Inc
NASDAQ    	TUTR                	PLATO Learning Inc.
TSE       	TMA.UN.TO           	Trimac Income Fund
NYSE      	STR                 	Questar Corporation
TSE       	CJC.TO              	Conjuchem Inc
NASDAQ    	LXBK                	LSB Bancshares, Inc.
NASDAQ    	CTWS                	Connecticut Water Service, Inc.
AMEX      	NAK                 	Northern Dynasty Minerals, Ltd.
INDEX     	TGJ                 	POWERSHARES IPV
AMEX      	AGG                 	iShares Lehman Aggregate Bond Fund
NYSE      	OPX                 	OPTEUM INC
AMEX      	TMY                 	Transmeridian Exploration Inc
NASDAQ    	TSFG                	South Financial Group Inc. (The)
TSE       	CX.TO               	Cyberplex Inc
NYSE      	TU                  	Telus Corporation
AMEX      	VIG                 	VANGUARD DVND VIPERS
AMEX      	SBK.W               	SUN AMERICA CL D WTS
TSE       	COH.TO              	Collicutt Energy Services
NYSE      	PYK                 	PPlus Trust
NASDAQ    	CTTYC               	CATUITY INC
NASDAQ    	TECUB               	Tecumseh Products Company
AMEX      	WEL                 	Boots and Coots International Well Control,  Inc.
AMEX      	EGO                 	Eldorado Gold Corp
NYSE      	MNT                 	Mentor Corporation
NASDAQ    	ABNK                	Amegy Bancorporation, Inc.
NASDAQ    	CESV                	China Energy Savings Technology, Inc.
INDEX     	MIV                 	MID-CAP SETTLE
NASDAQ    	NATRE               	NATURE S SUHINE
AMEX      	IPB                 	Merrill Lynch & Co., Inc.
NYSE      	DKY                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
AMEX      	WSC                 	Wesco Financial Corporation
NASDAQ    	SCST                	SCS Transportation, Inc.
NASDAQ    	FBMI                	Firstbank Corporation
NASDAQ    	STGSW               	Stage Stores, Inc.
AMEX      	NXG                 	Northgate Minerals Corporation
TSE       	ECG.TO              	Envoy Communications Group Inc
NYSE      	EXC                 	EXELON CORP
TSE       	THD.TO              	Third Canadian General Inv Tr
NYSE      	DJO                 	DJ ORTHOPEDICS INC
AMEX      	SFH                 	Citigroup Global Markets Holdings Inc
NASDAQ    	GTXI                	GTx, Inc.
TSE       	LPU.UN.TO           	Larence Payout Ratio Trust II
AMEX      	USO                 	U.S. OIL FUND  ETF
NYSE      	SGF                 	Singapore Fund, Inc. (The)
NYSE      	ATO                 	Atmos Energy Corporation
NASDAQ    	CRXL                	Crucell NV
NYSE      	HOS                 	Hornbeck Offshore Services
TSE       	TVI.TO              	TVI Pacific Inc
NASDAQ    	MDWV                	Medwave, Inc.
NASDAQ    	MERQE               	Mercury Interactive Corporation
NYSE      	KRI                 	Knight-Ridder, Inc.
NYSE      	BDT                 	Blackrock Strategic Dividend Achievers
NYSE      	EOI                 	Eaton Vance Enhance Equity Income Fund
NASDAQ    	MIND                	Mitcham Industries, Inc.
TSE       	FMO.UN.TO           	Foremost Industries Income Fd
TSE       	MYO.TO              	Macyro Group Inc
NASDAQ    	OPTV                	OpenTV Corp.
NYSE      	MPJ                 	MISSISSIPPI POWER CO
AMEX      	GLA.W               	GLOBAL ACQ CORP WTS
NYSE      	PX                  	Praxair, Inc.
NASDAQ    	LGTY                	Logility, Inc.
NASDAQ    	ADRX                	Andrx Group
NYSE      	YUM                 	Yum! Brands, Inc.
INDEX     	GBS                 	AMEX GBS INDEX
NASDAQ    	VOCLD               	VOCALTEC COMMUNICATI
NASDAQ    	DEBS                	Deb Shops, Inc.
TSE       	CM.TO               	Canadian Imperial Bank of Commerce
NASDAQ    	NNBR                	NN, Inc.
NASDAQ    	CCRN                	Cross Country Healthcare, Inc.
NASDAQ    	SIFI                	SI Financial Group, Inc.
NYSE      	ABM                 	ABM Industries Incorporated
AMEX      	IYE                 	iShares Dow Jones U.S. Oil and Gas Fund
NASDAQ    	STNR                	Steiner Leisure
TSE       	TDD.M.TO            	TD Capital Trust
TSE       	SRF.TO              	Sun Rype Products Ltd
NASDAQ    	VALU                	Value Line, Inc.
AMEX      	IAF                 	Aberdeen Australia Equity Fund Inc
NYSE      	RBC                 	Regal-Beloit Corporation
TSE       	SCF.TO              	Sterling Centrecorp Inc
AMEX      	ADG                 	Allied Defense Group (The)
NASDAQ    	FMER                	FirstMerit Corporation
NYSE      	NXN                 	Nuveen Insured New York Select Tax-Free Income Portfolio
AMEX      	BCP                 	Balchem Corporation
AMEX      	MPQ                 	Meredith Enterprises Inc
NYSE      	DHR                 	Danaher Corporation
NYSE      	VOT                 	Van Kampen Florida Municipal Opportunity Trust
INDEX     	SHZ                 	iShares Tr Lehman 1-3 Year Treasury Bond
TSE       	ZIC.TO              	ZI Cp
AMEX      	SRO                 	Scudder RREEF Real Estate Fund II, Inc.
NYSE      	BKH                 	Black Hills Corporation
TSE       	RDV.TO              	Redcorp Ventures Ltd
NYSE      	KB                  	Kookmin Bank New
NYSE      	COE                 	Columbia Equity Trust, Inc.
NYSE      	DIV                 	John Hancock Patriot Select Dividend Trust
NYSE      	CYI                 	Lehman ABS Corporation
NASDAQ    	SCON                	Superconductor Technologies Inc.
AMEX      	PCA                 	Putnam California Investment Grade Municipal Trust
TSE       	FCP.TO              	First Calgary Petroleums Ltd
INDEX     	NJP                 	ISHR NYS COMP
NYSE      	EON                 	E.ON AG
NYSE      	VBF                 	Van Kampen Bond Fund
NYSE      	CKH                 	SEACOR SMIT Inc.
NASDAQ    	SGRP                	SPAR Group, Inc.
NASDAQ    	OTTR                	Otter Tail Corporation
NYSE      	SRA                 	Serono International S.A.
NYSE      	PKI                 	PerkinElmer, Inc.
NASDAQ    	WGBC                	Willow Grove Bancorp, Inc.
AMEX      	BTJ                 	Bolt Technology Corporation
TSE       	VMY.TO              	Voice Mobility International
NASDAQ    	ATRC                	AtriCure, Inc.
AMEX      	PRW                 	Pro-Pharmaceuticals, Inc.
NASDAQ    	NKBS                	Newtek Business Services Inc
TSE       	CIX.TO              	CI Financial Inc
NYSE      	AWF                 	Alliance World Dollar Government Fund II
NYSE      	CE                  	Celanese Corporation
NYSE      	DSM                 	Dreyfus Strategic Municipal Bond Fund, Inc.
AMEX      	XHB                 	SPDR Homebuilders
NASDAQ    	CIEN                	CIENA Corporation
NASDAQ    	AMRB                	American River Bankshares
NASDAQ    	COLM                	Columbia Sportswear Company
NYSE      	PYX                 	Playtex Products, Inc.
AMEX      	AZL                 	Arizona Land Income Corporation
INDEX     	NNYY                	TMT IDX
NASDAQ    	WEYS                	Weyco Group, Inc.
NASDAQ    	CRYO                	CryoCor, Inc.
NYSE      	HYY                 	Structured Products Corp 6.25 Verizon Gbl
AMEX      	MMV                 	Eaton Vance Massachusetts Municipal Income Trust
NASDAQ    	DIET                	eDiets.com, Inc.
AMEX      	MHE                 	Massachusetts Health and Education Tax-Exempt Trust
NASDAQ    	PFWD                	Phase Forward Incorporated
NYSE      	GJL                 	Strats Tr for Bellsouth Telecommunications Ctfs
INDEX     	HBS                 	MORGAN STANLEY BASKET OF HOME B
NASDAQ    	FLIC                	First of Long Island Corporation (The)
TSE       	GLN.TO              	Glentel Inc
NASDAQ    	VNBC                	Vineyard National Bancorp
TSE       	DCE.TO              	Deer Creek Energy Ltd
NYSE      	OGE                 	OGE Energy Corporation
NYSE      	CHP                 	C&D Technologies, Inc.
NASDAQ    	BORL                	Borland Software Corporation
TSE       	CUR.TO              	Diagnocure Inc
AMEX      	IED                 	INVESTOOLS INC
NASDAQ    	ARTW                	Art's-Way Manufacturing Co., Inc.
INDEX     	NVV                 	iShares Goldman Sachs Software Index Fund
AMEX      	OMR                 	Odyssey Marine Exploration, Inc.
TSE       	MTK.TO              	Matrikon Inc
AMEX      	HPB                 	MORGAN STANLEY
NASDAQ    	CNXS                	C, Inc.
AMEX      	PGC                 	Peapack-Gladstone Financial Corporation
NYSE      	IIT                 	Perusahaan Satlt Cp
NYSE      	IO                  	Input/Output, Inc.
NYSE      	ATI                 	Allegheny Technologies Incorporated
INDEX     	NJKK                	ID JKK INDEX
AMEX      	PPW.P               	PACIFICP 5% PR
NYSE      	FFC                 	Flaherty & Crumrine/Claymore Preferred Securities Income Fd In
NYSE      	WNI                 	Weider Nutrition International, Inc.
AMEX      	NFM                 	Nuveen Maryland Dividend Advantage Municipal Fund
NYSE      	EME                 	EMCOR Group, Inc.
NYSE      	ETV                 	Eaton Vance Corporation
NASDAQ    	CHMP                	Champion Industries, Inc.
TSE       	RMN.TO              	Roman Cp Ltd
NYSE      	WHR                 	Whirlpool Corporation
AMEX      	NBH                 	Neuberger Berman Intermediate Municipal Fund Inc.
NASDAQ    	ENZN                	Enzon Pharmaceuticals, Inc.
NASDAQ    	ANSR                	answerthink inc.
AMEX      	FIZ                 	National Beverage Corp.
NASDAQ    	RPRX                	REPROS THERAPEUTICS
AMEX      	RFR                 	RMR F.I.R.E. Fund
AMEX      	SJW                 	SJW Corporation
AMEX      	NZX                 	Nuveen Georgia Dividend Advantage Municipal Fund
AMEX      	EKF                 	Citigroup Global Markets
NASDAQ    	CHRS                	Charming Shoppes, Inc.
NASDAQ    	ABBC                	Abington Community Bancorp, Inc.
NYSE      	TRU                 	Torch Energy Royalty Trust
NYSE      	CBC                 	Capitol Bancorp Ltd.
NYSE      	UNM                 	UnumProvident Corporation
NYSE      	ISH                 	International Shipholding Corporation
NYSE      	KCJ                 	Lehman ABS Corporation
TSE       	DTS.UN.TO           	Diversi Trust Stable Income Fd
NASDAQ    	CIPH                	Ciphergen Biosystems, Inc.
NASDAQ    	LCUT                	Lifetime Brands, Inc.
NASDAQ    	MICC                	Millicom International Cellular S.A.
NYSE      	SRT                 	StarTek, Inc.
NYSE      	IQM                 	MS Quality Municipal Securities
NYSE      	BBA                 	Bombay Company, Inc. (The)
NASDAQ    	SYNX                	SYNERGX Systems Inc.
NASDAQ    	AFBK                	Albemarle First Bank (Charlottesville, VA)
AMEX      	MRP                 	Morgan Stanley Dean Witter & Co.
AMEX      	BFI.P               	BREMER CAP TR I
NASDAQ    	MDCI                	Medical Action Industries Inc.
NYSE      	FMT                 	Fremont General Corporation
NASDAQ    	TBHS                	The Bank Holdings, Inc.
NASDAQ    	ITCD                	ITC DeltaCom, Inc.
TSE       	TAP.NV.TO           	Molson Coors Brewing Cl B
NYSE      	VIV                 	V IVO PARTICIPACOES S.A.
NASDAQ    	NBIX                	Neurocrine Biosciences, Inc.
TSE       	EUG.TO              	Eurogas Corporation
TSE       	FEL.UN.TO           	Fairborne Energy Trust
NYSE      	EWM                 	iShares MSCI Malaysia
NYSE      	TKC                 	Turkcell Iletisim Hizmetleri AS
NYSE      	LSS                 	Lone Star Technologies, Inc.
NASDAQ    	CRAI                	CRA International,Inc.
NASDAQ    	CYDS                	CYGNE DESIG INC
AMEX      	WLC                 	Wellco Enterprises, Inc.
AMEX      	DMC                 	Document Security Systems, Inc.
NASDAQ    	CSCX                	CARDIAC SCIENCE CORP
AMEX      	ICU                 	Cenuco, Inc.
TSE       	CUP.U.TO            	Caribbean Utilities Co US$
NYSE      	HIG                 	Hartford Financial Services Group, Inc. (The)
TSE       	POU.TO              	Paramount Resources Ltd
NYSE      	FNF                 	Fidelity National Financial, Inc.
TSE       	ARG.TO              	Amerigo Resources Ltd
NYSE      	GYA                 	Corporate Asset Backed Corp CABCO
NASDAQ    	BLUDE               	IMMUCOR INC
NASDAQ    	NEXM                	NexMed, Inc.
TSE       	AL.TO               	Alcan Inc
AMEX      	LRP                 	Lorus Therapeutics, Inc.
TSE       	GLA.U.TO            	Global Alumina Corporation US$
AMEX      	NWF                 	Nuveen Insured Florida Tax-Free Advantage Municipal Fund
NYSE      	PGM                 	Putnam Investment Grade Municipal Trust
AMEX      	NML                 	Merrill Lynch & Co., Inc.
NASDAQ    	NTII                	Neurobiological Technologies, Inc.
NASDAQ    	GAFC                	Greater Atlantic Financial Corporation
TSE       	MRT.DB.TO           	Morguard REIT Debs
NYSE      	MSJ                 	MORGAN STANLEY CAPITAL TRUST V
TSE       	GSI.TO              	GSI Lumonics Inc
NYSE      	KVW                 	Lehman ABS Corporation
INDEX     	HKJ                 	ISH MTR SML GR
TSE       	CRJ.TO              	Claude Resources Inc
INDEX     	MXY                 	AMEX Mexico Index
TSE       	VEG.UN.TO           	Hot House Growers Income Fund
NYSE      	DK                  	DELEL US HOLDINGS INC
NASDAQ    	ITWO                	i2 Technologies, Inc.
NASDAQ    	APPB                	Applebee's International, Inc.
TSE       	NTL.PR.F.TO         	Nortel Networks Ltd Pfd F
NYSE      	PQE                 	Bell & Howell Company
TSE       	NAR.U.TO            	TGS North American REIT US$
AMEX      	SYI.P               	S.Y. Bancorp Inc
NYSE      	WHQ                 	W-H Energy services, Inc.
AMEX      	EWY                 	iShares MSCI South Korea Index Fund
NYSE      	RBV                 	Viacom, Inc.
NASDAQ    	ISPH                	Inspire Pharmaceuticals, Inc.
TSE       	ASV.TO              	Aspreva Pharmaceuticals Cp
TSE       	LRR.TO              	Linear Gold Cp
NYSE      	PRM                 	Primedia, Inc.
AMEX      	EXX.A               	EXX, Inc.
AMEX      	XLG                 	Rydex Russell TOP 50
NASDAQ    	SYNMW               	Syntroleum Corporation
NYSE      	PCN                 	Pimco Corporate Income Fund
NASDAQ    	OCAS                	Ohio Casualty Corporation
TSE       	MFC.TO              	Manulife Financial Cp
NYSE      	RMH                 	RMK High Income Fund Inc
NYSE      	GWF                 	Wells Fargo Cap IX
NYSE      	SSS                 	Sovran Self Storage, Inc.
TSE       	LGI.TO              	Logibec Groupe Informatique
AMEX      	KSB                 	SSB PP ELKS S& P12/05
NASDAQ    	IPAS                	iPass Inc.
NYSE      	AFK                 	Ambac Financial Group, Inc.
NASDAQ    	UNIB                	University Bancorp Inc Michigan
NYSE      	MIN                 	MFS Intermediate Income Trust
NASDAQ    	UCBH                	UCBH Holdings, Inc.
NASDAQ    	OPNT                	OPNET Technologies Inc.
NASDAQ    	OPLKD               	OPLINK COMMUNIC NEW
INDEX     	NLL                 	iShares Dow Jones U.S. Consumer Cyclical Sector Index
NYSE      	USG                 	USG Corporation
NASDAQ    	WSTM                	Workstream Inc.
NYSE      	LNC                 	Lincoln National Corporation
AMEX      	QMM                 	Q Comm International, Inc.
NASDAQ    	CCFH                	CCF Holding Company
NASDAQ    	WFSI                	WFS Financial Inc.
NYSE      	HST                 	HOST HOTELS & RESORTS I    NC
NASDAQ    	KNXA                	Kenexa Corporation
NASDAQ    	SHRP                	Sharper Image Corporation
TSE       	DTC.PR.B.TO         	Domtar Inc Pfd B
NASDAQ    	TELOZ               	TEL Offshore Trust
NASDAQ    	NMHC                	National Medical Health Card Systems, Inc.
NYSE      	APL                 	Atlas Pipeline Partners, L.P.
AMEX      	CTT                 	Competitive Technologies, Inc.
AMEX      	DSJ                 	Merrill Lynch & Co., Inc.
NYSE      	BDG.A               	Bandag, Incorporated
AMEX      	FPB                 	Fountain Powerboat Industries, Inc.
NASDAQ    	ISNS                	Image Sensing Systems, Inc.
TSE       	DMC.TO              	Datamirror Cp
NYSE      	LDG                 	Longs Drug Stores Corporation
INDEX     	EIS                 	iShares S&P 1500 Fund
NASDAQ    	QVDX                	Quovadx Inc.
INDEX     	XSH                 	Semiconductor Holders Index
NYSE      	ROK                 	ROCKWELL AUTOMATION INC
AMEX      	MHT                 	Morgan Stanley Dean Witter & Co.
INDEX     	NDVY                	DIVIDENDS IDX
NASDAQ    	IART                	Integra LifeSciences Holdings Corporation
NASDAQ    	ABCB                	ABC Bancorp
TSE       	BRA.TO              	Biomira Inc
NASDAQ    	WGII                	Washington Group International, Inc.
NYSE      	XKM                 	Lehman ABS Corporation
INDEX     	INU                 	iShares MSCI United Kingdom Index - IOPV
TSE       	ACD.TO              	Accord Financial Cp
NASDAQ    	HIMX                	HIMAX TECHNOLOGIES
NASDAQ    	AXYS                	Axsys Technologies, Inc.
NYSE      	KFS                 	Kingsway Financial Services, Inc.
AMEX      	SHA.U               	SHANGHAI CENTURY ACQUISITION C
NASDAQ    	JCDA                	Jacada Ltd.
NASDAQ    	DYNT                	Dynatronics Corporation
NASDAQ    	DWMT                	Merrill Lynch & Co., Inc.
TSE       	WES.TO              	Western Financial Group Inc
NASDAQ    	CFCP                	Coastal Financial Corporation
NYSE      	ORA                 	Ormat Technologies, Inc.
NASDAQ    	ADIC                	Advanced Digital Information Corporation
NASDAQ    	LERA                	Merrill Lynch & Co., Inc.
AMEX      	PEL                 	Morgan Stanley PROPELS S
TSE       	TCT.UN.TO           	Top 10 Canadian Financial Trust
NASDAQ    	NCEME               	NEVADA CHEMICALS
INDEX     	MID                 	AMEX S&P Midcap 400 Index
INDEX     	JDP                 	POWERSHARES WATER RESOURCES POR
AMEX      	PYR                 	PYR Energy Corporation
NYSE      	TRW                 	TRW Automotive Holdings Corporation
AMEX      	CXZ                 	Citigroup Funding Inc.
AMEX      	TGC                 	Tengasco, Inc.
NYSE      	TOC                 	THOMSON CORP
NASDAQ    	HCFC                	Home City Financial Corporation
NYSE      	ED                  	Consolidated Edison, Inc.
NYSE      	KV.B                	K-V Pharmaceutical Company
NYSE      	ANN                 	AnnTaylor Stores Corporation
TSE       	NGI.TO              	Norwall Group Inc
NYSE      	ACP                 	AMERICAN REAL ESTATE PARTNR
NASDAQ    	NICE                	NICE-Systems
NYSE      	AGR                 	Agere Systems Inc
TSE       	QEC.TO              	Questerre Energy Cp
TSE       	TRT.TO              	Trinorth Capital Inc
TSE       	NGD.TO              	New Gold Inc
NASDAQ    	IDBE                	ID Biomedical Corporation
TSE       	CIC.TO              	Certicom Cp
NYSE      	HXM                 	Desarrolladora Homex
AMEX      	SMD                 	Singing Machine Company, Inc. (The)
AMEX      	COR                 	Cortex Pharmaceuticals, Inc.
TSE       	RNK.UN.TO           	Rainmaker Income Fund
TSE       	ECA.U.TO            	Encana Cp US$
NYSE      	CLD                 	San Diego County Cal Pension Oblig
NASDAQ    	VTNC                	Vitran Corporation, Inc.
NYSE      	ALM                 	Allmerica Security Trust
NASDAQ    	ESIO                	Electro Scientific Industries, Inc.
NASDAQ    	CLMS                	Calamos Asset Management, Inc.
NYSE      	CPS                 	ChoicePoint Inc.
NASDAQ    	SSNC                	SS&C Technologies, Inc.
NYSE      	IBA                 	Industrias Bachoco, S.A. de C.V.
NASDAQ    	SBGI                	Sinclair Broadcast Group, Inc.
NYSE      	FCE.B               	Forest City Enterprises Inc
NYSE      	UBA                 	Urstadt Biddle Properties Inc.
NYSE      	TGP                 	Teekay Lng Partners, L.P.
NYSE      	FGF                 	SunAmerica Focused Alpha Growth Fund, Inc.
NYSE      	TEF                 	Telefonica SA
NASDAQ    	CRVL                	CorVel Corp.
NASDAQ    	PBIZ                	Private Business, Inc.
TSE       	GCM.TO              	Gemcom Software International
NYSE      	SR                  	Standard Register Company (The)
TSE       	HYB.UN.TO           	DDJ High Yield Fund
NASDAQ    	LIHRY               	Lihir Gold,
NASDAQ    	BNHN                	Benihana Inc.
NASDAQ    	MITI                	MICROMET INC
NYSE      	CLE                 	Claire's Stores, Inc.
NASDAQ    	GMTN                	Gander Mountain Company
TSE       	CRS.UN.TO           	Creststreet Power & Income Fund LP
NASDAQ    	PIII                	PECO II, Inc.
NYSE      	WFC                 	Wells Fargo Cap IX
NASDAQ    	USEG                	U.S. Energy Corp.
NASDAQ    	CASM                	CAS MEDICAL SYS INC
NYSE      	AME                 	AMTEK, Inc.
NYSE      	BYM                 	Blackrock Insured Municipal Income Trust
NYSE      	BZ                  	Bairnco Corporation
NYSE      	HSM                 	Hyperion Strategic Mortgage Income Fund (The)
NASDAQ    	ATCO                	American Technology Corporation
TSE       	FTU.TO              	US Financial 15 Split Cp
NYSE      	GTW                 	Gateway, Inc.
NASDAQ    	AGIL                	Agile Software Corporation
NYSE      	SAY                 	Satyam Computer Services
AMEX      	JMG.W               	JMG EXPLORATION WTS
TSE       	IDG.TO              	Indigo Books & Music Inc
NYSE      	ISI                 	ISHARES S& P 1500 IDX
NASDAQ    	EWBC                	East West Bancorp, Inc.
NASDAQ    	OVRL                	Overland Storage, Inc.
TSE       	LAB.TO              	LAB International Inc
TSE       	FIG.PR.A.TO         	Income & Growth Split Tr Pfd A
NASDAQ    	DUCK                	Duckwall-Alco Stores, Inc.
NYSE      	SGA                 	Saga Communications, Inc.
NASDAQ    	RADS                	Radiant Systems, Inc.
NYSE      	KSM                 	Scudder Strategic Municiple Income Trust
NASDAQ    	MIKR                	Mikron Infrared, Inc.
NASDAQ    	FNFG                	First Niagara Financial Group Inc.
TSE       	TTN.A.TO            	Titan Exploration Ltd Cl A
NYSE      	AMT                 	American Tower Corporation
NASDAQ    	SENEA               	Seneca Foods Corp.
NYSE      	SKY                 	Skyline Corporation
NYSE      	IAL                 	International Aluminum Corporation
NASDAQ    	TNOX                	Tanox, Inc.
NYSE      	CNB                 	Colonial BancGroup, Inc. (The)
NASDAQ    	EVOL                	Evolving Systems, Inc.
NYSE      	CVI                 	Lehman ABS Corporation
TSE       	RBA.TO              	Ritchie Bros Auctioneers Inc
NYSE      	OCR                 	Omnicare, Inc.
NYSE      	CTX                 	Centex Corporation
TSE       	TI.UN.TO            	Terravest Income Fund
NYSE      	SYT                 	Syngenta AG
TSE       	SMU.UN.TO           	Summit REIT Uts
NYSE      	RJF                 	Raymond James Financial, Inc.
NYSE      	BHP                 	BHP Billiton
INDEX     	CYO                 	MORGAN STANLEY CYCLICAL INDEX F
TSE       	BPP.PR.G.TO         	BPO Properties Ltd Pfd G
TSE       	IZP.TO              	Inflazyme Pharmaceuticals Ltd
NASDAQ    	DRLNE               	Doral Financial Corporation
NYSE      	CBT                 	Cabot Corporation
TSE       	MFE.TO              	Mainframe Entertainment Inc
NASDAQ    	NMRX                	Numerex Corp.
NASDAQ    	EDEN                	EDEN Bioscience Corporation
NYSE      	NTZ                 	Natuzzi, S.p.A.
TSE       	SNH.PR.U.TO         	SNP Health Split Cp Cl A Pfd
NASDAQ    	IIJI                	Internet Initiative Japan, Inc.
NYSE      	LEH                 	Lehman Brothers Fin SA
NASDAQ    	CALL                	CallWave, Inc.
NASDAQ    	MNKD                	MannKind Corporation
NYSE      	MQY                 	MuniYield Quality Fund, Inc.
INDEX     	SXK                 	ISH S KOREA
NASDAQ    	ARDNA               	Arden Group, Inc.
NYSE      	LG                  	Laclede Group, Inc.
AMEX      	UUD                 	Merrill Lynch & Co., Inc.
AMEX      	MGN                 	Mines Management, Inc.
INDEX     	PSG                 	streetTRACKS Dow Jones U.S. SmallCap Growth Index Fund
AMEX      	BWR                 	8% MONTHLY INCOME STRATEGIC RE
NASDAQ    	MTTX                	Merrill Lynch & Co., Inc.
TSE       	MMM.TO              	Minco Mining & Metals Cp
NASDAQ    	DMGI                	DIGITAL MUSIC GROUP
AMEX      	QEE                 	Queenstake Resources Ltd
INDEX     	ADVQ                	NASDAQ Advances
NASDAQ    	MCRL                	Micrel, Incorporated
AMEX      	TLX                 	Trans-Lux Corporation
NASDAQ    	MBRG                	Middleburg Financial Corporation
NASDAQ    	OXPS                	optionsXpress Holdings, Inc.
NYSE      	IHE                 	ISHARES DOW JONES U.S. PHARMAC
NASDAQ    	EPIK                	Epic Bancorp
AMEX      	NOX                 	Neuberger Berman Income Opportunity Fund Inc.
INDEX     	JKC                 	ML LONG/SHRT III
NASDAQ    	DECK                	Deckers Outdoor Corporation
NYSE      	WAT                 	Waters Corporation
NASDAQ    	TARO                	Taro Pharmaceutical Industries Ltd.
TSE       	BIF.UN.TO           	Bayshore Floating Rate Senior Loan Fund
AMEX      	XLY                 	SPDR Consumer Discretionary
NYSE      	SEH                 	Spartech Corporation
NYSE      	IEO                 	ISHARES DOW JONES U.S. OIL &
INDEX     	OOV                 	S&P GL 100 ED
NASDAQ    	CSLR                	Consulier Engineering, Inc.
TSE       	VTI.TO              	Veteran Resources Inc
NYSE      	BBV                 	Banco Bilbao Viscaya Argentaria S.A.
AMEX      	TFN                 	Transnational Financial Network, Inc.
NYSE      	TLK                 	P.T. Telekomunikasi Indonesia, Tbk.
NASDAQ    	ICDGW               	ICOP Digital, Inc.
NYSE      	SJR                 	Shaw Communications Inc.
NASDAQ    	MGRC                	McGrath RentCorp
TSE       	BEI.UN.TO           	Boardwalk REIT Unit
NYSE      	TAI                 	Transamerica Income, Inc.
NYSE      	SCR.A               	Sea Containers Ltd.
INDEX     	RUO                 	Cboe Russell 2000 Growth Index
NASDAQ    	AHGP                	ALLIANCE HOLDINGS GP
NYSE      	BRG                 	BG Group plc
INDEX     	DVT                 	VANG TELECOM
INDEX     	FZA                 	iShares MSCI South Afirca
AMEX      	ILC                 	iLinc Communications, Inc.
INDEX     	UXV                 	Utilities Sector Fund SPDR UTV
NASDAQ    	NKTR                	Nektar Therapeutics
NASDAQ    	PLUG                	Plug Power, Inc.
AMEX      	MNK                 	Merrill Lynch & Co., Inc.
NASDAQ    	LEGC                	LEGACY BANCORP INC.
NASDAQ    	SRIX                	Merrill Lynch & Co., Inc.
NASDAQ    	UFPI                	Universal Forest Products, Inc.
AMEX      	PPH                 	HOLDRS Pharmaceutical
NASDAQ    	FDEF                	First Defiance Financial Corp.
NASDAQ    	RDWR                	Radware Ltd.
NASDAQ    	GCOM                	Globecomm Systems Inc.
NYSE      	DDE                 	Dover Downs Gaming & Entertainment Inc
TSE       	CQC.TO              	Cusac Gold Mines Ltd
NYSE      	NPI                 	Nuveen Premium Income Municipal Fund, Inc.
NYSE      	SNX                 	Synnex Corporation
NASDAQ    	DGII                	Digi International Inc.
TSE       	GSL.TO              	Greystar Resources Ltd
AMEX      	NKR                 	Nuveen Arizona Dividend Advantage Municipal Fund 2
TSE       	AGU.TO              	Agrium Inc
NASDAQ    	SANM                	Sanmina-SCI Corporation
NASDAQ    	LGVN                	LogicVision, Inc.
AMEX      	IWR                 	iShares Russell MidCap Index Fund
NASDAQ    	DGSE                	DGSE Companies, Inc.
NASDAQ    	CSTL                	Castelle
INDEX     	ILZ                 	Dynamic Sml Cp Valu Intellidex
AMEX      	DTY                 	Merrill Lynch & Co., Inc.
NASDAQ    	HYSL                	Hyperion Solutions Corporation
NASDAQ    	GFLS                	Greater Community Bancorp
INDEX     	QAU                 	WEBS AUSTRI SHR
AMEX      	DGT                 	streetTRACKS Dow Jones Global Titans Index Fund
NASDAQ    	COBZ                	CoBiz, Inc.
NASDAQ    	FIFG                	1st Independence Financial Group, Inc.
AMEX      	AE                  	Adams Resources & Energy, Inc.
NASDAQ    	AMTY                	AMERITYRE CORP
NYSE      	JPT                 	JP Morgan Chase Capital IX
NASDAQ    	LUFK                	Lufkin Industries, Inc.
NYSE      	GLB                 	Glenborough Realty Trust Incorporated
NYSE      	DO                  	Diamond Offshore Drilling, Inc.
NYSE      	UIC                 	United Industrial Corporation
TSE       	MFU.UN.TO           	Multi Fund Income Trust
NASDAQ    	CCBD                	Community Central Bank Corp.
NASDAQ    	SGMO                	Sangamo BioSciences, Inc.
NASDAQ    	WIND                	Wind River Systems, Inc.
NASDAQ    	ALXA                	ALEXZA PHARMACEUTICA
NASDAQ    	ORCL                	Oracle Corporation
NYSE      	PMO                 	Putnam Municipal Opportunities Trust
NASDAQ    	POWI                	Power Integrations, Inc.
AMEX      	SIF                 	SIFCO Industries, Inc.
NASDAQ    	CTGI                	Capital Title Group, Inc.
NYSE      	STP                 	SUNTECH POWER HOLDINGS CO LTD
TSE       	COI.UN.TO           	Commercial & Industrial Secs
TSE       	RPI.UN.TO           	Richard Packaging Income Fund
NASDAQ    	DCAP                	DCAP Group Inc
NASDAQ    	SHBI                	Shore Bancshares Inc
TSE       	PWF.PR.I.TO         	Power Financial Cp 6% Pfd I
NYSE      	PA                  	Panamsat Holding Corporation
NASDAQ    	ARLP                	Alliance Resource Partners, L.P.
AMEX      	PTE                 	PowerShares Dynamic Telecom & Wireless
NASDAQ    	FUND                	Royce Focus Trust, Inc.
NYSE      	KCN                 	Lehman ABS Corporation
NYSE      	HAS                 	Hasbro, Inc.
NYSE      	LC                  	Liberty Corporation (The)
TSE       	BNP.UN.TO           	Bonavista Energy Trust
NASDAQ    	ECST                	eCOST.com, Inc.
NYSE      	KTV                 	Lehman ABS Corporation
AMEX      	RRM                 	Merrill Lynch & Co., Inc.
INDEX     	HKH                 	POWERSHARES HARDWARE &CO ELEC
NASDAQ    	EPIX                	EPIX Pharmaceuticals, Inc.
NASDAQ    	HOVNP               	Hovnanian Enterprises Inc
NYSE      	MHF                 	Municipal High Income Fund, Inc.
NASDAQ    	PTNX                	Printronix, Inc.
NYSE      	GR                  	Goodrich Corporation (The)
TSE       	COB.SV.A.TO         	Coolbrands International Cl A
NYSE      	PYM                 	Putnam High Yield Municipal Trust
NASDAQ    	RYAAY               	Ryanair Holdings plc
AMEX      	TIV                 	Tri-Valley Corporation
NASDAQ    	NFLX                	Netflix, Inc.
INDEX     	HVO                 	VANGUARD EMERGING MARKETS VIPER
NYSE      	BPT                 	BP Prudhoe Bay Royalty Trust
NASDAQ    	ARRY                	Array BioPharma Inc.
NASDAQ    	NTRI                	Nutri/System Inc
NYSE      	DVA                 	DaVita Inc.
TSE       	BET.UN.TO           	Builders Energy Trust
NYSE      	FWJ                 	Merrill Lynch Depositor, Inc.
AMEX      	FFI                 	Fortune Diversified Industries, Inc.
NYSE      	UTF                 	Cohen & Steers Select Utility Fund
NASDAQ    	ACBA                	American Community Bancshares
NASDAQ    	IBOC                	International Bancshares Corporation
NYSE      	NSL                 	Nuveen Senior Income Fund
TSE       	FSR.TO              	First Silver Reserve Inc
AMEX      	RFA                 	BlackRock Florida Investment Quality Municipal Trust Inc. (The
TSE       	BBD.PR.B.TO         	Bombardier Inc Pfd B
NYSE      	EXM                 	EXCEL MARITIME CARR
TSE       	ABX.U.TO            	Barrick Gold Cp US$
NASDAQ    	TUNE                	Microtune, Inc.
NASDAQ    	TTEC                	TeleTech Holdings, Inc.
TSE       	NSU.TO              	Nevsun Resources Ltd
TSE       	NMT.UN.TO           	New Millennium Technology Uts
NYSE      	NRN                 	National Rural Utilities Cooperative Finance Corp
NYSE      	CNS                 	Cohn & Steers Inc
AMEX      	SNR                 	Sunair Electronics, Inc.
NASDAQ    	CTRN                	Citi Trends, Inc.
NASDAQ    	MLEA                	Millea Holdings Inc. ADR
NASDAQ    	VION                	Vion Pharmaceuticals Inc.
NASDAQ    	JSDA                	JONES SODA CO
NYSE      	ROP                 	Roper Industries, Inc.
NYSE      	IDT                 	IDT Corporation
NYSE      	RBA                 	Ritchie Bros. Auctioneers Incorporated
AMEX      	BPS                 	BlackRock Pennsylvania Strategic Municipal Trust (The)
NASDAQ    	CPWR                	Compuware Corporation
NYSE      	PTC                 	PAR Technology Corporation
NASDAQ    	PACW                	Pac-West Telecomm, Inc.
NASDAQ    	ECPG                	Encore Capital Group Inc
NYSE      	BZA                 	Blackrock California Municipal Bond Trust
NYSE      	ASF                 	Administaff, Inc.
NYSE      	SSD                 	Simpson Manufacturing Company, Inc.
NYSE      	AOS                 	Smith (A.O.) Corporation
NYSE      	TS                  	Tenaris S.A.
AMEX      	CVV                 	CVD Equipment Corporation
AMEX      	ANJ                 	Merrill Lynch
NASDAQ    	EXAS                	EXACT Sciences Corporation
NASDAQ    	WRSP                	WorldSpace, Inc.
NASDAQ    	NSTC                	Ness Technologies, Inc.
NYSE      	TIE                 	Titanium Metals Corporation
NASDAQ    	ZIPR                	ZipRealty, Inc.
AMEX      	AHN                 	ATC HEALTHCARE INC
NASDAQ    	POSO                	Prosoft Learning Corporation
NASDAQ    	EZPW                	EZCORP, Inc.
NASDAQ    	FMCN                	Focus Media Holding
NYSE      	NXP                 	Nuveen Select Tax Free Income Portfolio
NYSE      	GGT                 	Gabelli Global Multi-Media Trust, Inc. (The)
NASDAQ    	ACGY                	ACERGY SA
TSE       	BPP.PR.J.TO         	BPO Properties Ltd Pfd J
NYSE      	WMI                 	Waste Management, Inc.
INDEX     	RWB                 	POWERSHARES DYNAMIC SMALL CAP V
NASDAQ    	SPNC                	Spectranetics Corporation (The)
TSE       	EPE.PR.A.TO         	Epcor Preferred Equity I
NYSE      	FII                 	Federated Investors, Inc.
AMEX      	OGN                 	Merrill Lynch & Co., Inc.
NASDAQ    	HOOK                	Redhook Ale Brewery, Incorporated
INDEX     	XBEL                	Brussels BEL 20
NYSE      	JKH                 	iShares Morningstar Mid Growth Index Fund
AMEX      	TPO                 	Tarpon Industries, Inc.
NASDAQ    	VITR                	Vitria Technology, Inc.
NASDAQ    	WLDA                	World Air Holdings, Inc.
NASDAQ    	CTCI                	CT Communications, Inc.
NASDAQ    	QNTAP               	QUANTA CAPITAL HOLDI
NASDAQ    	PROG                	Programmer's Paradise, Inc.
NYSE      	DFS                 	Department 56, Inc.
NYSE      	TBL                 	Timberland Company (The)
NYSE      	HTD                 	John Hancock Tax Advantaged Dividend Income Fund
NASDAQ    	HWFG                	Harrington West Financial Group, Inc.
NYSE      	OXM                 	Oxford Industries, Inc.
NYSE      	MJV                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
AMEX      	IFK                 	International Finance Corp.
NASDAQ    	GNVC                	GenVec, Inc.
TSE       	PTQ.TO              	Petaquilla Minerals Ltd
TSE       	SPF.DB.TO           	Superior Plus Income Fd Debs
NASDAQ    	TEVA                	Teva Pharmaceutical Industries
NASDAQ    	KFRC                	Kforce, Inc.
TSE       	FES.TO              	Flint Energy Services Ltd
NYSE      	BEC                 	Beckman Coulter, Inc.
NASDAQ    	ZWZZT               	TEST ZWZZT
NASDAQ    	COST                	Costco Wholesale Corporation
NYSE      	BRL                 	Barr Pharmaceuticals, Inc.
NASDAQ    	KFFB                	Kentucky First Federal Bancorp
AMEX      	IYJ                 	iShares Dow Jones U.S. Industrials Index Fund
NASDAQ    	HEOP                	Heritage Oaks Bancorp (CA)
NASDAQ    	IFCB                	Integrity Financial Corporation
TSE       	AIF.UN.TO           	Altus Group Income Fund
NYSE      	AH                  	Armor Holdings, Inc.
NYSE      	ERF                 	Enerplus Resources Fund
NYSE      	HHS                 	Harte-Hanks, Inc.
NASDAQ    	MNDX                	Morgan Stanley
NASDAQ    	NRCI                	National Research Corporation
AMEX      	WRP                 	Wellsford Real Properties Inc.
NASDAQ    	TXRH                	Texas Roadhouse, Inc.
NYSE      	PTV                 	Pactiv Corporation
AMEX      	IYG                 	iShares Dow Jones U.S. Financial Services Index Fund
TSE       	PDN.TO              	Paladin Resources Ltd
NYSE      	LAB                 	LaBranche & Co., Inc.
TSE       	TIH.TO              	Toromont Industrials Ltd
TSE       	MKP.TO              	MCAP Inc
AMEX      	IYY                 	iShares Dow Jones U.S. Total Market Index Fund
NYSE      	NTG                 	NATCO Group Inc.
NYSE      	ITP                 	Intertape Polymer Group Inc.
NASDAQ    	SMTL                	Semitool, Inc.
NASDAQ    	FRMEP               	First Merchants Corporation
NYSE      	FBC                 	Flagstar Bancorp, Inc.
NYSE      	GPJ                 	Georgia Power Company
NASDAQ    	ALSC                	Alliance Semiconductor Corporation
NYSE      	HBC                 	HSBC Holdings, plc.
NASDAQ    	SMMF                	Summit Financial Group, Inc.
NYSE      	WDR                 	Waddell & Reed Financial, Inc.
NASDAQ    	FOOT                	Foothill Independent Bancorp
TSE       	PDV.TO              	Prime Dividend Corp
NYSE      	AEP                 	American Electric Power Company, Inc.
NASDAQ    	CWBS                	Commonwealth Bankshares, Inc.
NASDAQ    	NUHC                	Nu Horizons Electronics Corp.
TSE       	CEP.TO              	Ceramic Protection Corporation
TSE       	ASR.TO              	Aspen Group Resources Cp
NYSE      	CVW                 	Lehman ABS Corporation
NASDAQ    	AMPL                	Ampal-American Israel Corporation
TSE       	PBB.UN.TO           	PBB Global Logistics Income
NYSE      	NLS                 	Nautilus Group, Inc. (The)
NYSE      	CCU                 	Clear Channel Communications, Inc.
NYSE      	AHG                 	Apria Healthcare Group, Inc.
AMEX      	CGM                 	Congoleum Corporation
INDEX     	SJA                 	WEBS JAPN SHR
NASDAQ    	MLAB                	Mesa Laboratories, Inc.
NYSE      	BCA                 	CORPBANCA
NASDAQ    	NXTP                	Nextel Partners, Inc.
NASDAQ    	ORBK                	Orbotech Ltd.
TSE       	MHG.UN.TO           	Medisys Health Group Income Fd
NYSE      	ESI                 	ITT Educational Services, Inc.
NYSE      	HMC                 	Honda Motor Company, Ltd.
TSE       	AM.TO               	Automodular Cp
INDEX     	SJG                 	POWERSHARES DYNAMIC SEMICONDUCT
NYSE      	MCA                 	MuniYield California Insured Fund, Inc.
NASDAQ    	ARLC                	Arel Communications & Software Ltd.
INDEX     	CMR                 	Morgen Stanley Consumer Index
TSE       	GLF.UN.TO           	Golf Town Income Fund
INDEX     	EJK                 	ISH MTR LRG GR
NYSE      	OUI                 	Realty Income Corporation
NYSE      	SCS                 	Steelcase Inc.
NYSE      	MJE                 	MSDW Structured Asset Corporation
NASDAQ    	VITA                	Orthovita, Inc.
NASDAQ    	STEM                	StemCells, Inc.
NYSE      	CGC                 	Cascade Natural Gas Corporation
NYSE      	MRT                 	MORTON'S RESTAURANT GROUP INC
AMEX      	FDT                 	Federal Trust Corporation
NASDAQ    	OVBC                	Ohio Valley Banc Corp.
AMEX      	SRQ                 	Scudder RREEF Real Estate Fund, Inc.
NYSE      	COG                 	Cabot Oil & Gas Corporation
NASDAQ    	PRVT                	Private Media Group, Inc.
NASDAQ    	FITB                	Fifth Third Bancorp
NYSE      	SRV                 	Sierra Pacific Resources
AMEX      	BL                  	Blair Corporation
AMEX      	ESY                 	Merrill Lynch & Co., Inc.
TSE       	PFC.TO              	Petrofalcon Cp
INDEX     	IBH                 	Biotech Holdrs Index
NYSE      	EF                  	Europe Fund, Inc. (The)
NYSE      	DKW                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
TSE       	BNS.PR.K.TO         	Bank Of Nova Scotia Pfd Srs 13
AMEX      	BPA                 	Biosante Pharmaceuticals, Inc.
TSE       	EGY.TO              	Engenuity Technologies Inc
AMEX      	TGA                 	TRAGLOBE ENERGY CORP
NASDAQ    	QSND                	QSound Labs, Inc.
TSE       	GAM.TO              	Gammon Lake Resources Inc
NASDAQ    	THQI                	THQ Inc.
TSE       	RY.PR.W.TO          	Royal Bank Pfd W
NYSE      	CHN                 	China Fund, Inc. (The)
NASDAQ    	PROS                	ProCentury Corporation
NYSE      	AF                  	Astoria Financial Corporation
AMEX      	EZA                 	iShares MSCI South Africa Index Fund
AMEX      	NLX                 	Analex Corp
TSE       	CFG.TO              	Cervus Financial Group Inc
NYSE      	VTF                 	Van Kampen Trust for Investment Grade Florida Municipals
INDEX     	NJT                 	ISHR NYSE 100
NYSE      	IMT                 	MS Insured Municipal Trust
AMEX      	PSJ                 	PowerShares Dynamic Software
NYSE      	BSY                 	British Sky Broadcasting Group, plc
AMEX      	IIN                 	IntriCon Corporation
NYSE      	TEN                 	Tenneco Automotive, Inc.
AMEX      	RPN                 	MORGAN STANLEY
TSE       	GQM.TO              	Golden Queen Mining Co Ltd
NASDAQ    	LNCR                	Lincare Holdings Inc.
NYSE      	CYG                 	Lehman ABS Corporation
TSE       	OBP.TO              	Ondine Biopharma Cp
TSE       	MDS.TO              	MDS Inc
TSE       	CEN.TO              	Clear Energy Inc
TSE       	CGH.TO              	Canadian Gold Hunter Cp
NYSE      	SRC                 	Sierra Pacific Resources
NYSE      	PPF                 	John Hancock Patriot Preferred Dividend Fund
AMEX      	NEN                 	New England Realty Associates Partnership
NASDAQ    	EFII                	Electronics for Imaging, Inc.
NASDAQ    	BLDR                	Builders FirstSource, Inc.
NYSE      	UHS                 	UNIVERSAL HLTH SVCS INC
NASDAQ    	POCI                	Precision Optics Corporation, Inc.
NYSE      	WIA                 	Western Asset/Claymore U.S. Treasury Inflation Prot Secs Fd
AMEX      	BMI                 	Badger Meter, Inc.
NASDAQ    	CORS                	CORUS Bankshares, Inc.
NASDAQ    	MAXY                	Maxygen, Inc.
AMEX      	GFE                 	MORGAN STANLEY
TSE       	CP.TO               	Canadian Pacific Railway Ltd
NYSE      	DKF                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	KRNY                	Kearny Financial
TSE       	WJA.TO              	WestJet Airlines Ltd
AMEX      	IRW                 	IBT Bancorp Inc Pa
AMEX      	KHK                 	Kitty Hawk, Inc. New
NASDAQ    	SUNH                	Sun Healthcare Group, Inc.
TSE       	MSI.UN.TO           	Morneau Sobeco Income Fd
NASDAQ    	CBRL                	CBRL Group Inc.
NYSE      	EFD                 	eFunds Corporation
NASDAQ    	STAR                	Lone Star Steakhouse & Saloon, Inc.
TSE       	DTF.UN.TO           	Diversi Trust Income Fund
NASDAQ    	XPRSA               	U.S. Xpress Enterprises, Inc.
TSE       	NYF.UN.TO           	Northwater 5 Year Mkt Neutral
NYSE      	CEN                 	Ceridian Corporation
AMEX      	PCC                 	PMC Commercial Trust
NYSE      	MAN                 	Manpower Inc
NASDAQ    	WGNB                	WGNB Corp.
NASDAQ    	STTS                	STATS ChipPAC Ltd.
NASDAQ    	GOAM                	GoAmerica, Inc.
NASDAQ    	FINL                	Finish Line, Inc. (The)
AMEX      	PVX                 	Provident Energy Trust
TSE       	BOI.UN.TO           	CI Global Opportunities
NYSE      	UMC                 	United Microelectronics Corporation
NYSE      	AW                  	Allied Waste Industries, Inc.
NYSE      	ICB                 	MS Income Securities, Inc.
AMEX      	EKD                 	CFI DOW CHEM CO ELKS
NYSE      	FFA                 	First Trust/Fiduciary
NYSE      	MSY                 	Morgan Stanley High Yield Fund, Inc.
NASDAQ    	DECT                	Dectron International, Inc.
NASDAQ    	MRTI                	Maxus Realty Trust Inc
AMEX      	DIT                 	AMCON Distributing Company
TSE       	MXW.TO              	Minacs Worldwide Inc
AMEX      	CRB.U               	COURTSIDE ACQUISITION CORP UNITS
INDEX     	XNG                 	AMEX Natural Gas Index
TSE       	CHE.DB.TO           	Chemtrade Logistics 10% Debs
NASDAQ    	CNBC                	Center Bancorp, Inc.
NASDAQ    	RENT                	Rentrak Corporation
NYSE      	EDP                 	Electricidade de Portugal, S.A.
NASDAQ    	EXJF                	Exchange National Bancshares, Inc.
NYSE      	HTB                 	Household Finance Corp
NASDAQ    	DCOM                	Dime Community Bancshares, Inc.
NASDAQ    	PHTN                	Photon Dynamics, Inc.
NYSE      	TD                  	Toronto Dominion Bank (The)
TSE       	CRG.TO              	Corona Gold Cp
NYSE      	PKG                 	Packaging Corporation of America
NYSE      	MUI                 	Muni Intermediate Duration Fund Inc
NASDAQ    	OLGC                	Orthologic Corp.
TSE       	PFN.TO              	Pacific Northwest Capital Cp
NASDAQ    	DRYR                	Dreyer's Grand Ice Cream Holdings, Inc.
AMEX      	CTH                 	7.5% SEQUI LINKED TO UNITEDH
NASDAQ    	FNDT                	Fundtech Ltd.
TSE       	RBT.TO              	R Split II Cp Capital
NYSE      	GME                 	Gamestop Corporation
AMEX      	PDL.B               	Presidential Realty Corporation
TSE       	SFK.UN.TO           	SFK Pulp Fund Unit
NASDAQ    	ACGL                	Arch Capital Group Ltd.
NYSE      	KNR                 	Lehman ABS Corporation
NASDAQ    	IMCO                	IMPCO Technologies, Inc
NASDAQ    	COLB                	Columbia Banking System, Inc.
NYSE      	PGD                 	John Hancock Patriot Global Dividend Fund
NYSE      	GJO                 	WM STRATS SRS 2004-5
AMEX      	NXE                 	Nuveen Arizona Dividend Advantage Municipal Fund 3
NASDAQ    	ABLE                	Able Energy, Inc.
NASDAQ    	SBSE                	SBS Technologies, Inc.
TSE       	YLO.UN.TO           	Yellow Pages Income Fund
NASDAQ    	LEAP                	Leap Wireless International, Inc.
NYSE      	KCW                 	Lehman ABS Corporation
NYSE      	AWG                 	Alliance World Dollar Government Fund
NASDAQ    	HCTL                	Healthcare Technologies Ltd.
TSE       	HLB.TO              	Hillsborough Resources Ltd
NASDAQ    	ICOC                	ICO, Inc.
NASDAQ    	PBNY                	Provident New York Bancorp
NASDAQ    	CRDS                	Crossroads Systems, Inc.
TSE       	DCF.PR.A.TO         	Diversified Canadian Financial
TSE       	XPL.TO              	Xplore Technology Cp
NASDAQ    	BNCN                	BNC Bancorp (NC)
NASDAQ    	LION                	Fidelity Southern Corporation
NASDAQ    	IMGN                	ImmunoGen, Inc.
NYSE      	POT                 	Potash Corporation of Saskatchewan Inc.
NASDAQ    	TSCO                	Tractor Supply Company
NASDAQ    	BCAR                	Bank of the Carolinas (NC)
AMEX      	PWJ                 	PowerShares Dynamic Mid Cap Growth
INDEX     	RMP                 	Cohen & Steers Reit Index
NYSE      	HRL                 	Hormel Foods Corporation
AMEX      	NWD                 	New Dragon Asia Corporation
NYSE      	PNW                 	Pinnacle West Capital Corporation
AMEX      	ARY                 	ML S& P 500 AR
TSE       	FC.UN.TO            	Firm Capital Mtge Investment
NASDAQ    	MYOG                	Myogen, Inc.
INDEX     	EZR                 	STREETTRACKS DJ WILSHIRE LARGE
AMEX      	PWY                 	PowerShares Dynamic Small Cap Value
NYSE      	NQJ                 	Nuveen New Jersey Investment Quality Municipal Fund, Inc.
NASDAQ    	GTCB                	GTC Biotherapeutics Inc
NYSE      	GRD                 	Credit and Asset Repackaging Vehicle Corporation
NASDAQ    	GRRF                	CHINA GRENTECH ADS
TSE       	LFE.PR.A.TO         	Canadian Life Companies Split Corp Preferred
NYSE      	NWK                 	Network Equipment Technologies, Inc.
AMEX      	LSB                 	Citigroup Global Markets Holdings Inc
TSE       	GZ.TO               	Accrete Energy Inc
NASDAQ    	CMPX                	Compex Technologies, inc.
NYSE      	SAF                 	Scudder New Asia Fund, Inc.
NASDAQ    	EMRG                	eMerge Interactive, Inc.
NASDAQ    	NSIT                	Insight Enterprises, Inc.
NASDAQ    	SYBT                	S.Y. Bancorp, Inc.
TSE       	SNC.TO              	SNC Lavalin Group Inc
TSE       	EKD.TO              	Epic Data International Inc
AMEX      	MBJ                 	Morgan Stanley STARS based on the CBOE S&p 500 BuyWrite index
TSE       	TLM.U.TO            	Talisman Energy Inc
AMEX      	NG                  	Novagold Resources Inc New
NASDAQ    	SONO                	SonoSite, Inc.
NASDAQ    	GENR                	Genaera Corporation
TSE       	CTT.TO              	C1 Energy Ltd
TSE       	LPX.TO              	Liponex Inc
NYSE      	XVF                 	Lehman ABS Corp
AMEX      	EMI                 	Eaton Vance Michigan Municipal Income Trust
NYSE      	AGP                 	AMERIGROUP Corporation
INDEX     	DZR                 	DYNAMIC PHARMACEUTICAL INTELLID
NASDAQ    	COSI                	Cosi, Inc.
NYSE      	KRJ                 	Lehman ABS Corporation
NYSE      	ETW                 	EATON VANCE TAX-MANAGED GLOBAL
NYSE      	LPX                 	Louisiana-Pacific Corporation
NASDAQ    	LBTYB               	Liberty Global, Inc.
TSE       	T.TO                	Telus Cp
NYSE      	SBZ                 	State Street Corp
TSE       	SFG.UN.TO           	Sentry Select Focused Growth
NASDAQ    	ZILA                	Zila, Inc.
NASDAQ    	BTFG                	BancTrust Financial Group, Inc.
AMEX      	ION                 	PAXSON COMMUN CP
AMEX      	MDM                 	Mountain Province Diamonds Inc.
NASDAQ    	SCSC                	ScanSource, Inc.
NYSE      	TRB                 	Tribune Company
TSE       	KFS.TO              	Kingsway Financial Services
NYSE      	CZN                 	CITIZE UTILS TR
NYSE      	AKF                 	Ambac Financial Group, Inc.
NASDAQ    	HITT                	Hittite Microwave Corporation
TSE       	FZP.UN.TO           	Fidelity Partnership 1996 Uts
NASDAQ    	NDXP                	Morgan Stanley
AMEX      	ISI                 	iShares S&P 1500 Index Fund
NASDAQ    	BIIB                	Biogen Idec Inc
NASDAQ    	BIDU                	Baidu.com, Inc.
INDEX     	IXD                 	Industrial 15 Index
NASDAQ    	MONE                	MatrixOne, Inc.
NASDAQ    	ISTA                	ISTA Pharmaceuticals, Inc.
TSE       	EWI.UN.TO           	Brompton Equal Weight Income
NASDAQ    	URGI                	United Retail Group, Inc.
AMEX      	TSC                 	Stephan Company (The)
NASDAQ    	SPSX                	Superior Essex Inc
NYSE      	GXM                 	General Motors Corporation Series A Conv Sr Dbs 2032
TSE       	CUS.UN.TO           	Canexus Income Fund
NYSE      	IJS                 	iShares S&P Small Cap 600 Value
TSE       	AP.UN.TO            	Allied Properties Real Estate
TSE       	OPW.TO              	Opawica Explorations Inc
INDEX     	EDG                 	STREETTRACKS DJ WILSHIRE MID CA
NYSE      	ETH                 	Ethan Allen Interiors Inc.
INDEX     	DJG                 	Gold Mining Inds Plus Bsk Value
NASDAQ    	LSTR                	Landstar System, Inc.
NYSE      	VCO                 	Vina Concha Y Toro
NYSE      	NVL                 	Novelis Inc.
NASDAQ    	FFFL                	Fidelity Bankshares, Inc.
NYSE      	BKF                 	BKF Capital Group, Inc.
TSE       	LMI.TO              	Legg Mason Canada Holdings
NYSE      	MPX                 	Marine Products Corporation
NYSE      	XL                  	Select Sector SPDR Trust (The)
NASDAQ    	TTES                	T-3 Energy Services Inc
NASDAQ    	CYCCP               	CYCLACEL PHARMACEUTI
AMEX      	IJT                 	iShares Small Cap 600/BARRA Growth Index Fund
NYSE      	JRN                 	Journal Communications, Inc.
TSE       	MNG.TO              	Meridian Gold Inc
NASDAQ    	TESOF               	Tesco Corporation
NYSE      	CLS                 	Celestica, Inc.
NASDAQ    	IRBT                	IROBOT CORPORATION
TSE       	NCF.UN.TO           	Norcast Income Fund
AMEX      	VNX                 	VendingData Corporation
NASDAQ    	GNTA                	Genta Incorporated
NYSE      	ENI                 	ENERSIS S A
NASDAQ    	OKSB                	Southwest Bancorp, Inc.
TSE       	DW.TO               	Dundee Wealth Management Inc
TSE       	SRQ.UN.TO           	Scott's REIT
NYSE      	AZN                 	ASTRAZENECA PLC
TSE       	HCX.TO              	Barrick Gold Inc
NYSE      	JPC                 	Nuveen Preferred and Convertible Income Fund
TSE       	SUE.TO              	Sulliden Exploration Inc
NASDAQ    	MOLXA               	Molex Incorporated
NYSE      	GMT                 	GATX Corporation
NYSE      	PCL                 	Plum Creek Timber Company, Inc.
INDEX     	ILK                 	Dynamic Sml Cp Gr Intellidex
NASDAQ    	SCMF                	Southern Community Financial Corporation
NASDAQ    	OLGR                	Oilgear Company (The)
INDEX     	DWJ                 	DYNAMIC IURANCE INTELLIDEX
NASDAQ    	GCFC                	Central Federal Corporation
TSE       	JAG.TO              	Jaguar Mining Inc
NYSE      	KDE                 	4Kids Entertainment, Inc.
NASDAQ    	XTEX                	Crosstex Energy, L.P.
NYSE      	COH                 	Coach, Inc.
AMEX      	RUN                 	Reunion Industries Inc.
INDEX     	SHK                 	WEBS H KNG SHR
NASDAQ    	NATH                	Nathan's Famous, Inc.
NASDAQ    	NOVTD               	NOVOSTE CP NEW
NASDAQ    	GDPAP               	Goodrich Petroleum Corporation
NYSE      	JP                  	Jefferson-Pilot Corporation
NASDAQ    	TLAB                	Tellabs, Inc.
NASDAQ    	FONR                	Fonar Corporation
NASDAQ    	DELT                	Delta Galil Industries Ltd.
NYSE      	CXW                 	Corrections Corporation of America
NASDAQ    	SSPI                	Spectrum Signal Processing Inc.
AMEX      	OSQ                 	MS PLUS PSE OIL SSI
NASDAQ    	VMSI                	Ventana Medical Systems, Inc.
NYSE      	PNU                 	PNC CAP  TR D
NYSE      	NCC                 	National City Corporation
NASDAQ    	ADRE                	BLDRS Emerging Markets 50 ADR Index Fund
NYSE      	DCA                 	Dividend Capital Realty Income Allocation Fund
AMEX      	PHJ                 	PowerShares High Growth Rate Dividend Achievers
NASDAQ    	BUSEP               	First Busey Corporation
AMEX      	VCF                 	Delaware Investments Colorado Insured Municipal Income Fund, I
TSE       	RLO.TO              	Regalito Copper Cp
NASDAQ    	BOMK                	Bank McKenney VA
TSE       	IPL.DB.TO           	Inter Pipeline Fund 10% Debs
NASDAQ    	SUAI                	Specialty Underwriters' Alliance, Inc.
TSE       	WG.TO               	WGI Heavy Minerals Inc
NASDAQ    	ECLG                	eCollege.com
NASDAQ    	STGS                	Stage Stores, Inc.
NASDAQ    	LECO                	Lincoln Electric Holdings, Inc.
NASDAQ    	PSTA                	Monterey Gourmet Foods, Inc.
NYSE      	KBH                 	KB HOME
AMEX      	NEA                 	Nuveen Insured Tax-Free Advantage Municipal Fund
TSE       	HPF.PR.A.TO         	High Income Pfd Srs 1
NASDAQ    	MNRO                	Monro Muffler Brake, Inc.
NYSE      	JKI                 	iShares Morningstar Mid Value Index Fund
NASDAQ    	ABIX                	Abatix Corp.
NASDAQ    	PHIIK               	PHI INC NON-VOTING
NYSE      	CTR                 	Cato Corporation (The)
TSE       	ACE.RV.TO           	ACE Aviation Holdings
AMEX      	STS                 	Supreme Industries, Inc.
AMEX      	BOO                 	Collegiate Pacific, Inc.
NASDAQ    	LDIS                	Leadis Technology, Inc.
AMEX      	IGV                 	iShares Goldman Sachs Software Index Fund
NASDAQ    	PCLN                	priceline.com Incorporated
NYSE      	HPQ                 	Hewlett-Packard Company
INDEX     	NMJ                 	iShares Dow Jones U.S. Consumer Non-Cyclical Sector Index
NASDAQ    	CULS                	Cost-U-Less, Inc.
NYSE      	SI                  	Siemens AG
NYSE      	CHL                 	China Mobile (Hong Kong) Ltd.
TSE       	DX.TO               	Duke Energy Canada Exchangeco
NASDAQ    	BCRX                	BioCryst Pharmaceuticals, Inc.
NYSE      	PBH                 	Prestige Brand Holdings, Inc.
AMEX      	HA                  	Hawaiian Airlines, Inc.
AMEX      	CFW                 	Cano Petroleum, Inc.
NASDAQ    	GSIG                	GSI Group, Inc.
NASDAQ    	AFFM                	Affirmative Insurance Holdings, Inc.
AMEX      	VKL                 	Van Kampen Select Sector Municipal Trust
NASDAQ    	VITL                	Vital Signs, Inc.
TSE       	OFB.UN.TO           	OFI Income Fund
TSE       	CNQ.TO              	Canadian Natural Resources Ltd
AMEX      	TTG                 	Tutogen Medical, Inc.
INDEX     	NDY                 	Nasdaq 100
NYSE      	WIW                 	Western Asset/Claymore U.S Treasury Inflation Prot Secs Fd 2
NYSE      	NNY                 	Nuveen New York Municipal Value Fund, Inc.
NASDAQ    	LOOK                	LookSmart, Ltd.
NYSE      	SVJ                 	Savannah Electric and Power Co
NASDAQ    	SPAR                	Spartan Motors, Inc.
NASDAQ    	EXPO                	Exponent, Inc.
NYSE      	MDU                 	MDU RES GROUP INC
NYSE      	CWZ                 	Lehman ABS Corporation
NASDAQ    	FCBC                	First Community Bancshares, Inc.
NYSE      	KEP                 	Korea Electric Power Corporation
AMEX      	PRZ                 	PainCare Holdings, Inc.
NASDAQ    	FNET                	FORTUNET INC
NASDAQ    	SRCP                	SOURCECORP, Incorporated
NYSE      	Y                   	Alleghany Corporation
INDEX     	INJ                 	iShares MSCI Japan Index - IOPV
INDEX     	NJU                 	ISHR RUS1000 VL
NASDAQ    	NSYS                	Nortech Systems Incorporated
NASDAQ    	ZRAN                	Zoran Corporation
NASDAQ    	CYBE                	CyberOptics Corporation
NASDAQ    	IDEV                	Indevus Pharmaceuticals Inc.
NASDAQ    	MONM                	Monmouth Capital Corporation
INDEX     	OEX                 	S&P 100 Index
NYSE      	BJZ                 	Blackrock California Municipal 2018 Term Trust
AMEX      	BRD                 	Morgan Stanley Dean Witter & Co.
NASDAQ    	GLBC                	Global Crossing Ltd.
NYSE      	NPC                 	Nuveen Insured California Premium Income Fund, Inc.
NASDAQ    	RRGB                	Red Robin Gourmet Burgers, Inc.
NYSE      	FAL                 	Noranda, Inc.
NYSE      	DBD                 	Diebold, Incorporated
NYSE      	PSD                 	PUGET SOUND ENERGY CAP TR II
AMEX      	CUB                 	Cubic Corporation
TSE       	ZMR.TO              	Zaruma Resources Inc
AMEX      	GRZ                 	Gold Reserve Inc
TSE       	PVE.DB.TO           	Provident Energy Trust
NASDAQ    	LINTA               	LIBERTY MED INT A
NASDAQ    	MPWG                	MPW Industrial Services Group, Inc.
NASDAQ    	ATRO                	Astronics Corporation
NASDAQ    	SMRA                	Somera Communications, Inc.
NASDAQ    	FAVS                	First Aviation Services, Inc.
NASDAQ    	NWPX                	Northwest Pipe Company
NYSE      	NUV                 	Nuveen Municipal Value Fund, Inc.
NASDAQ    	MATR                	Matria Healthcare, Inc.
NASDAQ    	OCFC                	OceanFirst Financial Corp.
NASDAQ    	IUSA                	infoUSA, Inc.
TSE       	RVE.TO              	Rockyview Energy Inc
NYSE      	SII                 	Smith International, Inc.
AMEX      	MGT                 	MEDICSIGHT INC NEW
TSE       	HUM.TO              	Hummingbird Ltd
INDEX     	XFI                 	AMEX Financial Subr Index
NASDAQ    	EPHC                	EPOCH HOLDING CORP
NASDAQ    	MRLN                	Marlin Business Services Corp.
NYSE      	NSE                 	New Skies Satellites Holdings Ltd.
NYSE      	NQU                 	Nuveen Quality Income Municipal Fund, Inc.
NASDAQ    	FWLTW               	Foster Wheeler Ltd.
NASDAQ    	PLCE                	Children's Place Retail Stores, Inc. (The)
AMEX      	TST                 	Telestone Technologies Corp.
NASDAQ    	CVTX                	CV Therapeutics, Inc.
NASDAQ    	MERCS               	Mercer International Inc.
NYSE      	MUS                 	MuniHoldings Insured Fund, Inc.
NYSE      	SCL                 	Stepan Company
NYSE      	ABV.C               	COMPANHIA DE BEBIDAS DAS AME
NASDAQ    	SNCI                	Sonic Innovations, Inc.
NYSE      	IVV                 	iShares S&P 500
NASDAQ    	HMSL                	Hemosol Corp.
NASDAQ    	LCBM                	Lifecore Biomedical, Inc.
AMEX      	IHT                 	InnSuites Hospitality Trust
NASDAQ    	DLGS                	Dialog Semiconductor Plc
NYSE      	RDK                 	Ruddick Corporation
NASDAQ    	LAWS                	Lawson Products, Inc.
NYSE      	DV                  	DeVry Inc.
NYSE      	KG                  	King Pharmaceuticals, Inc.
AMEX      	CNU                 	Continucare Corp.
NASDAQ    	HARL                	Harleysville Savings Bank
AMEX      	ISR.W               	I-SECTOR WARRANTS
NASDAQ    	DWTT                	Merrill Lynch & Co., Inc.
TSE       	AQI.TO              	Aquiline Resources Inc
TSE       	IEP.UN.TO           	Income & Equity Index Uts
NYSE      	CPX                 	COMPLETE PRODUCTION SERVICES I
TSE       	IQW.PR.D.TO         	Quebecor World Srs 3 Pfd D
NYSE      	WPK                 	Wells Fargo Cap IX
NASDAQ    	GBCI                	Glacier Bancorp, Inc.
NASDAQ    	AVNX                	Avanex Corporation
AMEX      	ISV                 	InSite Vision Incorporated
NYSE      	DSX                 	Diana Shipping inc.
NASDAQ    	EGLS                	Electroglas, Inc.
NASDAQ    	DTSI                	DTS, Inc.
NYSE      	ESD                 	Salomon Brothers Emerging Markets Debt Fund Inc
AMEX      	PRK                 	Park National Corporation
NYSE      	FRE                 	Federal Home Loan Mortgage Corporation
NASDAQ    	DMCX                	DataMirror Corporation
NASDAQ    	CENF                	Central Freight Lines, Inc.
NYSE      	BTH                 	Blyth, Inc.
NASDAQ    	RIMM                	Research in Motion
TSE       	GCG.TO              	Guardian Capital Group Ltd
INDEX     	HKV                 	POWERSHARES DYNAMIC UTILITIES
NASDAQ    	DCGN                	deCODE genetics, Inc.
AMEX      	RFG                 	Rydex S&P 400 Pure Growth
NASDAQ    	TERN                	Terayon Communication Systems, Inc.
NYSE      	PUB                 	Publicis Groupe S.A.
NASDAQ    	REDI                	Remote Dynamics, Inc.
NYSE      	NOK                 	Nokia Corporation
NYSE      	DDS                 	Dillard's, Inc.
AMEX      	IDN                 	Intelli-Check, Inc.
NYSE      	BXP                 	Boston Properties, Inc.
INDEX     	XAL                 	AMEX Airline Index
NYSE      	FMY                 	First Trust
INDEX     	PLD                 	Palladium Index
NYSE      	RSC                 	REX Stores Corporation
NYSE      	COO                 	Cooper Companies, Inc. (The)
NASDAQ    	WIRE                	Encore Wire Corporation
NYSE      	UB                  	UnionBanCal Corporation
NYSE      	RML                 	Russell Corporation
TSE       	NVG.UN.TO           	NAV Energy Trust
NASDAQ    	WHRT                	World Heart Corporation
TSE       	PWI.UN.TO           	Primewest Energy Trust Units
NASDAQ    	STRS                	Stratus Properties, Inc.
TSE       	BVF.TO              	Biovail Cp
NYSE      	PKH                 	Merrill Lynch Depositor Inc Preferred Plus Trust Ser QWS-1 7.7
NASDAQ    	WOLF                	Great Wolf Resorts, Inc.
NASDAQ    	BUCA                	BUCA, Inc.
NASDAQ    	MLMT                	Merrill Lynch & Co., Inc.
TSE       	CFP.TO              	Canfor Cp
INDEX     	WHC                 	WELLSPRING BIO-CLINICAL INDEX
AMEX      	HEB                 	Hemispherx BioPharma, Inc.
TSE       	FCF.PR.A.TO         	Faircourt Split Five 6% Pfd A
NYSE      	FE                  	FirstEnergy Corporation
NASDAQ    	AMTC                	Ameritrans Capital Corporation
NASDAQ    	WTBA                	West Bancorporation
TSE       	XSB.TO              	iUnits Short Bond Index Fund
NYSE      	TVC                 	Tennessee Valley Authority
NASDAQ    	SPWR                	SUNPOWER CORPORATION
NASDAQ    	SMIT                	Schmitt Industries, Inc.
TSE       	MYG.TO              	Methylgene Inc
NASDAQ    	CVTI                	Covenant Transport, Inc.
NYSE      	CAL                 	Continental Airlines, Inc.
NASDAQ    	SNUS                	SONUS Pharmaceuticals, Inc.
NASDAQ    	IPCS                	IPCS INC
NASDAQ    	PAGI                	Pemco Aviation Group, Inc.
NASDAQ    	AVSR                	Avistar Communications Corporation
TSE       	STR.E.TO            	Financial Services Inc Equity
NASDAQ    	CKEC                	Carmike Cinemas, Inc.
TSE       	MSV.TO              	Minco Silver Corporation
TSE       	TSK.TO              	Tusk Energy Cp
AMEX      	RSP                 	Rydex S&P 500 Equal Weight
NASDAQ    	OLAB                	Oralabs Holding Corp.
TSE       	TER.TO              	Terasen Inc
NYSE      	AU                  	AngloGold Ashanti Ltd.
NYSE      	CW                  	Curtiss-Wright Corporation
NASDAQ    	ADST                	AdStar, Inc.
NYSE      	NX                  	Quanex Corporation
TSE       	PEY.UN.TO           	Peyto Energy Trust
NASDAQ    	OPSW                	Opsware, Inc.
NYSE      	SIR                 	SIRVA INC
INDEX     	DZC                 	DYNAMIC SOFTWARE INTELLIDEX
NYSE      	TZE                 	Bear Stearns Depositor, Inc.Trust Certificates 2001-1
INDEX     	KPE                 	STREETTRACKS KBW CAPITAL MARKET
NASDAQ    	BKOR                	Bank of Oak Ridge
NASDAQ    	CRAY                	Cray Inc
NYSE      	EHB                 	Entergy Arkansas, Inc.
AMEX      	TIK                 	Tel-Instrument Electronics Corp.
NYSE      	ATK                 	Alliant Techsystems Inc.
NYSE      	WMG                 	Warner Music Group Corp.
NASDAQ    	TBCC                	TBC Corporation
NASDAQ    	ALDN                	Aladdin Knowledge Systems
NYSE      	EWP                 	iShares MSCI Spain
NASDAQ    	MGAM                	Multimedia Games, Inc.
NASDAQ    	DXYN                	Dixie Group, Inc. (The)
TSE       	GAR.TO              	Garneau Inc
TSE       	TET.UN.TO           	Trilogy Energy Trust
NYSE      	EMT                 	Embratel Participacoes SA
TSE       	SNF.UN.TO           	Spinrite Income Fund
NASDAQ    	CFNL                	Cardinal Financial Corporation
NASDAQ    	TSRA                	Tessera Technologies, Inc.
NASDAQ    	STON                	StoneMor Partners L.P.
NYSE      	ABX                 	Barrick Gold Corporation
NASDAQ    	UAPH                	UAP Holding Corp.
NYSE      	AVY                 	Avery Dennison Corporation
NYSE      	ENB                 	ENBRIDGE INC
NASDAQ    	YORW                	York Water Company (The)
AMEX      	AOB                 	American Oriental Bioengineering, Inc.
AMEX      	PTG                 	Paragon Technologies, Inc.
NASDAQ    	YOCM                	YOCREAM International Inc
NASDAQ    	LAVA                	Magma Design Automation, Inc.
NASDAQ    	CBMD                	Columbia Bancorp
TSE       	VNX.TO              	Verenex Energy Inc
NASDAQ    	HPOL                	Harris Interactive, Inc.
NASDAQ    	OICO                	O. I. Corporation
NASDAQ    	GLOV                	AHPC Holdings, Inc.
NASDAQ    	BONT                	Bon-Ton Stores, Inc. (The)
NYSE      	BAC                 	Bank of America Corporation
TSE       	CMG.TO              	Computer Modelling Group Ltd
TSE       	DEH.TO              	Denninghouse Inc
NYSE      	IIC                 	MS California Insured Municipal Income Trust
TSE       	FOR.TO              	Franc-Or Resources Cp
TSE       	CMC.TO              	Consolidated Mercantile Inc
NYSE      	TP                  	TPG, N.V.
NYSE      	MSC                 	Material Sciences Corporation
NASDAQ    	PNRG                	PrimeEnergy Corporation
NYSE      	MAF                 	Municipal Advantage Fund, Inc.
NYSE      	THB                 	Tommy Hilfiger USA Inc
NASDAQ    	RARE                	RARE Hospitality International  Inc.
NYSE      	PLB                 	American Italian Pasta Company
AMEX      	ECP                 	Canterbury Park Holding Corporation
NASDAQ    	XRTX                	Xyratex Ltd.
AMEX      	NKM                 	Merrill Lynch & Co., Inc.
NYSE      	BGC                 	General Cable Corporation
NYSE      	PDS.P               	PRECISION DRILLING TRUST
NYSE      	HSC                 	Harsco Corporation
NASDAQ    	ZIXI                	Zix Corporation
NYSE      	SWX                 	Southwest Gas Corporation
INDEX     	KSX                 	KBW CAP MRKTS
NASDAQ    	MBFI                	MB Financial Inc.
TSE       	IBT.TO              	Ibex Technologies Inc
AMEX      	FSN                 	Fusion Telecommunications International, Inc.
NYSE      	AOI                 	Alliance One International, Inc.
NYSE      	VGR                 	Vector Group Ltd.
NYSE      	VTR                 	Ventas, Inc.
NYSE      	MNP                 	Municipal Partners Fund, Inc.
TSE       	ATQ.TO              	Adeptron Technologies Cp
NASDAQ    	SEPR                	Sepracor Inc.
TSE       	RMM.UN.TO           	Retrocom Mid-Mkt REIT Uts
NYSE      	RLF                 	Cohen & Steers Advantage Income Realty Fund, Inc.
NASDAQ    	PEGA                	Pegasystems Inc.
NASDAQ    	SIRI                	Sirius Satellite Radio Inc.
NASDAQ    	CVCY                	Central Valley Community Bancorp
NYSE      	PTA                 	Penn Treaty American Corporation
NYSE      	BA                  	Boeing Company (The)
TSE       	CSR.UN.TO           	Citadel Stable S-1 Income Fd
NASDAQ    	PRCSD               	PRAECIS PHARM NEW
NASDAQ    	NWFL                	Norwood Financial Corp.
AMEX      	SHM                 	Sheffield Pharmaceuticals, Inc.
AMEX      	ARD                 	Arena Resources Inc
NASDAQ    	SYMC                	Symantec Corporation
TSE       	RNT.UN.TO           	Stephensons Rental Services Income Fund
AMEX      	BGD                 	Morgan Stanley Dean Witter & Co.
AMEX      	SIL                 	Apex Silver Mines
NASDAQ    	EZEM                	E-Z-EM, Inc.
NASDAQ    	CYNO                	CYNOSURE INC.
NASDAQ    	SALM                	Salem Communications Corporation
NYSE      	URS                 	URS Corporation
NASDAQ    	FORR                	Forrester Research, Inc.
NYSE      	DHT                 	DOUBLE HULL TANKERS
NASDAQ    	TSEM                	Tower Semiconductor Ltd.
NASDAQ    	CNTY                	Century Casinos, Inc.
NYSE      	TMX                 	Telefonos de Mexico SA de CV Ser A Spons ADR
NASDAQ    	CMTY                	Community Banks, Inc.
TSE       	CVT.TO              	CVTech Group Inc
NASDAQ    	NKSH                	National Bankshares, Inc.
NASDAQ    	FICC                	Fieldstone Investment Corporation
NYSE      	GLD                 	streetTRACKS Gold Trust
NYSE      	CNN                 	CNA Income, Inc.
NYSE      	HJJ                 	MS Structured Asset Corp SATUR Goldman Sachs
TSE       	SPO.UN.TO           	Skylon Global Capital Yield Tr
AMEX      	BLJ                 	Blackrock New Jersey Municipal Bond Trust
AMEX      	HOO                 	Glacier Water Services, Inc.
AMEX      	MXC                 	Mexco Energy Corporation
NASDAQ    	PMBC                	Pacific Mercantile Bancorp
NASDAQ    	ADRU                	BLDRS Europe 100 ADR Index Fund
INDEX     	XIBX                	IBEX 35
NASDAQ    	ALKS                	Alkermes, Inc.
TSE       	GIP.UN.TO           	Global Plus Income Trust Unit
NYSE      	UIS                 	Unisys Corporation
NYSE      	NSR                 	Neustar, Inc.
NYSE      	PEI                 	Pennsylvania Real Estate Investment Trust
NYSE      	MLR                 	Miller Industries, Inc.
NYSE      	JCP                 	J.C. Penney Company, Inc. Holding Company
NYSE      	MGG                 	MGM MIRAGE
NASDAQ    	HURN                	Huron Consulting Group Inc.
TSE       	IW.TO               	Infowave Software Inc
NYSE      	FSF                 	Financial Security Assurance Holdings Ltd
NYSE      	KGC                 	Kinross Gold Corporation
NASDAQ    	GIGA                	Giga-tronics Incorporated
NYSE      	MJX                 	MSDW Structured Asset Corporation
INDEX     	GLD                 	Gold Index
NYSE      	BEN                 	Franklin Resources, Inc.
NYSE      	DER                 	De Rigo Spa
NYSE      	FIX                 	Comfort Systems USA, Inc.
NASDAQ    	MCHX                	Marchex, Inc.
TSE       	IE.TO               	Ivanhoe Energy Inc
TSE       	WIN.TO              	Wi Lan Inc
NYSE      	RDS.A               	ROYAL DUTCH SHELL PLC
TSE       	QUA.TO              	Quadra Mining Ltd
NYSE      	CMZ                 	COMPTON PETROLEUM CORPORATION
NASDAQ    	EASYE               	EasyLink Services Corporation
NASDAQ    	GOOG                	Google Inc.
NASDAQ    	CASH                	Meta Financial Group, Inc.
NYSE      	LZ                  	Lubrizol Corporation (The)
NYSE      	NWY                 	New York & Company, Inc.
NASDAQ    	ASPM                	Aspect Medical Systems, Inc.
NASDAQ    	CALC                	California Coastal Communities Inc
INDEX     	GSR                 	Goldman Sachs Naturl Resources
NASDAQ    	IRIS                	IRIS International, Inc.
NYSE      	CIX                 	CompX International Inc.
NASDAQ    	RADA                	Radica Games
NYSE      	SYD                 	Sybron Dental Specialties, Inc.
NYSE      	SHW                 	Sherwin-Williams Company (The)
NYSE      	NYC                 	iShares NYSE 100 Index Fund
NASDAQ    	IDNX                	Identix Incorporated
NASDAQ    	CEGE                	Cell Genesys, Inc.
NYSE      	TPL                 	Texas Pacific Land Trust
TSE       	BSN.TO              	B Split Cp
NASDAQ    	CNAF                	Commercial National Financial Corporation
NYSE      	KYE                 	Kayne Anderson Energy Total Return Fund, Inc.
INDEX     	RSJ                 	Rydex S&P Equal Weight Index
AMEX      	JRS                 	Nuveen Real Estate Fund
NASDAQ    	TRBS                	Texas Regional Bancshares, Inc.
NYSE      	BP                  	BP p.l.c.
NYSE      	CGA                 	CORUS GROUP PLC
NASDAQ    	WINS                	SM&A
AMEX      	VLR                 	9% SPARQS LINKED TO VALERO ENE
TSE       	AS.A.TO             	Amisk Inc Cl A
TSE       	MMN.UN.TO           	Multi-Manager Ltd Partners
NASDAQ    	PMCS                	PMC - Sierra, Inc.
NASDAQ    	UBSI                	United Bankshares, Inc.
TSE       	CUX.TO              	Centurion Energy International
NYSE      	ABI                 	Applera Corporation
AMEX      	LXU                 	Lsb Industries Inc.
NASDAQ    	CLHB                	Clean Harbors, Inc.
NASDAQ    	BKWW                	BANK OF WILMINGTON
NASDAQ    	CBRX                	Columbia Laboratories, Inc.
INDEX     	DZL                 	DYNAMIC LEISURE&ENTERTAINMENT I
NASDAQ    	DDSS                	LABOPHARM INC
NYSE      	ETR                 	Entergy Corporation
NASDAQ    	DWCH                	Datawatch Corporation
NASDAQ    	ACTT                	ACT Teleconferencing, Inc.
INDEX     	HMV                 	MORGAN STANLEY HEALTHCARE PAYOR
NYSE      	HMT                 	HOST MARRIOTT CORP NEW
NYSE      	ACI.P               	ARCH COAL INC 5% PERPETUAL CUMULATIVE PREFERRED
TSE       	FZR.DB.TO           	Atlas Cold Storage Income Trust
NASDAQ    	XXIA                	Ixia
NYSE      	CLF                 	Cleveland-Cliffs Inc.
NASDAQ    	RMKR                	Rainmaker Systems, Inc.
INDEX     	IPH                 	Pharmaceutical Holdrs Index
INDEX     	DOWD                	INDUSTRIALS INDICATIVE
NASDAQ    	PRVD                	Provide Commerce, Inc.
AMEX      	IPT                 	iParty Corporation
NASDAQ    	IBNK                	Integra Bank Corporation
TSE       	BDE.A.TO            	Bulldog Energy Inc Cl A
NASDAQ    	TBIO                	Transgenomic, Inc.
NASDAQ    	MCBI                	MetroCorp Bancshares, Inc.
TSE       	RND.TO              	Rand A Technology Cp
TSE       	AL.PR.E.TO          	Alcan Inc 1984 Series C Pfd
AMEX      	DFZ                 	BARRY R G CORP
NASDAQ    	CNST                	Constar International Inc.
NYSE      	BBK                 	Blackrock Municipal Bond Trust
INDEX     	SCQ                 	Phlx Sig Cable & Media Index
TSE       	TXT.UN.TO           	Top 10 Split Trust
NASDAQ    	PGEB                	Merrill Lynch & Co., Inc.
NASDAQ    	CRRC                	Courier Corporation
NASDAQ    	PRCS                	PRAECIS PHARMACEUTICALS INCORPORATED
NYSE      	PMX                 	PIMCO Municipal Income Fund III
NYSE      	AML                 	AMLI Residential Properties Trust
AMEX      	PAM                 	PACIFIC CMA INC
NASDAQ    	LINE                	LINN ENERGY LLC UTS
NYSE      	HUN.P               	HUNTSMAN CORP MND PF
TSE       	OST.PR.A.TO         	Oil Sands Split Trust Pfd A
AMEX      	MS.W                	MILESTONE SC WARRANT
AMEX      	RWR                 	streetTRACKS Wilshire REIT Index Fund
AMEX      	PME                 	PREMD INC
AMEX      	AXK                 	Accelr8 Technology Corporation
NASDAQ    	SNWL                	SonicWALL, Inc.
NASDAQ    	BBBB                	Blackboard Inc.
AMEX      	HWK                 	Hawk Corporation
NASDAQ    	BLDP                	Ballard Power Systems, Inc.
TSE       	BSD.UN.TO           	Brascan Soundvest Split Tr Uts
TSE       	FTS.TO              	Fortis Inc
AMEX      	MXN                 	First American Minnesota Municipal Income Fund II, Inc.
NASDAQ    	SWATW               	A4S Security, Inc.
AMEX      	ATF                 	Equity Income Fund, First Exchange Series
TSE       	ENB.PR.A.TO         	Enbridge Inc 5.5% Pfd A
TSE       	G.U.TO              	Goldcorp Inc US$
TSE       	HCH.TO              	CP Holdrs
AMEX      	IXN                 	iShares S&P Global Technology Index Fund
NYSE      	CBM                 	Cambrex Corporation
TSE       	CH.TO               	Century II Holdings Inc
AMEX      	EPG                 	Environmental Power Corporation
AMEX      	EWU                 	iShares MSCI United Kingdom Index Fund
NASDAQ    	STST                	ARGON ST, Inc.
NYSE      	USB                 	U.S. Bancorp
AMEX      	RFV                 	Rydex S&P 400 Pure Value
TSE       	WFI.TO              	WFI Industries Ltd
NASDAQ    	CTEC                	Cholestech Corporation
NASDAQ    	STRD                	Strategic Distribution, Inc.
NYSE      	HRB                 	H&R Block, Inc.
NASDAQ    	ULCM                	Ulticom, Inc.
NASDAQ    	GFSI                	GOLDLEAF FINANCIAL
TSE       	ASC.TO              	AIC Global Financial Split A
TSE       	MF.UN.TO            	Mortgage-Backed Secs Tr Uts
AMEX      	FLL                 	Full House Resorts, Inc.
NYSE      	FT                  	Franklin Universal Trust
NYSE      	HDI                 	Harley-Davidson, Inc.
TSE       	MUH.A.TO            	MCM Split Share Cp Cl A
INDEX     	NVZ                 	VANG REIT
NYSE      	RYI                 	RYERSON INC.
INDEX     	HEY                 	POWERSHARES IPV
TSE       	BPP.TO              	BPO Properties
AMEX      	UWN                 	Nevada Gold & Casinos, Inc.
AMEX      	GAV.U               	GRUBB & ELLIS REALTY     ADVISOR
NYSE      	SRP                 	Sierra Pacific Resources
NYSE      	NI                  	Northern Indiana Public Service Company
NYSE      	LUM                 	Luminent Mortgage Capital Inc
NYSE      	DQC                 	Duquesne Light Company
INDEX     	RMV                 	Cboe Russell Midcap Value Index
TSE       	SG.UN.TO            	Stone Total Return Unit Trust
NYSE      	GLW                 	Corning Incorporated
NASDAQ    	ODMO                	Odimo Incorporated
NYSE      	GMT.P               	GATX CORP PREF
NASDAQ    	IDXX                	IDEXX Laboratories, Inc.
NASDAQ    	MITSY               	Mitsui & Company, Ltd.
NYSE      	CMM                 	CRIIMI MAE Inc.
NASDAQ    	EXTR                	Extreme Networks, Inc.
NYSE      	KEA                 	Keane, Inc.
NASDAQ    	FRGO                	Fargo Electronics, Inc.
INDEX     	IQX                 	S&P 500 EQUAL WEIGHT
INDEX     	DOI                 	AMEX DEFEE INDEX FINAL SETTLE
NYSE      	AD                  	ADVO, Inc.
NASDAQ    	GASS                	STEALTHGAS INC
TSE       	PSD.TO              	Pulse Data Inc
TSE       	MKZ.UN.TO           	MacKenzie Master Ltd Unit
AMEX      	DPW                 	Digital Power Corporation
NYSE      	BNT                 	Bentley Pharmaceuticals, Inc.
TSE       	GBP.UN.TO           	Global Banks Premium Income Tr
TSE       	GWO.PR.E.TO         	Great West Lifeco Inc Pfd D
AMEX      	RWC                 	R E L M WIRELESS
NASDAQ    	FCEL                	FuelCell Energy, Inc.
NASDAQ    	MDTH                	MedCath Corporation
NYSE      	KTP                 	Lehman ABS Corporation
NYSE      	FDO                 	Family Dollar Stores, Inc.
NASDAQ    	GSBC                	Great Southern Bancorp, Inc.
INDEX     	HXC                 	USX CHINA INDEX
NASDAQ    	MTXC                	Matrix Bancorp, Inc
NYSE      	RGE                 	Rochester Gas & Electric Corporation
TSE       	CWA.UN.TO           	Coast Wholesale Appliances Fnd
NASDAQ    	LSBX                	LSB Corporation
TSE       	TIF.UN.TO           	Transforce Income Fund
NYSE      	BSG                 	BISYS Group, Inc. (The)
TSE       	ABX.TO              	Barrick Gold Cp
TSE       	BNB.TO              	BNN Investments Ltd
AMEX      	AMK                 	American Technical Ceramics Corp.
NYSE      	NFJ                 	NFJ Dividend, Interest & Premium Strategy Fund
NASDAQ    	EXAR                	Exar Corporation
NASDAQ    	BKUNA               	BankUnited Financial Corporation
NASDAQ    	ASMI                	ASM International N.V.
TSE       	SLP.UN.TO           	Skylon Global Capital Yield Tr
NYSE      	USS                 	U.S. Shipping Partners L.P.
NYSE      	TEI                 	Templeton Emerging Markets Income Fund, Inc.
NYSE      	VCG                 	Valor Communications Group, Inc.
NYSE      	MSF                 	Morgan Stanley Emerging Markets Fund, Inc.
TSE       	TIR.TO              	TIR Systems Ltd
TSE       	FCN.UN.TO           	Faircourt Split Seven Trust
INDEX     	EMX                 	AMEX Major 8 European Index
AMEX      	PWO                 	Power XTF: Dynamic OTC Portfolio
NASDAQ    	LNCB                	Lincoln Bancorp
NYSE      	BVF                 	Biovail Corporation
NASDAQ    	PAAS                	Pan American Silver Corp.
NASDAQ    	CREL                	COREL CORPORATION
AMEX      	CAX                 	MS ASE CHINA IDX CPN
TSE       	PNY.TO              	Point North Energy Ltd
AMEX      	SVI.W               	SVICE ACQUI CORP WAR
NASDAQ    	GKSRA               	G&K Services, Inc.
NASDAQ    	CTBIP               	Community Trust Bancorp, Inc.
NYSE      	SFO                 	Sunset Financial Resources Inc
NYSE      	LUX                 	Luxottica Group, S.p.A.
NASDAQ    	BFSB                	Brooklyn Federal Bancorp, Inc.
AMEX      	BXL                 	Bexil Corporation
NASDAQ    	CSNC                	Cardinal State Bank
NYSE      	CNO                 	Conseco, Inc.
NASDAQ    	UBET                	Youbet.com, Inc.
NYSE      	ADS                 	Alliance Data Systems Corporation
TSE       	PWF.PR.H.TO         	Power Financial Cp 5.75% Pfd H
TSE       	AFP.UN.TO           	AGF Master Partners
NYSE      	DYN                 	Dynegy Inc.
NYSE      	NPV                 	Nuveen Virginia Premium Income Municipal Fund
AMEX      	IXJ                 	iShares S&P Global Healthcare Index Fund
NASDAQ    	ARII                	AMERICAN RAILCAR IND
AMEX      	CLG                 	Cumberland Res Ltd
NASDAQ    	EVBS                	Eastern Virginia Bankshares, Inc.
NASDAQ    	WAIN                	Wainwright Bank & Trust Company
NYSE      	MIC                 	Macquarie Infrastructure Company Trust
NYSE      	UBH                 	U.S.B. Holding Company, Inc.
INDEX     	ECO                 	WH CLEAN ENERGY
TSE       	FPG.UN.TO           	First Premium Oil & Gas Uts
NYSE      	JBI                 	Lehman ABS Cp 7.857%
TSE       	DR.UN.TO            	Medical Facilities Cp
TSE       	FCR.TO              	First Capital Realty
NYSE      	PNY                 	Piedmont Natural Gas Company, Inc.
NYSE      	AEA                 	Advance America, Cash Advance Centers, Inc.
NYSE      	ACL                 	ALCON INC
NASDAQ    	VOXX                	Audiovox Corporation
TSE       	ICE.R.TO            	Versacold Income Fd
NYSE      	PHT                 	Pioneer High Income Trust
NYSE      	KRD                 	Lehman ABS Corporation
INDEX     	INY                 	iShares MSCI Austria Index - IOPV
AMEX      	SA                  	Seabridge Gold, Inc.
AMEX      	NVJ                 	Nuveen Ohio Dividend Advantage Municipal Fund 3
NYSE      	DG                  	Dollar General Corporation
NYSE      	IEZ                 	ISHARES DOW JONES U.S. OIL EQU
NYSE      	SUI                 	Sun Communities, Inc.
NASDAQ    	BANR                	Banner Corporation
NASDAQ    	MTLG                	Metrologic Instruments, Inc.
TSE       	EN.TO               	Energy Split Cp II Cap Yield
NYSE      	KVF                 	Lehman ABS Corporation
NYSE      	HEI                 	Heico Corporation
AMEX      	PPE                 	ACCELERATED RETURN NOTES LINKE
NASDAQ    	DRTE                	Dendrite International, Inc.
NASDAQ    	CHKR                	Checkers Drive-In Restaurants, Inc.
NYSE      	FHI                 	First Trust
AMEX      	UUU                 	Universal Security Instruments, Inc.
NYSE      	CSK                 	Chesapeake Corporation
NASDAQ    	MSNQ                	Morgan Stanley
NASDAQ    	PNTR                	POINTER TELOCATION
NASDAQ    	LYTS                	LSI Industries Inc.
TSE       	CGQ.E.TO            	Capital Gains Inc Streams Eq
NYSE      	HP                  	Helmerich & Payne, Inc.
AMEX      	NBW                 	Neuberger Berman California Intermediate Municipal Fund Inc.
AMEX      	IJJ                 	iShares S&P MidCap 400/Barra Value Index Fund
NYSE      	TEX                 	Terex Corporation
NYSE      	WWY                 	WRIGLEY WM JR CO
NYSE      	RY                  	Royal Bank Of Canada
NYSE      	BRW                 	Bristol West Holdings Inc
NASDAQ    	TWTC                	Time Warner Telecom Inc.
NASDAQ    	CGEN                	Compugen Ltd.
INDEX     	NIT                 	iShares Trust S&P Topix 150 Index Fund
NASDAQ    	MSLV                	MetaSolv Inc
TSE       	PES.UN.TO           	Peak Energy Services Trust
NASDAQ    	RAMEU               	RAM ENERGY RESOURCES
INDEX     	IXU                 	Utilities Select Sector Index
NASDAQ    	NEOF                	Neoforma Inc.
NASDAQ    	BKHM                	Bookham, Inc.
TSE       	PSI.TO              	Pason Systems Inc
TSE       	FAN.TO              	Farallon Resources Ltd
NYSE      	AHT                 	Ashford Hospitality Trust Inc
INDEX     	STI                 	Straits Times - Singapore
AMEX      	CMT                 	Core Materials Corporation
NASDAQ    	WLDAE               	WORLD AIR HOLDINGS
TSE       	PD.U.TO             	Precision Drilling Trust US$
TSE       	XEG.TO              	iUnits S&P/TSX Energy
NYSE      	ZQK                 	Quiksilver, Inc.
NASDAQ    	TCBK                	TriCo Bancshares
NYSE      	PRA                 	Pro-Assurance Corporation
NYSE      	PPM                 	Investment Grade Municipal Income Fund, Inc.
NYSE      	NTX                 	Nuveen Texas Quality Income Municipal Fund
NYSE      	PIF                 	Insured Municipal Income Fund, Inc.
NASDAQ    	TSEMW               	Tower Semiconductor Ltd.
NASDAQ    	RATE                	Bankrate Inc
NYSE      	JLL                 	Jones Lang LaSalle Incorporated
NYSE      	IQT                 	MS Quality Municipal Investment Trust
INDEX     	HKC                 	POWERSHARES DYNAMIC ENRG EXPLOR
INDEX     	XKH                 	Market 2000 Holders Index
NYSE      	CYF                 	Lehman ABS Corporation
NYSE      	BXS                 	BancorpSouth, Inc.
AMEX      	IFT                 	IFT Corporation
NASDAQ    	DIGE                	Digene Corporation
NYSE      	PLA.A               	Playboy Enterprises, Inc.
NYSE      	VVR                 	Van Kampen Senior Income Trust
AMEX      	PNJ                 	Citigroup Global Markets
NYSE      	ETE                 	ENERGY TRAFER EQUITY L.P.
TSE       	DGL.TO              	Datec Group Ltd
NYSE      	TRI                 	Triad Hospitals, Inc.
NYSE      	CSX                 	CSX Corporation
AMEX      	MSS                 	Measurement Specialties, Inc.
NYSE      	MBI                 	MBIA, Inc.
NYSE      	GCH                 	Greater China Fund, Inc.
NASDAQ    	WZEN                	Webzen Inc
NASDAQ    	WMAR                	West Marine, Inc.
NYSE      	TYN                 	TORTOISE NORTH AMERICAN ENERGY
NASDAQ    	SHLO                	Shiloh Industries, Inc.
TSE       	IMG.TO              	IAMGold Cp
NYSE      	BGR                 	Black Rock Global Energy and Resources Trust
NASDAQ    	IVGN                	Invitrogen Corporation
NASDAQ    	ICBC                	Independence Community Bank Corp.
AMEX      	CFX                 	Colonial Insured Municipal Fund
NYSE      	JKG                 	iShares Morningstar Mid Core Index Fund
AMEX      	RGX                 	Radiologix Inc.
TSE       	KRY.U.TO            	Crystallex International US$
NASDAQ    	COBR                	Cobra Electronics Corporation
NYSE      	AEM                 	Agnico-Eagle Mines
NASDAQ    	GABC                	German American Bancorp
NASDAQ    	IVOW                	iVOW, Inc.
NASDAQ    	DWSN                	Dawson Geophysical Company
NYSE      	PKE                 	Park Electrochemical Corporation
NYSE      	BSX                 	Boston Scientific Corporation
NASDAQ    	RIMG                	Rimage Corporation
TSE       	OSP.UN.TO           	Osprey Media Income Fund
AMEX      	RBG                 	Morgan Stanley Dean Witter & Co.
INDEX     	IXB                 	Materials Select Sector Index
NASDAQ    	CCOW                	Capital Corp of the West
TSE       	PUB.TO              	Public Storage Canadian Props
NYSE      	BAY                 	Bayer Aktiengesellschaft
NYSE      	RAY                 	Raytech Corporation
NASDAQ    	BWTR                	BASIN WATER INC
NASDAQ    	ALDA                	Aldila, Inc.
NASDAQ    	MASB                	MASSBANK Corp.
NYSE      	MET                 	MetLife, Inc.
TSE       	ADY.TO              	ADB Systems International
NASDAQ    	ZIGO                	Zygo Corporation
NYSE      	UVN                 	Univision Communications Inc.
NASDAQ    	MSON                	MISONIX, Inc.
NYSE      	PT                  	Portugal Telecom SGPS, S.A .
NASDAQ    	NXTY                	NEXITY FINANCIAL COR
AMEX      	NEP                 	Nephros, Inc.
TSE       	ZL.TO               	Zarlink Semiconductor Inc
TSE       	CFT.TO              	CE Franklin Ltd
TSE       	PNG.TO              	Pacific Northern Gas Ltd
NYSE      	TCC                 	Trammell Crow Company
NYSE      	PNF                 	PIMCO New York Municipal Income Fund
INDEX     	NVK                 	ISHR GS NDX
AMEX      	NGX                 	Nuveen Insured Massachusetts Tax-Free Advantage Municipal Fund
NASDAQ    	CHIR                	Chiron Corporation
NASDAQ    	ALBY                	Community Capital Bancshares, Inc.
NYSE      	ITY                 	Imperial Tobacco Group plc
NASDAQ    	CBAN                	Colony Bankcorp, Inc.
NASDAQ    	GLDC                	Golden Enterprises, Inc.
NASDAQ    	LNDC                	Landec Corporation
NASDAQ    	IPMT                	iPayment, Inc.
NASDAQ    	TISA                	Top Image Systems, Ltd.
TSE       	LUN.TO              	Lundin Mining Cp
NASDAQ    	TBAC                	Tandy Brands Accessories, Inc.
NASDAQ    	AVGN                	Avigen, Inc.
TSE       	TPX.NV.TO           	Molson Coors Canada Cl B Exch
NASDAQ    	ELSE                	Electro-Sensors, Inc.
TSE       	SAG.TO              	South American Gold & Copper
NYSE      	FNM                 	Federal National Mortgage Association
AMEX      	GFN.U               	GENERAL FINANCE CORPORATION
AMEX      	VTV                 	Vanguard Value VIPERs
NASDAQ    	AMHC                	American Healthways, Inc.
NASDAQ    	ZILG                	ZiLOG, Inc.
AMEX      	IWM                 	iShares Russell 2000 Index Fund
TSE       	CRC.TO              	Coreco Inc.
INDEX     	MDL                 	ORNINGSTAR DIVIDEND LEADERS IND
NASDAQ    	CSHB                	Community Shores Bank Corp.
NASDAQ    	CATT                	Catapult Communicatons Corporation
AMEX      	SFM                 	Citigroup Global Markets Holdings Inc
TSE       	GWE.TO              	Grey Wolf Exploration Inc
INDEX     	SDC                 	SIG SEMICONDUCTOR DEVICE EQUIPM
TSE       	NB.TO               	Northbridge Financial Cp
NYSE      	NXQ                 	Nuveen Select Tax Free Income Portfolio II
NYSE      	DKZ                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	MRTN                	Marten Transport, Ltd.
TSE       	TRP.TO              	Transcanada Cp
NASDAQ    	BTRX                	Barrier Therapeutics, Inc.
NASDAQ    	ATAXZ               	America First Tax Exempt Investors, L.P.
NYSE      	HBG                 	Hub Intl Ltd
AMEX      	AQQ                 	American Spectrum Realty, Inc.
NASDAQ    	NPSN                	Naspers
NYSE      	HPS                 	John Hancock Preferred Income Fund III
NASDAQ    	TRXI                	TRX INC.
INDEX     	XAH                 	Internet Architecture Holders
NYSE      	PLD                 	ProLogis
AMEX      	ILX                 	ILX Resorts Incorporated
NASDAQ    	ININ                	Interactive Intelligence, Inc.
NASDAQ    	MODT                	Modtech Holdings Inc.
TSE       	PCA.U.TO            	Petro Canada US$
NASDAQ    	LNET                	LodgeNet Entertainment Corporation
TSE       	CGI.PR.B.TO         	Canadian General Inv 4.65% B
AMEX      	GSX                 	GASCO ENERGY INC
NASDAQ    	XPRT                	LECG Corporation
TSE       	PRU.U.TO            	Mulvihill Pro-AMS 100 US$
AMEX      	BZM                 	BlackRock Maryland Municipal Bond Trust
NYSE      	SBF                 	Salomon Brothers Fund Inc.
NYSE      	MEN                 	MuniEnhanced Fund, Inc.
NASDAQ    	BIOM                	Biomira Inc.
TSE       	GGG.TO              	Glencairn Gold Cp
NYSE      	DQE                 	Duquesne Light Holdings, Inc.
NYSE      	RPF                 	Cohen & Steers Premium Income Realty Fund Inc
NASDAQ    	MIVA                	MIVA, Inc.
NYSE      	PTR                 	PetroChina Company
NYSE      	PFN                 	Pimco Floating Rate Strategy Fund
NASDAQ    	MDLK                	Medialink Worldwide Incorporated
NASDAQ    	CMLS                	Cumulus Media Inc.
TSE       	EXE.PR.D.TO         	Extendicare Inc Series 4 Pfd D
NYSE      	LFL                 	Lan Chile S.A.
NYSE      	JBX                 	Jack In The Box Inc.
AMEX      	VOX                 	Vanguard Telecommunication Services VIPERs
TSE       	HIT.UN.TO           	Yield Management Grp High Inm
NASDAQ    	COHT                	Cohesant Technologies Inc.
NASDAQ    	TSTF                	TeamStaff, Inc.
TSE       	PLG.TO              	Pelangio Mines Inc
NASDAQ    	VSEC                	VSE Corporation
NASDAQ    	ATRM                	Aetrium Incorporated
NASDAQ    	ALFA                	Alfa Corporation
NYSE      	MER                 	Merrill Lynch & Co., Inc.
NYSE      	SLG                 	SL Green Realty Corporation
NASDAQ    	XCYTP               	Xcyte Therapies, Inc.
AMEX      	RAE                 	RAE Systems Inc
AMEX      	TDS.S               	TELEPHONE & DATA SYS INC
NASDAQ    	ABMCW               	American Bio Medica Corp.
TSE       	CCR.UN.TO           	CCS Income Trust
AMEX      	NVG                 	Nuveen Insured Dividend Advantage Municipal Fund
NYSE      	MJZ                 	MSDW Structured Asset Corporation
NASDAQ    	SLNK                	SpectraLink Corporation
NYSE      	XKC                 	Lehman ABS Corporation
INDEX     	DBW                 	POWERSHARES DYNAMIC LARGE CAP V
NASDAQ    	ADBE                	Adobe Systems Incorporated
NASDAQ    	WTHN                	WIDERTHAN CO. LTD
NYSE      	HE                  	Hawaiian Electric Industries, Inc.
NASDAQ    	ZBRA                	Zebra Technologies Corporation
NYSE      	CF                  	CF Industries Holdings, Inc.
NASDAQ    	WMSI                	Williams Industries, Inc.
NASDAQ    	NXTM                	NXSTAGE MEDICAL INC
AMEX      	RNI                 	ACCELERATED RETURN NOTE LINKED
TSE       	RSI.DB.TO           	Rogers Sugar 9.5% Debs
AMEX      	TES                 	AMERICAN TELECOM SVC
NASDAQ    	ARTLP               	The Aristotle Corporation
TSE       	SIX.UN.TO           	Sixty Plus Income Tr Unit
NYSE      	PCU                 	Southern Peru Copper Corporation
NASDAQ    	TRMS                	Trimeris, Inc.
NASDAQ    	SGMS                	Scientific Games Corp
NYSE      	TCN                 	Tele Norte Celular Participacoes S.A.
TSE       	AEM.TO              	Agnico-Eagle Mines Ltd
NASDAQ    	FCCY                	1st Constitution Bancorp (NJ)
NASDAQ    	LGBT                	PlanetOut, Inc.
NASDAQ    	UNTD                	United Online, Inc.
INDEX     	ETT                 	EASYETFTITA50
INDEX     	EUV                 	AMEX Eurotop 100 Index
AMEX      	DCZ                 	DECORIZE INC
NYSE      	AHR                 	Anthracite Capital, Inc.
NYSE      	WLT                 	Walter Industries, Inc.
NASDAQ    	NMGC                	NeoMagic Corporation
NYSE      	NUT                 	ML Macadamia Orchards L.P.
NYSE      	PSS                 	Payless Shoesource, Inc.
TSE       	SSY.TO              	Spectrum Signal Processing Inc
NYSE      	SO                  	Southern Company (The)
NYSE      	DKK                 	Lehman ABS Corporation
NYSE      	ESV                 	ECO International Incorporated
NYSE      	CPV                 	Correctional Properties Trust
NYSE      	DTF                 	Duff & Phelps Utilities Tax-Free Income, Inc.
INDEX     	XRH                 	Regional Bank Holders Index
NASDAQ    	CALP                	Caliper Life Sciences Inc
NASDAQ    	PHII                	PHI INC.
NASDAQ    	IDSA                	Industrial Services of America, Inc.
NASDAQ    	PLNR                	Planar Systems, Inc.
NYSE      	GGP                 	General Growth Properties, Inc.
NASDAQ    	CCNE                	CNB Financial Corporation
NYSE      	IBM                 	International Business Machines Corporation
INDEX     	VXH                 	MORGAN STANLEY HEALTHCARE PROVI
NASDAQ    	VCMP                	VCampus Corporation
AMEX      	DII                 	Decorator Industries, Inc.
TSE       	DMN.PR.A.TO         	Dominion Citrus Ltd Pfd A
NASDAQ    	IDXC                	IDX Systems Corporation
NYSE      	KTC                 	Korea Telecom Corporation
AMEX      	CGY                 	Citigroup Global Markets SEQUI
AMEX      	MKP                 	Merrill Lynch & Co., Inc.
NASDAQ    	DAGM                	DAG Media, Inc.
NYSE      	NJR                 	NewJersey Resources Corporation
NASDAQ    	MSFG                	MainSource Financial Group, Inc.
TSE       	CTQ.TO              	Corriente Resources Inc
NASDAQ    	FSBC                	1st State Bancorp, Inc.
NASDAQ    	SPIL                	Siliconware Precision Industries Company, Ltd.
AMEX      	CQP                 	PREMIUM MANDATORY
NASDAQ    	EXPEW               	Expedia, Inc.
NASDAQ    	PBCI                	Pamrapo Bancorp, Inc.
AMEX      	WTT                 	Wireless Telecom Group,  Inc.
AMEX      	WSO.B               	Watsco, Inc.
NYSE      	MFD                 	Macquarie/First Trust Global
NASDAQ    	EVCI                	EVCI Career Colleges Holding Corp.
TSE       	MR.TO               	Metallica Resources Inc
NASDAQ    	ORNG                	Orange 21 Inc.
AMEX      	NZW                 	Nuveen Michigan Dividend Advantage Municipal Fund
NASDAQ    	CMCO                	Columbus McKinnon Corporation
NYSE      	SXA                 	Abbey Natl Plc Ord
NYSE      	RSA                 	Royal & SunAlliance Insurance Group PLC
NASDAQ    	HOKU                	Hoku Scientific, Inc.
NASDAQ    	MBND                	Multiband Corporation
INDEX     	ILW                 	Dynamic Lg Cp Valu Intellidex
NASDAQ    	OSTE                	Osteotech, Inc.
AMEX      	CPQ                 	10% SPARQS LINKED TO CHESAPEAK
NYSE      	GOL                 	Gol Linhas Aereas Inteligentes S.A.
AMEX      	GAV                 	GRUBB & ELLIS REALTY AD    VISOR
NASDAQ    	CRTX                	Critical Therapeutics, Inc.
AMEX      	EGX                 	Engex, Inc.
NASDAQ    	VASC                	Vascular Solutions, Inc.
NYSE      	ISE                 	Internation Securities Exchange, Inc.
NASDAQ    	HYTM                	Hythiam, Inc.
NASDAQ    	CMTL                	Comtech Telecommunications Corp.
TSE       	PWF.PR.E.TO         	Power Financial Cp Pfd D
NYSE      	POL                 	PolyOne Corporation
NYSE      	LAF                 	Lafarge Corporation
TSE       	CNJ.TO              	Cangene Cp
TSE       	WM.TO               	Wallbridge Mining Co Ltd
NYSE      	KVZ                 	Verizon New England Inc
NYSE      	BTF                 	Boulder Total Return Fund, Inc.
AMEX      	ERI                 	EMRISE CORPORATION
NASDAQ    	RBPAA               	Royal Bancshares of Pennsylvania, Inc.
NASDAQ    	TTMI                	TTM Technologies, Inc.
NASDAQ    	WCBO                	West Coast Bancorp
NASDAQ    	NOBL                	Noble International, Ltd.
NYSE      	ODP                 	Office Depot, Inc.
NASDAQ    	USPH                	U.S. Physical Therapy, Inc.
NASDAQ    	HEES                	H& E EQUIP SERVICES
NASDAQ    	DJCO                	Daily Journal Corp. (S.C.)
AMEX      	KBX                 	KIMBER RES INC
NYSE      	RNP                 	Cohen & Steers Reit and Preferred Income Fund Inc
AMEX      	NNB                 	Nuveen Virginia Dividend Advantage Municipal Fund 2
NASDAQ    	ANLT                	Analytical Surveys, Inc.
INDEX     	SSEC                	Shanghai Composite
NYSE      	HJL                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	ACUS                	Acusphere, Inc.
NASDAQ    	VARI                	Varian, Inc.
NASDAQ    	ENDP                	Endo Pharmaceuticals Holdings Inc.
NASDAQ    	BMRC                	Bank of Marin
AMEX      	PRG                 	Paragon Real Estate Equity and Investment Trust
TSE       	SNG.TO              	Canadian Superior Energy Inc
NYSE      	SVU                 	SuperValu Inc.
NYSE      	CRY.P               	CRYOLIFE INC
NYSE      	ELX                 	Emulex Corporation
NASDAQ    	USMO                	USA Mobility, Inc.
INDEX     	IEN                 	Estimated Cash Amount per Creation Unit
NYSE      	VOL                 	Volt Information Sciences, Inc.
INDEX     	ZWI                 	PALISADES WATER INDEX
NASDAQ    	CERG                	Ceres Group Inc.
NASDAQ    	BSET                	Bassett Furniture Industries, Incorporated
NASDAQ    	NCTY                	The9
NYSE      	HME                 	Home Properties, Inc.
NASDAQ    	DOVR                	DOVER SADDLERY INC
TSE       	GPS.TO              	Sigem Inc
INDEX     	DJJ                 	ISH DJ SEL DIV
NASDAQ    	ARTC                	ArthroCare Corporation
NYSE      	ANL                 	American Land Lease, Inc.
AMEX      	CTE                 	Cardiotech International, Inc.
NYSE      	FLI                 	CHC Helicopter Corporation
AMEX      	EVV                 	Eaton Vance Duration Income Fund
AMEX      	NZH                 	Nuveen California Dividend Advantage Municipal Fund 3
NASDAQ    	MCEL                	Millennium Cell Inc.
NASDAQ    	SWCB                	Southwest Community Bancorp
AMEX      	DSC                 	streetTRACKS DJ Wilshire Small Cap
NASDAQ    	GNET                	GLOBAL TRAFFIC NETWO
NASDAQ    	NPSI                	North Pittsburgh Systems, Inc.
TSE       	ELF.PR.F.TO         	E-L Financial Cp 1st Pfd F
NASDAQ    	MLAN                	Midland Company (The)
NYSE      	IHS                 	IHS INC
NYSE      	NKE                 	Nike, Inc.
NASDAQ    	SYPR                	Sypris Solutions, Inc.
NASDAQ    	TLGB                	Teleglobe International Holdings Ltd.
NASDAQ    	ASTE                	Astec Industries, Inc.
NYSE      	TVE                 	Tennessee Valley Authority
AMEX      	BRR                 	A C R GROUP INC
NASDAQ    	PCBI                	Peoples Community Bancorp, Inc.
TSE       	ACF.UN.TO           	IAT Air Cargo Facilities Fd
NYSE      	NSP                 	Natural Resource Partners L.P.
TSE       	DSC.TO              	Destiny Resource Services Cp
NASDAQ    	CREAF               	Creative Technology Ltd.
NYSE      	PYA                 	Merrill Lynch Depositor Inc
NYSE      	PCZ                 	Petro-Canada
NASDAQ    	TIERE               	TIER TECHS CL B
NYSE      	BWP                 	BOARDWALK PIPELINE PARTNERS LP
AMEX      	PBN                 	CFI CBOE S& P 500 BW
AMEX      	SPO                 	Citigroup Global Markets Holdings Inc
NASDAQ    	CSNT                	Crescent Banking Company
NASDAQ    	SNMX                	Senomyx, Inc.
NASDAQ    	VTSS                	Vitesse Semiconductor Corporation
NASDAQ    	ICON                	Iconix Brand Group, Inc.
NASDAQ    	IMCOE               	IMPCO TECH
AMEX      	AQR                 	ACQUICOR TECHNOLOGY
NASDAQ    	NVMI                	Nova Measuring Instruments Ltd.
NASDAQ    	PNBC                	Princeton National Bancorp, Inc.
TSE       	XIC.TO              	iUnits Composite Cdn Eq Capped Index
NASDAQ    	NILE                	Blue Nile, Inc.
NYSE      	JLG                 	JLG Industries, Inc.
NASDAQ    	BESI                	BE Semiconductor Industries NV
NASDAQ    	TRUE                	Centrue Financial Corporation
NASDAQ    	LORL                	LORAL SPACE NEW WI
INDEX     	SPIND               	SP500 Industrial Sector
TSE       	CBJ.TO              	Cambior Inc
NASDAQ    	CDZI                	Cadiz, Inc.
NASDAQ    	AHCI                	Allied HealthCare International Inc.
TSE       	IRD.TO              	International Road Dynamics
NYSE      	ENS                 	ENERSYS
NYSE      	AHC                 	Amerada Hess Corporation
NASDAQ    	HMSLQ               	HEMOSOL CORP
NASDAQ    	POZN                	Pozen, Inc.
NASDAQ    	TSTY                	TASTY BAKING CO
AMEX      	MEA                 	METALICO INC
NASDAQ    	ZCOM                	Impreso, Inc.
NYSE      	VKQ                 	Van Kampen Municipal Trust
NYSE      	NNJ                 	Nuveen New Jersey Premium Income Municipal Fund, Inc.
NYSE      	MSA                 	Mine Safety Appliances Company
TSE       	FNI.TO              	First Nickel Inc
NYSE      	TTF                 	Thai Fund, Inc. (The)
INDEX     	PLT                 	Platinum Index
NYSE      	HYB                 	New America High Income Fund, Inc. (The)
NYSE      	GF                  	New Germany Fund, Inc. (The)
NYSE      	RLH                 	RED LION HOTELS CORPORATION
NASDAQ    	MFLX                	Multi-Fineline Electronix, Inc.
TSE       	FIP.UN.TO           	Fidelity Partnership 1993 Unit
NASDAQ    	CMED                	China Medical Technologies, Inc.
INDEX     	WEM                 	ISH EMU IPOV
TSE       	POW.SV.TO           	Power Cp Of Canada
NYSE      	GPM                 	General Motors Corporation
AMEX      	CVR                 	Chicago Rivet & Machine Co.
NYSE      	MXE.P               	MEXICO EQTY AND INCOME FUND IN
NYSE      	IJT                 	iShares S&P Small Cap 600 Growth
NASDAQ    	RYAN                	Ryan's Restaurant Group, Inc.
TSE       	FTS.PR.E.TO         	Fortis Inc 1st Pfd E
AMEX      	BGF                 	B&G Foods Holdings Corp.
TSE       	BST.UN.TO           	Brascan Soundvest Total Return
NASDAQ    	QCRH                	QCR Holdings, Inc.
NASDAQ    	NEST                	Nestor, Inc.
NYSE      	UGP                 	Ultrapar Participacoes S.A.
AMEX      	ABL                 	American Biltrite Inc.
NASDAQ    	FCTR                	First Charter Corporation
NYSE      	AYN                 	Alliance New York Municipal Income Fund Inc
AMEX      	TMW                 	FORTUNE 500 Index Tracking Stock
NYSE      	MTR                 	Mesa Royalty Trust
NASDAQ    	TAYCP               	Taylor Capital Group, Inc.
NASDAQ    	APAT                	APA Enterprises, Inc.
NYSE      	CMN                 	Cantel Medical Corp.
NYSE      	ATN                 	Action Performance Companies, Inc.
NYSE      	MCM                 	Controladora Comerial Mexicana, S.A. de C.V.
NYSE      	TAM                 	TAM S.A.
NASDAQ    	VTIV                	Ventiv Health, Inc.
NASDAQ    	HAFC                	Hanmi Financial Corporation
NASDAQ    	NTWK                	NetSol Technologies Inc.
AMEX      	MXA                 	Minnesota Municipal Income Portfolio Inc.
NASDAQ    	CHRWD               	C.H. ROBION WW
NASDAQ    	NTMD                	NitroMed, Inc.
NASDAQ    	PZZA                	Papa John's International, Inc.
TSE       	IMG.U.TO            	IAMGold Cp US$
NASDAQ    	NPLA                	InPlay Technologies, Inc.
NASDAQ    	SIMC                	Simclar, Inc.
NASDAQ    	FPFC                	First Place Financial Corp.
NASDAQ    	AUBN                	Auburn National Bancorporation, Inc.
INDEX     	IIG                 	S&P BARRA GROWTH
AMEX      	TGD                 	Citigroup Global Markets Holdings Inc
TSE       	FM.TO               	First Quantum Minerals Ltd
NYSE      	DUK                 	Duke Energy Corporation
AMEX      	RDI                 	READING INTERNATIONAL INC
TSE       	SMC.M.TO            	Scotia Mortgage Inv Cp
NYSE      	AMX                 	America Movil, S.A. de C.V.
NYSE      	BEP                 	S&P 500 Covered Call Fund Inc.
NASDAQ    	HELE                	Helen of Troy
NYSE      	TWX                 	Time Warner Inc.
NYSE      	PGS                 	Petroleum Geo-Services Asa
INDEX     	BVO                 	Vanguard Mid Cap Vipers Index
NASDAQ    	GPCB                	GPC Biotech AG
AMEX      	EST                 	Merrill Lynch & Co., Inc.
NYSE      	TRX                 	TRONOX INCORPORATED CLASS A
NYSE      	HCE                 	Fiduciary/Claymore Dynamic Equity Fund
NASDAQ    	WDHD                	Woodhead Industries, Inc.
NASDAQ    	LINK                	Interlink Electronics
NYSE      	NFL                 	Nuveen Insured Florida Premium Income Municipal Fund
TSE       	BOS.TO              	Airboss Of America Cp
NYSE      	E                   	ENI S.p.A.
NYSE      	FRC                 	First Republic Bancorp Inc.
NYSE      	PIR                 	Pier 1 Imports, Inc.
AMEX      	GLL                 	Morgan Stanely Global Indices Basket Capital Protected Notes
TSE       	CWX.UN.TO           	CanWel Building Materials Fund
NYSE      	L                   	Liberty Media Corporation
AMEX      	XLV                 	SPDR Healthcare
NYSE      	BZF                 	Brazil Fund, Inc. (The)
AMEX      	GEX                 	Globix Corporation New
NASDAQ    	ADES                	ADA-ES, Inc.
NASDAQ    	CITP                	COMSYS IT Partners, Inc.
NASDAQ    	FFSW                	First Federal Banc of the Southwest, Inc.
NYSE      	BBI                 	Blockbuster Inc.
TSE       	AER.UN.TO           	Aeroplan Income Fund
NYSE      	JKK                 	iShares Morningstar Small Growth Index Fund
NYSE      	BHD                 	Blackrock Strategic Bond Trust
TSE       	DTC.TO              	Domtar Inc
AMEX      	NSD                 	Merrill Lynch & Co., Inc.
NASDAQ    	INSGE               	IIGNIA SOLUT ADR
TSE       	CL.PR.B.TO          	Canada Life Financial Cp Pfd B
NYSE      	RSO                 	RESOURCE CAPITAL CORP
INDEX     	CYC                 	Morgen Stanley Cyclical Index
NASDAQ    	UAUA                	UAL CORP NEW
NASDAQ    	MRBK                	Mercantile Bankshares Corporation
AMEX      	ENY                 	ENERNORTH INDUSTRIES INC
NASDAQ    	TORM                	TOR Minerals International Inc
INDEX     	NJKE                	ID JKE INDEX
NASDAQ    	MCDT                	McDATA Corporation
NASDAQ    	SFNT                	SafeNet Inc
NASDAQ    	OPMR                	Optimal Group, Inc.
NASDAQ    	FRSH                	Fresh Brands, Inc.
NASDAQ    	SAFT                	Safety Insurance Group, Inc.
NYSE      	SBW                 	Salomon Brothers Worldwide Income Fund Inc.
NASDAQ    	HIHO                	Highway Holdings
NYSE      	AMN                 	Ameron International Corporation
TSE       	FFN.PR.A.TO         	Financial 15 Split Cp II Pfd
NYSE      	TEK                 	Tektronix, Inc.
NYSE      	IRS                 	IRSA Inversiones Y Representaciones S.A.
NASDAQ    	ANSS                	AYS, Inc.
NASDAQ    	CEPH                	Cephalon, Inc.
TSE       	CM.PR.B.TO          	Cdn Imperial Bank Srs 24 Pfd
NYSE      	CSG                 	Cadbury Schweppes, PLC
NASDAQ    	RELV                	Reliv' International, Inc.
NYSE      	AVL                 	Aviall, Inc.
NASDAQ    	AEMLW               	Agnico-Eagle Mines
NYSE      	PVX                 	PROVIDENT ENERGY TR
NASDAQ    	ZOOM                	Zoom Technologies, Inc.
AMEX      	GSY                 	Merrill Lynch & Co., Inc.
AMEX      	NVX                 	Nuveen California Dividend Advantage Municipal Fund 2
NASDAQ    	NWLIA               	National Western Life Insurance Company
NYSE      	MOG.A               	MOOG INC
NASDAQ    	SRIB                	SRN IND 15 INDEX
NYSE      	BHS                 	Brookfield Homes Corp
NASDAQ    	VCBI                	Virginia Commerce Bancorp
NASDAQ    	KENT                	Kent Financial Services, Inc.
NYSE      	NBG                 	Natl Bk Greece Ads
NYSE      	Symbol              	Description
TSE       	EFH.TO              	EGI Financial Holdings Inc
NASDAQ    	SNPS                	Synopsys, Inc.
NASDAQ    	BWCF                	BWC Financial Corporation
NYSE      	KVT                 	Lehman ABS Corporation
NASDAQ    	PIXR                	Pixar
TSE       	MPH.TO              	Medicure Inc
NASDAQ    	OMEF                	Omega Financial Corporation
NASDAQ    	HOTT                	Hot Topic, Inc.
NYSE      	SKE                 	Spinnaker Exploration Company
INDEX     	IXCO                	Nasdaq Computer
AMEX      	MTY                 	Marlton Technologies, Inc.
INDEX     	AKG                 	iShares Lehman Aggregate Bond Fund
INDEX     	NAG                 	iShares Dow Jones U.S. Financial Services Sector Index
NASDAQ    	ONXS                	ONYX Software Corporation
AMEX      	KAL                 	Callisto Pharmaceuticals, Inc.
NYSE      	ARS                 	Aleris International, Inc.
NASDAQ    	OSKY                	MidWestOne Financial Group Inc
AMEX      	HT                  	Hersha Hospitality Trust
NASDAQ    	SCOP                	SCOPUS VIDEO NETWOR
NASDAQ    	PGLAF               	Progen Industries
AMEX      	ITF                 	iShares S&P/TOPIX 150 Index Fund
NASDAQ    	OUTL                	Outlook Group Corp.
AMEX      	DSE                 	Merrill Lynch & Co., Inc.
NASDAQ    	ITRI                	Itron, Inc.
NYSE      	XKR                 	Lehman ABS Corporation
NYSE      	NXC                 	Nuveen Insured California Select Tax-Free Income Portfolio
NASDAQ    	SVIN                	Scheid Vineyards, Inc.
NASDAQ    	CLDA                	Clinical Data, Inc.
NASDAQ    	PFACP               	Pro-Fac Cooperative, Inc.
NASDAQ    	AULT                	Ault Incorporated
NYSE      	UST                 	UST Inc.
INDEX     	OOU                 	S&P GL 100 TCA
TSE       	ICE.DB.TO           	Versacold Income Fd 8.5% Debs
NASDAQ    	ZONA                	Zonagen, Inc.
NASDAQ    	AIRN                	Airspan Networks Inc.
NASDAQ    	VICL                	Vical Incorporated
AMEX      	EFM                 	Merrill Lynch & Co., Inc.
NASDAQ    	ASTT                	ASAT Holdings
NASDAQ    	GNSS                	Genesis Microchip Inc.
NYSE      	SNY                 	Sanofi-Aventis SA
NYSE      	CLH                 	Lehman ABS Corporation
NYSE      	EHA                 	Entergy Arkansas, Inc.
NYSE      	EQT                 	Equitable Resources, Inc.
NYSE      	OTE                 	Hellenic Telecommunication Organization, S.A.
AMEX      	EWW                 	iShares MSCI Mexico Index Fund
NASDAQ    	DLIA                	DELIA*S INC.
NASDAQ    	RMCF                	Rocky Mountain Chocolate Factory, Inc.
NYSE      	AGL                 	Angelica Corporation
NYSE      	CII                 	Capital and Income Strategies Fund
NASDAQ    	GVHR                	Gevity HR, Inc.
NYSE      	LUK                 	Leucadia National Corporation
NASDAQ    	HTLD                	Heartland Express, Inc.
TSE       	PWF.PR.A.TO         	Power Financial Cp Pfd A
AMEX      	IYC                 	iShares Dow Jones U.S. Consumer Index Fund
NASDAQ    	LAMR                	Lamar Advertising Company
AMEX      	IW                  	ImageWare Systems, Inc.
NASDAQ    	MXICY               	Macronix International Co. Ltd
NASDAQ    	JILL                	J. Jill Group Inc. (The)
TSE       	BTH.UN.TO           	Barclays Top 100 E W Income Fd
NASDAQ    	TRPH                	Tripath Technology, Inc.
NASDAQ    	PTNR                	Partner Communications Company Ltd.
NYSE      	PD                  	Phelps Dodge Corporation
NASDAQ    	ICAB                	i-CABLE Communications
INDEX     	XST                 	The Select Ten Index
AMEX      	GAV.W               	GRUBB & ELLIS REALTY     ADVISOR
AMEX      	RXB                 	Morgan Stanley Dean Witter & Co.
NASDAQ    	SOMX                	SOMAXON PHARMACEUTIC
TSE       	VYE.TO              	Viceroy Exploration Ltd
NASDAQ    	ORCH                	Orchid Cellmark Inc.
NYSE      	IFN                 	India Fund, Inc. (The)
TSE       	MRF.TO              	Mount Real Cp
AMEX      	IAU                 	iShares COMEX Gold Trust
NYSE      	MHP                 	McGraw-Hill Companies, Inc. (The)
NASDAQ    	IMKTA               	Ingles Markets, Incorporated
NASDAQ    	SUNW                	Sun Microsystems, Inc.
NASDAQ    	ASTSF               	ASE Test,
NYSE      	PFL                 	PIMCO Floating Rate Income Fund
NYSE      	BAP                 	Credicorp Ltd.
NASDAQ    	KFED                	K-Fed Bancorp
TSE       	CU.PR.B.TO          	Canadian Utilities 2nd Pfd X
INDEX     	RXH                 	AMEX M S Healthcare Providr Index
NYSE      	LQ                  	Quinenco SA
INDEX     	BKO                 	PHLX BANK SECTOR INDEX SETTLEME
INDEX     	OSEAX               	OSE All Share - Norway
NASDAQ    	DRCO                	Dynamics Research Corporation
NYSE      	MIY                 	MuniYield Michigan Insured Fund, Inc.
TSE       	MHR.TO              	McGraw-Hill Ryerson Ltd
NYSE      	TSY                 	Trustreet Properties, Inc.
NASDAQ    	QUOT                	Quotesmith.com, Inc.
NYSE      	AB                  	ALLIANCE BERTEIN HOLDING L P
TSE       	HWO.UN.TO           	High Artic Energy Services Trust
NASDAQ    	WBCO                	Washington Banking Company
TSE       	FUN.TO              	Fun Technologies Plc
AMEX      	RZV                 	Rydex S&P 600 Pure Value
NYSE      	HLF                 	Herbalife LTD.
NASDAQ    	SPOR                	Sport-Haley, Inc.
TSE       	MNY.TO              	Mindready Solutions Inc
NASDAQ    	RNVS                	Renovis, Inc.
TSE       	BT.UN.TO            	Bonnett's Energy Services Tr
NYSE      	ABK                 	Ambac Financial Group, Inc.
INDEX     	NIZ                 	iShares Russell Midcap Index Fund
INDEX     	YHIN                	NYSE New 52 Week High
AMEX      	CAV                 	Cavalier Homes, Inc.
NYSE      	CRH                 	Lehman ABS Corporation
INDEX     	XMT                 	Merrill Lynch & Co Inc
INDEX     	DZN                 	DYNAMIC NETWORKING INTELLIDEX
NASDAQ    	SYNF                	Synergy Financial Group, Inc.
NYSE      	BSI                 	Blue Square - Israel Ltd.
NASDAQ    	HLEX                	HealthExtras, Inc.
NASDAQ    	COGO                	Comtech Group, Inc.
NASDAQ    	TASR                	TASER International, Inc.
NASDAQ    	CBSH                	Commerce Bancshares, Inc.
NYSE      	CNQ                 	Canadian Natural Resources
AMEX      	IF                  	Indonesia Fund, Inc. (The)
NASDAQ    	TWPG                	THOMAS WEISEL PARTNE
TSE       	TC.TO               	Tucows Inc
NYSE      	UCO                 	Universal Compression Holdings, Inc.
TSE       	KNA.UN.TO           	Keystone North America Inc IPS
NYSE      	TNH                 	Terra Nitrogen Company, L.P.
NYSE      	SCG                 	SCANA Corporation
NYSE      	SXC                 	STANTEC INC
NYSE      	NQF                 	Nuveen Florida Investment Quality Municipal Fund
NASDAQ    	NRMX                	Neurochem Inc
NYSE      	IEX                 	IDEX Corporation
NYSE      	NPX                 	Nuveen Insured Premium Income Municipal Fund II
TSE       	CUF.UN.TO           	Cominar REIT Unit
NYSE      	RL                  	Polo Ralph Lauren Corporation
INDEX     	RXS                 	Phlx Drug Index
NASDAQ    	SIGA                	SIGA Technologies Inc.
NYSE      	CCZ                 	Comcast Holdings Inc
NYSE      	AEC                 	Associated Estates Realty Corporation
NYSE      	RTU                 	Cohen & Steers REIT and Utility Income Fund Inc
TSE       	HOT.DB.TO           	Canadian Hotel REIT Deb
NASDAQ    	ACAS                	American Capital Strategies, Ltd.
NYSE      	HON                 	Honeywell International Inc.
NYSE      	DCN                 	Dana Corporation
NASDAQ    	HFFC                	HF Financial Corp.
TSE       	SYS.TO              	Systech Retail Systems Inc
AMEX      	BXA                 	Merrill Lynch
INDEX     	HVF                 	Vanguard Financials Vipers Index
TSE       	FDT.UN.TO           	Fairway Diversified Income
NYSE      	IYM                 	iShares Dow Jones US Basic Materials Index
AMEX      	GOV                 	Gouverneur Bancorp, Inc.
AMEX      	PXG                 	Phoenix Footwear Group, Inc.
NASDAQ    	BARI                	Bancorp Rhode Island, Inc.
INDEX     	NJJ                 	iShares S&P MidCap 400 BARRA Value Index
INDEX     	WBF                 	iShares MSCI France Index
NASDAQ    	PBIO                	Pressure BioSciences, Inc.
NYSE      	KOB                 	Lehman ABS Corporation
NASDAQ    	CHTT                	Chattem, Inc.
NASDAQ    	GTIM                	Good Times Restaurants Inc.
NYSE      	WWW                 	Wolverine World Wide, Inc.
AMEX      	XLE                 	SPDR Energy
NASDAQ    	NUVA                	NuVasive, Inc.
NYSE      	COA                 	Coachmen Industries, Inc.
INDEX     	IUX                 	Russell 2000 Stock Index
TSE       	III.TO              	Imperial Metals Cp
NYSE      	CFC                 	Structured Products Inc 8% CorTS
NASDAQ    	VNDA                	VANDA PHARMACEUTICAL
NASDAQ    	MBVA                	Millennium Bankshares Corporation
AMEX      	RBY                 	RUBICON MINERALS CORP
AMEX      	IMM                 	Immtech International Inc.
INDEX     	SMQ                 	Sig Investment Managers Index
AMEX      	JST                 	Jinpan International
INDEX     	IQZ                 	S&P 1000
NASDAQ    	INSP                	InfoSpace, Inc.
NYSE      	CYD                 	China Yuchai International
NASDAQ    	NMSS                	NMS Communications Corporation
NASDAQ    	AMAC                	American Medical Alert Corp.
NASDAQ    	SUMT                	SumTotal Systems, Inc.
NASDAQ    	NVAX                	Novavax, Inc.
NYSE      	SPC                 	Rayovac Corporation
NYSE      	NUE                 	Nucor Corporation
AMEX      	ETF                 	EMRG MKT TELCOM FUND
NASDAQ    	SBSI                	Southside Bancshares, Inc.
NYSE      	IND                 	ING Group, N.V.
TSE       	BNK.TO              	Bankers Petroleum Ltd
NASDAQ    	PHMD                	PhotoMedex, Inc.
TSE       	AMT.UN.TO           	Amtelecom Income Fund
NYSE      	DPD                 	Dow 30 Premium
NASDAQ    	AWBC                	AmericanWest Bancorporation
AMEX      	TO                  	Tech/Ops Sevcon, Inc.
AMEX      	NBY                 	NBC Capital Corporation
NASDAQ    	CTBI                	Community Trust Bancorp, Inc.
NASDAQ    	ALGI                	American Locker Group, Inc.
NYSE      	TLM                 	Talisman Energy Inc.
AMEX      	HCO.W               	HYPERSPACE COMM WRTS
NASDAQ    	CHKP                	Check Point Software Technologies Ltd.
NASDAQ    	CPRT                	Copart, Inc.
TSE       	CSA.TO              	Commercial Solutions Inc
NASDAQ    	DROOY               	DRDGOLD
AMEX      	SLP                 	Simulations Plus, Inc.
TSE       	RGL.TO              	Royal Gold Inc
NASDAQ    	ACTG                	Acacia Research Corporation
NASDAQ    	SLGN                	Silgan Holdings, Inc.
NYSE      	WMS                 	WMS Industries Inc.
TSE       	BGI.TO              	Birim Goldfields Inc
NASDAQ    	GVBK                	Greenville First Bancshares Inc.
NASDAQ    	DISCB               	Discovery Holding Co
AMEX      	OTT                 	Otelco, Inc.
NASDAQ    	PFCB                	P.F.Chang's China Bistro, Inc.
AMEX      	JNP                 	MORGAN STANLEY
AMEX      	TSV                 	Wachovia Corporation
INDEX     	DLL                 	iShares Tr GS $ InvesTop Corp Bd Fund
TSE       	XLX.TO              	Xillix Technology Cp
NYSE      	PYN                 	PIMCO New York Municipal Income Fund III
NYSE      	BGT                 	Blackrock Global
TSE       	TDR.TO              	Tudor Cp Ltd
NYSE      	KCC                 	Lehman ABS Corporation
AMEX      	DBY                 	MORGAN STANLEY
NYSE      	GJS                 	SYNTHETIC FIXED-INCOME SECURIT
NASDAQ    	PVTB                	PrivateBancorp, Inc.
TSE       	YOU.UN.TO           	Yield Advantage Income Trust
INDEX     	XMGI                	Madrid General Index
TSE       	CTR.NV.TO           	Canadian Tire Cp A
AMEX      	IYM                 	iShares Dow Jones U.S. Basic Materials Index
NYSE      	IMB                 	MS Insured Municipal Bond Trust
TSE       	FGL.TO              	Forzani Group Ltd Cl A
TSE       	ABT.TO              	Absolute Software Corporation
NYSE      	PBF                 	Pioneer Tax Advantaged Balanced Trust
AMEX      	DMJ                 	Morgan Stanley Dean Witter & Co.
AMEX      	ILI                 	Interlott Technologies, Inc.
NASDAQ    	UDRL                	UNION DRILLING INC.
TSE       	LIM.TO              	Lionore Mining International
NYSE      	MKS                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	PHG                 	Koninklijke Philips Electronics, N.V.
NYSE      	FXE                 	Rydex Euro Currency
TSE       	SLW.TO              	Silver Wheaton Cp
NYSE      	PBY                 	Pep Boys-Manny, Moe & Jack (The)
AMEX      	NSB                 	SAL SM BNY S& P500
INDEX     	ILH                 	Dynamic Lg Cap Gr Intellidex
NYSE      	NAU                 	National Australia Bank
AMEX      	RZ                  	RASER TECH INC
NASDAQ    	ALLI                	Allion Healthcare, Inc.
NASDAQ    	PFBC                	Preferred Bank
AMEX      	BPN                 	Merrill Lynch & Co., Inc.
TSE       	PPK.TO              	Polyair Inter Pack Inc
NASDAQ    	FBSS                	Fauquier Bankshares, Inc.
NASDAQ    	OMNI                	OMNI Energy Services Corp.
NASDAQ    	NATL                	National Interstate Corporation
NYSE      	BIE                 	Blackrock Florida Municipal Bond Trust
AMEX      	EMM                 	streetTRACKS DJ Wilshire Mid Cap
NASDAQ    	NOIZ                	Micronetics, Inc.
NYSE      	SAH                 	Sonic Automotive, Inc.
NYSE      	KHI                 	Scudder High Income Trust
NYSE      	ACN                 	Accenture Ltd.
AMEX      	MSU                 	Morgan Stanley Dean Witter & Co.
NYSE      	IDC                 	Interactive Data Corporation
TSE       	FCE.DB.A.TO         	Fort Chicago Energy 7.5% Debs
NASDAQ    	CFNB                	California First National Bancorp
NYSE      	APN                 	Applica Incorporated
NASDAQ    	ZVXI                	Zevex International, Inc.
NYSE      	GJB                 	Strats Tr for Bellsouth Telecommunications Ctfs
NYSE      	RGR                 	Sturm, Ruger & Company, Inc.
INDEX     	XT                  	Merrill Lyn Late Cyclical Index
NASDAQ    	POOL                	SCP Pool Corporation
NASDAQ    	PLUS                	ePlus Inc.
NYSE      	SEN                 	SEMCO Energy, Inc.
NASDAQ    	USNA                	USANA Health Sciences Inc.
TSE       	FP.UN.TO            	FP Newspapers Income Fund
AMEX      	CRB                 	Courtside Acquisition Corp.
NYSE      	AXS                 	Axis Capital Holdings
TSE       	ADC.TO              	AIC Diversified Canada Split
AMEX      	JSB                 	Citigroup Global Markets Holdings Inc
NASDAQ    	SWSI                	Superior Well Services, Inc.
NASDAQ    	CBBO                	Columbia  Bancorp
TSE       	TRH.UN.TO           	Triax Diversified Hi Yield Tr
NYSE      	FCN                 	FTI Consulting, Inc.
NASDAQ    	TRCA                	Tercica, Inc.
TSE       	CRT.UN.TO           	Citadel Smart Fund
AMEX      	UTH                 	HOLDRS Utilities
NASDAQ    	TBWC                	TB Wood's Corporation
TSE       	PXE.TO              	Proex Energy Ltd
NASDAQ    	TACX                	A Consulting Team, Inc. (The)
NASDAQ    	PHRM                	Pharmion Corporation
TSE       	OPC.TO              	OPTI Canada Inc
NASDAQ    	TONS                	Novamerican Steel, Inc.
NASDAQ    	VIDE                	Video Display Corporation
NYSE      	EOG                 	EOG Resources, Inc.
TSE       	GDC.TO              	Genesis Land Development Cp
TSE       	TA.PR.C.TO          	Transalta Cp 7.75% Pfd
NASDAQ    	RSTI                	Rofin-Sinar Technologies, Inc.
NYSE      	LEA                 	Lear Corporation
AMEX      	HEC                 	Harken Energy Corporation
AMEX      	ONH                 	Orion HealthCorp, Inc.
NASDAQ    	AMRN                	Amarin Corporation PLC
NASDAQ    	MDCO                	Medicines Company (The)
AMEX      	FRG                 	Fronteer Development Group Inc.
TSE       	HUX.TO              	HEARx Canada Inc
NYSE      	FTE                 	France Telecom S.A.
NYSE      	SLE                 	Sara Lee Corporation
AMEX      	STG                 	Stonepath Group, Inc.
NYSE      	CRA                 	Applera Corporation
TSE       	SLN.UN.TO           	Skylon Capital Yield Trust
TSE       	BC.PR.C.TO          	Bell Canada Srs 19 Pfd C
AMEX      	CCF                 	Chase Corporation
INDEX     	UNVN                	NYSE Unchanged Volume
NASDAQ    	MAXE                	Max & Erma's Restaurants, Inc.
INDEX     	DXY                 	DOLLAR INDEX
NYSE      	MMU                 	Managed Municipals Portfolio, Inc.
NASDAQ    	PENX                	Penford Corporation
AMEX      	PXN                 	PowerShares Lux Nanotech
NASDAQ    	NWFI                	Northway Financial Inc.
NYSE      	PDE                 	Pride International, Inc.
NYSE      	PIJ                 	Merrill Lynch Depositor, Inc.
INDEX     	MOX                 	Morgan Stanley Internet Index
NYSE      	MPR                 	Met-Pro Corporation
TSE       	UTR.UN.TO           	UBS Total Return Trust
NYSE      	VLI                 	Valero LP
NYSE      	TXT                 	Textron Inc.
NYSE      	NQP                 	Nuveen Pennsylvania Investment Quality Municipal Fund, Inc.
NASDAQ    	VPHM                	ViroPharma Incorporated
NASDAQ    	JNPR                	Juniper Networks, Inc.
INDEX     	NLT                 	iShares S&P SmallCap 600 BARRA Growth Index
AMEX      	NKI                 	MORGAN STANLEY
AMEX      	EMA                 	eMagin Corporation
NASDAQ    	SAFC                	SAFECO Corporation
NYSE      	EEA                 	EUROPEAN EQUITY FUND INC
INDEX     	JPN                 	AMEX Japan Index
NASDAQ    	SCMR                	Sycamore Networks, Inc.
TSE       	XGV.TO              	iUnits Govt Canada 5 Year Bd
AMEX      	WLB.P               	Westmoreland Coal Co
NASDAQ    	KNTA                	Kintera Inc.
TSE       	CHM.TO              	Chum Ltd
AMEX      	PBE                 	PowerShares Dynamic Biotech & Genome
NASDAQ    	TRAD                	TradeStation Group Inc
NYSE      	ITU                 	Banco Itau Holding Financeira SA (Holding Co)
NYSE      	JZL                 	Lehman ABS Corporation
TSE       	NPI.UN.TO           	Northland Power Income Tr Uts
NYSE      	SOV                 	Sovereign Bancorp, Inc.
AMEX      	ATC                 	Cycle Country Accessories Corporation
NASDAQ    	TFINP               	Team Financial, Inc.
NYSE      	XKE                 	Lehman ABS Corporation
NASDAQ    	ENMC                	Encore Medical Corporation
NASDAQ    	ECBE                	ECB Bancorp Inc
TSE       	RVM.TO              	Revett Minerals Inc
NASDAQ    	ARCAF               	Arcadis NV
AMEX      	CFS                 	COMFORCE Corp.
AMEX      	HSR                 	Hi-Shear Technology Corp.
NYSE      	MYJ                 	MuniYield New Jersey Fund, Inc.
NYSE      	RRD                 	R.R. Donnelley & Sons Company
NYSE      	AED                 	ALLIED DOMECQ PLC
NASDAQ    	DRAM                	Dataram Corporation
AMEX      	GLA                 	GLOBAL LOGISTICS ACQ
TSE       	PLD.UN.TO           	Preferred Securities Uts
INDEX     	DFI                 	AMEX Defense Index
NASDAQ    	ERES                	eResearch Technology Inc.
NYSE      	ILA                 	AQUILA INC
INDEX     	SVK                 	VANGUARD EUROPEAN VIPERS
TSE       	MBX.TO              	Microbix Biosystems Inc
TSE       	ART.UN.TO           	Acuity Multi-Cap Total Return Trust
NASDAQ    	GILT                	GILAT SATELLITE NW
NASDAQ    	IBIS                	Ibis Technology Corporation
NASDAQ    	UBFO                	United Security Bancshares
NASDAQ    	SRTIE               	SUNRISE TELECOM IN
NASDAQ    	NOOF                	New Frontier Media, Inc.
TSE       	XGD.TO              	iUnits S&P/TSX Gold
NASDAQ    	CABG                	CABG Medical, Inc.
NASDAQ    	GNLB                	Genelabs Technologies, Inc.
INDEX     	RDG                 	Cboe Russell Midcap Growth Index
NASDAQ    	CVGR                	Covalent Group, Inc.
AMEX      	NKX                 	Nuveen Insured California Tax-Free Advantage Municipal Fund
TSE       	VRS.TO              	Allen-Vanguard Cp
NASDAQ    	APAC                	APAC Customer Services, Inc.
NASDAQ    	CHNL                	Channell Commercial Corporation
TSE       	PAA.TO              	Pan American Silver Cp
NYSE      	ACV                 	Alberto-Culver Company
NASDAQ    	RADN                	Radyne Corporation
AMEX      	EWP                 	iShares MSCI Spain Index Fund
NASDAQ    	WFMI                	Whole Foods Market, Inc.
NASDAQ    	UAHC                	United American Healthcare Corporation
NASDAQ    	CTIC                	Cell Therapeutics, Inc.
NYSE      	EPD                 	Enterprise Products Partners L.P.
NYSE      	JAH                 	Jarden Corporation
NASDAQ    	BHLB                	BERKSHIRE HILL BNCP
INDEX     	IXY                 	Consumer Discretionary Select Sector Index
NASDAQ    	ANCC                	AirNet Communications Corporation
TSE       	BND.UN.TO           	Investment Grade Trust
NASDAQ    	NTRT                	NetRatings, Inc.
TSE       	XIU.TO              	iUnits S&P/TSX 60 Index
INDEX     	IIX                 	AMEX Interactive Week Intr New
AMEX      	GTF                 	Cytomedix, Inc. New
NASDAQ    	AMCE                	American Claims Evaluation, Inc.
NYSE      	BWE.P               	BANCWEST CP PFD
NYSE      	WPO                 	Washington Post Company (The)
TSE       	EXE.PR.E.TO         	Extendicare Inc Cl II Pfd E
AMEX      	FDL                 	FTETF MORNINGSTAR DV
NYSE      	RG                  	Rogers Communication, Inc.
NYSE      	BTU                 	Peabody Energy Corporation
NASDAQ    	WBPRJ               	W Holding Company Incorporated
NYSE      	EWZ                 	iShares MSCI Brazil
INDEX     	NBF                 	iShares Russell 1000 Growth Index
NYSE      	LMS                 	Lamson & Sessions Co. (The)
NASDAQ    	MAGS                	Magal Security Systems Ltd.
NASDAQ    	WLFCE               	WILLIS LEASE FIN C
TSE       	SI.TO               	Sirit Inc
AMEX      	SWH                 	HOLDRS Software
NASDAQ    	SRCE                	1st Source Corporation
NASDAQ    	FCPO                	Factory Card & Party Outlet Corporation
NASDAQ    	CVLY                	Codorus Valley Bancorp, Inc
NYSE      	LQU                 	Quilmes Industrial (Quinsa) S.A.
NYSE      	KVR                 	Lehman ABS Corporation
NYSE      	SPH                 	Suburban Propane Partners, L.P.
NASDAQ    	PVTBP               	PrivateBancorp, Inc.
NYSE      	DKP                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	EDE                 	Empire District Electric Company (The)
TSE       	KMP.TO              	Killam Properties Inc
NYSE      	HGT                 	Hugoton Royalty Trust
INDEX     	DRG                 	AMEX Pharmaceutical Index
NYSE      	AFB                 	Alliance National Municipal Income Fund Inc
AMEX      	TBV                 	Tiens Biotech Group (USA), Inc.
NYSE      	KST                 	Scudder Strategic Income Trust
NYSE      	CEI                 	Crescent Real Estate Equities Company
NASDAQ    	TFONY               	Telefonos de Mexico SA de CV Ser A Spons ADR
NASDAQ    	DHOM                	Dominion Homes Inc.
NYSE      	BDK                 	Black & Decker Corporation (The)
NASDAQ    	CUTR                	Cutera, Inc.
NASDAQ    	DTLK                	Datalink Corporation
NASDAQ    	AMCR                	Amcor
NYSE      	MFB                 	Maidenform Brands, Inc.
NASDAQ    	TRMM                	TRM Corporation
AMEX      	DJL                 	MORGAN STANLEY
NYSE      	AIN                 	Albany International Corporation
NASDAQ    	FTBK                	Frontier Financial Corporation
NASDAQ    	PRLS                	Peerless Systems Corporation
TSE       	NAC.TO              	North Atlantic Resources Ltd
NASDAQ    	VLTR                	Volterra Semiconductor Corporation
NYSE      	CVC                 	Cablevision Systems Corporation
NYSE      	FIS                 	IDELITY NATIONAL INFORMATION SE
INDEX     	HKR                 	POWERSHARES DYNAMIC AERSPC & DE
NYSE      	NCF.P               	NATIONAL COMM CAPITAL TRUST II PF
NASDAQ    	CSGP                	CoStar Group, Inc.
AMEX      	CVM                 	Cel-Sci Corporation
NYSE      	GJD                 	Strats Tr for Bellsouth Telecommunications Ctfs
NASDAQ    	TCMIV               	TRIPLE CROWN MEDIA
NASDAQ    	KCLI                	Kansas City Life Insurance Company
AMEX      	AKN                 	Akorn, Inc.
INDEX     	IXH                 	Institutional Holdings Index
NYSE      	FJC                 	Fedders Corporation
INDEX     	BTK                 	AMEX Biotechnology Index
NASDAQ    	SMRT                	Stein Mart, Inc.
NASDAQ    	ICLR                	ICON plc
TSE       	GSC.TO              	Golden Star Resources Ltd
NYSE      	UNS                 	UniSource Energy Corporation
AMEX      	PWB                 	PowerShares Dynamic Large Cap Growth
NYSE      	DFY                 	Delphi Financial Group, Inc.
NASDAQ    	ARQQ                	ARN NDQ 100
TSE       	ABR.SV.A.TO         	Arbec Forest Products Inc.
NYSE      	JBO                 	Lehman ABS Corporation
NASDAQ    	GNSY                	Genesys S.A.
NASDAQ    	SFUN                	SAIFUN SEMICONDUCTOR
NYSE      	REM                 	Remington Oil and Gas Corporation
NASDAQ    	ATSN                	Artesyn Technologies, Inc.
NASDAQ    	REFR                	Research Frontiers Incorporated
TSE       	IVW.TO              	Ivernia Inc
TSE       	TIM.TO              	Timminco Ltd
INDEX     	NLE                 	iShares Dow Jones U.S. Energy Sector Index
NASDAQ    	HSII                	Heidrick & Struggles International, Inc.
NASDAQ    	FUJIY               	Fuji Photo Film Co., Ltd.
AMEX      	MMX.W               	MONTANA MILLS BR WTS
TSE       	FAL.PR.Z.TO         	Falconbridge Pfd J3
INDEX     	IBF                 	iShares NASDAQ Biotechnology Index Fund
AMEX      	CDS.U               	COLD SPRING CAPITAL INC
AMEX      	TMP                 	TompkinsTrustco, Inc.
NASDAQ    	LPHI                	Life Partners Holdings Inc
NASDAQ    	AQQQ                	Merrill Lynch & Co., Inc.
NASDAQ    	REDE                	RedEnvelope, Inc.
NYSE      	PYC                 	Merrill Lynch Depositor Inc
NYSE      	HJD                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
TSE       	SLE.M.TO            	Sun Life Capital Trust
NYSE      	RNR                 	RenaissanceRe Holdings Ltd.
NYSE      	APU                 	AmeriGas Partners, L.P.
NYSE      	HCR                 	Manor Care, Inc.
AMEX      	DSA                 	Merrill Lynch & Co., Inc.
NYSE      	CPL                 	CPFL Energia S.A.
AMEX      	BHH                 	HOLDRS B2B Internet
NYSE      	RBK                 	Reebok International Ltd.
NYSE      	PJS                 	PreferredPlus Trust
NASDAQ    	CPBK                	COMMUNITY CAPITAL CP
TSE       	PBL.UN.TO           	Pollard Banknote Income Fund
NASDAQ    	CMKG                	CoActive Marketing Group Inc
NASDAQ    	COBK                	Colonial Bankshares, Inc.
NASDAQ    	BSRR                	Sierra Bancorp
AMEX      	RKH                 	HOLDRS Regional Bank
NYSE      	CL                  	Colgate-Palmolive Company
NASDAQ    	QUIP                	Quipp, Inc.
NASDAQ    	ISSX                	Internet Security Systems Inc
NASDAQ    	ILSE                	IntraLase Corp.
NASDAQ    	PCAR                	PACCAR Inc.
NASDAQ    	SMTC                	Semtech Corporation
NASDAQ    	TBSI                	TBS International
NYSE      	FHN                 	First Tennessee National Corporation
NASDAQ    	FTHR                	Featherlite, Inc.
NYSE      	RSG                 	Republic Services, Inc.
INDEX     	RUJ                 	Cboe Russell Value Index
NASDAQ    	RTLX                	Retalix Ltd.
AMEX      	FVD                 	First Trust Value Line Dividend Fund
NYSE      	ARP                 	American Reprographics Company
NASDAQ    	JCTCF               	Jewett-Cameron Trading Company
NASDAQ    	PBKS                	Provident Bankshares Corporation
NYSE      	GPD                 	Georgia Power Company
TSE       	ENB.PR.D.TO         	Enbridge Inc 7.8% Pfd D
AMEX      	IVE                 	iShares S&P 500/BARRA Value Index Fund
NASDAQ    	MCRS                	MICROS Systems, Inc.
NASDAQ    	CAFI                	Camco Financial Corporation
NASDAQ    	FFBC                	First Financial Bancorp.
TSE       	RRD.TO              	RR Donnelley & Sons Company
NASDAQ    	ZHNE                	Zhone Technologies, Inc.
INDEX     	DECQ                	NASDAQ Decliners
TSE       	IGM.PR.A.TO         	IGM Financial Inc Pfd A
NASDAQ    	GGBMZ               	GIGABEAM CORP WT Z
AMEX      	UNB                 	Union Bankshares, Inc.
TSE       	RY.PR.K.TO          	Royal Bank Pfd N
NASDAQ    	SYKE                	Sykes Enterprises, Incorporated
TSE       	MBN.TO              	Middlefield Bancorp Ltd
NASDAQ    	CTEL                	City Telecom (H.K.)
INDEX     	CKG                 	S&P SmallCap 600 BARRA Growth Index
AMEX      	MZT                 	Matritech, Inc.
NYSE      	KCP                 	Kenneth Cole Productions, Inc.
TSE       	MOD.TO              	Groupe Les Ailes De La Mode
NYSE      	CJO                 	Lehman ABS Corporation
TSE       	MST.UN.TO           	Multi Select Income Tr Units
INDEX     	INDS                	Nasdaq Industrial
NYSE      	BVC                 	Bay View Capital Corporation
NASDAQ    	PMID                	Pyramid Breweries, Inc.
NYSE      	STJ                 	St. Jude Medical, Inc.
TSE       	WN.TO               	George Weston Ltd
NYSE      	HCC                 	HCC Insurance Holdings, Inc.
NASDAQ    	HITK                	Hi-Tech Pharmacal Co., Inc.
NASDAQ    	ABMD                	ABIOMED, Inc.
TSE       	YMG.TO              	YMG Capital Management
NYSE      	UTI                 	Universal Technical Institute Inc
NYSE      	RTN                 	Raytheon Company
TSE       	AXX.TO              	Axia Netmedia Cp
NYSE      	MCS                 	Marcus Corporation (The)
AMEX      	PED.W               	SMARTPROS LTD WTS
NASDAQ    	NTES                	Netease.com, Inc.
TSE       	MRE.TO              	Martinrea International Inc
TSE       	PWF.PR.G.TO         	Power Financial Cp 5.90% Pfd F
NASDAQ    	BYBI                	Back Yard Burgers, Inc.
TSE       	ARZ.TO              	Aurizon Mines Ltd
TSE       	BAN.TO              	Band-Ore Resources Ltd
TSE       	CU.PR.D.TO          	Canadian Utilities 2nd Pfd S
TSE       	AIG.UN.TO           	Acuity Growth & Income Trust
TSE       	TRF.UN.TO           	Triax Resource Ltd Partnership
NASDAQ    	FBTC                	First BancTrust Corporation
NASDAQ    	TBNC                	Banc Corporation (The)
NYSE      	MF                  	Malaysia Fund, Inc. (The)
NYSE      	AWR                 	American States Water Company
NYSE      	DSS                 	Quantum Corporation
NASDAQ    	AACC                	Asset Acceptance Capital Corp.
NYSE      	UTR                 	Unitrin, Inc.
NYSE      	MJI                 	MuniYield New Jersey Insured Fund, Inc.
NYSE      	CXR                 	Cox Radio, Inc.
TSE       	TNK.TO              	Tenke Mining Cp
NASDAQ    	JKHY                	Jack Henry & Associates, Inc.
TSE       	GWL.PR.O.TO         	Great West Life Pfd O
NASDAQ    	BTHS                	Benthos, Inc
NYSE      	MWD                 	MORGAN STANLEY
TSE       	ETC.TO              	Equitable Group Inc
NYSE      	GCA                 	GLOBAL CASH ACCESS HOLDINGS IN
AMEX      	HLD                 	Harold's Stores, Inc.
NASDAQ    	KIRK                	Kirkland's, Inc.
NASDAQ    	SJOE                	St Joseph Capital Corp
AMEX      	TJA                 	Citigroup Global Markets Holdings Inc
NASDAQ    	VVUS                	Vivus, Inc.
NYSE      	PFX                 	Phoenix Companies, Inc.
NASDAQ    	EENC                	Enterra Energy Trust
NYSE      	MUO                 	Pioneer Interest
TSE       	S.TO                	Sherritt International Cp
NASDAQ    	APCC                	American Power Conversion Corporation
AMEX      	EKM                 	9% ELKS BASED UPON THE COMMON
NASDAQ    	ANAT                	American National Insurance Company
NYSE      	HRS                 	Harris Corporation
NASDAQ    	EPEX                	Edge Petroleum Corporation
NYSE      	GCT                 	GMH Communities Trust
TSE       	KCO.TO              	Kereco Energy Ltd
NASDAQ    	CAPA                	Captaris Inc.
NYSE      	ENN                 	Equity Inns, Inc.
NYSE      	XFH                 	Lehman ABS Corporation
NYSE      	STD                 	Banco Santander Central Hispano, S.A.
NASDAQ    	NPTH                	Enpath Medical, Inc.
NYSE      	HJN                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	KAMNA               	Kaman Corporation
NYSE      	EAT                 	Brinker International, Inc.
NASDAQ    	MNDO                	MIND C.T.I. Ltd.
NYSE      	PNK                 	Pinnacle Entertainment, Inc.
INDEX     	EYT                 	iShares DJ Transport Avg Index Fund
NASDAQ    	DLTR                	Dollar Tree Stores, Inc.
NASDAQ    	CERN                	Cerner Corporation
NASDAQ    	IOTN                	Ionatron, Inc.
NASDAQ    	LSBC                	Large Scale Biology Corporation
TSE       	WTO.TO              	Western Oil Sands Inc
NYSE      	PIO                 	Pioneer Corporation
TSE       	AMM.TO              	Almaden Minerals Ltd
TSE       	CCH.TO              	Campbell Resources Inc
INDEX     	RMC                 	Cboe Russell Midcap Index
AMEX      	WFD                 	Westfield Financial, Inc.
NASDAQ    	TESS                	TESSCO Technologies Incorporated
NYSE      	CHG                 	CH Energy Group, Inc.
NYSE      	PML                 	Pimco Municipal Income Fund II
NYSE      	CXG                 	CNX GAS CORPORATION
AMEX      	HWG                 	Hallwood Group Incorporated
NYSE      	WHI                 	W Holding Company Incorporated
NASDAQ    	TTPA                	Trintech Group PLC
NASDAQ    	SEEDW               	ORIGIN AGRITCH LT WT
NASDAQ    	XMSR                	XM Satellite Radio Holdings Inc.
NASDAQ    	ROAC                	Rock of Ages Corporation
NYSE      	ELK                 	Elcor Corporation
NYSE      	VTP                 	Van Kampen Trust for Investment Grade Pennsylvania Municipals
NASDAQ    	BAMM                	Books-A-Million, Inc.
NYSE      	MNC                 	Monaco Coach Corporation
INDEX     	QSW                 	WEBS SWITZ SHR
NYSE      	AMB                 	AMB Property Corporation
NYSE      	ACG                 	ACM Government Income Fund, Inc.
TSE       	BMO.PR.V.TO         	Bank Of Montreal Pfd V
NYSE      	NFG                 	National Fuel Gas Company
NYSE      	IMN                 	Imation Corporation
AMEX      	GBN                 	Great Basin Gold, Ltd.
TSE       	RRR.DB.TO           	Retirement Residences Real Estate Investment Trust
TSE       	IDT.UN.TO           	Indexplus 2 Income Fund
NYSE      	ETM                 	Entercom Communications Corporation
AMEX      	OPT                 	OptiCare Health Systems, Inc.
AMEX      	PXE                 	PowerShares Dynamic Energy & Exploration
INDEX     	DOS                 	PHLX THESTREET.COM INTERNET SEC
AMEX      	EWH                 	iShares MSCI Hong Kong Index Fund
NASDAQ    	ROME                	Rome Bancorp, Inc.
TSE       	FLS.UN.TO           	Front Street Long/Short Income Fund
INDEX     	TOKS                	Tokyo TOPIX
TSE       	GPT.UN.TO           	Global Preferred Securities Tr
TSE       	ENF.UN.TO           	Enbridge Income Fund
NASDAQ    	PLBC                	Plumas Bancorp (Quincy, California)
TSE       	GMP.UN.TO           	GMP Capital Trust
NASDAQ    	SUSQ                	Susquehanna Bancshares, Inc.
INDEX     	INN                 	iShares MSCI Netherlands Index - IOPV
NYSE      	OMN                 	OMNOVA Solutions Inc.
NASDAQ    	AMPH                	American Physicians Service Group, Inc.
TSE       	TEU.TO              	CP Ships Ltd
NASDAQ    	VELCF               	Velcro Industries N.V.
NASDAQ    	SFSU                	CFI SMUN NDQ 100 IDX
NASDAQ    	TAYC                	Taylor Capital Group, Inc.
NASDAQ    	DSCM                	drugstore.com, inc.
NYSE      	DTE                 	DTE Energy Company
TSE       	CNH.TO              	Cinch Energy Cp
AMEX      	STV                 	Sterling Construction Company Inc
NASDAQ    	PCBS                	PROVIDENT COMMUNITY
NASDAQ    	KINDW               	Kindred Healthcare, Inc.
NYSE      	CSE                 	CAPITALSOURCE INC
TSE       	SU.TO               	Suncor Energy Inc
NYSE      	WB                  	Wachovia Corporation
TSE       	CHF.UN.TO           	Citadel Hytes Fund Unit
AMEX      	BEL                 	BENNETT ENVIRONMENTAL INC
NASDAQ    	FINB                	First Indiana Corporation
TSE       	TXL.UN.TO           	Triax Resource Ltd Partner II
NASDAQ    	CYCL                	Centennial Communications Corporation
NASDAQ    	ALVR                	Alvarion Ltd.
NASDAQ    	FWLT                	Foster Wheeler Ltd.
TSE       	CG.TO               	Centerra Gold Inc
AMEX      	MWE                 	MarkWest Energy Partners, LP
TSE       	AZD.TO              	Azure Dynamics Cp
NYSE      	OLP                 	One Liberty Properties, Inc.
NYSE      	EHP                 	Eagle Hospitality Properties Trust Inc
AMEX      	ESC                 	Emeritus Corporation
NASDAQ    	SBIBO               	Sterling Bancshares, Inc.
TSE       	AOF.TO              	Arrow Energy Ltd.
NASDAQ    	ISSI                	Integrated Silicon Solution, Inc.
NASDAQ    	EDGW                	Edgewater Technology, Inc.
NASDAQ    	AMAT                	Applied Materials, Inc.
NYSE      	WTW                 	Weight Watchers International Inc
TSE       	ACX.TO              	Ascendant Cooper Cp
TSE       	DXT.TO              	Dexit Inc
INDEX     	GDM                 	AMEX GOLD MINERS
NASDAQ    	BKRS                	Bakers Footwear Group, Inc.
NYSE      	BSC                 	Bear Stearns Companies, Inc (The)
TSE       	FPS.TO              	Fraser Papers Inc
TSE       	QRL.TO              	Queenstake Resources Ltd
NYSE      	WCG                 	Wellcare Group
INDEX     	BDI                 	Baltic Dry Index
NYSE      	MHN                 	MuniHoldings New York Insured Fund, Inc.
NASDAQ    	DHIL                	Diamond Hill Investment Group, Inc.
NASDAQ    	CTRX                	CoTherix, Inc.
TSE       	CHR.TO              	Chromos Molecular Systems Inc
NASDAQ    	FCGI                	First Consulting Group, Inc.
NYSE      	IJJ                 	iShares S&P Mid Cap 400 Value
AMEX      	AXO                 	AXS-One Inc.
AMEX      	ASE                 	AMERICAN SCIEN & ENGR INC
AMEX      	FXX                 	FOXBY CORP
NASDAQ    	ICOP                	ICOP DIGITAL INC
NASDAQ    	RESC                	Roanoke Electric Steel Corporation
TSE       	KLT.UN.TO           	KBSH Leaders Trust
TSE       	BE.TO               	Brompton Equity Split Cp
NYSE      	MDT                 	Medtronic, Inc.
NASDAQ    	BOCH                	Bank of Commerce Holdings (CA)
NYSE      	GYI                 	Getty Images, Inc.
NASDAQ    	RIGL                	Rigel Pharmaceuticals, Inc.
AMEX      	ERS                 	Empire Resources, Inc.
NASDAQ    	DSPG                	DSP Group, Inc.
AMEX      	CIZ                 	Citizens Holding Company
NASDAQ    	THLD                	Threshold Pharmaceuticals, Inc.
NASDAQ    	PMTI                	Palomar Medical Technologies, Inc.
NASDAQ    	EASI                	Engineered Support Systems, Inc.
NYSE      	CMX                 	Caremark Rx, Inc.
AMEX      	CDS                 	COLD SPRING CAPITAL
NYSE      	MW                  	Men's Wearhouse, Inc. (The)
NYSE      	GDW                 	Golden West Financial Corporation
NYSE      	NCL                 	Nuveen Insured California Premium Income Municipal Fund II, In
NASDAQ    	GHDX                	GENOMIC HEALTH INC
NASDAQ    	HOTJ                	HOUSE OF TAYLR JEWLR
NASDAQ    	STEC                	SimpleTech Inc
NYSE      	TUG                 	Maritrans, Inc.
NYSE      	EQS                 	Equus II Incorporated
INDEX     	NJH                 	iShares S&P MidCap 400 Index
TSE       	GWO.PR.F.TO         	Great West Lifeco Inc Pfd F
NASDAQ    	SYNO                	Synovis Life Technologies, Inc.
INDEX     	XAU                 	Phlx Gold Silver Index
AMEX      	IMO                 	Imperial Oil
NASDAQ    	DDICD               	DDI CORP NEW
NASDAQ    	SWFT                	Swift Transportation Co., Inc.
NYSE      	V                   	Vivendi Universal
NASDAQ    	ESLT                	Elbit Systems Ltd.
NASDAQ    	EUROD               	EUROTRUST A/S
NYSE      	GFW                 	AAG Holding Company Inc.
NYSE      	JNC                 	John Nuveen Company (The)
AMEX      	SUF                 	SULPHCO INC
NYSE      	ANF                 	Abercrombie & Fitch Company
NASDAQ    	CNFL                	Citizens Financial Corporation
NASDAQ    	IACIZ               	IAC/InterActiveCorp
NYSE      	RIO                 	COMPANHIA VALE DO RIO DOCE
NYSE      	BMA                 	BANCO MACRO BAUD S A
NASDAQ    	POLXF               	Polydex Pharmaceuticals
NASDAQ    	PPDI                	Pharmaceutical Product Development, Inc.
NYSE      	CIN                 	Cinergy Corporation
AMEX      	MRI.A               	McRae Industries, Inc.
NYSE      	KNX                 	KNIGHT TRAN INC
AMEX      	PIV                 	PowerShares Value Line Timeliness Selection
NYSE      	BZH                 	Beazer Homes USA, Inc.
TSE       	DHF.UN.TO           	Davis+Henderson Income Fund
NYSE      	SU                  	Suncor Energy  Inc.
NASDAQ    	ZXZZT               	TEST ZXZZT
INDEX     	IIV                 	S&P BARRA VALUE
NASDAQ    	HMSY                	HMS Holdings Corp
NASDAQ    	UNAM                	Unico American Corporation
NYSE      	NT                  	Nortel Networks Corporation
TSE       	TMY.A.TO            	Tempest Energy Cp Cl A
AMEX      	EWC                 	iShares MSCI Canada Index Fund
INDEX     	XGN                 	iShares S&P Global Info Technology
TSE       	HWD.UN.TO           	Hardwoods Distribution Income
NASDAQ    	TELN                	Telenor ASA
NASDAQ    	BWLD                	Buffalo Wild Wings, Inc.
NASDAQ    	NTIQ                	NetIQ Corporation
NYSE      	BRS                 	BRISTOW GROUP INC.
NASDAQ    	BOOM                	Dynamic Materials Corporation
NYSE      	OXY                 	Occidental Petroleum Corporation
AMEX      	ADL                 	AMDL INC
NASDAQ    	NSHA                	NASHUA CP
NASDAQ    	PLPC                	Preformed Line Products Company
INDEX     	SSJ                 	SIG STEEL PRODUCERS INDEX SETTL
TSE       	POW.PR.F.TO         	Power Cp Of Canada 1St Pfd F
NASDAQ    	BIOV                	BioVeris Corporation
NASDAQ    	PTEC                	Phoenix Technologies Ltd.
AMEX      	LDB                 	Merrill Lynch
INDEX     	IDM                 	MID ALERT
NYSE      	CHY                 	Calamos Convertible and High Income Fund
NYSE      	TXU.P               	TXU CORP
NASDAQ    	RNAI                	Sirna Therapeutics, Inc.
NASDAQ    	GNTX                	Gentex Corporation
NYSE      	CMI                 	Cummins Inc.
NYSE      	TAR                 	TELEFONICA DE ARGENTINA S A
TSE       	ATS.UN.TO           	ATS Andlauer Income Fd
NYSE      	IEV                 	iShares S&P Europe 350
NASDAQ    	UCFC                	United Community Financial Corp.
AMEX      	VWO                 	Vanguard Emerging Markets VIPERs
NYSE      	GME.B               	Gamestop Corp
INDEX     	ATG                 	General Share
NASDAQ    	HMNF                	HMN Financial, Inc.
NASDAQ    	ALOT                	Astro-Med, Inc.
NASDAQ    	TRCI                	Technology Research Corporation
NASDAQ    	CATG                	Cambridge Antibody Technology Group plc
NASDAQ    	NSFC                	Northern States Financial Corporation
NYSE      	TGI                 	Triumph Group, Inc.
INDEX     	DJU                 	Dow Jones Utility Average
TSE       	HEQ.UN.TO           	Home Equity Income Trust Units
NYSE      	PHI                 	Philippine Long Distance Telephone Company
TSE       	CM.PR.D.TO          	Cdn Imperial Bank Srs 26 Pfd
NASDAQ    	TXCO                	The Exploration Company
NASDAQ    	OLCB                	Ohio Legacy Corporation
NYSE      	GAP                 	Great Atlantic & Pacific Tea Company, Inc. (The)
TSE       	SVN.TO              	724 Solutions Inc
NASDAQ    	APOG                	Apogee Enterprises, Inc.
NASDAQ    	NUCO                	NuCo2 Inc.
NASDAQ    	PRXL                	PAREXEL International Corporation
TSE       	FAL.PR.F.TO         	Falconbridge Pfd F
TSE       	AFO.TO              	Afriore Ltd
AMEX      	CET                 	Central Securities Corporation
NYSE      	GY                  	GenCorp Inc.
NASDAQ    	NEXT                	NEXTEST SYSTEMS CORP
TSE       	RYG.TO              	Royal Group Technologies
NYSE      	CCL                 	Carnival Corporation
INDEX     	CTM                 	CREDIT SUISSE FIRST BOSTON TECH
AMEX      	JOB                 	General Employment Enterprises, Inc.
NYSE      	KCI                 	Kinetic Concepts, Inc.
NYSE      	MBE                 	MBIA, Inc.
NYSE      	KSU.P               	KAAS CITY SOUTHERN PFD
NYSE      	SMA                 	Symmetry Medical Inc
NASDAQ    	SPTN                	Spartan Stores, Inc.
INDEX     	NGJ                 	iShares Trust GS Natural Resources Fund
AMEX      	ISB                 	Citigroup Global Markets Holdings Inc
TSE       	CFU.TO              	Cars4U Ltd
NASDAQ    	LENS                	Concord Camera Corp.
NYSE      	NUC                 	Nuveen California Quality Income Municipal Fund, Inc.
NASDAQ    	SPNS                	Sapiens International Corporation N.V.
INDEX     	DVO                 	VANG ENERGY
NYSE      	ABX.P               	ARRICK GOLD CORP
NYSE      	IYK                 	iShares Dow Jones US Consumer Goods Index
NYSE      	IRL                 	Irish Investment Fund, Inc. (The)
NASDAQ    	AMOV                	America Movil, S.A. de C.V.
NYSE      	SEL                 	Seligman Select Municipal Fund, Inc.
TSE       	SVI.TO              	Strategic Vista International
NASDAQ    	EXPE                	Expedia, Inc.
TSE       	VIC.UN.TO           	Vicwest Income Fund
NYSE      	CAG                 	ConAgra Foods, Inc.
NASDAQ    	AEPI                	AEP Industries Inc.
NASDAQ    	YBTVA               	Young Broadcasting, Inc.
INDEX     	NKLD                	ID KLD INDEX
AMEX      	EAG                 	Eagle Broadband, Inc.
NYSE      	UAG                 	United Auto Group, Inc.
INDEX     	PVW                 	Vanguard Value Vipers Index
NASDAQ    	SUPVA               	Super Vision International, Inc.
NASDAQ    	CURE                	Curative Health Services, Inc.
NYSE      	HMX                 	Hartmarx Corporation
NYSE      	HET                 	Harrah's Entertainment, Inc.
NASDAQ    	ACAD                	ACADIA Pharmaceuticals Inc.
NASDAQ    	SNSS                	SUNESIS PHARMACEUTIC
NYSE      	GUQ                 	Gulf Power Company
INDEX     	NNK                 	iShares S&P MidCap 400 BARRA Growth Index
AMEX      	NII                 	Nuveen North Carolina Dividend Advantage Municipal Fund 3
NASDAQ    	EMBT                	Embarcadero Technologies, Inc.
NASDAQ    	BPRG                	BioProgress plc
NYSE      	PP                  	Prentiss Properties Trust
NASDAQ    	SBIB                	Sterling Bancshares, Inc.
NASDAQ    	VRTB                	VESTIN REALTY MORTGA
NASDAQ    	CARN                	Carrington Laboratories, Inc.
AMEX      	NSU                 	Nevsun Resources Ltd
NASDAQ    	ARXT                	Adams Respiratory Therapeutics, Inc.
TSE       	TWF.UN.TO           	Timberwest Forest Cp Uts
NYSE      	BUD                 	Anheuser-Busch Companies, Inc.
NASDAQ    	PCYC                	Pharmacyclics, Inc.
TSE       	FAC.UN.TO           	Flaherty & Crumrine Investment
NYSE      	JW.B                	John Wiley & Sons, Inc.
NYSE      	CKP                 	Checkpoint Systms, Inc.
NYSE      	XRX                 	Xerox Corporation
TSE       	PD.TO               	Precision Drilling Cp
NYSE      	BFR                 	BBVA Banco Frances S.A.
NYSE      	SGK                 	Schawk, Inc.
NYSE      	NEU                 	NewMarket Corporation
NYSE      	DHY                 	Credit Suisse High Yield Bond Fund
NASDAQ    	MUSE                	Micromuse, Inc.
NASDAQ    	TWIN                	Twin Disc, Incorporated
AMEX      	KBE                 	streetTRACKS KBW Bank
AMEX      	IYR                 	iShares Dow Jones U.S. Real Estate Index Fund
TSE       	NHC.TO              	NHC Communications Inc
AMEX      	IAX                 	International Absorbents Inc.
AMEX      	MLN                 	Merrill Lynch & Co., Inc.
NYSE      	LEN                 	Lennar Corporation
NYSE      	IN                  	Infonet Services Corporation
NASDAQ    	APII                	Action Products International, Inc.
NYSE      	PRE                 	PartnerRe Ltd.
INDEX     	SKR                 	SIG SPECIALTY RETAILING INDEX S
INDEX     	JMT                 	streetTRACKS Morgan Stanley High Tech 35 Index Fund
AMEX      	NLN                 	National Lampoon Inc.
NASDAQ    	BGFV                	Big 5 Sporting Goods Corporation
NASDAQ    	MRVC                	MRV Communications, Inc.
NASDAQ    	FRED                	Fred's, Inc.
AMEX      	SZI                 	SEGMENTZ INC
INDEX     	KXV                 	TECH SEC SPDR
NYSE      	HAL                 	Halliburton Company
NASDAQ    	RCNI                	RCN Corp.
AMEX      	EFH                 	Empire Financial Holding Company
AMEX      	KRY                 	Crystallex International Corporation
INDEX     	EFI                 	Merrill Lynch Euro Fund Index
NASDAQ    	INTU                	Intuit Inc.
TSE       	L.TO                	Loblaw Companies Ltd
NYSE      	KAR                 	Adesa Inc
NASDAQ    	QNTA                	Quanta Capital Holdings Ltd.
TSE       	AI.UN.TO            	Amalgamated Income Ltd Unit
NASDAQ    	WBSN                	Websense, Inc.
TSE       	KIH.TO              	Kingsway International
TSE       	SBL.TO              	Siebel Janna Arrangement Inc
NASDAQ    	CSPI                	CSP Inc.
NASDAQ    	LOJN                	LoJack Corporation
NYSE      	UNF                 	Unifirst Corporation
NYSE      	SPW                 	SPX Corporation
NASDAQ    	LIFE                	Lifeline Systems, Inc.
NYSE      	TSM                 	Taiwan Semiconductor Manufacturing Company
NASDAQ    	LTON                	Linktone Ltd.
NASDAQ    	NASI                	North American Scientific, Inc.
INDEX     	DZH                 	DYNAMIC HARDWARE & CO ELEC IN
INDEX     	IRH                 	Retail Holdrs Index
NASDAQ    	QGEN                	Qiagen N.V.
AMEX      	PPA                 	PowerShares Aerospace & Defense
NASDAQ    	CACH                	Cache, Inc.
NASDAQ    	FLAG                	FLAG Financial Corporation
AMEX      	MFI                 	MICRO FINCL INC
AMEX      	XFN                 	Xfone, Inc.
AMEX      	PBW                 	PowerShares WilderHill Clean Energy
AMEX      	OTV                 	eResource Capital Group, Inc.
NYSE      	GPS                 	Gap, Inc. (The)
NYSE      	NBL                 	Noble Energy Inc.
NASDAQ    	ANGO                	AngioDynamics, Inc.
TSE       	STQ.TO              	Income Streams III Cap Yld
NYSE      	ROS                 	Rostelecom
INDEX     	GBK                 	MORGAN STANLEY GLBL BSKT CPN
NASDAQ    	ROHI                	ROTECH HEALTHCARE
TSE       	THR.TO              	Thundermin Resources Inc
NASDAQ    	VWPT                	Viewpoint Corporation
NASDAQ    	ECGI                	Envoy Communications Group, Inc.
NASDAQ    	SPEC                	Spectrum Control, Inc.
NASDAQ    	ZION                	Zions Bancorporation
INDEX     	HUV                 	AMEX GOLD BUGS INDEX FINAL SETT
NASDAQ    	ADPI                	American Dental Partners, Inc.
NASDAQ    	TRMB                	Trimble Navigation
NASDAQ    	WWVYE               	Warwick Valley Telephone Company
NASDAQ    	MTSC                	MTS Systems Corporation
NYSE      	CDD                 	Lehman ABS Corporation
NYSE      	FCZ                 	Ford Motor Credit Company
TSE       	CDV.TO              	Com Dev International Ltd
INDEX     	SGW                 	SIG CASINO GAMING INDEX
NASDAQ    	EYET                	Eyetech Pharmaceuticals, Inc.
NYSE      	SHR                 	Schering Aktiengesellschaft
NASDAQ    	UFPT                	UFP Technologies, Inc.
NASDAQ    	TVIN                	TVI Corporation
NYSE      	PDG                 	Placer Dome Incorporated
TSE       	TO.A.TO             	Tax Optimized Return Income
NYSE      	NVC                 	Nuveen California Select Quality Municipal Fund, Inc.
NYSE      	BNE                 	Bowne & Co., Inc.
TSE       	TO.UN.TO            	Tax Optimized Return Roc Tr
NYSE      	MGA                 	Magna International, Inc.
NYSE      	ITW                 	Illinois Tool Works Inc.
NYSE      	SKP                 	SCPIE Holdings Inc.
NASDAQ    	ISSC                	Innovative Solutions and Support, Inc.
NYSE      	DYS                 	Distribucion y Servicio
NASDAQ    	PALM                	Palm, Inc.
TSE       	BSN.PR.A.TO         	B Split Cp Pfd A
TSE       	CBY.TO              	Canada Bread Company Ltd
NYSE      	GGL                 	GOODMAN GLOBAL INC
NASDAQ    	SRDD                	Merrill Lynch & Co., Inc.
TSE       	FHT.UN.TO           	First Trust Highland Capital
NYSE      	KSE                 	KeySpan Corporation
NASDAQ    	TLEO                	TALEO CORP
NYSE      	CYR                 	Lehman ABS Corporation
NYSE      	CB                  	Chubb Corporation (The)
TSE       	AXR.TO              	Alexco Resource Corp
TSE       	MSD.TO              	Mosaid Technologies Inc
NYSE      	TXA                 	Tribune Company
AMEX      	RPG                 	Rydex S&P 500 Pure Growth
TSE       	BR.UN.TO            	Big Rock Brewery Income Trust
NYSE      	MDC                 	M.D.C. Holdings, Inc.
NYSE      	GDF                 	Global Partners Income Fund, Inc.
NASDAQ    	MTXX                	Matrixx Initiatives Inc.
INDEX     	HKP                 	POWERSHARES DYNAMIC RETAIL
NASDAQ    	UNIZ                	Unizan Financial Corporation
NASDAQ    	AKZOY               	Akzo Nobel N.V.
TSE       	RSP.UN.TO           	Ameristar RSP Income Trust
AMEX      	PTN                 	Palatin Technologies, Inc.
AMEX      	DCV                 	Merrill Lynch & Co., Inc.
NASDAQ    	SCHN                	Schnitzer Steel Industries, Inc.
AMEX      	AA.P                	Alcoa Inc Pref
AMEX      	FEI                 	Frequency Electronics, Inc.
INDEX     	DDX                 	AMEX Disk Drive Index
NYSE      	PSW                 	Preferred and Corporate Income Strategies Fund Inc
NASDAQ    	CTSH                	Cognizant Technology Solutions Corporation
TSE       	MEW.UN.TO           	Menu Foods Income Fund
NYSE      	CSV                 	Carriage Services, Inc.
NASDAQ    	EPAY                	Bottomline Technologies, Inc.
TSE       	CCT.UN.TO           	Connor Clark & Lunn Tigers Tr
NASDAQ    	VCLK                	ValueClick, Inc.
TSE       	CDX.TO              	Canadex Resources Ltd
NYSE      	BMN                 	BlackRock Municipal Target Term Trust Inc. (The)
NYSE      	JZJ                 	Lehman ABS Corporation
NYSE      	AEF                 	Aetna Inc.
NASDAQ    	TINY                	Harris & Harris Group, Inc.
NASDAQ    	LSCO                	LESCO, Inc.
AMEX      	GST                 	GASTAR EXPLORATION
NYSE      	CKR                 	CKE Restaurants, Inc.
NASDAQ    	HANS                	Hansen Natural Corporation
NYSE      	DX                  	Dynex Capital, Inc.
NASDAQ    	SQNM                	Sequenom, Inc.
NASDAQ    	PILL                	ProxyMed, Inc.
INDEX     	INH                 	iShares MSCI Hong Kong Index - IOPV
NASDAQ    	MSTR                	MicroStrategy Incorporated
TSE       	EET.TO              	Etruscan Resources Inc
NASDAQ    	ANCX                	Access National Corporation
NASDAQ    	PSIT                	PSi Technologies Holdings, Inc.
NASDAQ    	PTSI                	P.A.M. Transportation Services, Inc.
NASDAQ    	WGRD                	WatchGuard Technologies, Inc.
NASDAQ    	BFIN                	BankFinancial Corporation
NYSE      	HCA                 	HCA Inc.
TSE       	RIM.TO              	Research In Motion Ltd
TSE       	MFC.U.TO            	Manulife Financial Cp US$
NASDAQ    	MTMC                	MTM Technologies, Inc.
NYSE      	PIL                 	Merrill Lynch Depositor, Inc.
INDEX     	HBM                 	PDR HOMEBUILDERS INDEX FUND
NASDAQ    	NHHC                	National Home Health Care Corp.
TSE       	VET.UN.TO           	Vermilion Energy Trust
AMEX      	JKA.U               	JK ACQUISITION CORP
NASDAQ    	AMCC                	Applied Micro Circuits Corporation
INDEX     	SWE                 	WEBS SWEDEN SHR
NASDAQ    	FOXX                	Fox & Hound Restaurant Group
NASDAQ    	UTSI                	UTStarcom, Inc.
AMEX      	MCP                 	Merrill Lynch & Co., Inc.
NYSE      	FSS                 	Federal Signal Corporation
INDEX     	NLR                 	iShares Dow Jones U.S. Real Estate Sector Index
NASDAQ    	ISLE                	Isle of Capris Casinos, Inc.
NYSE      	DOM                 	Dominion Resources Black Warrior Trust
NASDAQ    	AICX                	Applied Imaging Corp.
TSE       	TGL.TO              	Transglobe Energy Cp
NYSE      	MMS                 	Maximus, Inc.
NASDAQ    	ALTR                	Altera Corporation
NYSE      	GEG                 	Global Power Equipment Group Inc.
NYSE      	IIM                 	MS Insured Municipal Income Trust
NASDAQ    	AIXD                	ACCESS INTEGR TECH A
NASDAQ    	ENSI                	EnergySouth, Inc.
NASDAQ    	OUTD                	Outdoor Channel Holdings, Inc.
TSE       	CTY.TO              	Calian Technologies Ltd
NYSE      	MXT                 	Metris Companies Inc.
NASDAQ    	ABPI                	ACCENTIA BIOPHARMACE
TSE       	TRZ.RV.A.TO         	Transat AT Cl A Variable Vtg
TSE       	KRY.TO              	Crystallex International Cp
NASDAQ    	IFCJ                	Interchange Financial Services Corporation
AMEX      	HX                  	Halifax Corporation
AMEX      	SSY                 	SunLink Health Systems, Inc.
AMEX      	GEE                 	GLOBAL ENTERTAINMENT
NASDAQ    	WBPRL               	W Holding Company Incorporated
NYSE      	X                   	USX Corporation
NASDAQ    	ERICY               	LM Ericsson Telephone Company
INDEX     	DYI                 	AMEX Dynamic Market Intellidex
NYSE      	BHI                 	Baker Hughes Incorporated
INDEX     	BFX                 	BEL 20 - Belgium
NASDAQ    	BECN                	Beacon Roofing Supply, Inc.
NYSE      	MTN                 	Vail Resorts, Inc.
NYSE      	XKY                 	Lehman ABS Corporation
TSE       	XMC.TO              	Xceed Mortgage Co
TSE       	PBP.TO              	Procyon Biopharma Inc
AMEX      	RSW                 	MS TRAOCEAN SPRQS
NASDAQ    	OMCL                	Omnicell, Inc.
NASDAQ    	FCMC                	Franklin Credit Management Corp
NYSE      	CVA                 	COVANTA HOLDINGS CORPORATION
NASDAQ    	HFWA                	Heritage Financial Corporation
NASDAQ    	EVVV                	ev3 Inc.
INDEX     	QMX                 	WEBS MEXICO SHR
NASDAQ    	OATS                	Wild Oats Markets, Inc.
AMEX      	RAA                 	BlackRock California Investment Quality Municipal Trust Inc.
TSE       	SPA.NV.A.TO         	Spectra Grp Great Rest Cl A
NASDAQ    	ASVI                	A.S.V., Inc.
NYSE      	CSB                 	Ciba Specialty Chemicals Holding, Inc.
NYSE      	WG                  	Willbros Group, Inc.
TSE       	MEG.UN.TO           	Madacy Entertainment Income Fd
INDEX     	IXF                 	Nasdaq Financial 100
NASDAQ    	LAKE                	Lakeland Industries, Inc.
NYSE      	CIL                 	Lehman ABS Corporation
NASDAQ    	SGDE                	Sportsman's Guide, Inc. (The)
NYSE      	SGU                 	Star Gas Partners, L.P.
AMEX      	NZR                 	Nuveen Maryland Dividend Advantage Municipal Fund 2
AMEX      	HMG                 	HMG/Courtland Properties, Inc.
NYSE      	WAL                 	Western Alliance Bancorporation
TSE       	X.TO                	TSX Group Inc
NYSE      	TGX                 	Theragenics Corporation
TSE       	CHU.TO              	Channel Resources Ltd.
NASDAQ    	WSTC                	West Corporation
NASDAQ    	FLYR                	Navigant International, Inc.
AMEX      	SGN                 	RECOM MANAGED SYS
NASDAQ    	CHDX                	Chindex International, Inc.
NYSE      	MXE                 	Mexico Equity and Income Fund, Inc. (The)
NYSE      	IBI                 	Interline Brands, Inc.
NYSE      	RE                  	Everest Re Group, Ltd.
NASDAQ    	HGRD                	Health Grades, Inc.
INDEX     	BES                 	WEBS BELGM SHR
TSE       	BER.TO              	Bear Ridge Resources Ltd
TSE       	CU.X.TO             	Canadian Utilities Ltd Cl B
NASDAQ    	FXEN                	FX Energy, Inc.
NYSE      	PMG                 	Putnam Investment Grade Municipal Trust II
NASDAQ    	AUDC                	AudioCodes Ltd.
NASDAQ    	MATH                	MATHSTAR INC.
TSE       	TIW.TO              	Telesystem Intl Wireless
NYSE      	CEG                 	Constellation Energy Group, Inc.
NASDAQ    	NXUS                	NEXUS TELOC SYS
AMEX      	AGT                 	Apollo Gold Corporation
NASDAQ    	RACK                	Rackable Systems, Inc.
NASDAQ    	ATRI                	ATRION Corporation
AMEX      	PSB                 	PS Business Parks, Inc.
NYSE      	KIM                 	Kimco Realty Corporation
NYSE      	BK                  	Bank of New York Company, Inc. (The)
INDEX     	DXS                 	SPADE DEFEE
NASDAQ    	NGPS                	NovAtel Inc.
NASDAQ    	QMED                	QMed Inc.
AMEX      	MZA                 	MuniYield Arizona Fund, Inc.
TSE       	CNI.TO              	Canico Resource Cp
TSE       	GAC.TO              	Geac Computer Cp Ltd
NYSE      	NNN                 	Commercial Net Lease Realty, Inc.
NASDAQ    	PLFE                	Presidential Life Corporation
NYSE      	IYF                 	iShares Dow Jones US Financial Index
NYSE      	HUM                 	Humana Inc.
NASDAQ    	HOME                	Home Federal Bancorp, Inc.
AMEX      	DIL                 	Dyadic International, Inc.
NASDAQ    	NTLIW               	NTL Incorporated
NASDAQ    	TASRE               	TASER INTL INC
INDEX     	IEE                 	IEE-BRASIL
NASDAQ    	FRNS                	First Avenue Networks, Inc.
NYSE      	CAJ                 	Canon, Inc.
NYSE      	WON                 	Westwood One, Inc.
TSE       	YGA.TO              	Gastar Exploration Ltd
TSE       	SHN.UN.TO           	Shiningbank Energy Income Uts
NASDAQ    	DITC                	Ditech Communications Corporation
NYSE      	NSC                 	Norfolk Souther Corporation
NASDAQ    	UBMT                	United Financial Corp
TSE       	STW.UN.TO           	Strata Income Fund Uts
NYSE      	VVC                 	Vectren Corporation
INDEX     	EUR                 	FTSE Eurotop 100 Index
AMEX      	ROW                 	Rowe Companies (The)
AMEX      	BUF                 	MINRAD INTL INC
NASDAQ    	DMAX                	DrugMax, Inc.
TSE       	CVF.PR.A.TO         	Coastal Value Fund Inc Pfd A
NASDAQ    	JAKK                	JAKKS Pacific, Inc.
INDEX     	Symbol              	Description
NYSE      	TR                  	Tootsie Roll Industries, Inc.
NYSE      	MHY                 	Managed High Income Portfolio, Inc.
NYSE      	RQI                 	Cohen & Steers Quality Income Realty Fund Inc
NYSE      	CRR                 	Carbo Ceramics, Inc.
INDEX     	VVX                 	VVX INDEX
TSE       	UEX.TO              	UEX Cp
TSE       	DZR.TO              	Diaz Resources Ltd
NYSE      	MOD                 	Modine Manufacturing Company
AMEX      	EGI                 	Entree Gold Inc
NASDAQ    	ANDW                	Andrew Corporation
NYSE      	DCI                 	Donaldson Company, Inc.
AMEX      	JLN                 	Jaclyn, Inc.
NASDAQ    	ISONZ               	Isonics Corporation
AMEX      	HHH                 	HOLDRS Internet
TSE       	PLB.TO              	Paladin Labs Inc
NYSE      	WCN                 	Waste Connections Inc.
NYSE      	HYF                 	Managed High Yield Plus Fund, Inc.
NASDAQ    	ABAX                	ABAXIS, Inc.
INDEX     	DFX                 	Phlx Defense Sector Index
INDEX     	NJKI                	ID JKI INDEX
AMEX      	ESP                 	Espey Mfg. & Electronics Corp.
NASDAQ    	CART                	Carolina Trust Bank
NYSE      	ESS                 	Essex Property Trust, Inc.
NASDAQ    	OLED                	Cambridge Display Technology, Inc.
NYSE      	POP                 	Pope & Talbot, Inc.
NYSE      	CNL                 	Cleco Power LLC
NYSE      	BDJ                 	Blackrock Enhanced Dividend Achievers Trust
NYSE      	ABD                 	Acco Brands Corporation
NASDAQ    	CJBK                	Central Jersey Bancorp
NYSE      	EWD                 	iShares MSCI Sweden
NYSE      	MJN                 	MSDW Structured Asset Corp SATUR AT&T Deb Bkd Ser 2001-8
AMEX      	MRY                 	Memry Corporation
NASDAQ    	ZOLL                	Zoll Medical Corporation
NASDAQ    	BOVA                	BANK VA CHESTERFIELD
NASDAQ    	NOBH                	Nobility Homes, Inc.
NASDAQ    	PANL                	Universal Display Corporation
TSE       	POW.PR.A.TO         	Power Cp Of Canada 5.6% Pfd A
NASDAQ    	LEXR                	Lexar Media, Inc.
NASDAQ    	UNFI                	United Natural Foods, Inc.
TSE       	HLF.TO              	High Liner Foods Inc
NASDAQ    	ALLEP               	National City Corporation
NASDAQ    	CNTF                	China TechFaith Wireless Communication Technology
NASDAQ    	DECC                	D&E Communications, Inc.
NASDAQ    	TTEK                	Tetra Tech, Inc.
NASDAQ    	MALL                	PC Mall, Inc.
NYSE      	WLP                 	WellPoint Health Networks Inc.
NYSE      	GDI                 	Gardner Denver, Inc.
NYSE      	EMR                 	Emerson Electric Company
NASDAQ    	ISYS                	Integral Systems, Inc.
NASDAQ    	IBCA                	Intervest Bancshares Corp.
TSE       	WPO.TO              	World Point Terminals Inc
NASDAQ    	ARCI                	APPLNC RCYCL CT AMER
NASDAQ    	BMHC                	Building Materials Holding Corporation
TSE       	SBY.TO              	Sobeys Inc
NASDAQ    	CFBK                	CENTRAL FED CP
NYSE      	SLB                 	Schlumberger N.V.
NYSE      	CZN.P               	CITIZE UTILITIES TRUST PFD
NASDAQ    	CEBK                	Central Bancorp, Inc
NYSE      	DGF                 	Delaware Investments Global Dividend & Income Fund, Inc.
NYSE      	FEZ                 	streetTRACKS Dow Jones EURO STOXX 50
NASDAQ    	ICCA                	Internet Commerce Corp.
NYSE      	VCI                 	Valassis Communications, Inc.
NASDAQ    	BNSO                	Bonso Electronics International, Inc.
NYSE      	NST                 	TAR
INDEX     	DECLA               	AMEX Decliners
NYSE      	ADP                 	Automatic Data Processing, Inc.
TSE       	BNS.TO              	Bank Of Nova Scotia
NASDAQ    	KOMG                	Komag, Inc. New
NASDAQ    	STXN                	Stratex Networks Inc
NYSE      	HUB.B               	Hubbell Inc A
NASDAQ    	MAYS                	J. W. Mays, Inc.
NASDAQ    	AMIS                	AMIS Holdings, Inc.
AMEX      	CDV                 	Consolidated Delivery & Logistics, Inc.
NASDAQ    	TWGP                	Tower Group, Inc.
TSE       	SPU.UN.TO           	Sustainable Production Energy Trust
NYSE      	RTP                 	Rio Tinto Plc
NYSE      	EEP                 	Enbridge Energy, Partnership
NYSE      	MAD                 	Madeco SA
NYSE      	PCQ                 	PIMCO California Municipal Income Fund
TSE       	CCQ.UN.TO           	Connor Clark & Lunn Consv Inc
NYSE      	AHL.P               	ASPEN IURANCE HOLDINGS LIMIT
TSE       	CBT.UN.TO           	Criterion Business Trust Ut
TSE       	MLC.TO              	Merrill Lynch & Co Canada Ltd
INDEX     	CPR                 	Copper Index
NYSE      	ALD                 	Allied Capital Corporation
NASDAQ    	DWRI                	Design Within Reach, Inc.
TSE       	EH.TO               	Easyhome Ltd
NASDAQ    	PSBH                	PSB Holdings, Inc.
AMEX      	EWD                 	iShares MSCI Sweden Index Fund
AMEX      	MOR                 	MORGAN STANLEY
NASDAQ    	IRETP               	Investors Real Estate Trust
NYSE      	SMP                 	Standard Motor Products, Inc.
NASDAQ    	XETA                	XETA Technologies, Inc.
NASDAQ    	ROCK                	Gibraltar Industries, Inc.
AMEX      	NTN                 	NTN Communications, Inc.
INDEX     	GWI                 	Merrill Lynch Sel Sector Spdr
NASDAQ    	ACSEF               	ACS-Tech80
NASDAQ    	PSMT                	PriceSmart, Inc.
TSE       	AGF.NV.TO           	AGF Management Ltd Cl B
AMEX      	IWZ                 	iShares Russell 3000 Growth Index Fund
AMEX      	EIA                 	Eaton Vance Insured California Municipal Bond Fund II
AMEX      	ZP                  	ZAP
NASDAQ    	HIFS                	Hingham Institution for Savings
TSE       	CSN.U.TO            	Cognos Inc US$
NASDAQ    	LACO                	Lakes Entertainment, Inc.
NASDAQ    	AWGIW               	Alderwoods Group Inc
NASDAQ    	CKXE                	Sports Entertainment Enterprises, Inc.
NASDAQ    	AACE                	Ace Cash Express, Inc.
TSE       	TUN.TO              	Tundra Semiconductor Cp
NYSE      	JTA                 	Nuveen Tax-Advantaged Total Return Strategy Fund
AMEX      	AAU                 	ALMADEN MINERALS LTD
NYSE      	PNM                 	PNM Resources, Inc. (Holding Co.)
NYSE      	GCV                 	Gabelli Convertible and Income Securities Fund, Inc. (The)
NYSE      	PIM                 	Putnam Master Intermediate Income Trust
NYSE      	EW                  	Edwards Lifesciences Corporation
NYSE      	CPB                 	Campbell Soup Company
AMEX      	PID                 	PowerShares International Dividened Achievers
NASDAQ    	INLD                	Interland, Inc.
INDEX     	XGJ                 	iShares S&P Global Healthcare Sector
INDEX     	CRX                 	AMEX M/S Commodity Relate Equity
TSE       	ATP.UN.TO           	Atlantic Power Cp IPS
AMEX      	MII                 	MICROISLET INC
NASDAQ    	DRRA                	Dura Automotive Systems, Inc.
NASDAQ    	DGIT                	Digital Generation Systems, Inc.
NYSE      	BR                  	Burlington Resources Inc.
AMEX      	SVI                 	Services Acquisition Corp. International
NASDAQ    	IFNY                	Infinity, Inc.
TSE       	FQE.TO              	Fairquest Energy Ltd
NYSE      	GFF                 	Griffon Corporation
INDEX     	TPN                 	Ten Cos Bridges Basket Value Index
NYSE      	DTC                 	Domtar Incorporated
NYSE      	SVC                 	Stewart
NASDAQ    	EPIC                	Epicor Software Corporation
NYSE      	EOC                 	Empresa Nacional de Electricidad S.A.
AMEX      	HBE                 	Diversified Security Solutions, Inc.
INDEX     	ITH                 	Telecom Holdrs Index
NYSE      	KTN                 	Lehman ABS Corporation
NYSE      	MSP                 	Madison Strategic Sector Premium Fund
NYSE      	COP                 	CONOCOPHILLIPS
NYSE      	BSE                 	Blackrock New York Insured Municipal Income Trust
NYSE      	SON                 	Sonoco Products Company
INDEX     	NNZ                 	ML NANOTECH
AMEX      	PDD                 	Citigroup Global Markets
AMEX      	LOV                 	SPARK NETWORKS ADS
NYSE      	HTN                 	Household Finance Corp
NASDAQ    	WPSC                	Wheeling-Pittsburgh Corporation
NYSE      	KFY                 	Korn/Ferry International
NASDAQ    	PACR                	Pacer International, Inc.
NYSE      	CBK                 	Christopher & Banks Corporation
NYSE      	TJX                 	TJX Companies, Inc. (The)
NASDAQ    	XCYT                	Xcyte Therapies, Inc.
NYSE      	XCH                 	Northern States Power Co Minnesota
NYSE      	XKN                 	Lehman ABS Corporation
INDEX     	MIBTEL              	Italian Mibtel Index
TSE       	ONE.TO              	01 Communique Laboratory Inc
NASDAQ    	GENZ                	Genzyme General
NASDAQ    	GCBC                	Greene County Bancorp, Inc.
TSE       	OZN.TO              	Orezone Resources Inc
NYSE      	CPY                 	CPI Corporation
NYSE      	DRC                 	Dresser-Rand Group Inc.
NYSE      	VTN                 	Van Kampen Trust for Investment Grade New York Municipals
AMEX      	MSI                 	Movie Star, Inc.
NASDAQ    	CASS                	Cass Information Systems, Inc
NYSE      	BAT                 	BlackRock Advantage Term Trust, Inc.
NASDAQ    	HFBC                	HopFed Bancorp, Inc.
INDEX     	CZH                 	AMEX CHINA INDX
NASDAQ    	ISIG                	Insignia Systems, Inc.
NASDAQ    	LCAPA               	LIBERTY MED CP A WI
TSE       	VE.UN.TO            	Vector Energy Fund
NYSE      	WCI                 	WCI Communities Inc
TSE       	NG.TO               	Novagold Resources Inc
NASDAQ    	CSAR                	Caraustar Industries, Inc.
NASDAQ    	AXTI                	AXT Inc
NASDAQ    	INDBM               	Independent Bank Corp.
NASDAQ    	PERY                	Perry Ellis International Inc.
INDEX     	UVOL                	NYSE Up Volume
AMEX      	DHY                 	CREDIT SUISSE HY BD
NASDAQ    	PDNT                	Merrill Lynch & Co., Inc.
NYSE      	SWS                 	SWS Group, Inc.
TSE       	RMX.TO              	Rubicon Minerals Cp
NYSE      	NQC                 	Nuveen California Investment Quality Municipal Fund, Inc.
AMEX      	PBJ                 	PowerShares Dynamic Food & Beverage
TSE       	FDG.UN.TO           	Fording Inc
NYSE      	BKN                 	BlackRock Investment Quality Municipal Trust Inc. (The)
NASDAQ    	MBVT                	Merchants Bancshares, Inc.
NYSE      	MTA                 	Matav
NYSE      	BFT                 	Bally Total Fitness Holding Corporation
TSE       	BPO.PR.K.TO         	Brookfield Props AAA Pfd K
NYSE      	VCV                 	Van Kampen California Value Municipal Income Trust
AMEX      	GLA.U               	GLOBAL LOGISTICS ACQUISITION C
INDEX     	ATX                 	ATX - Austria
NASDAQ    	CTAC                	1-800 Contacts, Inc.
NASDAQ    	PCCC                	PC Connection, Inc.
NYSE      	SID                 	Companhia Siderurgica Nacional S.A.
NASDAQ    	DSCO                	Discovery Laboratories, Inc.
NYSE      	EWY                 	iShares MSCI South Korea
NASDAQ    	SNAKE               	POORE BROTHERS INC
NASDAQ    	NMIL                	NewMil Bancorp, Inc.
TSE       	BGU.UN.TO           	Mavrix Balanced Income Growth
TSE       	BIT.TO              	Bridges Transitions Inc
NYSE      	IJH                 	iShares S&P Mid Cap
NYSE      	CRD.B               	Crawford & Company
NYSE      	MHL                 	Mortgageit Holdings Inc
NASDAQ    	PSYS                	Psychiatric Solutions, Inc.
NYSE      	TMA                 	Thornburg Mortgage, Inc.
INDEX     	SXF                 	WEBS FRANCE SHR
NASDAQ    	FCFC                	FirstCity Financial Corporation
NASDAQ    	BDAY                	Celebrate Express, Inc.
NYSE      	SAT                 	Asia Satellite Telecommunications Holdings
NYSE      	CXE                 	Colonial High Income Municipal Trust
TSE       	GMX.TO              	Globex Mining Enterprises Inc
NYSE      	VTA                 	Vesta Insurance Group, Inc.
NYSE      	SJW                 	S J W CP
AMEX      	EIP                 	Eaton Vance Insured Pennsylvania Municipal Bond Fund
NASDAQ    	KNBT                	KNBT Bancorp, Inc.
NASDAQ    	SEEDU               	ORIGIN AGRITCH LT UT
NYSE      	EDF                 	Emerging Markets IncomeFund II, Inc. (The)
AMEX      	EEM                 	iShares MSCI Emerging Index Fund
TSE       	BD.TO               	Bulldog Resources Inc
NASDAQ    	TCBI                	Texas Capital Bancshares, Inc.
NASDAQ    	CBTE                	Commonwealth Biotechnologies, Inc.
INDEX     	TRA                 	Nasdaq Transportation
NASDAQ    	BKSC                	Bank of South Carolina Corp.
NASDAQ    	ZEUS                	Olympic Steel, Inc.
NASDAQ    	KSWS                	K-Swiss Inc.
INDEX     	HVW                 	Vanguard Materials Vipers Index
AMEX      	RPV                 	Rydex S&P 500 Pure Value
AMEX      	CAC                 	Camden National Corporation
INDEX     	WBJ                 	iShares MSCI Australia Index
NASDAQ    	SEBL                	Siebel Systems, Inc.
NASDAQ    	IMMC                	Immunicon Corporation
TSE       	ERF.UN.TO           	Enerplus Resources Fund
NYSE      	CMK                 	Colonial Intermarket Income Trust I
NASDAQ    	MDTL                	Medis Technologies Ltd.
NYSE      	NWS                 	News Corporation (The)
AMEX      	AIX                 	Access Integrated Technologies, Inc.
NYSE      	TOM                 	Tommy Hilfiger USA Inc
NASDAQ    	TVIA                	TVIA, Inc.
NYSE      	SQF                 	Seligman Quality Municipal Fund, Inc.
NASDAQ    	WEFN                	WebFinancial Corporation
NYSE      	MOS                 	Mosaic Company (The)
TSE       	WHT.TO              	World Heart Cp
TSE       	CWF.TO              	Canadian World Fund Ltd
NYSE      	RMT                 	Royce Micro-Cap Trust, Inc.
TSE       	RRB.UN.TO           	Conner, Clark & Lunn Real Return Income Fund
NYSE      	IQC                 	MS California Municipal Securities
NYSE      	SUG                 	Southern Union Company
AMEX      	DSP                 	Merrill Lynch & Co., Inc.
NYSE      	UZV                 	United States Cellular Corporation
NYSE      	IKM                 	Bank of America Corporation
TSE       	CYM.TO              	Cymat Cp
INDEX     	SED                 	SIG SEMICONDUCTOR EQUIPMENT IND
TSE       	DIF.UN.TO           	Clarington Diversified Income
NYSE      	ETP                 	ENERGY TRAFER PARTNERS
NYSE      	BEZ                 	Baldor Electric Company
TSE       	BES.TO              	Bestar Inc
NYSE      	PWR                 	Quanta Services, Inc.
NASDAQ    	IMMR                	Immersion Corporation
AMEX      	PPN                 	Citigroup Global Markets
NASDAQ    	BMRN                	BioMarin Pharmaceutical Inc.
NYSE      	HCP                 	Health Care Property Investors, Inc.
NYSE      	HJB                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
INDEX     	KLS                 	PHLX KBW IURANCE INDEX
NASDAQ    	PTRY                	Pantry, Inc. (The)
AMEX      	FTK                 	Flotek Industries, Inc.
NASDAQ    	CNBKA               	Century BanCorp, Inc.
INDEX     	HVJ                 	Vanguard Utilities Vipers Index
NASDAQ    	IIVI                	II-VI Incorporated
TSE       	XBO.TO              	Oxbow Equities Cp
NYSE      	DLB                 	Dolby Laboratories
NYSE      	RAH                 	Ralcorp Holdings, Inc.
NYSE      	PAI                 	Pacific American Income, Inc.
AMEX      	VPU                 	Vanguard Utilities VIPERs
NYSE      	MVT                 	MuniVest Fund II, Inc.
TSE       	PLI.SV.TO           	Prometic Life Sciences Inc
NYSE      	EVT                 	Eaton Vance Tax Advantaged Dividend Income Fund
NASDAQ    	FNLY                	Finlay Enterprises, Inc.
NYSE      	LUV                 	Southwest Airlines Company
NYSE      	A                   	Agilent Technologies, Inc.
NASDAQ    	NTBK                	Net.B@nk, Inc.
NYSE      	SAC.P               	SOUTH CAROLINA E & G CO PFD
NASDAQ    	AEIS                	Advanced Energy Industries, Inc.
TSE       	AHX.TO              	Adherex Technologies Inc
NASDAQ    	CHTP                	CHELSEA THERAPEUTICS
NASDAQ    	MEMY                	Memory Pharmaceuticals Corp.
NASDAQ    	PLAB                	Photronics, Inc.
NYSE      	NRS                 	National Rural Utilities Cooperative Finance Corp
NYSE      	ANH                 	Anworth Mortgage Asset  Corporation
NASDAQ    	ICAD                	icad inc.
NYSE      	CRS                 	Carpenter Technology Corporation
NASDAQ    	ATHR                	Atheros Communications, Inc.
TSE       	A.U.TO              	Abitibi Consolidated Inc US$
AMEX      	DLK                 	Semotus Solutions, Inc.
NASDAQ    	TPGI                	Thomas Properties Group, Inc.
AMEX      	NDD                 	Neuberger Berman Dividend Advantage
NYSE      	UDR                 	United Dominion Realty Trust, Inc.
NASDAQ    	ACFC                	Atlantic Coast Federal Corporation
NYSE      	AFE                 	American Financial Group, Inc.
NASDAQ    	FFIV                	F5 Networks, Inc.
TSE       	PWC.PR.A.TO         	Pacific & Western 7.0% Pfd
TSE       	PUG.TO              	Pure Gold Minerals Inc
INDEX     	DEY                 	INDICATIVE NET ENTITLEMENT VAL
NASDAQ    	JFBC                	Jeffersonville Bancorp
NYSE      	PHK                 	Pimco High Income Fund
TSE       	HOC.TO              	Heritage Oil Cp
NYSE      	FCX                 	Freeport-McMoRan Copper & Gold, Inc.
INDEX     	INW                 	iShares MSCI Mexico Index - IOPV
TSE       	ORL.TO              	Oriel Resources Plc
NASDAQ    	FELE                	Franklin Electric Co., Inc.
NYSE      	FMN                 	Federated Premier Municipal Income Fund
NASDAQ    	DAIO                	Data I/O Corporation
INDEX     	PVY                 	Vanguard Sml Cap Value Vipers
TSE       	PDL.TO              	North American Palladium Ltd
AMEX      	CEV                 	Eaton Vance California Municipal Income Trust
NYSE      	BPL                 	Buckeye Partners L.P.
NASDAQ    	OIIM                	02Micro International
TSE       	QSR.UN.TO           	Priszm Canadian Income Fund
NYSE      	KNM                 	Konami Corporation
TSE       	ASA.TO              	ACD Systems International
NASDAQ    	BFCF                	B F C Financial Corp
NASDAQ    	PRAA                	Portfolio Recovery Associates, Inc.
NYSE      	JBK                 	Lehman ABS Corporation
TSE       	BVI.TO              	Blackrock Ventures Inc
NASDAQ    	IVII                	Intervideo, Inc.
TSE       	ABO.A.TO            	Arbor Memorial Services Cl A
NASDAQ    	TRST                	TrustCo Bank Corp NY
NASDAQ    	DMND                	Diamond Foods, Inc.
AMEX      	TGZ                 	TARGETS Trust XXII
TSE       	DFR.TO              	Defiant Resources Cp
NASDAQ    	LSBCD               	LARGE SCALE BIOLOG
NYSE      	DSL                 	Downey Financial Corporation
TSE       	SWP.TO              	Saskatchewan Wheat Pool
TSE       	CMS.UN.TO           	Citadel Multi Sector Income Fd
NYSE      	KRB                 	MBNA Corporation
NASDAQ    	PRKR                	ParkerVision, Inc.
NASDAQ    	STSI                	Star Scientific, Inc.
NYSE      	MRO                 	Marathon Oil Corporation
NYSE      	TLS                 	Telstra Corporation
NASDAQ    	GROW                	U.S. Global Investors, Inc.
NASDAQ    	METH                	Methode Electronics, Inc.
NASDAQ    	GMCR                	Green Mountain Coffee Roasters, Inc.
NASDAQ    	PKOH                	Park-Ohio Holdings Corp.
TSE       	SLF.TO              	Sun Life Financial Inc
TSE       	RXD.TO              	Rex Diamond Mining Cp
NASDAQ    	MRGO                	Margo Caribe Inc.
NYSE      	HJO                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	RVI                 	Retail Ventures, Inc.
NYSE      	TAP                 	Molson Coors Brewing  Company
NYSE      	ITB                 	ISHARES DJ US HCIF
NASDAQ    	AVRX                	AVALON PHARMACEUTIC
TSE       	NCT.U.TO            	180 Connect Inc
NASDAQ    	HAMP                	Hampshire Group,
TSE       	PRI.UN.TO           	Primary Energy Recycling Cp
NYSE      	VNO                 	Vornado Realty Trust
NYSE      	ARB                 	Arbitron Inc.
NASDAQ    	MLIN                	Micro Linear Corporation
TSE       	UNS.TO              	Uni-Select Inc
NASDAQ    	SWIR                	Sierra Wireless, Inc.
NASDAQ    	RAMS                	Aries Maritime Transport
TSE       	DPS.UN.TO           	Diversified Pfd Share Trust
TSE       	GAT.UN.TO           	UBS Global Allocation Trust
NYSE      	CYT                 	Cytec Industries Inc.
TSE       	PZA.UN.TO           	Pizza Pizza Royalty Income Fund
NYSE      	VIM                 	Van Kampen Trust for Insured Municipals
NYSE      	SFY                 	Swift Energy Company
NASDAQ    	TRMD                	Aktieselskabet Dampskibsselskabet Torm
NYSE      	EBF                 	Ennis, Inc.
AMEX      	VGZ                 	Vista Gold Corporation
NYSE      	SCL.P               	SPEPAN 5.5 CVPR
NYSE      	VC                  	Visteon Corporation
NASDAQ    	ACXM                	Acxiom Corporation
NYSE      	PDT                 	John Hancock Patriot Premium Dividend Fund II
TSE       	FTT.TO              	Finning International Inc
NYSE      	PXD                 	Pioneer Natural Resources Company
NYSE      	FRT                 	Federal Realty Investment Trust
NASDAQ    	DRLOE               	Doral Financial Corporation
NASDAQ    	MTLM                	Metal Management , Inc.
NASDAQ    	CBHI                	CENTENNIAL BANK HOLD
NASDAQ    	DATA                	DataTrak International, Inc.
NASDAQ    	BCSB                	BCSB Bankcorp, Inc.
NASDAQ    	GLYT                	Genlyte Group Incorporated (The)
TSE       	CCS.PR.A.TO         	Cooperators General Ins Pfd A
NASDAQ    	INFO                	Metro One Telecommunications, Inc.
NYSE      	TDK                 	TDK Corporation
NYSE      	FXI                 	IShares Trust FTSE-Xinhua China 25 Index Fund
NASDAQ    	CINF                	Cincinnati Financial Corporation
AMEX      	MHJ                 	Man Sang Holdings Inc
TSE       	ZNS.TO              	Zenas Energy Cp
AMEX      	HAQ.W               	HEALTHCARE ACQUISITION CORP
NASDAQ    	ABCO                	Advisory Board Company (The)
NYSE      	ASR                 	Grupo Aeroportuario del Sureste, S.A. de C.V.
INDEX     	HUI                 	AMEX Gold Bugs Index
TSE       	CWM.UN.TO           	CanWest MediaWorks Income Fund
NYSE      	SGI                 	Silicon Graphics, Inc.
NYSE      	IPS                 	IPSCO Inc.
NYSE      	BDY                 	Bradley Pharmaceuticals, Inc.
NYSE      	GJG                 	Strats Tr for Bellsouth Telecommunications Ctfs
NASDAQ    	ANTP                	PHAZAR CORP
NASDAQ    	BELFB               	Bel Fuse Inc.
NASDAQ    	SHLM                	A. Schulman, Inc.
NYSE      	WMB                 	Williams Companies, Inc. (The)
AMEX      	TKO                 	Telkonet, Inc.
NYSE      	EFL                 	Emerging Markets Floating Rate Fund, Inc. (The)
AMEX      	VPF                 	Valpey Fisher Corporation
NASDAQ    	AEHR                	Aehr Test Systems
NYSE      	DRL                 	Doral Financial Corporation
AMEX      	EZU                 	iShares MSCI EMU Index Fund
NYSE      	SBS                 	Companhia de saneamento Basico Do Estado De Sao Paulo - Sabesp
AMEX      	ACY                 	AeroCentury Corp.
TSE       	RYL.DB.TO           	Royal Host REIT Debs
NYSE      	STU                 	Student Loan Corporation (The)
NASDAQ    	CDIC                	CardioDynamics International Corporation
NASDAQ    	NHWK                	NIGHTHAWK RADIOLOGY
AMEX      	EBY                 	Citigroup Global Markets Holdings Inc
AMEX      	NKZ.W               	NIKKEI 225 INDEX CALL WARRANTS
TSE       	WPT.TO              	Westport Innovations Inc
NASDAQ    	CBOU                	CARIBOU COFFEE
TSE       	SIN.UN.TO           	Sciti Trust Trans Units
NYSE      	EPR                 	Entertainment Properties Trust
AMEX      	UTL                 	UNITIL Corporation
NASDAQ    	AMOT                	Allied Motion Technologies, Inc.
NYSE      	PTM                 	Putnam Managed High Yield Trust
NYSE      	XFK                 	Lehman ABS Corporation
NASDAQ    	CRFT                	Craftmade International, Inc.
TSE       	GCD.TO              	Great Canadian Gaming Cp
NYSE      	TNL                 	Technitrol, Inc.
NYSE      	BFC                 	BlackRock California Insured Municipal 2008 Term Trust Inc (Th
AMEX      	AMC                 	American Mortgage Acceptance Company
TSE       	MFC.PR.B.TO         	Manulife Financial Cl A Pfd 2
NYSE      	NVT                 	NAVTEQ CORP
NASDAQ    	SVNTE               	Savient Pharmaceuticals Inc
NYSE      	KUB                 	Kubota Corporation
NASDAQ    	CPSS                	Consumer Portfolio Services, Inc.
NYSE      	NPT                 	Nuveen Premium Income Municipal Fund IV, Inc.
NYSE      	ECV                 	Enhanced Equity Yield Fund, Inc.
TSE       	DGT.UN.TO           	Diversified Investment Grade 1
NYSE      	HEI.A               	Heico Corporation
NASDAQ    	ORCT                	Orckit Communications,
NYSE      	TCA.P               	TRACANADA PIPELINES LTD PFD
INDEX     	XWE                 	PHLX WORLD ENERGY INDEX
TSE       	MFI.TO              	Maple Leaf Foods Inc
TSE       	LFE.TO              	Canadian Life Companies Split Corp Class A
AMEX      	MIB                 	MS 3 IDX CPN'S
NYSE      	MRH                 	Montpelier RE Holdings Ltd
NASDAQ    	WGNR                	Wegener Corporation
NASDAQ    	IFUL                	Insightful Corporation
INDEX     	TICK                	NYSE Issues Up/Down Ratio
AMEX      	VKC                 	Van Kampen American Capital California Municipal Trust
NASDAQ    	TGIC                	Triad Guaranty Inc.
NASDAQ    	BIOS                	BioScrip, Inc.
NASDAQ    	ANDS                	Anadys Pharmaceuticals, Inc.
NASDAQ    	KNDL                	Kendle International Inc.
NYSE      	FNT                 	FIDELITY NATIONAL TITLE GROUP
NYSE      	HJR                 	MS STRUCTURED ASSET CORP
NASDAQ    	HOMS                	HomeStore Inc.
NYSE      	DGX                 	Quest Diagnostics Incorporated
NASDAQ    	MCDTA               	McDATA Corporation
NYSE      	GDP                 	Goodrich Petroleum Corporation
NYSE      	KRO                 	KRONOS WORLDWIDE INC
INDEX     	EJH                 	ISH MRNGSTR LRG
NASDAQ    	NPTE                	NORTH POINTE HOLDING
NYSE      	KZL                 	Kerzner International
TSE       	DMK.TO              	Datamark Systems Group Inc
NASDAQ    	LTREE               	LEARNING TREE
NYSE      	FIA.P               	FIAT SPA ADS PFD
NASDAQ    	TOFC                	Tower Financial Corporation
NASDAQ    	PEAK                	Peak International
NASDAQ    	SPCHB               	SPORT CHALET CL-B
TSE       	LGY.DB.TO           	Legacy Hotels Reit Debs
INDEX     	XHL                 	AMEX Healthcare Sub Index
NASDAQ    	MSHL                	Marshall Edwards, Inc.
AMEX      	MAM                 	Maine & Maritimes Corporation
NASDAQ    	GGXY                	Golf Galaxy, Inc.
NYSE      	S                   	Sprint  Nextel Corporation
NASDAQ    	BPHX                	BluePhoenix Solutions, Ltd.
NYSE      	SGG                 	SGL Carbon Aktiengesellschaft
INDEX     	NNW                 	iShares Russell 3000 Value Index
NYSE      	LGF                 	Lions Gate Entertainment Corporation
NASDAQ    	OSIS                	OSI Systems, Inc.
NASDAQ    	OSTK                	Overstock.com, Inc.
NASDAQ    	PLXS                	Plexus Corp.
AMEX      	IDU                 	iShares Dow Jones U.S. Utilities Index Fund
NASDAQ    	CAAS                	China Automotive Systems, Inc.
NYSE      	CEE                 	Central Europe and Russia Fund, Inc. (The)
NYSE      	OLA                 	Old Mutual/Claymore Long-Short Fund
NASDAQ    	SBIBN               	Sterling Bancshares, Inc.
TSE       	BSF.UN.TO           	Brascan SoundVest Focused Business Trust
AMEX      	NAO                 	NORTH AM IUR LDRS
NASDAQ    	FLPB                	Leesport Financial Corporation
NASDAQ    	TALX                	TALX Corporation
NASDAQ    	CBON                	Community Bancorp
NASDAQ    	MTDB                	Merrill Lynch & Co., Inc.
NASDAQ    	PLMD                	PolyMedica Corporation
TSE       	BPT.UN.TO           	Boralex Power Income Fund
NASDAQ    	CORI                	Corillian Corporation
NASDAQ    	ACET                	Aceto Corporation
NASDAQ    	BOFI                	BofI Holding, Inc.
NASDAQ    	JOSB                	Jos. A. Bank Clothiers, Inc.
AMEX      	NCU                 	Nuveen California Premium Income Municipal Fund
NASDAQ    	GLDN                	Golden Telecom, Inc.
NASDAQ    	OBCI                	Ocean Bio-Chem, Inc.
NYSE      	JDD                 	Nuveen Diversified Dividend and Income Fund
NASDAQ    	BANFP               	BancFirst Corporation
NASDAQ    	SMAN                	Standard Management Corporation
TSE       	BRT.TO              	Burntsand Inc
TSE       	FIG.UN.TO           	Income & Growth Split Trust
NYSE      	SCT                 	Scottish RE Group
NYSE      	JHX                 	James Hardie Industries NV
NYSE      	HQH                 	H&Q Healthcare Investors
NASDAQ    	OFLX                	Omega Flex, Inc.
NASDAQ    	PRCP                	Perceptron, Inc.
NYSE      	IVN                 	Ivanhoe Mines Ltd
NYSE      	D                   	Dominion Resources, Inc.
AMEX      	GLU                 	Gabelli Global Utility
NASDAQ    	WIBC                	Wilshire Bancorp, Inc.
NYSE      	SIZ                 	Sizeler Property Investors, Inc.
INDEX     	PVJ                 	Vanguard Growth Vipers Index
NASDAQ    	LMIA                	LMI Aerospace, Inc.
NYSE      	PPG                 	PPG Industries, Inc.
NYSE      	UHT                 	Universal Health Realty Income Trust
NASDAQ    	CCBG                	Capital City Bank Group
NASDAQ    	MWRK                	Mothers Work, Inc.
NASDAQ    	GYMB                	Gymboree Corporation (The)
NYSE      	GRH                 	Credit and Asset Repackaging Vehicle Corporation
NYSE      	BEE                 	STRATEGIC HOTEL & RESOR    TS IN
NYSE      	RCC                 	Small Cap Premium
NYSE      	HOC                 	Holly Corporation
NYSE      	GS                  	Goldman Sachs Group, Inc. (The)
AMEX      	RSY                 	Recom Managed Systems, Inc.
NASDAQ    	JMBI                	James Monroe Bancorp Inc
NYSE      	CSP                 	American Strategic Income Portfolio III
NASDAQ    	COLY                	Coley Pharmaceutical Group, Inc.
NYSE      	HNT                 	Health Net Inc.
NASDAQ    	HEII                	HEI, Inc.
NASDAQ    	BSMD                	BioSphere Medical, Inc.
INDEX     	DAA                 	Mergent Dividend Achievers Index
AMEX      	BXU                 	8% MONTHLY INCOME STRATEGIC RE
NASDAQ    	OVEN                	TurboChef Technologies, Inc.
NYSE      	UU                  	United Utilities plc.
AMEX      	ETQ                 	CORRIENTE RES INC
NASDAQ    	INSW                	InsWeb Corporation
NASDAQ    	QLGC                	QLogic Corporation
NYSE      	IPG                 	Interpublic Group of Companies, Inc. (The)
NASDAQ    	MTIC                	MTI Technology Corporation
NASDAQ    	FUEL                	Streicher Mobile Fueling, Inc.
NASDAQ    	GTIV                	Gentiva Health Services, Inc.
NYSE      	BMS                 	Bemis Company, Inc.
NYSE      	BSP                 	American Strategic Income Portfolio II
INDEX     	SMY                 	WEBS MALAY SHR
NYSE      	BBD                 	Banco Bradesco Sa
NASDAQ    	HUMC                	Hummingbird Ltd
NASDAQ    	WLFCP               	WILLIS LEASE FINANCE
NYSE      	SWC                 	Stillwater Mining Company
NASDAQ    	SYNL                	Synalloy Corporation
AMEX      	FZB.P               	FCB/NC CAPITAL TR II
NASDAQ    	PROV                	Provident Financial Holdings, Inc.
AMEX      	FTF                 	Franklin Templeton Duration Income Trust
TSE       	CIT.UN.TO           	Sciti Trust II
NASDAQ    	CBCF                	Citizens Banking Corporation
NYSE      	PDS                 	Precision Drilling Corporation
TSE       	UWH.UN.TO           	UE Waterheater Income Fund
NYSE      	TDW                 	Tidewater Inc.
TSE       	BWR.TO              	Breakwater Resources Ltd
NYSE      	CMS                 	CMS Energy Corporation
TSE       	PWF.PR.J.TO         	Power Financial Cp 4.7% Pfd J
NASDAQ    	AMTCW               	Ameritrans Capital Corporation
NYSE      	RHY                 	RMK MULTI-SECTOR HIGH INCOME F
NASDAQ    	GKSR                	GK SVCS INC CL A
NASDAQ    	ASHW                	Ashworth, Inc.
NYSE      	BLU                 	Blue Chip Value Fund, Inc.
NYSE      	APX                 	APEX Municipal Fund, Inc.
INDEX     	HSI                 	Hang Seng
NASDAQ    	MBTF                	M B T Financial Corp
TSE       	CNN.UN.TO           	Canada Trust Income Investment
AMEX      	END                 	Endeavor International Corporation
NASDAQ    	CNET                	CNET Networks, Inc.
AMEX      	SNG                 	Canadian Superior Energy Inc
NASDAQ    	TGEN                	Targeted Genetics Corporation
NASDAQ    	CRLTS               	Century Realty Trust
NYSE      	GJK                 	Strats Tr for Bellsouth Telecommunications Ctfs
TSE       	TGY.TO              	Tenergy Ltd
AMEX      	GRS                 	Gammon Lake Resources, Inc.
NASDAQ    	FSBI                	Fidelity Bancorp, Inc.
TSE       	AOG.UN.TO           	Brompton Adv Equal Wgt Oil&Gas
NASDAQ    	STBC                	STATE BANCORP INC
TSE       	CPU.UN.TO           	Catapult Energy Partnership I
NYSE      	NRL                 	Neuberger Berman Real Estatee Income Fund
NYSE      	APB                 	Asia Pacific Fund, Inc. (The)
NASDAQ    	SLTC                	Selectica, Inc.
AMEX      	BFY                 	BlackRock New York Municipal Income Trust II
TSE       	NSI.PR.C.TO         	Nova Scotia Power Inc Pfd C
NASDAQ    	ABER                	Aber Diamond Corporation
NASDAQ    	CRDC                	CARDICA INC.
NASDAQ    	PLJC                	CTH PPELN NQ 100 IDX
AMEX      	CLM                 	Cornerstone Strategic Value Fund, Inc.
NYSE      	CGX                 	Consolidated Graphics, Inc.
NASDAQ    	PPHM                	Peregrine Pharmaceuticals Inc.
NASDAQ    	VAIL                	Vail Banks, Inc.
INDEX     	DAX                 	Frankfurt Dax
NASDAQ    	UMBF                	UMB Financial Corporation
NASDAQ    	FBNC                	First Bancorp
NYSE      	LQI                 	LA QUINTA PPTYS INC
AMEX      	ALT                 	Alteon Inc.
TSE       	MRC.TO              	Morguard Cp
NASDAQ    	LNUX                	VA Software Corporation
NASDAQ    	GIVN                	Given Imaging Ltd.
TSE       	CDR.TO              	Caldera Resources Inc
NYSE      	RC                  	Grupo Radio Centro, S.A. de C.V.
TSE       	EMS.TO              	Environmental Management Solns
AMEX      	AVN.R               	AVANIR PHARMACEUTICL
NASDAQ    	INHX                	Inhibitex, Inc.
NYSE      	RVT                 	Royce Value Trust, Inc.
AMEX      	DFC                 	Delta Financial Corporation
NASDAQ    	BTUI                	BTU International, Inc.
TSE       	AR.PR.D.TO          	Argus Cp Ltd Pfd D
NYSE      	POR                 	PORTLAND GENERAL ELECTRIC COMP
NASDAQ    	NREB                	Northern Empire Bancshares
NYSE      	OIS                 	Oil States International, Inc.
NYSE      	BNK                 	Banknorth Group, Inc.
AMEX      	HCT                 	Hector Communications Corporation
NASDAQ    	TWAV                	Therma-Wave, Inc.
NYSE      	NYX                 	NYSE GROUP INC
AMEX      	SLV                 	ISHARES SILVER TRUST
NASDAQ    	BERK                	Berkshire Bancorp, Inc.
NASDAQ    	NANO                	Nanometrics Incorporated
NYSE      	OII                 	Oceaneering International, Inc.
NASDAQ    	GAIA                	Gaiam, Inc.
NYSE      	RIG                 	Transocean Inc.
NASDAQ    	KAMN                	KAMAN CORPORATION
NYSE      	VSL                 	Videsh Sanchar Nigam
NASDAQ    	PSSI                	PSS World Medical Inc.
NASDAQ    	ORCC                	Online Resources Corporation
NASDAQ    	RMTI                	Rockwell Medical Technologies, Inc.
TSE       	PR.UN.TO            	Pro-AMS Trust Unit
AMEX      	SGC                 	Superior Uniform Group, Inc.
NASDAQ    	ONXX                	ONYX Pharmaceuticals, Inc.
INDEX     	EPX                 	SIG OIL EXPLORATION & PRODUCERS
NASDAQ    	CNVR                	Convera Corporation
TSE       	MF.U.TO             	Mortgage-Backed Secs Tr US$
NYSE      	NPK                 	National Presto Industries, Inc.
NYSE      	SLR                 	Solectron Corporation
TSE       	BIG.A.TO            	Big 8 Split Inc Cl A Capital
TSE       	ATD.SVB.TO          	Alimentation Couche Tard Inc
NYSE      	KCT                 	Lehman ABS Corporation
NASDAQ    	FFDF                	FFD Financial Corporation
AMEX      	MBR                 	Mercantile Bancorp, Inc. (Quincey, IL)
NASDAQ    	WDFC                	WD-40 Company
AMEX      	VFH                 	Vanguard Financials VIPERs
AMEX      	NBN                 	NORTHEAST BANCORP
NYSE      	ABB                 	ABB LTD
NASDAQ    	NBXH                	9% TARGETED INC STRS
NYSE      	NNP                 	Nuveen New York Performance Plus Municipal Fund, Inc.
AMEX      	ELU                 	ELINEAR INC
AMEX      	DSN                 	Merrill Lynch & Co., Inc.
NYSE      	RRI                 	Reliant Resources, Inc.
NYSE      	HEP                 	Holly Energy Partners, L.P.
NYSE      	PYT                 	Merrill Lynch Depositor Inc
NASDAQ    	CRZO                	Carrizo Oil & Gas, Inc.
NYSE      	CAT                 	Caterpillar, Inc.
NASDAQ    	CRNT                	Ceragon Networks Ltd.
AMEX      	CLN                 	Celsion Corporation
NYSE      	POS                 	Catalina Marketing Corporation
TSE       	OYR.UN.TO           	O&Y REIT
TSE       	GDL.TO              	Goodfellow Inc
NYSE      	LFC                 	China Life Insurance Company
TSE       	BSC.TO              	B Split Corp II A
INDEX     	MIA                 	MID O/C/H/L AVG
NASDAQ    	CPAK                	CPAC, Inc.
TSE       	IMN.TO              	Inmet Mining Cp
NYSE      	GTY                 	Getty Realty Corporation
NASDAQ    	PORK                	Premium Standard Farms, Inc.
TSE       	CM.PR.E.TO          	Cdn Imperial Bank Srs 27 Pfd
INDEX     	NJKG                	ID JKG INDEX
INDEX     	PDB                 	SIG COAL PRODUCERS INDEX SETTLE
AMEX      	AAC                 	Ableauctions.Com Inc
TSE       	GCI.UN.TO           	Gateway Casinos Income Fund
NYSE      	HES                 	HESS CORPORATION
NYSE      	TRC                 	Tejon Ranch Company
NASDAQ    	NAFC                	Nash-Finch Company
NYSE      	NUO                 	Nuveen Ohio Quality Income Municipal Fund, Inc.
TSE       	TEC.TO              	Technicoil Corporation
NYSE      	WPC                 	W.P. Carey & Co. LLC
INDEX     	WBQ                 	iShares MSCI Sweden Index
NASDAQ    	LBTYA               	Liberty Global, Inc.
NASDAQ    	WCAA                	WCA Waste Corporation
NASDAQ    	ACAM                	Acambis plc
TSE       	BNG.PR.A.TO         	Bell Nordiq Group Inc
NASDAQ    	BIVN                	Bioenvision, Inc.
INDEX     	ETZ                 	INDCTVE NEV - TARGET INC STRS
AMEX      	TZN                 	TARGETS Trust XXIII
NYSE      	BKE                 	Buckle, Inc. (The)
NYSE      	YZC                 	Yanzhou Coal Mining Company
AMEX      	IYW                 	iShares Dow Jones U.S. Technology Index Fund
NASDAQ    	INTX                	Intersections, Inc.
NYSE      	DSF                 	Defined Strategy Fund, Inc.
NASDAQ    	SBCF                	Seacoast Banking Corporation of Florida
NYSE      	NDE                 	IndyMac Bancorp, Inc.
NASDAQ    	FCSE                	FOCUS Enhancements, Inc.
NASDAQ    	DOVP                	DOV Pharmaceutical, Inc.
NASDAQ    	CRMH                	CRM HOLDINGS LTD.
NYSE      	NMO                 	Nuveen Municipal Market Opportunity Fund, Inc.
NYSE      	ALV                 	Autoliv, Inc.
NASDAQ    	LEND                	Accredited Home Lenders Holding Co.
NASDAQ    	SPSS                	SPSS Inc.
INDEX     	TSJ                 	Vipers Index Fund
NASDAQ    	DOTN                	Merrill Lynch & Co., Inc.
NASDAQ    	PMFG                	Peerless Manufacturing Company
NYSE      	ITT                 	ITT Industries, Inc.
NASDAQ    	USEY                	U.S. Energy Systems, Inc.
NASDAQ    	LHCG                	LHC Group
AMEX      	PWX                 	Providence and Worcester Railroad Company
NASDAQ    	SORL                	SORL AUTO PARTS INC
NASDAQ    	MOCO                	MOCON, Inc.
AMEX      	DIA                 	DIAMONDS Trust Series I
INDEX     	RLG                 	Cboe 1000 Growth Index
NYSE      	CHT                 	Chunghwa Telecom Co Ltd
TSE       	PAP.A.TO            	H Paulin & Co Ltd Cl A
NASDAQ    	WVCM                	Wavecom S.A.
INDEX     	KRX                 	KBW REGIONAL BANKING INDEX
TSE       	HAL.UN.TO           	Halterm Income Fund Trust Unit
NASDAQ    	IMNRZ               	Immune Response Corporation (The)
TSE       	XIT.TO              	iUnits S&P/TSX Info Tech
NYSE      	KWR                 	Quaker Chemical Corporation
INDEX     	INR                 	iShares MSCI Singapore Index - IOPV
AMEX      	CAP                 	Creative Computer Applications Inc.
NYSE      	AIR                 	AAR Corp.
NASDAQ    	NBTF                	NB&T FINANCIAL GROUP INC
NYSE      	LTD                 	Limited Brands, Inc.
NASDAQ    	VIGN                	Vignette Corporation
NASDAQ    	FCZA                	First Citizens Banc Corp.
NASDAQ    	MEDX                	Medarex, Inc.
NASDAQ    	ADSK                	Autodesk, Inc.
TSE       	DMN.TO              	Dominion Citrus Ltd
NASDAQ    	APOL                	Apollo Group, Inc.
NYSE      	EYE                 	Advanced Medical Optics, Inc.
NYSE      	CI                  	CIGNA Corporation
NYSE      	TCT                 	Town & Country Trust (The)
NYSE      	UDM                 	United Dominion Realty Trust, Inc.
AMEX      	VDC                 	Vanguard Consumer Staples VIPERs
NASDAQ    	HGSI                	Human Genome Sciences, Inc.
NYSE      	JZC                 	Lehman ABS Corporation
NASDAQ    	APPX                	American Pharmaceutical Partners, Inc.
NASDAQ    	RGCI                	Regent Communications, Inc.
AMEX      	BCV                 	Bancroft Convertible Fund, Inc.
AMEX      	IJS                 	iShares Small Cap 600/BARRA Value Index Fund
NASDAQ    	VNUS                	VNUS Medical Technologies, Inc.
AMEX      	BDH                 	HOLDRS Broadband
TSE       	GIT.TO              	Gitennes Exploration Inc
NASDAQ    	THRD                	TF Financial Corporation
NASDAQ    	PEBO                	Peoples Bancorp Inc.
NYSE      	GRE                 	S&P 500 Geared Fund Inc.
NASDAQ    	MARPS               	Marine Petroleum Trust
TSE       	ABZ.TO              	Aber Diamond Cp
NYSE      	MPY                 	Maytag Corporation
NASDAQ    	BPUR                	Biopure Corporation
NASDAQ    	CENT                	Central Garden & Pet Company
NASDAQ    	CLZR                	Candela Corporation
NYSE      	AM                  	American Greetings Corporation
NYSE      	MYE                 	Myers Industries, Inc.
NASDAQ    	BELFA               	Bel Fuse Inc.
NASDAQ    	ADEX                	ADE Corporation
TSE       	BBD.SV.B.TO         	Bombardier Inc Cl B
NASDAQ    	MRVL                	Marvell Technology Group, Ltd.
NASDAQ    	CYTX                	CYTORI THERAPEUTICS
NYSE      	HW                  	Headwaters Incorporated
INDEX     	SGV                 	CASINO GAMING
NASDAQ    	KELYB               	Kelly Services, Inc.
NYSE      	LYG                 	LLOYDS TSB GROUP PLC
NASDAQ    	NANX                	Nanophase Technologies Corporation
AMEX      	ADY                 	Merrill Lynch & Co., Inc.
NASDAQ    	NICH                	Nitches, Inc.
NYSE      	AMR                 	AMR Corporation
AMEX      	MPF                 	Merrill Lynch & Co., Inc.
INDEX     	RAV                 	Cboe Russell 3000 Value Index
NASDAQ    	PFSB                	PennFed Financial Services, Inc.
AMEX      	JVA                 	Coffee Holding Co., Inc.
NASDAQ    	HRAY                	Hurray! Holding Co., Ltd.
INDEX     	DWC                 	DJ Wilshire 5000 Index (Full Cap)
NYSE      	EHL                 	ENTERGY LA INC
TSE       	RTT.TO              	Roctest Ltd
NYSE      	AGU                 	Agrium Inc.
NYSE      	NIM                 	Nuveen Select Maturities Municipal Fund
NYSE      	CHE                 	Roto-Rooter Inc
NASDAQ    	ESTX                	Morgan Stanley
TSE       	SCO.UN.TO           	Aberdeen Scots Trust Uts
NASDAQ    	LNOP                	LanOptics Ltd.
NYSE      	SUN                 	Sunoco, Inc.
NYSE      	GD                  	General Dynamics Corporation
INDEX     	NNYE                	ENERGY IDX
NYSE      	KTH                 	Lehman ABS Corporation
TSE       	CYN.TO              	Cygnal Technologies Cp
NASDAQ    	WVVI                	Willamette Valley Vineyards, Inc.
NASDAQ    	KRON                	Kronos Incorporated
NYSE      	GPX                 	GP Strategies Corporation
NYSE      	NCS                 	NCI Building Systems, Inc.
NASDAQ    	FBSI                	First Bancshares, Inc.
NYSE      	MIK                 	Michaels Stores, Inc.
NASDAQ    	ECHO                	Electronic Clearing House, Inc.
NYSE      	AIC                 	Aames Investment Corporation
NASDAQ    	AGII                	Argonaut Group, Inc.
NASDAQ    	PLSB                	Placer Sierra Bancshares
NYSE      	PHM                 	Pulte Homes, Inc.
AMEX      	DCU                 	DRYCLEAN USA, Inc.
TSE       	MAL.TO              	Magellan Aerospace Cp
NYSE      	WAG                 	Walgreen Company
TSE       	TIL.UN.TO           	Tree Island Wire Income Fund
NASDAQ    	DSTIZ               	DayStar Technologies, Inc.
AMEX      	BTN                 	Ballantyne of Omaha, Inc.
AMEX      	MDF                 	Metropolitan Health Networks, Inc.
AMEX      	CFO                 	PACERS LINKED TO THE PHILADELP
AMEX      	FRD                 	Friedman Industries Inc.
NASDAQ    	COCO                	Corinthian Colleges, Inc.
NASDAQ    	STRL                	STERLING COTRUCTIO
NYSE      	NXY                 	Nexen, Inc.
NYSE      	PPX                 	Pacific Energy Partners LP
NYSE      	NDE.P               	INDYMAC BANCORP INC PF
NASDAQ    	WGAT                	Worldgate Communications, Inc.
NASDAQ    	BEAS                	BEA Systems, Inc.
NYSE      	CBU                 	Community Bank System, Inc.
NYSE      	PZE                 	Petrobras Energia Participaciones SA
NYSE      	FAC                 	Liberte Investors Inc.
NASDAQ    	VTRU                	Vertrue Incorporated
INDEX     	STQ                 	TRACKS STQ  VLI
NYSE      	WNR                 	WESTERN REFINING INC
NASDAQ    	DOCC                	DocuCorp International, Inc.
NASDAQ    	CNCT                	Connetics Corporation
AMEX      	CAA                 	Capital Alliance Income Trust Ltd.
NYSE      	ISL                 	First Israel Fund, Inc. (The)
NYSE      	URI                 	United Rentals, Inc.
NYSE      	TNM.B               	Thomas Nelson, Inc.
TSE       	FPU.UN.TO           	First Premium US Income Uts
NASDAQ    	ARNQ                	ARN NASDAQ-100 INDEX
NYSE      	FMS.P               	FRESENIUS MEDICAL CARE AG PFD
NYSE      	NIO                 	Nuveen Insured Municipal Opportunity Fund, Inc.
NASDAQ    	BFBC                	Benjamin Franklin Bancorp, Inc.
NYSE      	KVO                 	Lehman ABS Corporation
TSE       	DTT.UN.TO           	Diversified Income Trust II
NYSE      	TSD                 	Tele Sudeste Celular Participacoes S.A.
NYSE      	DKS                 	Dick's Sporting Goods Inc
NASDAQ    	ARXX                	Aeroflex Incorporated
NASDAQ    	LSCP                	Laserscope
NYSE      	CCG                 	Lehman ABS Corporation
TSE       	MYF.UN.TO           	Mydas Fund Trust Units
AMEX      	NVD                 	NOVADEL PHARMA INC
AMEX      	EWN                 	iShares MSCI Netherlands Index Fund
TSE       	ENT.UN.TO           	Enterra Energy Trust
AMEX      	EIF                 	Eaton Vance Insured Florida Municipal Bond Fund
NASDAQ    	TBBK                	The Bancorp, Inc.
INDEX     	OSV                 	PHLX OIL SERVICE SECTOR INDEX S
NYSE      	CGI                 	Commerce Group, Inc. (The)
NASDAQ    	MECA                	Magna Entertainment Corporation
NASDAQ    	TIER                	Tier Technologies, Inc.
TSE       	WNX.TO              	Warnex Inc
NASDAQ    	ASEI                	American Science and Engineering, Inc.
NYSE      	MCN                 	Madison/Claymore Covered Call Fund
NASDAQ    	INOC                	Innotrac Corporation
TSE       	NTL.PR.G.TO         	Nortel Networks Ltd Pfd G
NYSE      	CUK                 	Carnival Plc ADS
NYSE      	KMR                 	Kinder Morgan Management, LLC
NYSE      	FLR                 	Fluor Corporation
NASDAQ    	NOVA                	NovaMed, Inc.
NYSE      	KT                  	Katy Industries, Inc.
NYSE      	LH                  	Laboratory Corporation of America Holdings
NYSE      	GEF                 	Greif Bros. Corporation
NASDAQ    	ELRN                	Elron Electronic Industries Ltd.
NASDAQ    	KEYS                	Keystone Automotive Industries, Inc.
NASDAQ    	YAKC                	Yak Communications, Inc.
NASDAQ    	FAST                	Fastenal Company
NYSE      	TRY.B               	TRIARC COS INC
NASDAQ    	CTLM                	Centillium Communications, Inc.
NASDAQ    	LSBI                	LSB Financial Corp.
NASDAQ    	MWIV                	MWI Veterinary Supply, Inc.
NASDAQ    	PSEC                	Prospect Energy Corporation
NYSE      	KOH                 	Lehman ABS Corporation
AMEX      	BRN                 	Barnwell Industries, Inc.
NASDAQ    	TSRI                	TSR, Inc.
NASDAQ    	AHPI                	Allied Healthcare Products, Inc.
NYSE      	LMT                 	Lockheed Martin Corporation
NYSE      	VCP                 	Votorantim Celulose e Papel SA
NYSE      	SPI                 	Scottish Power pls
NASDAQ    	UEPS                	Net 1 UEPS Technologies, Inc.
NASDAQ    	KOPN                	Kopin Corporation
TSE       	NEW.A.TO            	Newgrowth Cp Cl A
INDEX     	HKM                 	POWERSHARES DYNAMIC OIL & GAS S
TSE       	NAS.TO              	Northstar Aerospace Inc
TSE       	MBC.TO              	Millenium Biologix Cp
NYSE      	PYE                 	PPlus Trust
NYSE      	NWL                 	Newell Rubbermaid Inc.
NYSE      	DVN                 	Devon Energy Corporation
NYSE      	ODC                 	Oil-Dri Corporation Of America
NASDAQ    	BEBE                	bebe stores, inc.
TSE       	BIR.TO              	Birchcliff Energy Ltd
NASDAQ    	SOMHW               	Somerset Hills Bancorp
NASDAQ    	INGP                	Instinet Group Incorporated
AMEX      	IOX                 	Iomed, Inc.
NASDAQ    	ROYL                	Royale Energy, Inc.
NYSE      	MTX                 	Minerals Technologies Inc.
NASDAQ    	MROI                	MRO Software, Inc.
INDEX     	CVK                 	S&P SmallCap 600 BARRA Value Index
NYSE      	ADI                 	Analog Devices, Inc.
NASDAQ    	WSII                	Waste Services, Inc.
NASDAQ    	CHKE                	Cherokee Inc.
NYSE      	SZH                 	Savannah Electric and Power Co
NASDAQ    	AFFX                	Affymetrix, Inc.
NYSE      	GGY                 	Compagnie Generale de Geophysique
NYSE      	DWA                 	Dreamworks Animation SKG, Inc.
TSE       	SDL.UN.TO           	Citadel S1 Income Trust Unit
NASDAQ    	JMDT                	Jamdat Mobile Inc.
NASDAQ    	SNBC                	Sun Bancorp, Inc.
TSE       	CYC.TO              	Cyclical Split NT Cp
NASDAQ    	HTGC                	Hercules Technology Growth Capital, Inc.
NASDAQ    	FRME                	First Merchants Corporation
NASDAQ    	CARSP               	Capital Automotive REIT
NASDAQ    	HPCCP               	Huntington Preferred Capital, Inc.
NASDAQ    	SCKT                	Socket Communications, Inc.
TSE       	SNX.TO              	Humpty Dumpty Snack Foods Ltd
NYSE      	ARM                 	ArvinMeritor, Inc.
AMEX      	TPS                 	Morgan Stanley Dean Witter & Co.
NYSE      	MC                  	Matsushita Electric Industrial Company, Ltd.
NASDAQ    	INCY                	Incyte Corporation
NASDAQ    	ONVI                	Onvia, Inc.
NASDAQ    	MSPX                	Merrill Lynch & Co., Inc.
AMEX      	GHM                 	Graham Corporation
NASDAQ    	WBPRO               	W Holding Company Incorporated
NASDAQ    	DGICA               	Donegal Group, Inc.
NASDAQ    	STEIE               	STEWART ENTERPR
AMEX      	VPS                 	Vermont Pure Holdings, Ltd.
AMEX      	SEA                 	STAR MARITIME ACQUISITION CORP
NYSE      	SBL                 	Symbol Technologies, Inc.
NYSE      	HMA                 	Health Management Associates, Inc.
INDEX     	BUX                 	B2B Internet Holdrs Index
NASDAQ    	INTC                	Intel Corporation
TSE       	ATB.SV.TO           	Atrium Biotechnologies Inc
NYSE      	NP                  	Neenah Paper, Inc.
NYSE      	FCH                 	FelCor Lodging Trust Incorporated
NASDAQ    	FCFS                	First Cash Financial Services, Inc.
TSE       	TAH.TO              	Tahera Diamond Cp
INDEX     	MSH                 	AMEX Morgan Stanley Hi Tech 35
NASDAQ    	QLTI                	QLT Inc.
INDEX     	NJKL                	ID JKL INDEX
NASDAQ    	INNO                	Innovo Group, Inc.
NASDAQ    	DTPI                	DiamondCluster International, Inc.
NYSE      	GM                  	General Motors Corporation
NYSE      	RA                  	Reckson Associates Realty Corporation
NASDAQ    	ADLS                	Advanced Life Sciences Holdings, Inc.
NASDAQ    	BBXT                	BankAtlantic Bancorp, Inc.
AMEX      	BKR                 	Baker (Michael) Corporation
AMEX      	MHA                 	MANHATTAN PHARMA INC
NYSE      	HPI                 	John Hancock Preferred Income Fund
TSE       	COU.UN.TO           	Countryside Power Income Fund
TSE       	RY.PR.O.TO          	Royal Bank Pfd O
TSE       	AVK.TO              	Avnel Gold Mining
AMEX      	TWH                 	The Washtenaw Group, Inc.
NASDAQ    	ADVS                	Advent Software, Inc.
INDEX     	HVH                 	Vanguard Health Care Vipers
NYSE      	BHY                 	Blackrock High Yield Trust (The)
TSE       	SID.TO              	Steeplejack Industrial Group
TSE       	MLX.TO              	Marsulex Inc
NASDAQ    	NTSC                	National Technical Systems, Inc.
TSE       	AVF.UN.TO           	Avenir Diversified Income Tr
TSE       	PIH.TO              	Pacific Insight Electronics Cp
TSE       	CLR.UN.TO           	Clearwater Seafoods Income Fd
NYSE      	WEC                 	Wisconsin Energy Corporation
TSE       	VKR.DB.TO           	Viking Energy Royalty Tr 10.5%
INDEX     	OGX                 	AMEX Oil & Natrl Gas
AMEX      	XLK                 	SPDR Technology
TSE       	SBS.TO              	Sembiosys Genetics Inc
TSE       	CSH.UN.TO           	Chartwell Seniors Housing REIT
NASDAQ    	NERX                	NeoRx Corporation
INDEX     	NMV                 	iShares Russell 3000 Index
NASDAQ    	MCGC                	MCG Capital Corporation
NASDAQ    	FVRL                	Favrille, Inc.
AMEX      	NI.P                	Nisource Inc Holding Co
NYSE      	NOC                 	Northrop Grumman Corporation
NYSE      	OFG                 	Oriental Financial Group, Inc.
AMEX      	IEV                 	iShares S&P Europe 350 Index Fund
NASDAQ    	IDIX                	Idenix Pharmaceuticals, Inc.
NYSE      	AOC                 	Aon Corporation
TSE       	AE.DB.TO            	Acclaim Energy Trust 11% Debs
NASDAQ    	VIMC                	VIMICRO INTL. CORP.
TSE       	AAA.TO              	Adastra Minerals Inc
NASDAQ    	GYRO                	Gyrodyne Company of America, Inc.
TSE       	IDL.TO              	Imaging Dynamics Co Ltd
NASDAQ    	GPRE                	GREEN PLAI REN ERG
NASDAQ    	XRIT                	X-Rite, Incorporated
NYSE      	GSK                 	GLAXOSMITHKLINE PLC
AMEX      	NXJ                 	Nuveen New Jersey Dividend Advantage Municipal Fund
NASDAQ    	FOBB                	First Oak Brook Bancshares, Inc.
NASDAQ    	EFJI                	EFJ Inc
INDEX     	MFX                 	KBW MORTGAGE FINANCE INDEX
NYSE      	TMG                 	TransMontaigne Inc.
TSE       	WF.TO               	White Fire Energy Ltd
AMEX      	FEV                 	Eaton Vance Florida Municipal Income Trust
AMEX      	IGN                 	iShares Goldman Sachs Network Index Fund
NYSE      	AHL                 	Aspen Insurance Holdings
TSE       	KHD.TO              	Canadian Hydro Developers Inc
NASDAQ    	ACEC                	ACE*COMM Corporation
NASDAQ    	CPII                	CPI INTERNATIONAL
NYSE      	HCN                 	Health Care REIT, Inc.
NASDAQ    	ICOS                	ICOS Corporation
TSE       	NT.TO               	Nortel Networks Cp
TSE       	CZN.TO              	Canadian Zinc Cp
NYSE      	MYC                 	MuniYield California Fund, Inc.
TSE       	MSH.TO              	Medisolution Ltd
NASDAQ    	BOKF                	BOK Financial Corporation
AMEX      	TIS                 	Orchids Paper Products Company
NYSE      	GCO                 	Genesco Inc.
NYSE      	BF.B                	Brown-Forman Corporation
NASDAQ    	OCENY               	Oce NV
INDEX     	SDL                 	SEMICON DEV
NASDAQ    	PWER                	Power-One, Inc.
NASDAQ    	ATLS                	Atlas America, Inc.
NYSE      	BDF                 	1838 Bond-Debenture Trading Fund
TSE       	FLH.UN.TO           	Front Street Long/Short Income Fund II
NASDAQ    	HYDL                	Hydril
NYSE      	NBP                 	Northern Border Partners, L.P.
TSE       	ROY.UN.TO           	Royster-Clark Ltd
NYSE      	WF                  	Woori Finance Holdings Co Ltd
NYSE      	TRX.B               	TRONOX INCORPORATED
TSE       	NXY.TO              	Nexen Inc
NYSE      	XFA                 	Lehman ABS Corporation
NYSE      	CSA                 	CHILESAT CORP S.A.
INDEX     	DFW                 	Aeros & Defense Bridges Basket Value Index
NYSE      	TUC                 	Mac-Gray Corporation
AMEX      	ISO                 	ISCO INTERNATIONAL INC
AMEX      	NAO.U               	NORTH AMERICAN IURANCE LEADE
AMEX      	IRN                 	Rewards Network, Inc.
NYSE      	TDY                 	Teledyne Technologies Incorporated
NASDAQ    	CBEY                	CBEYOND COMMUNICATIO
NASDAQ    	PNCL                	Pinnacle Airlines Corp.
TSE       	FE.TO               	Find Energy Ltd
NYSE      	AZZ                 	AZZ Incorporated
TSE       	TT.UN.TO            	Tremont Capital Opportunity Tr
NASDAQ    	NWSB                	Northwest Bancorp, Inc.
TSE       	PVN.UN.TO           	Premier Value Income Trust
NASDAQ    	AVII                	AVI BioPharma, Inc.
NYSE      	MWG                 	Morgan Stanley Cap Tr IV
NASDAQ    	NIPNY               	NEC Corporation
NYSE      	KSA                 	Lehman ABS Corporation
NASDAQ    	VRNT                	Verint Systems Inc.
NASDAQ    	CITZ                	CFS Bancorp, Inc.
NYSE      	FDG                 	Fording Inc
INDEX     	KXE                 	PHILADELPHIA STOCK EXCHANGE
AMEX      	PEY                 	PowerShares High Yield Equity Dividend Achievers Portfolio
NYSE      	FLC                 	Flaherty & Crumrine/Claymore Total Return Fund Inc
NYSE      	VE                  	Vivendi Environnement Ord
INDEX     	SPHEA               	SP500 Healthcare Sector
NASDAQ    	DCAI                	Dialysis Corporation of America
NASDAQ    	FUNC                	First United Corporation
NYSE      	EVF                 	Eaton Vance Senior Income Trust
NASDAQ    	TRIS                	Tri-S Security Corporation
NYSE      	BME                 	Blackrock Health Sciences Trust
AMEX      	PAE                 	Peace Arch Entertainment Group Inc.
NYSE      	PSY                 	Preferred Income Strategies Fund
INDEX     	DGE                 	AMEX Equal Weighted Pharma Index
TSE       	KEY.UN.TO           	Keyera Facilities Income Fund
INDEX     	MJK                 	POWERSHARES DYNAMIC MEDIA PORTF
NASDAQ    	MAIR                	MAIR Holdings, Inc.
NYSE      	BRO                 	Brown & Brown, Inc.
NYSE      	CBH                 	Commerce Bancorp, Inc.
TSE       	CM.PR.R.TO          	Cdn Imperial Bank Srs 19 Pfd
NYSE      	EAS                 	Energy East Corporation
NASDAQ    	NYNY                	Empire Resorts, Inc.
NYSE      	BKT                 	BlackRock Income Trust Inc. (The)
NYSE      	TX                  	TERNIUM S.A. ADS
NYSE      	IDT.C               	IDT CORP
NASDAQ    	JAMS                	Jameson Inns, Inc.
NASDAQ    	DDDC                	deltathree Inc
AMEX      	MCB                 	Morgan Stanley Dean Witter & Co.
TSE       	NCX.U.TO            	Nova Chemicals Cp US$
NASDAQ    	FPIC                	FPIC Insurance Group, Inc.
NASDAQ    	ARRO                	Arrow International, Inc.
TSE       	TA.TO               	Transalta Cp
INDEX     	NIH                 	iShares Trust S&P Latin America 40 Fund
NYSE      	PCR                 	Perini Corporation
TSE       	SCC.TO              	Sears Canada Inc
NASDAQ    	ACMR                	A.C. Moore Arts & Crafts, Inc.
NASDAQ    	AATI                	Advanced Analogic Technologies, Inc.
AMEX      	TWW                 	Terremark Worldwide, Inc.
NASDAQ    	IPIX                	IPIX Corporation
NYSE      	REY                 	Reynolds and Reynolds Company (The)
NASDAQ    	CRED                	Credo Petroleum Corporation
NASDAQ    	AMPX                	Ampex Corporation
NASDAQ    	RAVN                	Raven Industries, Inc.
NASDAQ    	KINDZ               	Kindred Healthcare, Inc.
NASDAQ    	TUTS                	Tut Systems, Inc.
NYSE      	NFB                 	North Fork Bancorporation, Inc.
TSE       	CSY.TO              	CSI Wireless Inc
NYSE      	ALE                 	Allete, Inc.
NASDAQ    	IPII                	Imperial Industries, Inc.
NASDAQ    	SPDE                	Speedus Corp.
TSE       	CJT.UN.TO           	Cargojet Income Fund
AMEX      	LKI                 	Lazare Kaplan International, Inc.
NYSE      	IYW                 	iShares Dow Jones US Technology Index
NYSE      	BAK                 	Copene-Petroquimica do Nordeste
NYSE      	BYI                 	BALLY TECHNOLOGIES INC
INDEX     	DWR                 	DYNAMIC RETAIL INTELLIDEX
NYSE      	FFH                 	Fairfax Financial Holdings Ltd
NYSE      	ALA                 	ALCATEL
NYSE      	MT                  	Mittal Steel Company NV
NYSE      	UTX                 	United Technologies Corporation
NYSE      	FL                  	Venator Group, Inc.
NYSE      	GJI                 	Strats Tr for Bellsouth Telecommunications Ctfs
NYSE      	ACC                 	American Campus Communities Inc
NASDAQ    	ESBK                	Elmira Savings Bank, FSB (The)
NASDAQ    	MRCY                	Mercury Computer Systems
NASDAQ    	MERB                	Merrill Merchants Bancshares, Inc.
NYSE      	IMH                 	Impac Mortgage Holdings, Inc.
NYSE      	RF.P                	REGIO FINANCING TRUST I
NASDAQ    	YELL                	Yellow Roadway Corporation
NASDAQ    	IBCP                	Independent Bank Corporation
TSE       	VN.TO               	Vincor International Inc
NASDAQ    	MTSX                	Metal Storm
NASDAQ    	MAPS                	MapInfo Corporation
NYSE      	KEX                 	Kirby Corporation
TSE       	ME.TO               	Moneta Porcupine Mines Inc
NYSE      	ECT                 	Energy East Corporation
TSE       	ABK.PR.C.TO         	Allbanc Split Cp Pfd A
NYSE      	KSP                 	K-Sea Transportation Partners LP
NYSE      	PFB                 	PFF Bancorp, Inc.
NASDAQ    	RBNC                	Republic Bancorp Inc.
NYSE      	AVB                 	AvalonBay Communities, Inc.
NASDAQ    	SYGR                	Synagro Technologies, Inc.
NASDAQ    	GPTX                	Global Payment Technologies, Inc.
NYSE      	MWV                 	Meadwestvaco Corporation
TSE       	YRB.A.TO            	Yorbeau Resources Inc
NASDAQ    	COHR                	Coherent, Inc.
NASDAQ    	RADI                	Rada Electronics Industries
NASDAQ    	BPOPM               	Popular, Inc.
NYSE      	IR                  	Ingersoll-Rand Company
NYSE      	SNF                 	Spain Fund (The)
NASDAQ    	DIMEZ               	Washington Mutual, Inc.
NASDAQ    	HDSN                	Hudson Technologies, Inc.
NASDAQ    	ATSI                	ATS Medical, Inc.
NYSE      	JW.A                	John Wiley & Sons, Inc.
TSE       	BYT.TO              	Bioscrypt Inc
AMEX      	EMV                 	streetTRACKS DJ Wilshire Mid Cap Value
TSE       	SDG.UN.TO           	Stoneham Drilling Trust
NYSE      	BW                  	Brush Engineered Materials Inc.
NYSE      	CE.P                	CELANESE CORP DEL PF
TSE       	RCL.TO              	Ridley Inc
TSE       	GXP.TO              	Goldstake Explorations Inc
TSE       	JAM.UN.TO           	ED Smith Income Fund
AMEX      	GAN                 	GAICO, Inc.
NASDAQ    	BFLY                	Bluefly, Inc.
NASDAQ    	PZZI                	Pizza Inn, Inc.
NASDAQ    	LEXG                	Lexicon Genetics Incorporated
NASDAQ    	MFRI                	MFRI, Inc.
TSE       	AZZ.TO              	Azcar Technologies Inc
TSE       	FHM.UN.TO           	First Trust Highland Cap Fund II
NASDAQ    	GMRK                	GulfMark Offshore, Inc.
NASDAQ    	FORTY               	Formula Systems (1985) Ltd.
NASDAQ    	SIFY                	Sify
NYSE      	UGI                 	UGI Corporation
INDEX     	NJS                 	iShares S&P SmallCap 600 BARRA Value Index
NASDAQ    	AVNC                	Advancis Pharmaceutical Corporation
NASDAQ    	BASI                	Bioanalytical Systems, Inc.
NASDAQ    	FULT                	Fulton Financial Corporation
NASDAQ    	RFIL                	RF Industries, Inc.
NYSE      	PYY                 	MERRILL LYNCH DEPOSITOR INC. P
NYSE      	NQN                 	Nuveen New York Investment Quality Municipal Fund, Inc.
INDEX     	SMW                 	PHLX SIG INVESTMENT MANAGERS IN
AMEX      	BHO                 	B+H Ocean Carriers Ltd.
NASDAQ    	AFAM                	Almost Family Inc
TSE       	MX.TO               	Methanex Cp
AMEX      	SBM                 	MS
NYSE      	LGI                 	Lazard Global Total Return and Income Fund
NYSE      	THE                 	TODCO
TSE       	ATY.U.TO            	ATI Technologies Inc US$
NASDAQ    	TRKN                	Trikon Technologies, Inc.
NYSE      	CNH                 	CNH Global N.V.
NASDAQ    	NTST                	Netsmart Technologies, Inc.
NASDAQ    	PCOP                	Pharmacopeia Drug Discovery, Inc.
NYSE      	BOH                 	Bank of Hawaii Corporation
NYSE      	TSA                 	Sports Authority, Inc. (The)
AMEX      	EWK                 	iShares MSCI Belgium Index Fund
NASDAQ    	PETDE               	Petroleum Development Corporation
NYSE      	ABS.P               	Albertsons Inc PR
TSE       	AAI.UN.TO           	Acuity All Cap & Income Trust
NYSE      	EK                  	Eastman Kodak Company
TSE       	SDE.UN.TO           	Select 50 S-1 Income Tr II
NYSE      	KVL                 	Lehman ABS Corporation
NASDAQ    	ARTX                	Arotech Corporation
NASDAQ    	JAXB                	Jacksonville Bancorp, Inc.
AMEX      	ATA                 	Apogee Technology, Inc.
NASDAQ    	BRNC                	Bronco Drilling Company, Inc.
NASDAQ    	BMTC                	Bryn Mawr Bank Corporation
NASDAQ    	AXCA                	Axcan Pharma Inc.
TSE       	SNH.U.TO            	SNP Health Split Cp US$
TSE       	PTO.TO              	Pareto Cp
NASDAQ    	TXUI                	Texas United Bancshares, Inc.
TSE       	BCE.TO              	BCE Inc
NASDAQ    	LARL                	Laurel Capital Group, Inc.
NASDAQ    	SRDX                	SurModics, Inc.
AMEX      	VDE                 	Vanguard Energy VIPERs
NASDAQ    	CBKN                	Capital Bank Corporation
TSE       	BSI.UN.TO           	Brascan Soundvest Diversified
INDEX     	RAG                 	Cboe Russell 3000 Growth Index
NYSE      	ZAP                 	Zapata Corporation
INDEX     	NYA                 	NYSE Composite
NYSE      	BOW                 	Bowater Incorporated
NASDAQ    	WILCF               	G. Willi-Food International,  Ltd.
TSE       	ACL.TO              	Anthony Clark Insurance Broker
INDEX     	FFY                 	streetTRACKS FORTUNE 500 Index Fund
NYSE      	HAN                 	Hanson plc.(Holding Company)
AMEX      	BQY                 	S&P Quality Rankings Glbl Equ Mngd Tr
NASDAQ    	CHRT                	Chartered Semiconductor Manufacturing Ltd.
NYSE      	ZLC                 	Zale Corporation
NASDAQ    	FFKT                	Farmers Capital Bank Corporation
NYSE      	YCC                 	Yankee Candle Company, Inc. (The)
NYSE      	CSR                 	CREDIT SUISSE GROUP
NASDAQ    	ARKR                	Ark Restaurants Corp.
NASDAQ    	HEPH                	Hollis-Eden Pharmaceuticals, Inc.
NASDAQ    	DRTK                	Duratek, Inc.
TSE       	ON.TO               	ONX Enterprise Inc
NYSE      	ASN                 	Archstone Communities Trust
NYSE      	GEF.B               	GREIF INC
NASDAQ    	GLBL                	Global Industries, Ltd.
NASDAQ    	BUCY                	Bucyrus International, Inc.
NASDAQ    	CCBI                	Commercial Capital Bancorp, Inc.
NASDAQ    	SCLD                	SteelCloud Inc.
NYSE      	SAM                 	Boston Beer Company, Inc. (The)
NYSE      	UNH                 	UnitedHealth Group Incorporated
NASDAQ    	LOUD                	Loudeye Corporation
AMEX      	ADH                 	Adherex Technologies Inc
NASDAQ    	CMOS                	Credence Systems Corporation
AMEX      	NKG                 	Nuveen Georgia Dividend Advantage Municipal Fund 2
TSE       	VRK.TO              	Virtek Vision International
NYSE      	EDS                 	Electronic Data Systems Corporation
NASDAQ    	MELA                	Electro-Optical Sciences, Inc
NASDAQ    	APTI                	Advanced Power Technology, Inc.
NYSE      	BBI.B               	BLOCKBUSTER INC
NYSE      	JZE                 	Lehman ABS Corporation
NYSE      	EXR                 	EXTRA SPACE STORAGE INC
NASDAQ    	CIPHE               	CIPHERGEN BIOSYSTE
AMEX      	TTA                 	TARGETS Trust XXI
NASDAQ    	FTEK                	Fuel-Tech, N.V.
TSE       	TNX.TO              	Tan Range Exploration Cp
TSE       	TOC.TO              	Thomson Cp
TSE       	CUQ.TO              	Churchill Cp Cl A
TSE       	FPF.UN.TO           	Front Street Performance Fd II
NYSE      	DUC                 	Duff & Phelps Utility & Corporate Bond Trust, Inc.
TSE       	PBC.TO              	Pebercan Inc
NASDAQ    	STKR                	StockerYale Inc.
NASDAQ    	WTSLA               	Wet Seal, Inc. (The)
NASDAQ    	DLIAV               	DELIA*S INC.
INDEX     	BPE                 	PHILADELPHIA STOCK EXCHANGE
AMEX      	SSM                 	ML 8 STRIDES ADR Sony
INDEX     	NIND                	Nasdaq NM Industrial
NASDAQ    	ELON                	Echelon Corporation
NASDAQ    	SMXC                	Smithway Motor Xpress Corp.
TSE       	TWT.TO              	20-20 Technologies Inc
NASDAQ    	NURO                	NeuroMetrix, Inc.
NYSE      	GES                 	Guess?, Inc.
NASDAQ    	ARTNA               	Artesian Resources Corporation
NYSE      	IGT                 	International Game Technology
TSE       	BNE.UN.TO           	Bonterra Energy Income Trust
NYSE      	BTO                 	John Hancock Bank and Thrift Opportunity Fund
INDEX     	NJM                 	iShares Russell 2000 Index
NYSE      	TWP                 	Trex Company, Inc.
NYSE      	NLC                 	Nalco Holding Company
NASDAQ    	IMCL                	ImClone Systems Incorporated
NYSE      	AWC                 	ALUMINA LTD
TSE       	SWY.TO              	Stornoway Diamond Cp
TSE       	IDX.UN.TO           	Indexplus Income Fund
AMEX      	PPK                 	Polyair Inter Pack Inc.
NYSE      	BLC                 	Belo Corporation
NYSE      	CFE                 	Motorola, Inc.
NYSE      	VIA.B               	Viacom, Inc.
NASDAQ    	AMCP                	AMCOMP INCORPORATED
NYSE      	CBD                 	Companhia Brasileira de Distribuicao
NYSE      	BJS                 	BJ Services Company
NYSE      	KO                  	Coca-Cola Company (The)
AMEX      	UDW                 	US DATAWORKS INC
NASDAQ    	SIGI                	Selective Insurance Group, Inc.
NYSE      	FTO                 	Frontier Oil Corporation
NYSE      	ESL                 	Esterline Technologies Corporation
NASDAQ    	ATBC                	Atlantic BancGroup Inc
NYSE      	GVA                 	Granite Construction Incorporated
AMEX      	IFO                 	InfoSonics Corp
NYSE      	TG                  	Tredegar Corporation
NASDAQ    	STLD                	Steel Dynamics, Inc.
NYSE      	IP                  	INTL PAPER CO
NYSE      	SWN                 	Southwestern Energy Company
TSE       	PDP.TO              	Petrolifera Petroleum
NYSE      	WOS                 	WOLSELEY PLC
INDEX     	IGRA                	Lima General
NYSE      	VAL                 	Valspar Corporation (The)
NYSE      	CPO                 	Corn Products International, Inc.
NASDAQ    	IACIW               	IAC/InterActiveCorp
NYSE      	NGG                 	National Grid Transco, PLC
NYSE      	CMU                 	Colonial Municipal Income Trust
AMEX      	OOO                 	streetTRACKS SPDR O Strip
NASDAQ    	NRGN                	Neurogen Corporation
NYSE      	XKJ                 	Lehman ABS Corporation
NYSE      	JZV                 	Lehman ABS Corporation
TSE       	AFN.UN.TO           	AG Growth Income Fund
AMEX      	AEZ                 	American Oil & Gas, Inc.
NASDAQ    	CLGY                	Cellegy Pharmaceuticals, Inc.
NYSE      	FRK                 	Florida Rock Industries, Inc.
NASDAQ    	QTEC                	FIRST TRUST NASDAQ-1
AMEX      	LTS                 	Ladenburg Thalmann Financial Services Inc
AMEX      	SLI                 	SL Industries, Inc.
NASDAQ    	KMGB                	KMG Chemicals, Inc.
NYSE      	GSF                 	Santa Fe International Corporation
INDEX     	NJB                 	iShares Russell 1000 Index
AMEX      	PJP                 	PowerShares Dynamic Pharmaceutical
NASDAQ    	DBLE                	Double Eagle Petroleum Company
NYSE      	NPM                 	Nuveen Premium Income Municipal Fund II, Inc.
AMEX      	IVW                 	iShares S&P 500/BARRA Growth Index Fund
NYSE      	BRK.A               	Berkshire Hathaway Inc.
AMEX      	CEQ                 	MORGAN STANLEY
NASDAQ    	HTBK                	Heritage Commerce Corp
NASDAQ    	NNDS                	NDS Group plc.
NYSE      	KMP                 	Kinder Morgan Energy Partners, L.P.
NASDAQ    	SIVOE               	SVB Financial Group
NYSE      	ORI                 	Old Republic International Corporation
NASDAQ    	CLDN                	Celadon Group, Inc.
NYSE      	EWJ                 	iShares MSCI Japan
TSE       	IOL.TO              	Interoil Cp
AMEX      	MRM                 	Merrimac Industries, Inc.
TSE       	SIC.TO              	Sico Inc
NYSE      	LYV                 	CCE SPINCO INC WI
INDEX     	EJN                 	ISH MTR LRG VL
NYSE      	FMS                 	Fresenius Medical Care Corporation
NYSE      	PGL                 	Peoples Energy Corporation
TSE       	MT.TO               	Miranda Technologies Inc
NASDAQ    	UVSP                	Univest Corporation of Pennsylvania
NYSE      	GJM                 	General Motors Acceptance Corp
NYSE      	VZ                  	Verizon Communications Inc.
NYSE      	BNI                 	Burlington Northern Santa Fe Corporation
INDEX     	IKB                 	ISE National 100 Index
TSE       	WSC.PR.A.TO         	West Street Capital Cp 7% Pfd
TSE       	BCE.PR.A.TO         	BCE Inc Series A  Pfd A
NASDAQ    	NVSL                	Naugatuck Valley Financial Corporation
TSE       	SPL.B.TO            	Mulvihill Pro-AMS B
TSE       	MBT.TO              	Manitoba Telecom Services Inc
NYSE      	GED                 	General Elec Cap Corp
NASDAQ    	POSS                	Possis Medical, Inc.
NYSE      	TKF                 	Turkish Investment Fund, Inc. (The)
INDEX     	XII                 	AMEX Institutional Index
NASDAQ    	OPLK                	Oplink Communications, Inc.
INDEX     	MXX                 	Mexico IPC
TSE       	TLM.TO              	Talisman Energy Inc
NASDAQ    	GAIN                	Gladstone Investment Corporation
NYSE      	CHR                 	Converium Holding AG
NASDAQ    	INSU                	Insituform Technologies, Inc.
INDEX     	QSN                 	WEBS SPAIN SHR
INDEX     	EYV                 	STREETTRACKS DJ WILSHIRE MID CA
NYSE      	MZF                 	MBIA Capital/Claymore Total Return Fund Inc
NASDAQ    	LCRY                	LeCroy Corporation
NASDAQ    	ASYT                	Asyst Technologies, Inc.
TSE       	BXN.TO              	B Split II Cp Cl A Capital
NASDAQ    	EXPEZ               	Expedia, Inc.
NYSE      	NHP                 	Nationwide Health Properties, Inc.
NASDAQ    	PHEL                	Petroleum Helicopters, Inc.
TSE       	ACN.TO              	Alberta Clipper Energy Inc
NASDAQ    	SOLD                	HouseValues, Inc.
NASDAQ    	PXSL                	Pharmaxis
TSE       	LMZ.TO              	LMS Medical Systems Inc
NASDAQ    	FFCH                	First Financial Holdings, Inc.
NYSE      	PCM                 	PIMCO Commercial Mortgage Securities Trust, Inc.
NASDAQ    	HYGS                	Hydrogenics Corporation
INDEX     	INE                 	iShares MSCI Italy Index - IOPV
NYSE      	IES                 	Integrated Electrical Services, Inc.
NYSE      	ROL                 	Rollins, Inc.
NYSE      	CVS                 	CVS Corporation
AMEX      	EXX.B               	EXX, Inc.
NASDAQ    	INTG                	Intergroup Corporation (The)
TSE       	QLT.TO              	QLT Inc
TSE       	Q.TO                	Q9 Networks Inc
TSE       	HRG.TO              	High River Gold Mines Ltd
AMEX      	PKB                 	PowerShares Dynamic Building & Construction
NASDAQ    	STBA                	S&T Bancorp, Inc.
NASDAQ    	BCGI                	Boston Communications Group, Inc.
NASDAQ    	ASTM                	Aastrom Biosciences, Inc.
TSE       	D.UN.TO             	Dundee REIT Unit
NYSE      	ANS                 	AirNet Systems, Inc.
NYSE      	ALX                 	Alexander's, Inc.
TSE       	EIS.UN.TO           	Eveready Income Fund
NASDAQ    	BPOP                	Popular, Inc.
NYSE      	AAV                 	ADVANTAGE ENERGY INCOME FUND
NASDAQ    	PFBX                	Peoples Financial Corporation
NYSE      	KEI                 	Keithley Instruments, Inc.
INDEX     	TOB                 	AMEX Tobacco Index
NYSE      	IOP                 	INNOSPEC INC.
AMEX      	IIP                 	Internap Network Services Corporation
NASDAQ    	MTNK                	Merrill Lynch & Co., Inc.
AMEX      	BCT                 	BlackRock Broad Investment Grade 2009 Term Trust Inc. (The)
NASDAQ    	MOLX                	Molex Incorporated
NASDAQ    	BCON                	Beacon Power Corporation
NASDAQ    	AXYX                	Axonyx, Inc.
NASDAQ    	CAMD                	California Micro Devices Corporation
NYSE      	MO                  	Altria Group
NYSE      	MPW                 	Medical Properties Trust, Inc.
AMEX      	DSK                 	Merrill Lynch & Co., Inc.
NYSE      	CCI                 	Crown Castle International Corporation
NASDAQ    	NETM                	NetManage, Inc.
NASDAQ    	NATI                	National Instruments Corporation
NASDAQ    	ARWR                	Arrowhead Research Corporation
TSE       	ACE.B.TO            	ACE Aviation Holdings Cl B
NYSE      	CDR                 	Cedar Shopping Centers Inc
NASDAQ    	BFAM                	Bright Horizons Family Solutions Inc.
TSE       	POW.PR.B.TO         	Power Cp Of Canada 5.35% Pfd B
NASDAQ    	LTBG                	Lightbridge, Inc.
TSE       	FIF.UN.TO           	Focused 40 Income Fund
NYSE      	TRO                 	Tele Centro Oest Celular Participacoes S.A.
NYSE      	CNW                 	CON-WAY INC
INDEX     	HWI                 	AMEX Computer Hardware Index
TSE       	CYY.TO              	Coretec Inc
NASDAQ    	PCAP                	Patriot Capital Funding, Inc.
NASDAQ    	MAMA                	Mamma.com Inc
NASDAQ    	WEBX                	WebEx Communications, Inc.
NASDAQ    	APLX                	Applix, Inc.
NYSE      	MAT                 	Mattel, Inc.
NASDAQ    	PNBK                	Patriot National Bancorp Inc.
AMEX      	MMK                 	MINCO MINING AND MET
NASDAQ    	VLGEA               	Village Super Market, Inc.
TSE       	XTX.TO              	Xantrex Technology Inc
NYSE      	PKY                 	Parkway Properties, Inc.
NYSE      	NVO                 	Novo Nordisk A/S
NASDAQ    	DNEX                	Dionex Corporation
TSE       	PAZ.UN.TO           	Pathfinder Income Fund
NYSE      	CTB                 	Cooper Tire & Rubber Company
NYSE      	FRP                 	Fairpoint Communications, Inc.
INDEX     	MGD                 	S&P MidCap 400/BARRA Growth Index
NYSE      	CAE                 	Cascade Corporation
NYSE      	FHR                 	Canadian Pac Ltd
NYSE      	LDF                 	Latin American Discovery Fund, Inc. (The)
NASDAQ    	MENT                	Mentor Graphics Corporation
NYSE      	HEW                 	Hewitt Associates Inc
NASDAQ    	PVSW                	Pervasive Software Inc.
INDEX     	SHANG               	Shanghai Index
NASDAQ    	CASA                	Mexican Restaurants, Inc.
NYSE      	ENL                 	Reed Elsevier NV
NYSE      	TOD                 	Todd Shipyards Corporation
NASDAQ    	RUSL                	Morgan Stanley
NASDAQ    	MOTVE               	MOTIVE INC.
NASDAQ    	UHCP                	United Heritage Corporation
NYSE      	LND                 	Lincoln National Income Fund, Inc.
TSE       	GRO.UN.TO           	Sun Gro Horticulture Income Fd
NASDAQ    	INTV                	InterVoice Inc.
NYSE      	CHC                 	CHARTERMAC
NASDAQ    	BOBE                	Bob Evans Farms, Inc.
TSE       	UNC.PR.B.TO         	United Corporations 59 Pfd
TSE       	NSI.PR.D.TO         	Nova Scotia Power Inc Pfd D
NYSE      	NDC                 	National Data Corporation
NASDAQ    	MAXC                	Maxco, Inc.
NYSE      	LII                 	Lennox International, Inc.
TSE       	TOS.TO              	TSO3 Inc
TSE       	AFT.UN.TO           	Advanced Fiber Technologies Fd
NYSE      	CIR                 	CIRCOR International, Inc.
AMEX      	PHX                 	Panhandle Royalty Company
NASDAQ    	RCBK                	River City Bank (Mechanicsville, VA)
TSE       	MPT.UN.TO           	Macquarie Power Income Fund
NYSE      	DD                  	E.I. du Pont de Nemours and Company
NYSE      	SVM                 	ServiceMaster Company (The)
AMEX      	MSN                 	Emerson Radio Corporation
AMEX      	PWV                 	PowerShares Dynamic Large Cap Value
NASDAQ    	CMGI                	CMGI, Inc.
NASDAQ    	SATC                	SatCon Technology Corporation
AMEX      	MCX                 	MC Shipping Inc.
TSE       	OMP.UN.TO           	Opensky Capital Income Tr Fund
NYSE      	MON                 	Monsanto Company
NYSE      	HIH                 	Highland Hospitality Corporation
NASDAQ    	ROFO                	Rockford Corporation
NYSE      	REG                 	Regency Centers Corporation
NASDAQ    	TAGS                	Tarrant Apparel Group
NASDAQ    	CFFI                	C&F Financial Corporation
TSE       	TIV.TO              	Tiverton Petroleums Ltd
NYSE      	HBC.P               	HARRIS PREFERRED CAP CP PFD
NYSE      	PZC                 	PIMCO California Municipal Income Fund III
NYSE      	KKD                 	Krispy Kreme Doughnuts, Inc.
NASDAQ    	VISGD               	VIISAGE TECH INC
NYSE      	HTX                 	Hutchison Telecommunications International
INDEX     	NGV                 	AMEX NATURAL GAS INDEX FINAL SE
NYSE      	TBH                 	Telecom Brasil Sa Te
TSE       	SXT.TO              	Sixty Split Cp
NASDAQ    	LEIX                	Lowrance Electronics, Inc.
TSE       	OGF.UN.TO           	Brompton Equal Weight Oil Gas
TSE       	SZR.UN.TO           	Sunrise Senior Living REIT
NASDAQ    	IDSY                	I.D. Systems, Inc.
AMEX      	MDH                 	MHI Hospitality Corporation
NASDAQ    	FMBI                	First Midwest Bancorp, Inc.
NASDAQ    	NVDA                	NVIDIA Corporation
NASDAQ    	PFBI                	Premier Financial Bancorp, Inc.
NYSE      	MHX                 	MeriStar Hospitality Corporation
AMEX      	PDY                 	Citigroup Global Markets
NYSE      	ATU                 	Actuant Corporation
NYSE      	LBF                 	Scudder Global High Income Fund, Inc.
NYSE      	FLA                 	Florida East Coast Industries, Inc.
TSE       	RC.TO               	RDM Cp
NYSE      	MTZ                 	MasTec, Inc.
AMEX      	IWF                 	iShares Russell 1000 Growth Index Fund
NASDAQ    	NEOL                	NeoPharm, Inc.
TSE       	BCI.UN.TO           	Benvest New Look Income Fund
NASDAQ    	ALEX                	Alexander & Baldwin, Inc.
NASDAQ    	UHAL                	Amerco
NASDAQ    	BBGI                	Beasley Broadcast Group, Inc.
NASDAQ    	RSYS                	RadiSys Corporation
TSE       	TXR.UN.TO           	Triax CaRTS Technology Trust
NYSE      	ABS                 	ALBERTSO INC
NYSE      	EMO                 	Entergy Mississippi, Inc.
NYSE      	TLD                 	Tele Danmark A/S
NASDAQ    	KLAC                	KLA-Tencor Corporation
NYSE      	DVD                 	Dover Downs Entertainment, Inc.
NASDAQ    	UBCD                	UnionBancorp, Inc
INDEX     	BVH                 	Vanguard Large Cap Vipers Index
NASDAQ    	DGIN                	Digital Insight Corporation
NYSE      	GYB                 	CABCO Series 2004-101 Trust
NYSE      	GTN                 	Gray Television, Inc.
TSE       	HLG.PR.B.TO         	Hollinger Inc Pfd B
NYSE      	ARK                 	Senior High Income Portfolio, Inc.
AMEX      	AQR.U               	ACQUICOR TECHNOLOGY INC
NASDAQ    	SPLS                	Staples, Inc.
NYSE      	MAR                 	Marriot International
NASDAQ    	AMRI                	Albany Molecular Research, Inc.
NASDAQ    	LABS                	LabOne, Inc.
NYSE      	MMM                 	3M Company
AMEX      	LPA                 	IFT CORPORATION
NASDAQ    	NOVT                	Novoste Corporation
NYSE      	DOW                 	Dow Chemical Company (The)
NASDAQ    	PRPX                	Portec Rail Products, Inc.
TSE       	AL.U.TO             	Alcan Inc US$
AMEX      	WEX                 	Winland Electronics, Inc.
NASDAQ    	CELL                	Brightpoint, Inc.
NYSE      	BN                  	Banta Corporation
NASDAQ    	PMRY                	Pomeroy IT Solutions, Inc.
NYSE      	SSI                 	SpectraSite, Inc.
INDEX     	ILP                 	Dynamic Mid Cp Valu Intellidex
NASDAQ    	MOSY                	Monolithic System Technology, Inc.
NYSE      	ELP                 	Companhia Paranaense de Energia (COPEL)
NASDAQ    	CORE                	CORE MARK HOLDING
NYSE      	XFR                 	Lehman ABS Corporation
NASDAQ    	SRLS                	SeraCare Life Sciences Inc
NYSE      	NWN                 	Northwest Natural Gas Company
INDEX     	INL                 	iShares MSCI Switzerland Index - IOPV
NASDAQ    	PDFS                	PDF Solutions, Inc.
TSE       	CCI.TO              	Canaccord Capital Inc
TSE       	CWI.UN.TO           	Consumers Waterheater Income
NYSE      	SUP                 	Superior Industries International, Inc.
INDEX     	DZF                 	DYNAMIC FOOD & BEVERAGE INTELLI
NASDAQ    	ZRBA                	ZAREBA SYSTEMS INC
NYSE      	HMN                 	Horace Mann Educators Corporation
AMEX      	TTP                 	Titan Pharmaceuticals, Inc.
TSE       	KEG.UN.TO           	Keg Royalties Income Fund
NASDAQ    	PFIN                	P & F Industries, Inc.
NYSE      	VOD                 	Vodafone AirTouch Public Company
NASDAQ    	AMCRP               	Amcor
NYSE      	BCE                 	BCE, Inc.
NASDAQ    	FORM                	FormFactor, Inc.
NASDAQ    	UPCS                	UbiquiTel Inc.
NYSE      	NR                  	Newpark Resources, Inc.
AMEX      	FZN                 	CUISINE SOLUTIO INC
NYSE      	SAP                 	SAP Aktiengesellschaft Systeme, Anwendungen, Produkte
NASDAQ    	PCTI                	PC-Tel, Inc.
AMEX      	PZJ                 	PowerShares Zacks Small Cap Portfolio
AMEX      	VBK                 	Vanguard Small-Cap Growth VIPERs
NYSE      	COF.P               	CAPITAL ONE FINANCIAL CORP
TSE       	HLG.C.TO            	Hollinger Inc Cl C
INDEX     	UKS                 	WEBS U.K. SHR
NASDAQ    	DBRN                	Dress Barn, Inc. (The)
NYSE      	MIM                 	MI Developments Inc
NASDAQ    	AMNT                	AmNet Mortgage, Inc
AMEX      	EWA                 	iShares MSCI Australia Index Fund
TSE       	MTI.TO              	MTI Global Inc
NYSE      	CLP                 	Colonial Properties Trust
AMEX      	FNG.P               	FRONT RANGE CAP TR I
INDEX     	WWC                 	iShares MSCI Brazil Index
TSE       	AED.TO              	Atlas Energy Ltd
NYSE      	WEA                 	Western Asset Bond Fund
TSE       	MET.TO              	Metalore Resources Ltd
TSE       	MVX.TO              	Mavrix Fund Management Inc
NASDAQ    	FMFC                	First M & F Corporation
INDEX     	HKK                 	ISH MTR SML VL
TSE       	GII.UN.TO           	Global Diversified Income II
NYSE      	GMP                 	Green Mountain Power Corporation
NASDAQ    	VLCCF               	Knightsbridge Tankers,
NYSE      	FCF                 	First Commonwealth Financial Corporation
NASDAQ    	GCFBU               	Granite City Food & Brewery Ltd.
TSE       	NNO.TO              	Northern Orion Resources Inc
NYSE      	TVL                 	LIN TV CORP
NYSE      	SKT                 	Tanger Factory Outlet Centers, Inc.
NYSE      	TFC                 	Taiwan Greater China Fund
NYSE      	LBY                 	Libbey, Inc.
NASDAQ    	ECTX                	ECtel Ltd.
TSE       	LNK.TO              	Clublink Cp
TSE       	ANS.TO              	Ainsworth Lumber Co Ltd
NYSE      	WL                  	Wilmington Trust Corporation
NYSE      	ITC                 	ITC Holdings Corp.
NASDAQ    	FALC                	FalconStor Software, Inc.
NASDAQ    	RBNCP               	Republic Bancorp Inc.
NYSE      	MSK                 	Grupo Industrial Maseca, S.A. de C.V.
NYSE      	KTJ                 	Lehman ABS Corporation
NYSE      	SCO                 	SCOR S.A.
NYSE      	BEV                 	Beverly Enterprises. Inc.
NYSE      	VMO                 	Van Kampen Municipal Opportunity Trust
AMEX      	FWV                 	First West Virginia Bancorp, Inc.
TSE       	BCB.TO              	Cott Cp
NASDAQ    	NABI                	Nabi Biopharmaceuticals
NYSE      	VRX                 	Valeant Pharmaceuticals International
NASDAQ    	CBIN                	Community Bank of Indiana, Inc.
NYSE      	EHI                 	Salomon Brothers Global High Income Fund Inc
INDEX     	MLO                 	AMEX Merrill Lynch Tech 100
NYSE      	TCI                 	Transcontinental Realty Investors, Inc.
NYSE      	WW                  	Watson Wyatt & Company Holdings
AMEX      	TF                  	Thai Capital Fund Inc
NYSE      	DKQ                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	JHI                 	John Hancock Investors Trust
NASDAQ    	LINC                	Lincoln Educational Services Corporation
NASDAQ    	XNPT                	XenoPort, Inc.
NASDAQ    	STOSY               	Santos, Ltd.
NASDAQ    	SPRT                	SupportSoft Inc.
NASDAQ    	GIGM                	GigaMedia
NASDAQ    	BULKU               	NAVIOS MARITIME UTS
NYSE      	PNC                 	PNC FINL SVCS GROUP INC
NASDAQ    	CVLL                	COMMUNITY VALLEY BNC
TSE       	HII.MV.B.TO         	Homburg Invest Inc MV
NYSE      	BTU.P               	EABODY ENERGY CORP
TSE       	SFI.TO              	Saxon Financial Inc
NASDAQ    	BWEB                	BackWeb Technologies Ltd.
TSE       	IMP.TO              	Intermap Technologies Cp
AMEX      	GW                  	Grey Wolf, Inc.
AMEX      	DYX                 	DiaSys Corporation
INDEX     	OSX                 	Phlx Euro Style Oil Svc Index
NASDAQ    	VEGF                	Corautus Genetics, Inc.
NASDAQ    	TDSC                	3D Systems Corporation
NYSE      	PJK                 	Preferred Plus Trust
NYSE      	SMV.A               	Smedvig Asa Ads Cla
NYSE      	FUN                 	Cedar Fair, L.P.
TSE       	IQ.TO               	Air IQ Inc
NYSE      	DCX                 	DAIMLERCHRYSLER AG
NASDAQ    	MITY                	MITY Enterprises Inc.
AMEX      	VMN                 	Delaware Investments Minnesota Municipal Income Fund, Inc.
NASDAQ    	INGR                	Intergraph Corporation
TSE       	TDS.B.TO            	TD Split Inc
NASDAQ    	ELTK                	Eltek Ltd.
INDEX     	NME                 	iShares S&P 500 BARRA Value Index
NASDAQ    	FSII                	FSI International, Inc.
NYSE      	SKM                 	SK Telecom Corporation, Ltd.
NYSE      	SFF                 	Santa Fe Energy Trust
NASDAQ    	MVSN                	Macrovision Corporation
NYSE      	CTL                 	CenturyTel, Inc.
TSE       	WSC.TO              	West Street Capital Cp
NYSE      	DPL                 	DPL Inc.
TSE       	AB.TO               	Asbestos Cp Ltd
NYSE      	SMG                 	Scotts Company (The)
NYSE      	WLM                 	Wellman, Inc.
NYSE      	CMG                 	CHIPOTLE MEXICAN GRILL INC
AMEX      	BGO                 	Bema Gold Corporation
NASDAQ    	RGLD                	Royal Gold, Inc.
NYSE      	NPO                 	Enpro Industries
TSE       	STQ.E.TO            	Income Streams III Equity
AMEX      	RZG                 	Rydex S&P 600 Pure Growth
TSE       	SSC.TO              	Scotia Split Cp
NYSE      	PPS                 	Post Properties, Inc.
NYSE      	DNR                 	Denbury Resources, Inc. (Holding Company)
NYSE      	FSB                 	Financial Security Assurance Holdings Ltd
NASDAQ    	EMCI                	EMC Insurance Group, Inc.
NASDAQ    	PGNX                	Progenics Pharmaceuticals Inc.
NYSE      	ALG                 	Alamo Group, Inc.
NYSE      	IAT                 	ISHARES DOW JONES U.S. REGIONA
AMEX      	IXG                 	iShares S&P Global Financial Index Fund
INDEX     	NIR                 	iShares S&P SmallCap 600 Index
NASDAQ    	GOOD                	Gladstone Commercial Corporation
NASDAQ    	DPII                	Discovery Partners International, Inc.
AMEX      	BSM                 	BSD Medical Corporation
NASDAQ    	INFS                	InFocus Corporation
NYSE      	TI                  	Telecom Italia S.P.A.
TSE       	RER.TO              	Real Resources Inc
TSE       	GTK.TO              	Guest-Tek Interactive Ltd
NYSE      	AYE                 	Allegheny Energy, Inc.
NASDAQ    	NTLID               	NTL INC
TSE       	PEL.TO              	Purcell Energy Ltd
NYSE      	CX                  	Cemex Sa De Cv A Ads
AMEX      	SAL                 	Salisbury Bancorp, Inc.
NASDAQ    	DDRX                	Diedrich Coffee
TSE       	KCP.UN.TO           	KCP Income Fund
NASDAQ    	MEDI                	MedImmune, Inc.
NASDAQ    	TCHCW               	21st Century Holding Company
AMEX      	EVO                 	Eaton Vance Ohio Municipal Income Trust
NYSE      	MFL                 	MuniHoldings Florida Insured Fund, Inc.
NASDAQ    	CAPB                	CAPITALSOUTH BANCORP
NASDAQ    	CLBH                	Carolina Bank Holdings Inc.
NASDAQ    	HBAN                	Huntington Bancshares Incorporated
NYSE      	EWI                 	iShares MSCI Italy
NYSE      	NUM                 	Nuveen Michigan Quality Income Municipal Fund, Inc.
AMEX      	DAR                 	Darling International Inc.
NASDAQ    	TMNG                	Management Network Group, Inc. (The)
NASDAQ    	CHNR                	China Natural Resources, Inc.
NASDAQ    	PWOD                	Penns Woods Bancorp, Inc.
INDEX     	FDB                 	ISH MTR MID GR
NASDAQ    	AEZS                	AEterna Zentaris, Inc.
TSE       	HBP.TO              	Helix Biopharma Cp
NASDAQ    	MEAD                	Meade Instruments Corp.
NASDAQ    	PRWT                	Premier West Bancorp
NYSE      	TIF                 	Tiffany & Co.
NASDAQ    	MBAY                	MediaBay, Inc.
TSE       	BBD.PR.D.TO         	Bombardier Inc Series 3 Pfd
INDEX     	NIJ                 	iShares Dow Jones U.S. Industrial Sector Index
NASDAQ    	STGSZ               	Stage Stores, Inc.
NASDAQ    	TMTA                	Transmeta Corporation
NASDAQ    	AVNR                	AVANIR PHARMACEUTICL
NASDAQ    	MSSR                	McCormick & Schmick's Seafood Restaurants, Inc.
NASDAQ    	GBCIP               	Glacier Bancorp, Inc.
INDEX     	KIH                 	STREETTRACKS KBW IURANCE
TSE       	RY.TO               	Royal Bank Of Canada
INDEX     	IDX                 	S&P 400 Midcap Index
NYSE      	MI                  	Marshall & Ilsley Corporation
NASDAQ    	EVBN                	Evans Bancorp, Inc.
NASDAQ    	SHMR                	Shamir Optical Industry Ltd.
NYSE      	WNC                 	Wabash National Corporation
NASDAQ    	SMRAD               	SOMERA COMMUNIC NEW
TSE       	A.TO                	Abitibi Consolidated Inc
TSE       	AEZ.TO              	Aeterna Zentaris Inc
TSE       	SVY.TO              	Savanna Energy Services Cp
NASDAQ    	BUTLE               	Butler International, Inc.
NYSE      	PTI                 	PATNI COMPUTER SYSTEMS
NYSE      	PIY                 	Merrill Lynch Depositor, Inc.
INDEX     	IJE                 	ISHARE RUSSEL MICROCAP INDEX
NASDAQ    	MFLR                	Mayflower Co-operative Bank
TSE       	BSP.UN.TO           	Blumont Strategic Partners
TSE       	KCR.TO              	Cancor Mines Inc
NASDAQ    	ITLA                	ITLA Capital Corporation
TSE       	FFI.UN.TO           	Flaherty & Crumrine Investment
INDEX     	EWR                 	Streettracks Trust Index
NASDAQ    	MGLN                	Magellan Health Services, Inc.
INDEX     	SIT                 	WEBS ITALY SHR
NASDAQ    	GMXRW               	GMX Resources, Inc.
TSE       	WN.PR.B.TO          	George Weston Ltd 5.15% Pfd
NASDAQ    	MNST                	Monster Worldwide Inc.
NYSE      	AVD                 	AMER VANGUARD CP
NASDAQ    	INVX                	Innovex, Inc.
NYSE      	EWT                 	iShares MSCI Taiwan
NASDAQ    	UHCDC               	UNITED HERITAGE NEW
NASDAQ    	NYMX                	Nymox Pharmaceutical Corporation
NYSE      	CJR                 	Corus Entertainmt Incorporated
AMEX      	ESM                 	Merrill Lynch & Co., Inc.
INDEX     	FZO                 	Powershares Dynam Otc Ptf Index
NASDAQ    	STGN                	Stratagene Corporation
NYSE      	CBS.A               	CBS CORP CL A
INDEX     	PHN                 	AMEX Telecom Index
TSE       	CYS.TO              	Cyries Energy Inc
NASDAQ    	INDM                	United America Indemnity, Ltd.
AMEX      	BWL.A               	Bowl America, Inc.
NASDAQ    	EEFT                	Euronet Worldwide, Inc.
INDEX     	NVOT                	NYSE Total Volume
NYSE      	LEV                 	Levitt Corporation
AMEX      	NOM                 	Nuveen Missouri Premium Income Municipal Fund
NASDAQ    	GRIN                	Grand Toys International, Inc.
NASDAQ    	QQEW                	FIRST TRUST NASDAQ-1
NASDAQ    	RUTX                	Republic Companies Group, Inc.
TSE       	DDD.TO              	Dragon Pharmaceutical
NASDAQ    	Symbol              	Description
AMEX      	LB                  	LaBarge, Inc.
INDEX     	MBO                 	CHINESE MPS BSKT
NASDAQ    	SSTR                	Silverstar Holdings Ltd
AMEX      	VRA                 	Viragen, Inc.
NYSE      	YRK                 	York International Corporation
AMEX      	GTA                 	Golf Trust of America, Inc.
TSE       	CDM.U.TO            	Coeur Dalene Mines Cp US$
AMEX      	CGL.A               	Cagle's, Inc.
NYSE      	MGM                 	MGM MIRAGE
TSE       	CAC.PR.A.TO         	Cancap Pfd Cp Pfd A
AMEX      	FRS                 	Frisch's Restaurants, Inc.
TSE       	PMK.TO              	Promatek Industries Ltd
NYSE      	AES                 	AES CORP
NASDAQ    	SCOX                	SCO Group, Inc. (The)
INDEX     	SPFIN               	SP500 Financials Sector
TSE       	APQ.TO              	Asia Pacific Resources Ltd
NASDAQ    	EQIX                	Equinix, Inc.
TSE       	AKT.B.TO            	Akita Drilling Ltd Cl B
NYSE      	PFD                 	Flaherty & Crumrine Preferred Income Fund Incorporated
NYSE      	OS                  	Oregon Steel Mills, Inc.
NASDAQ    	TECUA               	Tecumseh Products Company
NASDAQ    	DANKY               	Danka Business Systems PLC
NYSE      	TNP                 	Tsakos Energy Navigation Ltd
NASDAQ    	AAME                	Atlantic American Corporation
TSE       	WDA.TO              	Weda Bay Minerals Inc
NYSE      	WIT                 	Wipro
NASDAQ    	SAFM                	Sanderson Farms, Inc.
AMEX      	SEA.W               	STAR MARITIME ACQUISITION CORP
NYSE      	CWP                 	Cable & Wireless plc
NYSE      	ACE                 	Ace
AMEX      	SZB                 	SouthFirst Bancshares, Inc.
NASDAQ    	NOVC                	NOVACEA INC.
NASDAQ    	PLCM                	Polycom, Inc.
AMEX      	APY                 	ASPYRA INC
TSE       	DDJ.UN.TO           	DDJ US High Yield Fund
NYSE      	TY.P                	TRI CONTINENTAL CP PFD
NASDAQ    	CKCM                	Click Commerce, Inc.
NYSE      	HR                  	Healthcare Realty Trust Incorporated
AMEX      	SMH                 	HOLDRS Semiconductors
NASDAQ    	CIMT                	Cimatron,
TSE       	LPR.UN.TO           	Lawrence Payout Ratio Trust
NYSE      	PCP                 	Precision Castparts Corporation
AMEX      	EWI                 	iShares MSCI Italy Index Fund
NASDAQ    	AATK                	American Access Technologies, Inc.
TSE       	SPA.TO              	Spectra Grp Great Restaurant
NYSE      	AKR                 	Acadia Realty Trust
TSE       	FIE.UN.TO           	Canadian Financial Income Fund
NASDAQ    	REGN                	Regeneron Pharmaceuticals, Inc.
NYSE      	DRI                 	Darden Restaurants, Inc.
NASDAQ    	ALNC                	Alliance Financial Corporation
NASDAQ    	CLRT                	Clarient, Inc.
AMEX      	BI                  	Bell Industries, Inc.
INDEX     	XHP                 	iShares S&P Global Telecommunications
AMEX      	TLL                 	Teletouch Communications, Inc.
NASDAQ    	FFEX                	Frozen Food Express Industries, Inc.
AMEX      	ECF                 	Ellsworth Convertible Growth and Income Fund, Inc.
NASDAQ    	SUFB                	SuffolkFirst Bank
AMEX      	AMW                 	American Water Star Inc
NYSE      	AXL                 	American Axle & Manufacturing Holdings, Inc.
NASDAQ    	NPSP                	NPS Pharmaceuticals, Inc.
NYSE      	CAO                 	CSK Auto Corporation
NYSE      	ET                  	E*TRADE Financial Corporation
AMEX      	TLF                 	Leather Factory, Inc. (The)
NASDAQ    	ACME                	ACME Communications, Inc.
NASDAQ    	MMLP                	Martin Midstream Partners L.P.
NASDAQ    	ATRS                	Altiris, Inc.
TSE       	BH.TO               	Brainhunter Inc
NASDAQ    	MNRK                	Monarch Bank
NASDAQ    	FHRX                	First Horizon Pharmaceutical Corporation
AMEX      	NBR                 	Nabors Industries, Inc.
NYSE      	DKX                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	SMTX                	SMTC Corporation
AMEX      	CYL                 	Community Capital Corporation
INDEX     	EXY                 	EURO INDEX
AMEX      	DNE                 	Dune Energy, Inc.
NASDAQ    	TROW                	T. Rowe Price Group, Inc.
TSE       	ATM.TO              	Atcion Minerals Inc
TSE       	HCG.TO              	Home Capital Group Inc
AMEX      	RTK                 	Rentech, Inc.
NASDAQ    	KNOT                	Knot, Inc. (The)
AMEX      	TES.W               	AMERICAN TELECOM WS
NYSE      	ASX                 	Advanced Semiconductor Engineering, Inc.
NYSE      	EE                  	El Paso Electric Company
NYSE      	KMA                 	KMG America Corporation
NYSE      	BKI                 	Buckeye Technologies, Inc.
NASDAQ    	CKFR                	CheckFree Corporation
NYSE      	TDA                 	Telephone and Data Systems, Inc.
TSE       	SJR.PR.A.TO         	Shaw Comms Inc Pfd A
NASDAQ    	SNFCA               	Security National Financial Corporation
NASDAQ    	NTOP                	Net2Phone
TSE       	NAE.UN.TO           	NAL Oil & Gas Trust Unit
NYSE      	PNR                 	Pentair, Inc.
TSE       	SOM.UN.TO           	Somerset Entertnmnt Income Fd
INDEX     	HWO                 	COMPUTER HARDWARE INDEX FNL SET
NASDAQ    	RCKY                	Rocky Shoes & Boots, Inc.
NYSE      	KRH                 	Lehman ABS Corporation
AMEX      	PSI                 	PowerShares Dynamic Semiconductor
NYSE      	APF                 	Morgan Stanley Asia-Pacific Fund, Inc.
NASDAQ    	MAXM                	Maxim Pharmaceuticals, Inc.
NASDAQ    	VISG                	Viisage Technology, Inc.
NASDAQ    	IDGR                	Industrial Distribution Group, Inc.
NASDAQ    	LOGC                	Logic Devices Incorporated
TSE       	RIT.UN.TO           	First Asset Equal Weight Reit
TSE       	GWL.PR.L.TO         	Great West Life Pfd L
AMEX      	SLS                 	Selas Corporation of America
NASDAQ    	STEL                	Stellent, Inc.
AMEX      	RLO                 	Regalito Copper Corp.
NYSE      	HMB                 	Homebanc Corp
AMEX      	PZA                 	Provena Foods, Inc.
NASDAQ    	VEXP                	Velocity Express Corporation
NASDAQ    	MXWL                	Maxwell Technologies, Inc.
NASDAQ    	TRFDF               	Tramford International
TSE       	SAS.TO              	St Andrew Goldfields Ltd
NYSE      	WTI                 	W&T Offshore, Inc.
NASDAQ    	DADE                	Dade Behring Holdings, Inc
NASDAQ    	HIST                	Gallery of History, Inc.
AMEX      	RSM                 	Merrill Lynch & Co., Inc.
NASDAQ    	NGAS                	NGAS Resources, Inc.
NYSE      	CKI                 	Lehman ABS Corporation
TSE       	HCI.UN.TO           	Hartco Cp
TSE       	CO.TO               	Contact Diamond Cp
NASDAQ    	CONN                	Conn's, Inc.
NASDAQ    	HCBK                	Hudson City Bancorp, Inc.
TSE       	DDS.TO              	Labopharm Inc
NYSE      	PJZ                 	Merrill Lynch Depositor Inc
AMEX      	IGC.W               	INDIA GLOBAL CAP WTS
NYSE      	MTD                 	Mettler-Toledo International, Inc.
AMEX      	IBB                 	iShares NASDAQ Biotechnology Index Fund
NASDAQ    	DEPO                	DepoMed, Inc.
NASDAQ    	RFMI                	RF Monolithics, Inc.
TSE       	AEO.TO              	Aurado Energy Inc
AMEX      	IMX                 	Implant Sciences Corporation
NASDAQ    	EBTC                	Enterprise Bancorp Inc
NASDAQ    	SPIR                	Spire Corporation
NASDAQ    	WSCC                	Waterside Capital Corporation
TSE       	TUI.UN.TO           	True Energy Trust
NYSE      	BTM                 	Brasil Telecom Participacoes S.A.
NYSE      	UNN                 	UnumProvident Corporation
NASDAQ    	THOR                	Thoratec Corporation
TSE       	SPL.A.TO            	Mulvihill Pro-AMS A
TSE       	NPF.UN.TO           	Newport Partners Income Fund
TSE       	IMZ.TO              	International Minerals Cp
NASDAQ    	NFLD                	Northfield Laboratories Inc.
AMEX      	PDJ                 	MORGAN STANLEY
INDEX     	BTS                 	AMEX BIOTECHNOLOGY INDEX FINAL
NASDAQ    	MFBC                	MFB Corp.
INDEX     	DAT                 	MERGENT INTERNATIONAL DIVIDEND
NASDAQ    	NDPL                	MS PLUS NDQ 100 IDX
INDEX     	XE                  	Merrill Lyn Early Cyclical Index
TSE       	IXL.TO              	Innova Exploration Ltd
NYSE      	HC                  	Hanover Compressor Company
NYSE      	FA                  	Fairchild Corporation (The)
NASDAQ    	CGTKD               	CORGENTECH INC
NYSE      	MGI                 	Moneygram International, Inc.
INDEX     	BIS                 	PDR BIOTECH INDEX FUND TC
NASDAQ    	ARCC                	Ares Capital Corporation
NASDAQ    	CORT                	Corcept Therapeutics Incorporated
TSE       	IQW.PR.B.TO         	Quebecor World Srs 4 Pfd B
TSE       	SOY.TO              	Sunopta Inc
INDEX     	MEV                 	AMEX MEXICO INDEX SETTLEMENT
NYSE      	SXT                 	Sensient Technologies Corporation
AMEX      	VLG                 	Valley National Gases, Inc.
TSE       	SGV.TO              	StrataGold Cp
AMEX      	CDM                 	Citigroup Global Markets Holdings Inc
NASDAQ    	SRCL                	Stericycle, Inc.
NASDAQ    	TAXI                	Medallion Financial Corp.
NASDAQ    	RHAT                	Red Hat, Inc.
NYSE      	MJD                 	MSDW Structured Asset Corporation
NYSE      	NWS.A               	News Corporation (The)
NYSE      	ABN                 	ABN Amro Holding N.V.
TSE       	AU.LV.TO            	Agricore United
NYSE      	MRD                 	MacDermid, Incorporated
NYSE      	ISG                 	International Steel Group Inc
NASDAQ    	CNXT                	Conexant Systems, Inc.
NASDAQ    	ZANE                	Zanett Inc.
NASDAQ    	CTXS                	Citrix Systems, Inc.
NASDAQ    	LCGI                	Learning Care Group, Inc.
AMEX      	LMZ                 	LMS MEDICAL SYSTEMS INC
NYSE      	OMX                 	Boise Cascade Corporation
TSE       	PWC.TO              	Pacific & Western Credit Cp
NYSE      	BRY                 	Berry Petroleum Company
NASDAQ    	JACO                	Jaco Electronics, Inc.
NYSE      	EQY                 	Equity One, Inc.
NYSE      	VOQ                 	Van Kampen Ohio Quality Municipal Trust
NYSE      	BFK                 	BlackRock Municipal Income Trust
INDEX     	JYT                 	AMEX JYT INDEX
NYSE      	TE                  	TECO Energy, Inc.
NYSE      	GJN                 	SYNTHETIC FIXED-INCOME SECURIT
AMEX      	MLW                 	Merrill Lynch & Co., Inc.
NYSE      	LM                  	Legg Mason, Inc.
AMEX      	VMV                 	Van Kampen Massachusetts Value Municipal Income Trust
NYSE      	TZI                 	Trust Certificates Ser 2001-4 Bear Stearns Depositor
NASDAQ    	CACS                	Carrier Access Corporation
NYSE      	IVC                 	Invacare Corporation
TSE       	FBS.A.TO            	5Banc Split Inc Cl A Capital
NYSE      	HL                  	Hecla Mining Company
TSE       	NLG.TO              	Nelson Resources Ltd
TSE       	TAV.TO              	TD Select Canadian Value Idx
AMEX      	EBB                 	7% SPARQS LINKED TO EBAY INC.
NASDAQ    	SCIL                	Scientific Learning Corporation
TSE       	AAH.TO              	Aastra Technologies Ltd
NYSE      	CSL                 	Carlisle Companies Incorporated
TSE       	AOM.TO              	Anormed Inc
NASDAQ    	IFOX                	Infocrossing, Inc.
TSE       	AIN.UN.TO           	Arriscraft International
NASDAQ    	SRXA                	S R Telecom Inc
NYSE      	IQN                 	MS New York Quality Municipal Securities
NYSE      	EMD                 	Emerging Markets Income Fund, Inc. (The)
NASDAQ    	GRAN                	Bank of Granite Corporation
NASDAQ    	AMMD                	American Medical Systems Holdings, Inc.
NASDAQ    	MLNM                	Millennium Pharmaceuticals, Inc.
NASDAQ    	PLLL                	Parallel Petroleum Corporation
AMEX      	AZK                 	Aurizon Mines, Ltd.
INDEX     	NJKJ                	ID JKJ INDEX
INDEX     	SFJ                 	SIG FOOTWEAR AND ATHLETIC INDEX
AMEX      	GRN                 	GreenMan Technologies, Inc.
NYSE      	TYG                 	Tortoise Energy Infrastructure Corporation
AMEX      	GEL                 	Genesis Energy, L.P.
NASDAQ    	ATMI                	ATMI Inc.
NASDAQ    	OTEX                	Open Text Corporation
TSE       	SO.TO               	Softchoice Cp
NYSE      	EXP                 	Eagle Materials Inc
NYSE      	JZT                 	Lehman ABS Corp
AMEX      	MEK                 	Metretek Technologies, Inc.
NASDAQ    	ALTI                	Altair Nanotechnologies Inc.
NYSE      	LQI.P               	LA QUINTA PROPERTIES
NYSE      	DKI                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	GRT                 	Glimcher Realty Trust
NASDAQ    	ASGRE               	AMERICA SERVICE GP
AMEX      	DMD                 	Merrill Lynch & Co., Inc.
NASDAQ    	SFCC                	SFBC International, Inc.
NASDAQ    	CENX                	Century Aluminum Company
NYSE      	WBS                 	Webster Financial Corporation
NASDAQ    	AMSF                	AMERISAFE INC
NYSE      	HIF                 	Salomon Brothers High Income Fund Inc.
TSE       	SEO.TO              	Storm Explorations Inc
NYSE      	PGN                 	PROGRESS ENERGY INC
NASDAQ    	EBIX                	Ebix Inc
AMEX      	SNB                 	Citigroup Global Markets Holdings Inc
NASDAQ    	ESMC                	Escalon Medical Corp.
NYSE      	CDL                 	Citadel Broadcasting Corporation
NASDAQ    	BDSI                	BioDelivery Sciences International, Inc.
NASDAQ    	KVHI                	KVH Industries, Inc.
NYSE      	GHI                 	Global High Income Dollar Fund, Inc.
NASDAQ    	UCBI                	United Community Banks, Inc.
TSE       	NVA.TO              	Nuvista Energy Ltd
NYSE      	IQW                 	Quebecor World Inc.
NASDAQ    	ICCC                	ImmuCell Corporation
NYSE      	EWL                 	iShares MSCI Switzerland
NASDAQ    	WSTL                	Westell Technologies, Inc.
AMEX      	VFL                 	Delaware Investments Florida Insured Municipal Income Fund
NASDAQ    	SCHK                	SCHICK TECHS INC
NYSE      	CBB                 	Cincinnati Bell Inc
NYSE      	ZL                  	Zarlink Semiconductor Inc.
TSE       	BLZ.TO              	Belzberg Technologies Inc
NASDAQ    	PENN                	Penn National Gaming, Inc.
TSE       	SQP.UN.TO           	Strongco Inc
AMEX      	XLF                 	SPDR Finanical
NYSE      	EFG                 	iShares MSCI EAFE Growth Index
NASDAQ    	TWTR                	Tweeter Home Entertainment Group, Inc
AMEX      	BLE                 	BlackRock Municipal Income Trust II
NYSE      	CBA                 	Brilliance China Automotive Holdings
TSE       	LOR.TO              	Lorus Therapeutics Inc
NYSE      	AZO                 	AutoZone, Inc.
AMEX      	CRV                 	Coast Distribution System, Inc. (The)
NASDAQ    	CHINA               	CDC Corporation
NYSE      	KRK                 	Lehman ABS Corporation
TSE       	JDU.TO              	JDS Uniphase Canada Ltd
NASDAQ    	QRCP                	QUEST RESOURCE CORP
NASDAQ    	NBTB                	NBT Bancorp Inc.
NYSE      	TMS                 	THOMSON multimedia S.A.
NASDAQ    	JFBI                	Jefferson Bancshares, Inc.
INDEX     	BANK                	Nasdaq Bank
AMEX      	MFP                 	MS PHLX HSG SEC IDX
TSE       	PWT.UN.TO           	Penn West Energy Trust
NYSE      	DJ                  	Dow Jones & Company, Inc.
NASDAQ    	CGPI                	CollaGenex Pharmaceuticals, Inc.
TSE       	TTF.TO              	TD S&P/TSX Composite Index
AMEX      	BIO.B               	Bio-Rad Laboratories, Inc.
NASDAQ    	CPBC                	COMMUNITY PARTNERS B
TSE       	KER.UN.TO           	Ketch Resources Trust
NYSE      	AAP                 	ADVANCE AUTO PARTS INC
NYSE      	DA                  	GROUPE DANONE
AMEX      	WLB                 	Westmoreland Coal Company
NASDAQ    	FTGX                	Fibernet Telecom Group, Inc.
TSE       	CGI.PR.A.TO         	Canadian General Inv 5.40% A
NASDAQ    	HDTV                	SpatiaLight, Inc.
NYSE      	NPY                 	Nuveen Pennsylvania Premium Income Municipal Fund II
NYSE      	ARW                 	Arrow Electronics, Inc.
NASDAQ    	JXSB                	Jacksonville Bancorp Inc.
NASDAQ    	SBNY                	Signature Bank
TSE       	TTN.B.TO            	Titan Exploration Ltd Cl B
NYSE      	ZMH                 	Zimmer Holdings, Inc.
AMEX      	VHT                 	Vanguard Health Care VIPERs
NYSE      	IJR                 	iShares S&P Small Cap 600
NASDAQ    	BRLC                	Brillian Corporation
NYSE      	LNX                 	LENOX GROUP INC
TSE       	DPM.TO              	Dundee Precious Metals Inc
NYSE      	GNI                 	Great Northern Iron Ore Properties
NYSE      	ALZ                 	ALABAMA POWER COMPANY
TSE       	EFL.TO              	Electrovaya Inc
INDEX     	RMZ                 	THE MSCI REIT INDEX
NASDAQ    	PEET                	Peet's Coffee & Tea, Inc.
INDEX     	DRO                 	AMEX PHARMACEUTICAL INDEX FINAL
NASDAQ    	PRSC                	The Providence Service Corporation
NYSE      	RT                  	Ryerson Tull, Inc.
NASDAQ    	CRIS                	Curis, Inc.
NYSE      	VLT                 	Van Kampen High Income Corporate Bond Fund
NYSE      	MKE                 	MSDW Structured Asset Cp
NASDAQ    	KTCC                	Key Tronic Corporation
NASDAQ    	BBSI                	Barrett Business Services, Inc.
NASDAQ    	ICGE                	Internet Capital Group, Inc.
NASDAQ    	STKL                	SunOpta, Inc.
TSE       	GNM.TO              	General Minerals Cp
TSE       	GVC.TO              	Glacier Ventures International
NASDAQ    	GNCMA               	General Communication, Inc.
NYSE      	PPB                 	Merrill Lynch Depositor, Inc.
AMEX      	ECC                 	MORGAN STANLEY
NASDAQ    	UHCPC               	UNITED HERITAGE CORP
TSE       	REI.UN.TO           	Riocan REIT Uts
NASDAQ    	VSCI                	Vision-Sciences, Inc.
NASDAQ    	GLDB                	Gold Banc Corporation, Inc.
NASDAQ    	PPBI                	Pacific Premier Bancorp Inc
NYSE      	PCK                 	Pimco California Municipal Income Fund II
NYSE      	PBR.A               	PETROLEO BRASILEIRO SA PETRO
AMEX      	HTI                 	Halozyme Therapeutics, Inc.
NASDAQ    	NAVI                	NaviSite, Inc.
NYSE      	CHA                 	China Telecom Corp Ltd
NASDAQ    	DRIV                	Digital River, Inc.
TSE       	CF.UN.TO            	Calpine Power Income Tr Unit
TSE       	MTF.UN.TO           	MBC Adjustable Rate Income
NASDAQ    	MANU                	Manugistics Group, Inc.
TSE       	PGF.A.TO            	Pengrowth Energy Tr Units A
NYSE      	NBD                 	NB Capital Corporation
AMEX      	SPU                 	Citigroup Global Markets Holdings Inc
TSE       	NII.TO              	Norsat International Inc
NASDAQ    	ECLP                	Eclipsys Corporation
NYSE      	NQI                 	Nuveen Insured Quality Municipal Fund, Inc.
NASDAQ    	TGEND               	TARGETED GENETICS CP
NYSE      	TEM                 	Telefonica Moviles S.A.
AMEX      	CVF                 	Castle Convertible Fund, Inc.
NYSE      	WGR                 	Western Gas Resources, Inc.
TSE       	N.TO                	Inco Ltd
NYSE      	KV.A                	K-V Pharmaceutical Company
NYSE      	GAH                 	Georgia Power Company
NASDAQ    	WLSN                	Wilsons The Leather Experts Inc.
NYSE      	ACO                 	Amcol International Corporation
TSE       	MGL.TO              	Moto Goldmines
AMEX      	TGB                 	Taseko Mines
NYSE      	HGM                 	General Motors Corporation 7.375 10/01/2051
NASDAQ    	MSTRW               	MicroStrategy Incorporated
NYSE      	KCX                 	Lehman ABS Corporation
NYSE      	FCE.A               	Forest City Enterprises Inc
TSE       	STE.B.TO            	Stelco Inc Cl B
NYSE      	CPE                 	Callon Petroleum Company
NASDAQ    	FCBP                	First Community Bancorp
TSE       	HAE.TO              	Haemacure Cp
NASDAQ    	FWRD                	Forward Air Corporation
NASDAQ    	FMDAY               	Futuremedia Public Company
TSE       	GLH.UN.TO           	Great Lakes Hydro Income Unit
AMEX      	DSI                 	Merrill Lynch & Co., Inc.
AMEX      	CTU                 	Chad Therapeutics, Inc.
AMEX      	MCZ                 	Mad Catz Interactive Inc
AMEX      	CMQ                 	Equidyne Corporation
NASDAQ    	ICCI                	Insight Communications Company, Inc.
NASDAQ    	UFMC                	United Financial Mortgage Corporation
NASDAQ    	BDMS                	Birner Dental Management Services, Inc.
INDEX     	ILJ                 	Dynamic Mid Cp Gr Intellidex
NYSE      	CGD                 	Lehman ABS Corporation
NASDAQ    	EMIS                	Emisphere Technologies, Inc.
AMEX      	FSN.W               	FUSION TELECOM WTS
NYSE      	JRO                 	Nuveen Floating Rate Income Opportuntiy Fund
NASDAQ    	ABRI                	Abrams Industries, Inc.
NYSE      	ETG                 	Eaton Vance Tax-Advantaged Global Dividend Income Fund
NASDAQ    	GORX                	GeoPharma, Inc.
NASDAQ    	SNDS                	Sands Regent (The)
NASDAQ    	GSBCP               	Great Southern Bancorp, Inc.
AMEX      	CFK                 	CE Franklin Ltd.
NYSE      	AMF                 	ACM Managed Income Fund, Inc.
NASDAQ    	MTSL                	MER Telemanagement Solutions Ltd.
NASDAQ    	AMBK                	American Bank Inc
NYSE      	SGL                 	Strategic Global Income Fund, Inc.
NYSE      	FCT                 	First Trust Four Corners Senior
NASDAQ    	FADV                	First Advantage Corporation
NYSE      	CLC                 	CLARCOR Inc.
NASDAQ    	PTEN                	Patterson-UTI Energy, Inc.
NYSE      	SF                  	Stifel Financial Corporation
NASDAQ    	ADVNB               	ADVANTA Corp.
NYSE      	NAB                 	National Australia Bank
NYSE      	HTV                 	Hearst-Argyle Television, Inc.
NYSE      	CPT                 	Camden Property Trust
NASDAQ    	CCUR                	Concurrent Computer Corporation
AMEX      	HCO                 	HyperSpace Communications
NASDAQ    	BSXT                	BOE Financial Services of Virginia Inc.
AMEX      	MVF                 	MuniVest Fund, Inc.
NYSE      	NL                  	NL Industries, Inc.
INDEX     	FHB                 	ISH MTR MD VL
NASDAQ    	ETWCW               	ETRIALS WORLDWIDE
NYSE      	WTR                 	Aqua America, Inc.
NASDAQ    	MNTG                	MTR Gaming Group, Inc.
NASDAQ    	SSYS                	Stratasys, Inc.
NASDAQ    	POSH                	BABYUNIVERSE INC.
INDEX     	JDK                 	OWERSHARES ZACKS SMALL CAP PORT
TSE       	BAO.UN.TO           	Brascan Adjustable Rate Trust I
NASDAQ    	CSBK                	Clifton Savings Bancorp, Inc.
NASDAQ    	PTEK                	PTEK Holdings, Inc.
NASDAQ    	NCOG                	NCO Group, Inc.
TSE       	SIA.UN.TO           	Skylon International Adv B
NASDAQ    	BEXP                	Brigham Exploration Company
NASDAQ    	VECO                	Veeco Instruments Inc.
TSE       	SWS.UN.TO           	Swiss Water Decaf Coffee Fund
NYSE      	CIT                 	CIT Group Inc (DEL)
NYSE      	DCS                 	Dreman/Claymore Dividend & Income Fund
NYSE      	AMP                 	AMERIPRISE FINANCIAL INC.
NASDAQ    	CDWC                	CDW Corporation
INDEX     	PBM                 	PHARMACEUTICAL COMPANIES PLUS B
AMEX      	IYZ                 	iShares Dow Jones U.S. Telecommunications Index Fund
NYSE      	MTG                 	MGIC Investment Corporation
NYSE      	PGP                 	Pimco Global Stocksplus & Income Fund
NYSE      	AKO.A               	Embotelladora Andina S.A.
AMEX      	VIR                 	Virco Manufacturing Corporation
AMEX      	MDJ                 	Merrill Lynch & Co., Inc.
AMEX      	ILF                 	iShares S&P Latin America 40 Index Fund
NYSE      	PAC                 	GRUPO AEROPORTUARIO DEL PACIFI
TSE       	PMT.UN.TO           	Paramount Energy Trust Units
NYSE      	MFW                 	M&F Worldwide Corporation
NASDAQ    	FMTI                	Forbes Medi-Tech Inc.
NASDAQ    	FLYI                	FLYi, Inc.
NYSE      	ATG.P               	A G L RESOURCES INC PFD
NYSE      	HSP                 	HOSPIRA INC
NASDAQ    	LPMA                	Lipman Electronic Engineering Ltd.
AMEX      	COQ                 	7.5% SPARQS LINKED TO COACH I
NASDAQ    	TRLG                	True Religion Apparel, Inc.
NASDAQ    	LTEC                	LOUD TECHNOLOGS
NASDAQ    	NOVN                	Noven Pharmaceuticals, Inc.
NYSE      	PBT                 	Permian Basin Royalty Trust
TSE       	SZG.UN.TO           	Sceptre Income & Growth Trust
AMEX      	AOM                 	ANORMED INC
TSE       	POW.PR.C.TO         	Power Cp Of Canada 5.8% Pfd C
TSE       	NFI.UN.TO           	New Flyer Industries Inc
TSE       	FPL.TO              	FPI Ltd
NASDAQ    	SRCEO               	1st Source Corporation
AMEX      	DSZ                 	Merrill Lynch & Co., Inc.
INDEX     	HGX                 	Phlx Hsg Sector Index
AMEX      	EVY                 	Eaton Vance New York Municipal Income Trust
NYSE      	TGS                 	Transportadora de Gas del Sur SA TGS
AMEX      	SCU                 	STORM CAT ENERGY CP
NASDAQ    	CDMS                	Cadmus Communications Corporation
AMEX      	PTS                 	Citigroup Global Funding
TSE       	TAY.UN.TO           	Taylor NGL LP Uts
NYSE      	TNT                 	A.O. Tatneft
NYSE      	CNA                 	CNA Financial Corporation
INDEX     	RUA                 	Russell 3000 Index
NASDAQ    	ANIK                	Anika Therapeutics Inc.
NYSE      	PSA                 	Public Storage, Inc.
AMEX      	TCY                 	Targets Trust XX
NASDAQ    	SIVB                	SVB Financial Group
NASDAQ    	CTBK                	City Bank
NASDAQ    	BVEW                	Bindview Development Corporation
NYSE      	BE                  	BEARINGPOINT INC
TSE       	DAX.TO              	Draxis Health Inc
NYSE      	TUP                 	Tupperware Corporation
TSE       	SSF.UN.TO           	FIDAC US Mortgage Trust
INDEX     	HWB                 	POWERSHARES DYNAMIC MID CAP VAL
NASDAQ    	FREEZ               	FREESEAS INC
NYSE      	FUL                 	H. B. Fuller Company
TSE       	SIS.TO              	Savaria Cp
NASDAQ    	CNCP                	CAROLINA NATIONAL
NYSE      	BLH                 	Blackrock New York Municipal 2018 Term Trust
AMEX      	PRH                 	VitaCube Systems Holdings, Inc.
NASDAQ    	DRLPE               	Doral Financial Corporation
NASDAQ    	SPAN                	Span-America Medical Systems, Inc.
AMEX      	SYP                 	Citigroup Global Markets Holdings Inc
NYSE      	MEG                 	Media General, Inc.
AMEX      	EEC                 	MORGAN STANLEY
NYSE      	WYE.P               	WYETH PFD 2.00
NASDAQ    	NTLI                	NTL Incorporated
NASDAQ    	SCVL                	Shoe Carnival, Inc.
NASDAQ    	RMTR                	Ramtron International Corporation
NYSE      	JSN                 	Nuveen Equity Premium Opportunity Fund
NASDAQ    	PFCO                	PAULA Financial
INDEX     	HKZ                 	POWERSHARES DYN TELE & WIRELESS
TSE       	CEK.TO              	Caspian Energy Inc
NYSE      	DDF                 	Delaware Investments Dividend & Income Fund, Inc.
INDEX     	MXV                 	SPDR S&P Midcap 400
AMEX      	CBN                 	Cornerstone Bancorp, Inc.
NASDAQ    	DISH                	EchoStar Communications Corporation
INDEX     	NLG                 	iShares S&P Europe 350 Index
TSE       	BPO.PR.J.TO         	Brookfield Props AAA Pfd J
NYSE      	PIA                 	MS Municipal Premium Income Trust
NYSE      	ARI                 	Arden Realty, Inc.
INDEX     	DOWV                	TREASURIES IDX
TSE       	PNP.TO              	Pinetree Capital Ltd
NYSE      	NCO                 	Nuveen California Municipal Market Opportunity Fund, Inc.
NYSE      	NGT                 	Eastern American Natural Gas Trust
NASDAQ    	EEEI                	Electro Energy Inc.
NYSE      	AIG                 	American International Group, Inc.
NASDAQ    	NPBC                	National Penn Bancshares, Inc.
NYSE      	GLP                 	GLOBAL PARTNERS LP
NASDAQ    	CHTR                	Charter Communications, Inc.
NASDAQ    	ACLS                	Axcelis Technologies, Inc.
NYSE      	ISH.P               	INTL SHIPHOLDING CRP
NYSE      	DRS                 	DRS Technologies, Inc.
NYSE      	JJZ                 	U.S.0 Industries, Inc.
AMEX      	LCI                 	Lannett Co Inc
NASDAQ    	EUBK                	EuroBancshares, Inc.
NYSE      	TNC                 	Tennant Company
NYSE      	BGM                 	General Motors Corporation
NYSE      	FRA                 	Floating Rate Income Strategies Fund Inc
NASDAQ    	UFCS                	United Fire & Casualty Company
NYSE      	NZT                 	Telecom Corporation
NYSE      	BBW                 	Build-A-Bear Workshop, Inc.
NYSE      	BFZ                 	BlackRock California Municipal Income Trust
NASDAQ    	VRLK                	Verilink Corporation
NYSE      	HYI                 	High Yield Income Fund, Inc. (The)
AMEX      	NGO                 	Nuveen Connecticut Dividend Advantage Municipal Fund 3
TSE       	GIN.TO              	Glendale International Cp
INDEX     	DIB                 	INDICATIVE NET ENT VAL FOR 8% T
NYSE      	LEE                 	Lee Enterprises, Incorporated
INDEX     	RPE                 	AMEX Elec Pwr&Nat Gas Infrastr
INDEX     	XSV                 	AMEX ITITUTIONAL INDEX OPEN S
NASDAQ    	CLMT                	CALUMET SPECIALTY PR
NYSE      	CIG                 	Comp En De Mn Cemig ADS
NASDAQ    	VRYA                	ViryaNet Ltd.
TSE       	DT.TO               	Diamond Tree Energy Ltd
TSE       	TCA.PR.Y.TO         	Transcan Pipelines Ltd Pfd Y
NASDAQ    	RMIX                	U.S. Concrete, Inc.
TSE       	PJC.SV.A.TO         	Jean Coutu Group Cl A
AMEX      	EMG                 	streetTRACKS DJ Wilshire Mid Cap Growth
NASDAQ    	SURW                	SureWest Communications
NASDAQ    	DMRC                	Digimarc Corporation
NASDAQ    	PRSP                	Prosperity Bancshares, Inc.
TSE       	MN.TO               	March Networks Cp
AMEX      	DRY                 	Coinmach Service Corp.
TSE       	VIA.TO              	Virginia Gold Mines Inc
AMEX      	AIS                 	Antares Pharma, Inc.
NYSE      	EXP.B               	EAGLE MATERIALS INC
NASDAQ    	ZOLT                	Zoltek Companies, Inc.
NYSE      	MGS                 	MetroGas, S.A.
NASDAQ    	RVSN                	RADVision Ltd.
NASDAQ    	OMTL                	Omtool, Ltd.
NASDAQ    	MTLK                	Metalink, Ltd.
NYSE      	MUH                 	MuniHoldings Fund II, Inc.
TSE       	PRG.UN.TO           	Pro-Vest Growth & Income Fd
TSE       	BZM.TO              	BrazMin Corp
NYSE      	ICA                 	Empresas Ica Soc Contrladora
NASDAQ    	ASGR                	America Service Group Inc.
NASDAQ    	SMHG                	Sanders Morris Harris Group, Inc.
TSE       	FTN.TO              	Financial 15 Split Cp A
AMEX      	PMK                 	PMA Capital Corporation
NASDAQ    	FORG                	Forgent Networks Inc
NYSE      	XNR                 	Xanser Corporation
NASDAQ    	QUIX                	Quixote Corporation
NASDAQ    	ALAN                	Alanco Technologies Inc.
NYSE      	SKO                 	ShopKo Stores, Inc.
NYSE      	MWR                 	Morgan Stanley Cap Tr III
NASDAQ    	CYTC                	Cytyc Corporation
NASDAQ    	TTWO                	Take-Two Interactive Software, Inc.
TSE       	IVN.TO              	Ivanhoe Mines Ltd
NYSE      	VGM                 	Van Kampen Trust for Investment Grade Municipals
NASDAQ    	BRBI                	Blue River Bancshares, Inc.
TSE       	AUR.TO              	AUR Resources Inc
NYSE      	CNC                 	Centene Corporation
NYSE      	GUT                 	Gabelli Utility Trust (The)
NASDAQ    	TRID                	Trident Microsystems, Inc.
TSE       	DLX.TO              	Dual Exploration Inc
NASDAQ    	RCRC                	RC2 Corporation
NASDAQ    	CTCH                	Commtouch Software Ltd.
NYSE      	AKH.W               	AIR FRN WARRANTS
NYSE      	EFV                 	iShares MSCI EAFE Value Index
INDEX     	JDV                 	POWERSHARES VL TIMELINESS SEL T
NASDAQ    	EDAP                	EDAP TMS S.A.
TSE       	STE.A.TO            	Stelco Inc Cl A
INDEX     	HKI                 	POWERSHARES DYNAMIC IURANCE
TSE       	VUE.TO              	Vivendi Universal Exchange Co
INDEX     	NNYI                	INTERNATIONAL 100
AMEX      	XWG                 	Wireless Xcessories Group Inc
NYSE      	GPK                 	Graphic Packaging International Corporation
NASDAQ    	PMACA               	PMA Capital Corporation
NYSE      	SFD                 	Smithfield Foods, Inc.
NASDAQ    	GMTC                	GameTech International, Inc.
NYSE      	JCC                 	Jilin Chemical Industrial Company, Ltd.
TSE       	GSV.UN.TO           	Aberdeen G7 Trust
NASDAQ    	CLWT                	Euro Tech Holdings Company
NYSE      	CWG                 	CanWest Global Communications Corporation
NYSE      	FDS                 	FactSet Research Systems Inc.
NASDAQ    	CCDC                	Concorde Career Colleges, Inc.
TSE       	MDA.TO              	MacDonald Dettwiler & Assoc
NYSE      	MWO                 	Morgan Stanley Cap Tr V
NASDAQ    	VDSI                	VASCO Data Security International, Inc.
NYSE      	FRZ                 	Reddy Ice Holdings, Inc.
NYSE      	HLT                 	Hilton Hotels Corporation
TSE       	ATY.TO              	ATI Technologies Inc
TSE       	IIC.LV.TO           	ING Canada Inc Ltd
NASDAQ    	NINE                	Ninetowns Digital World Trade Holdings
NYSE      	BBF                 	BlackRock Florida Municipal Income Trust
NASDAQ    	IRSN                	Irvine Sensors Corporation
AMEX      	OEF                 	iShares S&P 100 Index Fund
TSE       	CXN.TO              	Chamaelo Exploration Ltd
NASDAQ    	OSHC                	Ocean Shore Holding Co.
NYSE      	STO                 	STATOIL ASA
NYSE      	BLW                 	Blackrock Duration Income Trust
AMEX      	FOL                 	MORGAN STANLEY
NASDAQ    	KOSS                	Koss Corporation
NYSE      	SMI                 	Semiconductor  Manufacturing International Corporation
NYSE      	SPM                 	Spirent plc
NYSE      	GBM                 	General Motors Corporation Ser B Conv Sr Dbs due 2032
AMEX      	BDR                 	Blonder Tongue Laboratories, Inc.
TSE       	NCX.TO              	Nova Chemicals Cp
NYSE      	SPA                 	Sparton Corporation
TSE       	RPA.PR.A.TO         	ROC Pref II Cp Pfd
AMEX      	MDY                 	SPDR S&P 400
NASDAQ    	HRZB                	Horizon Financial Corp.
INDEX     	JPV                 	AMEX JAPAN INDEX FINAL SETTLEME
AMEX      	TQ                  	Cash Technologies, Inc.
NASDAQ    	SEAC                	SeaChange International, Inc.
NYSE      	RHA                 	Rhodia SA
INDEX     	EKI                 	Europe 2001 Holdrs Index
TSE       	MGN.TO              	Magnotta Winery Cp
TSE       	ESL.TO              	Enghouse Systems Ltd
TSE       	NQL.TO              	NQL Energy Services Inc
NASDAQ    	CADA                	CAM Commerce Solutions, Inc.
AMEX      	RIF                 	AEW Real Estate Income Fund
NASDAQ    	INFY                	Infosys Technologies
NASDAQ    	IWOV                	Interwoven, Inc.
NYSE      	JBD                 	Lehman ABS Corporation 6.00% Bell South
NYSE      	KVJ                 	Lehman ABS Corporation
NYSE      	VPI                 	Vintage Petroleum, Inc.
NASDAQ    	TRCR                	Transcend Services, Inc.
NASDAQ    	ADSX                	Applied Digital Solutions, Inc.
NASDAQ    	ABNJ                	AMERICAN BANCORP NJ
NYSE      	OFC                 	Corporate Office Properties Trust
NYSE      	SCX                 	L.S. Starrett Company (The)
NYSE      	TSU                 	Tele Celular Sul Participacoes S.A.
NASDAQ    	ACTI                	ActivCard Corporation
NASDAQ    	HAXS                	HealthAxis Inc.
TSE       	ECH.TO              	Enerchem International Inc
NASDAQ    	ATVI                	Activision, Inc.
NASDAQ    	VTEK                	Vodavi Technology, Inc.
TSE       	PIF.DB.TO           	Pembina Pipeline Income Debs
NYSE      	THC                 	Tenet Healthcare Corporation
NASDAQ    	TUES                	Tuesday Morning Corp.
NASDAQ    	KTEC                	Key Technology, Inc.
NASDAQ    	CLCT                	Collectors Universe, Inc.
INDEX     	XMI                 	AMEX Major Market Index
AMEX      	DVW                 	Covad Communications Group, Inc.
NYSE      	GIL                 	Gildan Activewear, Inc.
NASDAQ    	COMS                	3Com Corporation
NYSE      	AMU                 	ACM Municipal Securities Income Fund
NASDAQ    	TICC                	Technology Investment Capital Corp.
NASDAQ    	MTIX                	Micro Therapeutics, Inc.
NYSE      	EPL                 	Energy Partners, Ltd.
NASDAQ    	CYMI                	Cymer, Inc.
TSE       	GWO.PR.X.TO         	Great West Lifeco Inc Pfd E
INDEX     	OXH                 	Oil Service Holdrs Index
NASDAQ    	AMEN                	AMEN Properties Inc.
NASDAQ    	MROE                	Monroe Bancorp
NASDAQ    	POCC                	Penn Octane Corporation
TSE       	BCE.PR.S.TO         	BCE Inc Pfd S
NASDAQ    	SCOND               	SUPERCONDUCTOR TEC
NASDAQ    	CASY                	Casey's General Stores, Inc.
NASDAQ    	AETH                	Aether Holdings, Inc.
NASDAQ    	CGTK                	Corgentech Inc.
NASDAQ    	SIEB                	Siebert Financial Corp.
TSE       	GZM.UN.TO           	Gaz Metro Ltd Partnership
NASDAQ    	MSPD                	Mindspeed Technologies, Inc.
NASDAQ    	RESP                	Respironics, Inc.
NYSE      	NRY                 	National Rural Utilities Cooperative Finance Corp
AMEX      	LIV                 	SAMARITAN PHARMACEUTICALS
NYSE      	PAS                 	Whitman Corporation
NASDAQ    	GLGS                	GlycoGenesys Inc.
NASDAQ    	IKNX                	Ikonics Corporation
NYSE      	CRM                 	Salesforce.com Inc
TSE       	LSG.TO              	Lake Shore Gold Corp
INDEX     	ADVA                	AMEX Advances
NASDAQ    	SSCCP               	Smurfit-Stone Container Corporation
NASDAQ    	SKYE                	SkyePharma PLC
NYSE      	PMB.P               	PREMIER CAPITAL TRUST I PFD
TSE       	TBL.UN.TO           	Taiga Forest Products Ltd
NYSE      	RFI                 	Cohen & Steers Total Return Realty Fund, Inc.
NASDAQ    	PGIC                	Mikohn Gaming Corporation
NYSE      	AOF                 	ACM Government Opportunity Fund
AMEX      	IYK                 	iShares Dow Jones U.S. Consumer Goods Index Fund
NASDAQ    	NRIM                	Northrim BanCorp Inc
AMEX      	BLD                 	Baldwin Technology Company, Inc.
TSE       	ORB.TO              	Orbus Pharma Inc
NASDAQ    	EMKR                	EMCORE Corporation
NASDAQ    	ISWI                	Interactive Systems Worldwide Inc.
NASDAQ    	MVCO                	Meadow Valley Corporation
AMEX      	EUM                 	Merrill Lynch & Co., Inc.
NASDAQ    	PETS                	PetMed Express, Inc.
NYSE      	NTL                 	Nortel Inversora SA, ADR
NASDAQ    	TECH                	Techne Corporation
NYSE      	CCT                 	Lehman ABS Corporation
TSE       	RP.TO               	RPM Tech Inc
NYSE      	SWM                 	Schweitzer-Mauduit International, Inc.
TSE       	BDY.TO              	Brazilian Diamonds Ltd
NASDAQ    	TALK                	Talk America Holdings Inc.
NASDAQ    	NHTB                	New Hampshire Thrift Bancshares, Inc.
NYSE      	TMK                 	Torchmark Corporation
NYSE      	PJI                 	Merrill Lynch Depositor Inc
AMEX      	AQR.W               	ACQUICOR TECH WTS
AMEX      	IYF                 	iShares Dow Jones U.S. Financials Index Fund
NYSE      	N                   	Inco Ltd.
INDEX     	IPSA                	IPSA - Chile
NASDAQ    	HTLF                	Heartland Financial USA, Inc.
TSE       	IE.U.TO             	Ivanhoe Energy Inc US$
AMEX      	CVU                 	CPI Aerostructures, Inc.
NYSE      	CCC                 	Calgon Carbon Corporation
TSE       	CM.PR.C.TO          	Cdn Imperial Bank Srs 25 Pfd
NYSE      	VNT                 	Compania Anonima Nacional Telefonos de Venezuela
NASDAQ    	UTMD                	Utah Medical Products, Inc.
NYSE      	AKT                 	Ambac Financial Group, Inc.
AMEX      	PQU                 	Citigroup Global Mkts Nasdaq-100
NYSE      	ASI                 	American Safety Insurance Holdings, Ltd.
NYSE      	BT                  	BT GROUP PLC
NASDAQ    	STMP                	Stamps.com Inc.
INDEX     	BPI                 	Biotech-Pharmaceutical Index
NYSE      	VDM                 	Van Der Moolen Holding NV
NYSE      	BAM                 	BRASCAN CORPORATION
NYSE      	NHI                 	National Health Investors, Inc.
NASDAQ    	CTDC                	CHINA DEV GRP CORP
NYSE      	MVL                 	Marvel Enterprises, Inc.
TSE       	ALE.TO              	Sleeman Breweries Ltd
AMEX      	IPA                 	Interpharm Holdings Inc.
NASDAQ    	ZVZZT               	TEST ZVZZT
NYSE      	APD                 	Air Products and Chemicals, Inc.
NYSE      	MRF                 	American Income Fund, Inc.
NASDAQ    	FLWS                	1-800 FLOWERS.COM, Inc.
TSE       	CHD.TO              	Chariot Resources Ltd
NASDAQ    	CACB                	Cascade Bancorp
TSE       	PPL.TO              	Prime Rate Plus Corp.
NYSE      	DKC                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	INXI                	INX INC CMN STK
NASDAQ    	PEDH                	Peoples Educational Holdings, Inc.
NASDAQ    	SCSS                	Select Comfort Corporation
AMEX      	IAG                 	Iamgold Corporation
NASDAQ    	ARIA                	ARIAD Pharmaceuticals, Inc.
NYSE      	GIM                 	Templeton Global Income Fund, Inc.
NYSE      	WLK                 	Westlake Chemical Corporation
NYSE      	DKV                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	IYZ                 	iShares Dow Jones US Telecommunications Index
TSE       	IEF.UN.TO           	Innergex Power Income Fund
NYSE      	HIB                 	Hibernia Corporation
AMEX      	WSB                 	Washington Savings Bank, F.S.B. (The)
NYSE      	SNH                 	Senior Housing Properties Trust
AMEX      	IDP                 	HYBRIDON INC
TSE       	HYM.UN.TO           	High Yield & Mortgage Plus Tr
NASDAQ    	COMB                	COMMUNITY BANCSHS DE
NYSE      	KND                 	Kindred Healthcare, Inc.
NYSE      	FAF                 	First American Corporation (The)
NASDAQ    	ARDM                	Aradigm Corporation
TSE       	PEG.TO              	Peregrine Energy Ltd
NASDAQ    	ISCA                	International Speedway Corporation
AMEX      	MLJ                 	Merrill Lynch & Co., Inc.
NASDAQ    	FNLC                	First National Lincoln Corporation
NYSE      	DAB                 	Dave & Buster's, Inc.
NASDAQ    	IKAN                	IKANOS COMMUNICATION
NASDAQ    	RJET                	Republic Airways Holdings, Inc.
TSE       	GTU.U.TO            	Central Gold Trust US$
INDEX     	SJF                 	ISH MSCI TAIWAN
NASDAQ    	CCPCO               	Capital Crossing Preferred Corporation
NYSE      	TKA                 	TELEKOM AUSTRIA AG
NYSE      	TIP                 	iShares Lehman TIPS Bond Fund
INDEX     	YIH                 	Internet Infrastructure Holders
NASDAQ    	SHLD                	Sears Holdings Corporation
TSE       	GCE.TO              	Grande Cache Coal Cp
AMEX      	SBK                 	SUN AMERICAN BANCORP
NYSE      	PSO                 	Pearson, Plc
NYSE      	COF                 	Capital One Financial Corporation
TSE       	ANP.U.TO            	Angiotech Pharmaceuticals US$
AMEX      	SMU                 	Citigroup Global Markets
NYSE      	SEO                 	Stora Enso Oyj
TSE       	TL.TO               	TEAL Exploration & Mining Inc
INDEX     	JYV                 	ISHR FTSE/XINHUA
AMEX      	FSP                 	Franklin Street Properties Corp.
NASDAQ    	TRBM                	TERABEAM INC
NASDAQ    	STEN                	STEN Corporation
NYSE      	PCG                 	Pacific Gas & Electric Co.
TSE       	WJX.UN.TO           	Wajax Income Fund
NYSE      	LCC                 	US AIRWAYS GROUP INC.
NYSE      	KWK                 	Quicksilver Resources Inc.
TSE       	ITP.TO              	Intertape Polymer Group Inc
NASDAQ    	HSIC                	Henry Schein, Inc.
NYSE      	PER                 	Perot Systems Corporation
NYSE      	MJF                 	MSDW Structured Asset Corporation
TSE       	SKA.UN.TO           	Skylon All Asset Trust
NASDAQ    	GSOL                	Global Sources Ltd.
AMEX      	HOM                 	Home Solutions of America, Inc.
AMEX      	TTE                 	Citigroup Global Markets Holdings Inc
NASDAQ    	CANI                	Carreker Corporation
TSE       	BPO.PR.H.TO         	Brookfield Props AAA Pfd H
NYSE      	EGF                 	ENHANCED GOVERNMENT FUND INC
NYSE      	HRZ                 	HORIZON LINES INC.
TSE       	NIO.TO              	Niocan Inc
NYSE      	IDU                 	iShares Dow Jones US Utilities Index
TSE       	BSD.PR.A.TO         	Brascan Soundvest Split Tr Pfd
TSE       	ENM.TO              	Energem Resources Inc
TSE       	AEI.TO              	Arsenal Energy Inc
NYSE      	JOR                 	Earle M. Jorgensen company
NYSE      	CYH                 	Community Health Systems, Inc.
NASDAQ    	KEQU                	Kewaunee Scientific Corporation
NYSE      	CFR                 	Cullen/Frost Bankers, Inc.
TSE       	XCL.TO              	X-CAL Resources Ltd
INDEX     	SPUTL               	SP500 Utilities Sector
AMEX      	PBS                 	PowerShares Dynamic Media
TSE       	RCC.TO              	Rockwater Capital Cp
NASDAQ    	PMTR                	Pemstar Inc.
TSE       	MUN.TO              	Mundoro Mining Inc
NYSE      	POH                 	Public Service Company of Oklahoma
NASDAQ    	ATYT                	ATI Technologies Inc.
NASDAQ    	LPTH                	LightPath Technologies, Inc.
NASDAQ    	VOLVY               	AB Volvo
NASDAQ    	USAK                	USA Truck, Inc.
NYSE      	JZR                 	Lehman ABS Corporation
NYSE      	THO                 	Thor Industries, Inc.
NYSE      	DP                  	Diagnostic Products Corporation
NYSE      	ECA                 	Encana Corporation
TSE       	OTC.TO              	Open Text Cp
NASDAQ    	ADAM                	A.D.A.M. Inc.
TSE       	POS.TO              	Producers Oilfield Services
AMEX      	NXM                 	Nuveen Pennsylvania Dividend Advantage Municipal Fund
NASDAQ    	FFBI                	First Federal Bancshares, Inc.
AMEX      	FRN                 	Friendly Ice Cream Corporation
NASDAQ    	EPMD                	EP MedSystems, Inc.
TSE       	FT.TO               	Fortune Minerals Ltd
AMEX      	MEM                 	MCF Corporation
AMEX      	MPP                 	Medical Technology Systems, Inc.
NASDAQ    	ICTS                	ICTS International N.V.
NYSE      	FMD                 	First Marblehead Corporation (The)
NASDAQ    	GRIFE               	GRIFFIN LAND NURS
NYSE      	AV                  	Avaya Inc.
TSE       	SQE.UN.TO           	Sequioa Oil & Gas Trust
NYSE      	CEO                 	CNOOC
TSE       	MVG.TO              	Metallic Ventures Gold Inc
NYSE      	HAR                 	Harman International Industries, Incorporated
NYSE      	OMI                 	Owens & Minor, Inc.
NASDAQ    	ERIE                	Erie Indemnity Company
NASDAQ    	NUAN                	Nuance Communications, Inc.
NASDAQ    	FLML                	Flamel Technologies S.A.
NYSE      	ICE                 	INTERCONTINENTALEXCHANGE INC
TSE       	MRD.TO              	Melcor Developments Ltd
NYSE      	JHP                 	Nuveen Quality Preferred Income Fund 3
NYSE      	VAP                 	Van Kampen Advantage Pennsylvania Municipal Income
NASDAQ    	TIBB                	TIB Financial Corporation
NASDAQ    	MPWR                	Monolithic Power Systems, Inc.
NYSE      	LEN.B               	LENNAR CORP
TSE       	ES.TO               	Energy Split Cp Cap Yield
NASDAQ    	AVCI                	Avici Systems Inc.
NASDAQ    	VSNT                	Versant Corporation
NASDAQ    	CPWM                	Cost Plus, Inc.
NYSE      	EMF                 	Templeton Emerging Markets Fund
NASDAQ    	MARSA               	Marsh Supermarkets, Inc.
NYSE      	ADX                 	Adams Express Company (The)
NYSE      	PCF                 	Putnam High Income Bond Fund
NASDAQ    	TPPH                	Tapestry Pharmaceuticals, Inc.
NYSE      	CU                  	Compania Cervecerias Unidas, S.A.
NASDAQ    	QADI                	QAD Inc.
NASDAQ    	LVLT                	Level 3 Communications, Inc.
NYSE      	FC                  	Franklin Covey Company
NASDAQ    	INGN                	Introgen Therapeutics, Inc.
NYSE      	TXI                 	Texas Industries, Inc.
NASDAQ    	RDEN                	Elizabeth Arden, Inc.
INDEX     	HKX                 	AMEX Hong Kong 30 Index
AMEX      	PDL.A               	Presidential Realty Corporation
AMEX      	AIP                 	American Israeli Paper Mills, Ltd.
NYSE      	SFP                 	Salton, Inc.
NYSE      	PKJ                 	Merrill Lynch Depositor, Inc.
AMEX      	BUN                 	BabyUniverse, Inc.
TSE       	LB.TO               	Laurentian Bank Of Canada
TSE       	YLD.TO              	Split Yield Cp
AMEX      	BMJ                 	BIRKS & MAYORS INC
NYSE      	TRR                 	TRC Companies, Inc.
NASDAQ    	WAYN                	Wayne Savings Bancshares Inc.
NASDAQ    	LOGI                	Logitech International S.A.
TSE       	BPO.TO              	Brookfield Properties Cp
NASDAQ    	GNLBD               	GENELABS TECH INC
NYSE      	IVE                 	iShares S&P 500 Value
NASDAQ    	NCOC                	National Coal Corporation
NASDAQ    	PKTR                	Packeteer, Inc.
NYSE      	PHS                 	PacifiCare Health Systems, Inc.
NYSE      	BAX.P               	BAXTER INTERNATIONAL 7% UNITS
AMEX      	RHR                 	RMR Hospitality and Real Estate Fund
NASDAQ    	TRNI                	Trans-Industries, Inc.
NASDAQ    	RPFG                	Rainier Pacific Financial Group, Inc.
AMEX      	REF                 	Refac
AMEX      	GXY                 	Galaxy Nutritional Foods, Inc.
TSE       	RIC.TO              	Richmont Mines Inc
NASDAQ    	QDEL                	Quidel Corporation
NASDAQ    	IGLD                	Internet Gold Golden Lines Ltd.
NASDAQ    	NVGN                	Novogen
TSE       	TRE.TO              	Sino Forest Cp
NASDAQ    	NEBSD               	NEW ENGLAND BANC[CT]
NASDAQ    	APPA                	AP Pharma, Inc.
NASDAQ    	IPAR                	Inter Parfums, Inc.
NYSE      	KCV                 	Lehman ABS Corporation
NASDAQ    	PLAY                	PortalPlayer, Inc.
NYSE      	TDF                 	Templeton Dragon Fund, Inc.
NYSE      	AGO                 	ASSURED GUARANTY LTD
NYSE      	WPZ                 	Williams Partners L.P.
NASDAQ    	FLEX                	Flextronics International Ltd.
NASDAQ    	ARTG                	Art Technology Group, Inc.
AMEX      	DMF                 	Dreyfus Municipal Income, Inc.
AMEX      	NGK                 	Nuveen Connecticut Dividend Advantage Municipal Fund 2
TSE       	FAL.PR.X.TO         	Falconbridge Pfd J1
NASDAQ    	ABGX                	Abgenix, Inc.
NYSE      	XVG                 	Lehman ABS Corporation
NYSE      	TZG                 	Bear Stearns Depositor, Inc. Trust Certificates Series 2001-3
NYSE      	WSO                 	Watsco, Inc.
NASDAQ    	CPHD                	CEPHEID
NASDAQ    	SIRF                	SiRF Technology Holdings, Inc.
NASDAQ    	CHIC                	Charlotte Russe Holding, Inc.
NASDAQ    	PNRA                	Panera Bread Company
AMEX      	EFC                 	EFC Bancorp, Inc.
AMEX      	LIC                 	Lynch Interactive Corporation
NASDAQ    	EGHT                	8x8 Inc
NASDAQ    	IONA                	IONA Technologies PLC
AMEX      	MBK                 	Morgan Stanley Dean Witter & Co.
NASDAQ    	OAKF                	Oak Hill Financial, Inc.
TSE       	PBN.TO              	Pe Ben Oilfield Services Ltd
NYSE      	NNF                 	Nuveen Insured New York Premium Income Municipal Fund, Inc.
NASDAQ    	MCBC                	Macatawa Bank Corporation
NASDAQ    	HRSH                	Hirsch International Corp.
AMEX      	ABP                 	Abraxas Petroleum Corporation
AMEX      	MFN                 	MineFinders Corp. Ltd.
NYSE      	NTY                 	NBTY, Inc.
NYSE      	KPA                 	Innkeepers USA Trust
NYSE      	JQC                 	Nuveen Preferred and Convertible Income Fund 2
NASDAQ    	CWBC                	Community West Bancshares
AMEX      	EMJ                 	Eaton Vance Insured New Jersey Municipal Bond Fund
NASDAQ    	IMOS                	ChipMOS TECHNOLOGIES (Bermuda) LTD.
NYSE      	AAR                 	AMR Corporation
NASDAQ    	TFSM                	24/7 Real Media, Inc.
AMEX      	OZN                 	Orezone Res Inc
NYSE      	GJA                 	Strats Tr for Bellsouth Telecommunications Ctfs
AMEX      	SVA                 	Sinovac Biotech, Ltd.
NYSE      	MYM                 	MuniYield Michigan Insured Fund II, Inc.
NASDAQ    	UARM                	UNDER ARMOUR INC
NASDAQ    	NLCI                	Nobel Learning Communities, Inc.
NYSE      	GBX                 	Greenbrier Companies, Inc. (The)
NASDAQ    	IVOWD               	IVOW INC NEW
NYSE      	JEC                 	Jacobs Engineering Group Inc.
NYSE      	SEE                 	Sealed Air Corporation
NYSE      	RPB                 	REPUBLIC PROPERTY TRUST COMMON
AMEX      	NKB                 	ACCELERATED RETURN NOTES LINKE
NYSE      	HIW                 	Highwoods Properties, Inc.
AMEX      	CH                  	CHILE FUND INC
AMEX      	EWZ                 	iShares MSCI Brazil Index Fund
NASDAQ    	PRLX                	Parlex Corporation
NYSE      	OIB                 	MS Municipal Income Opportunities Trust II
NASDAQ    	ONSM                	Onstream Media Corporation
INDEX     	DWY                 	DYNAMIC TELECOMMUNICATION & WIR
TSE       	PCR.TO              	Peru Copper Inc
NYSE      	AFL                 	AFLAC Incorporated
NYSE      	CRY                 	CryoLife, Inc.
NYSE      	DVY                 	iShares Dow Jones Select Dividend Index Fund
INDEX     	NEX                 	WILDERHILL NEW ENERFY GLOBAL INN
TSE       	INN.DB.TO           	Innvest REIT 9.75% CV Debs
AMEX      	Symbol              	Description
NASDAQ    	SLAB                	Silicon Laboratories, Inc.
INDEX     	NWX                 	AMEX Networking Index
NYSE      	NDN                 	99 CENTS ONLY STORES
INDEX     	NJW                 	iShares Dow Jones U.S. Technology Sector Index
INDEX     	INP                 	iShares MSCI Spain Index - IOPV
AMEX      	VGK                 	Vanguard European VIPERs
NYSE      	MMA                 	Municipal Mortgage & Equity, LLC
NYSE      	WPI                 	Watson Pharmaceuticals, Inc.
NASDAQ    	IFLO                	I-Flow Corporation
NYSE      	SFC                 	Spirit Finance Corporation
NASDAQ    	JCOM                	j2 Global Communications Inc
NYSE      	TEO                 	Telecom Argentina Stet - France Telecom S.A.
TSE       	TTH.TO              	Transition Therapeutics Inc
AMEX      	MIS                 	MORGAN STANLEY
NYSE      	TYY                 	Tortoise Energy Capital Corporation
NASDAQ    	IFSIA               	Interface, Inc.
NASDAQ    	WYNN                	Wynn Resorts,
NASDAQ    	GERN                	Geron Corporation
TSE       	PGX.UN.TO           	Progress Energy Trust Unit
TSE       	CFW.TO              	Calfrac Well Services Ltd
AMEX      	IGC.U               	INDIA GLOBALIZATION CAPITAL I
TSE       	SM.TO               	Seamark Asset Management
NYSE      	IMS                 	MS Insured Municipal Securities
NASDAQ    	ARDMD               	ARADIGM CP
NASDAQ    	ORLY                	O'Reilly Automotive, Inc.
INDEX     	IXE                 	The Energy Select Sector Index
NASDAQ    	SCFSP               	Sovereign Bancorp, Inc.
INDEX     	DWE                 	DYNAMIC ENERGY EXPLORATION & PR
NASDAQ    	HTGCR               	HTGC TRA RIGHTS
INDEX     	XOI                 	AMEX Oil Index
NASDAQ    	SERO                	Serologicals Corporation
NYSE      	FSL                 	Freescale Semiconductor Inc
NYSE      	GAJ                 	Great Atlantic & Pacific Tea Company, Inc. (The)
TSE       	SES.TO              	Saxon Energy Services Inc
TSE       	NGX.U.TO            	Northgate Minerals Cp US$
NASDAQ    	MINI                	Mobile Mini, Inc.
AMEX      	HDY                 	HyperDynamics Corporation
AMEX      	IWD                 	iShares Russell 1000 Value Index Fund
NYSE      	LRT                 	LL&E Royalty Trust
NASDAQ    	JBOH                	JB Oxford Holdings, Inc.
TSE       	VRO.TO              	Vero Energy Inc
NASDAQ    	XTXI                	Crosstex Energy, Inc.
NYSE      	DEX                 	DEX MEDIA, INC.
NASDAQ    	MMUS                	MakeMusic! Inc.
NYSE      	ORB                 	Orbital Sciences Corporation
NYSE      	IHG                 	Intercontinental Hotels Group
INDEX     	KFX                 	KFX - Denmark
TSE       	NMN.UN.TO           	Northwater Market Neutral Tr
TSE       	MSY.TO              	Masters Energy Inc
TSE       	BGO.TO              	Bema Gold Cp
NYSE      	WCC                 	WESCO International, Inc.
NASDAQ    	TMCV                	Temecula Valley Bancorp Inc. (CA)
AMEX      	EET                 	8.40% ELKS BASED UPON THE TEXA
NYSE      	UBS.P               	UBS AG PFD
TSE       	LGF.TO              	Lions Gate Entertainment Cp
NASDAQ    	HAVS                	Havas
TSE       	HPU.TO              	High Plains Uranium Inc
NASDAQ    	SRRR                	Merrill Lynch & Co., Inc.
AMEX      	AMY                 	AmREIT, Inc
NASDAQ    	BJCT                	Bioject Medical Technologies Inc.
NYSE      	KTF                 	Scudder Municiple Income Trust
NASDAQ    	BCSI                	Blue Coat Systems Inc
NASDAQ    	MESA                	Mesa Air Group, Inc.
NYSE      	KFT                 	Kraft Foods Inc.
NASDAQ    	MDST                	Mid-State Bancshares
NYSE      	AAA                 	Asco Plc Ads
AMEX      	DHB                 	DHB Industries Inc
NASDAQ    	EGLE                	Eagle Bulk Shipping Inc.
AMEX      	GNS                 	MORGAN STANLEY
NASDAQ    	DTAS                	Digitas, Inc.
NASDAQ    	ADRD                	BLDRS Developed Markets 100 ADR Index Fund
NYSE      	DEG                 	Etablissements Delhaize Freres et Cie Le Lion S.A.
TSE       	BPF.UN.TO           	Boston Pizza Royalties Income
NASDAQ    	SEGU                	Segue Software, Inc.
AMEX      	CMD                 	Criticare Systems, Inc.
NASDAQ    	LCRD                	LaserCard Corporation
NASDAQ    	DESC                	Distributed Energy Systems Corporation
AMEX      	RUM                 	Todhunter International, Inc.
NYSE      	ATR                 	AptarGroup, Inc.
AMEX      	DSG                 	streetTRACKS Dow Jones U.S. Small Cap Growth Index Fund
NYSE      	EWN                 	iShares MSCI Netherlands
NASDAQ    	WFSL                	Washington Federal, Inc.
NYSE      	GMS                 	General Motors Corporation
TSE       	IVT.TO              	Inventronics
NYSE      	SLW                 	SILVER WHEATON CORP
NASDAQ    	HORT                	Hines Horticulture, Inc.
NYSE      	SWZ                 	Swiss Helvetia Fund, Inc. (The)
NYSE      	GXP                 	GREAT PLAI ENERGY INC
NASDAQ    	LTXX                	LTX Corporation
NASDAQ    	RNDC                	Raindance Communications, Inc.
TSE       	SGL.TO              	Scandinavian Gold Ltd
NYSE      	EEF                 	Enhanced Equity Yield Fund, Inc.
NASDAQ    	EXBD                	Corporate Executive Board Company (The)
NASDAQ    	LINTB               	LIBERTY MED INT B
TSE       	CM.PR.H.TO          	CIBC Cl A Pfd Series 30
TSE       	SGO.TO              	Sepps Gourmet Foods Ltd
TSE       	FMF.UN.TO           	FMF Capital Group Ltd IPS
NYSE      	AVU                 	Vectren Utility Holdings Inc 7.25 Pfd
NASDAQ    	CSGS                	CSG Systems International, Inc.
AMEX      	ASY                 	Elecsys Corporation
NASDAQ    	FILE                	FileNet Corporation
NASDAQ    	ROIA                	Radio One, Inc.
NYSE      	DCQ                 	Walt Disney Company (The)
NYSE      	AIT                 	Applied Industrial Technologies, Inc.
NASDAQ    	FOSL                	Fossil, Inc.
NYSE      	RYG                 	Royal Group Technologies
NYSE      	AMD                 	Advanced Micro Devices, Inc.
TSE       	VAS.TO              	Vasogen Inc
NYSE      	CIA                 	Citizens, Inc.
NYSE      	HXL                 	Hexcel Corporation
NASDAQ    	MFCO                	Microwave Filter Company, Inc.
NASDAQ    	SMMX                	Symyx Technologies, Inc.
NYSE      	AIV                 	Apartment Investment and Management Company
TSE       	BTF.UN.TO           	Brompton Tracker Fund
TSE       	AEN.TO              	Antrim Energy Inc
AMEX      	CRF                 	Cornerstone Strategic Return Fund, Inc. (The)
NYSE      	TFR                 	Tefron Ltd.
NYSE      	PPT                 	Putnam Premier Income Trust
TSE       	DAY.UN.TO           	Daylight Energy Trust Unit
TSE       	ALD.TO              	Aldeavision Inc
AMEX      	VYM                 	Delaware Investments Minnesota Municipal Income Fund III, Inc.
NASDAQ    	DNDN                	Dendreon Corporation
NASDAQ    	SFLK                	SAFLINK Corporation
NYSE      	HKF                 	Hancock Fabrics, Inc.
NASDAQ    	CAPX                	Capital Crossing Bank
NASDAQ    	AIRT                	Air T, Inc.
NYSE      	ELT                 	Elscint
NASDAQ    	DRRX                	Durect Corporation
NYSE      	SKX                 	Skechers U.S.A., Inc.
NYSE      	BJ                  	BJ's Wholesale Club, Inc.
NASDAQ    	JBLU                	JetBlue Airways Corporation
NASDAQ    	VIRL                	Virage Logic Corporation
NASDAQ    	MONEE               	MatrixOne, Inc.
TSE       	ALA.UN.TO           	Altagas Income Trust
NYSE      	STI.P               	SUNTRUST CAPITAL IV TRUST PFD
AMEX      	FPX                 	FIRST TRUST  IPOX
NASDAQ    	HRVE                	Harvey Electronics, Inc.
NASDAQ    	ETWCU               	ETRIALS WORLDWIDE UT
NYSE      	BC                  	Brunswick Corporation
NYSE      	GGB                 	Gerdau S.A.
NASDAQ    	MKTX                	MarketAxess Holdings, Inc.
NYSE      	FR                  	First Industrial Realty Trust, Inc.
NASDAQ    	SUBK                	Suffolk Bancorp
NASDAQ    	NRPH                	New River Pharmaceuticals Inc.
NASDAQ    	CEDC                	Central European Distribution Corporation
NYSE      	NAT                 	Nordic American Tanker Shipping
AMEX      	NKS                 	MITTS LINKED TO THE PERFORMANC
NASDAQ    	MSHLW               	Marshall Edwards, Inc.
NYSE      	JEQ                 	Japan Equity Fund, Inc. (The)
NASDAQ    	PFSL                	Pocahontas Bancorp, Inc.
NYSE      	CBS                 	CBS CORP CL B
NYSE      	ALL                 	Allstate Corporation (The)
NYSE      	CCE                 	Coca-Cola Enterprises, Inc.
NASDAQ    	CRHCY               	CRH PLC
NASDAQ    	AFCO                	Applied Films Corporation
TSE       	CCP.UN.TO           	Connor Clark & Lunn Prints Tr
NYSE      	PBR                 	Petroleo Brasileiro S.A.- Petrobras
NYSE      	CVH                 	Coventry Health Care, Inc.
TSE       	UNC.PR.C.TO         	United Corporations 63 Pfd
AMEX      	HCM                 	Hanover Capital Mortgage Holdings, Inc.
AMEX      	EWL                 	iShares MSCI Switzerland Index Fund
AMEX      	SMC                 	Citigroup Global Markets Holdings Inc
TSE       	MBL.UN.TO           	Montrusco Bolton Income Fd
NASDAQ    	PETD                	Petroleum Development Corporation
NYSE      	RKT                 	Rock-Tenn Company
NYSE      	VVI                 	Viad Corporation
INDEX     	FKM                 	POWERSHARES HI GRWTH RT DVDND A
NASDAQ    	FRCCP               	First Republic Preferred Capital Corporation
NASDAQ    	CKNN                	CASH SYSTEMS INC
NYSE      	PAA                 	Plains All American Pipeline, L.P.
NASDAQ    	CYTR                	CytRx Corporation
NASDAQ    	VRTX                	Vertex Pharmaceuticals Incorporated
NASDAQ    	CPTV                	Captiva Software Corporation
NASDAQ    	ASCA                	Ameristar Casinos, Inc.
NASDAQ    	SVBI                	Severn Bancorp Inc (Md)
NASDAQ    	IAAC                	International Assets Holding Corporation
NYSE      	TNE                 	Tele Norte Leste Participacoes S.A.
INDEX     	NIV                 	iShares Russell Midcap Index Value Fund
NASDAQ    	STRN                	SUTRON CORP
NASDAQ    	NVLS                	Novellus Systems, Inc.
NASDAQ    	HBIO                	Harvard Bioscience, Inc.
NASDAQ    	INTZ                	Intrusion Inc.
NYSE      	LF                  	LEAPFROG ENTERPRISES INC
AMEX      	EAR                 	HearUSA, Inc.
AMEX      	IWB                 	iShares Russell 1000 Index Fund
INDEX     	RTF                 	RUSSELL TOP 50 INDEX
AMEX      	IAH                 	HOLDRS Internet Architecture
TSE       	BMO.PR.H.TO         	Bank Of Montreal Pfd H
NYSE      	TWI                 	Titan International, Inc.
AMEX      	IGM                 	iShares Goldman Sachs Technology Index Fund
NYSE      	NC                  	NACCO Industries, Inc.
TSE       	NMC.TO              	Newmont Mining Cp Of Canada
NYSE      	NAC                 	Nuveen California Dividend Advantage Municipal Fund
TSE       	PKI.UN.TO           	Parkland Income Fund
TSE       	XFN.TO              	iUnits S&P/TSX Financials
NYSE      	KMT                 	Kennametal Inc.
NASDAQ    	DYAX                	Dyax Corp.
NASDAQ    	CRXX                	COMBINATORX
TSE       	EMA.TO              	Emera Inc
TSE       	STY.TO              	Stylus Energy Inc
INDEX     	IDG                 	ISHARES MSCI GROWTH INDEX
NASDAQ    	MATW                	Matthews International Corporation
NYSE      	HYK                 	Lehman ABS Corporation
INDEX     	ZHI                 	PALOMAR HEALTHCARE TECH IDX
NYSE      	HJH                 	MS Structured Asset Corp Saturns AT&T
TSE       	INC.UN.TO           	Income Financial Trust Unit
AMEX      	RMR                 	RMR Real Estate Fund
NYSE      	XAA                 	American Municipal Income Portfolio
NASDAQ    	WTFCP               	Wintrust Financial Corporation
NASDAQ    	MTSN                	Mattson Technology, Inc.
INDEX     	DFA                 	PHLX DEFEE SECTOR INDEX SETTL
NYSE      	HLR                 	Hollinger International, Inc.
TSE       	SW.TO               	Sierra Wireless Inc
NASDAQ    	BRKS                	Brooks Automation, Inc.
NASDAQ    	PTIE                	Pain Therapeutics
AMEX      	CNR                 	CanArgo Energy Corporation
NASDAQ    	BYFC                	Broadway Financial Corporation
NYSE      	MGU                 	Macquarie Global Infrastructure Total Return Fund Inc.
NASDAQ    	CDCY                	CompuDyne Corporation
NYSE      	HIT                 	Hitachi, Ltd.
AMEX      	CZJ                 	Citigroup Funding Inc.
TSE       	WEF.TO              	Western Forest Products Inc
NASDAQ    	PABK                	PAB BANKSHARES INC
NASDAQ    	SVNX                	724 Solutions
NYSE      	PGR                 	Progressive Corporation (The)
NYSE      	SCR.B               	Sea Containers Ltd.
NYSE      	KR                  	Kroger Company (The)
NASDAQ    	LSBK                	LAKE SHORE BANCORP
TSE       	VIR.TO              	ViRexx Medical Cp
NYSE      	WGO                 	Winnebago Industries, Inc.
INDEX     	XAO                 	ASX All Ordinaries
TSE       	RBI.TO              	Red Back Mining Inc
NYSE      	UCI                 	UICI
NASDAQ    	FRGB                	First Regional Bancorp
NASDAQ    	NBSC                	New Brunswick Scientific Co., Inc.
NYSE      	GEP                 	GENERAL ELEC CAP CORP
NASDAQ    	DCTHZ               	DELCATH SYSTEMS WRNT
NASDAQ    	ANSW                	GuruNet Corporation
NASDAQ    	ECMV                	E Com Ventures, Inc.
AMEX      	NHR                 	National Health Realty, Inc.
INDEX     	SX                  	PHLX SEMICONDUCTOR SECTOR INDEX
NYSE      	VAS                 	VIASYS HEALTHCARE INC
NYSE      	LEG                 	Leggett & Platt, Incorporated
NYSE      	SPP                 	Sappi
NYSE      	EVN                 	Eaton Vance Municipal Income Trust
NYSE      	BRF                 	BlackRock Florida Insured Municipal 2008 Term Trust Inc. (The)
NYSE      	XEL                 	Xcel Energy Inc.
NYSE      	IPX                 	Interpool, Inc.
AMEX      	ENV                 	CET Services, Inc.
INDEX     	NNYK                	FINANCIAL
NASDAQ    	NVAL                	New Valley Corporation
AMEX      	DJQ                 	Citigroup Global Markets Holdings Inc
NASDAQ    	FLIR                	FLIR Systems, Inc.
NASDAQ    	ACOR                	ACORDA THERAPEUTICS
NASDAQ    	NWIR                	NWH, Inc.
NYSE      	STM                 	STMicroelectronics N.V.
NASDAQ    	AUGT                	August Technology Corporation
NASDAQ    	ADBL                	Audible, Inc.
NASDAQ    	TZOO                	Travelzoo Inc
TSE       	ZOG.B.TO            	Zargon Oil & Gas Ltd
NASDAQ    	PMTC                	Parametric Technology Corporation
NYSE      	CNE                 	CANETIC RESOURCES TRUST TRUST
NYSE      	TTM                 	Tata Motors Ltd
NASDAQ    	CHDN                	Churchill Downs, Incorporated
NASDAQ    	LJPC                	La Jolla Pharmaceutical Company
NASDAQ    	POWL                	Powell Industries, Inc.
TSE       	SHC.TO              	Shell Canada Ltd
TSE       	AXL.TO              	Anderson Energy Ltd
NYSE      	HCH                 	Merrill Lynch Canada Inc CP HOLDRS
TSE       	HRX.TO              	Heroux Devtek Inc
NYSE      	PLA                 	Playboy Enterprises, Inc.
INDEX     	HKG                 	ISH MTR SML
NYSE      	GPI                 	Group 1 Automotive, Inc.
NASDAQ    	VLRX                	VALERA PHARMACEUTICA
NYSE      	JYP.P               	JERSEY CENT POWER & LIGHT PFD
INDEX     	EFK                 	INTL PROPELS
AMEX      	EGR                 	Commerce Energy Group, Inc
NYSE      	GRA                 	W.R. Grace & Company
AMEX      	XLI                 	SPDR Industry
AMEX      	RCF                 	Rica Foods, Inc.
NYSE      	LTM                 	Life Time Fitness
NYSE      	LOR                 	Lazard World Dividend & Income Fund, Inc.
NYSE      	EDO                 	EDO Corporation
NYSE      	MGF                 	MFS Government Markets Income Trust
NYSE      	BCR                 	C.R. Bard, Inc.
INDEX     	SPTEL               	SP500 Telecommunictaions Sector
AMEX      	TSR                 	Thermo Sentron Inc.
NYSE      	MUJ                 	MuniHoldings New Jersey Insured Fund, Inc.
NYSE      	PR                  	Price Communications Corporation
NYSE      	KOE                 	Lehman ABS Corporation
NYSE      	ELE                 	Endesa S.A.
AMEX      	CGN                 	Cognitronics Corporation
TSE       	WLT.TO              	Welton Energy Corporation
NYSE      	TYL                 	Tyler Technologies, Inc.
AMEX      	UMH                 	United Mobile Homes, Inc.
TSE       	FET.UN.TO           	Focus Energy Trust
TSE       	GNY.TO              	Gentry Resources Ltd
AMEX      	VB                  	Vanguard Small-Cap VIPERs
NYSE      	JPS                 	Nuveen Quality Preferred Income Fund 2
NASDAQ    	BBHL                	BB Holdings
TSE       	CLG.TO              	Cumberland Resources Ltd
NASDAQ    	BKMU                	Bank Mutual Corporation
NASDAQ    	KLIC                	Kulicke and Soffa Industries, Inc.
NYSE      	PJV                 	Preferredplus Trust
NASDAQ    	EDEND               	EDEN BIOSCIENCE CO
NASDAQ    	OSCI                	Oscient Pharmaceuticals Corporation
NYSE      	PFS                 	Provident Financial Services
TSE       	WTC.TO              	Western Silver Cp
NYSE      	PEO                 	Petroleum Resources Corporation
NASDAQ    	GEMP                	Gemplus International S.A.
AMEX      	CPD                 	Caraco Pharmaceutical Laboratories, Ltd.
AMEX      	ENG                 	ENGlobal Corporation
NASDAQ    	LIFC                	LifeCell Corporation
NASDAQ    	SIMG                	Silicon Image, Inc.
NYSE      	LXK                 	Lexmark International, Inc.
INDEX     	NFXT                	FOREIGN IDX
INDEX     	EUS                 	PHLX EUROPE SECTOR INDEX SETTLE
NYSE      	ACR                 	American Retirement Corporation
TSE       	BPO.PR.I.TO         	Brookfield Props AAA Pfd I
NYSE      	SWK                 	Stanley Works (The)
AMEX      	NHC                 	National HealthCare Corporation
NYSE      	CD                  	Cendant Corporation
NASDAQ    	TRIB                	Trinity Biotech plc
NYSE      	KCO                 	Structured Products Corp.
NYSE      	NFS                 	Nationwide Financial Services, Inc.
NYSE      	EFT                 	Eaton Vance Floating Rate Income Trust
NASDAQ    	FLSH                	M-Systems Flash Disk Pioneers Ltd.
NYSE      	NBR                 	NABORS INDS INC NEW
AMEX      	PTF                 	NCE Petrofund
AMEX      	TMI                 	Team, Inc.
NYSE      	MNI                 	McClatchy Company (The)
AMEX      	IWS                 	iShares Russell MidCap Value Index Fund
AMEX      	NAO.W               	NORTH AMERICAN IURANCE LEADE
INDEX     	HVA                 	Vanguard Consum Discr Vipers
NASDAQ    	FMCO                	FMS Financial Corporation
INDEX     	NAJ                 	iShares Russell 2000 Value Index
AMEX      	JMG                 	JMG EXPLORATION
NASDAQ    	SBKC                	Security Bank Corporation
AMEX      	IXC                 	iShares S&P Global Energy Index Fund
AMEX      	NMZ                 	Nuveen Municipal High Income Opportunity Fund
TSE       	EUR.TO              	Euro Ressources SA
NASDAQ    	IMNR                	Immune Response Corporation (The)
TSE       	AVP.TO              	Avcorp Industries Inc
NASDAQ    	HILL                	Dot Hill Systems Corporation
NYSE      	GB                  	Wilson Greatbatch Technologies, Inc.
NASDAQ    	GTOP                	Genitope Corporation
NASDAQ    	LOOKD               	LOOKSMART LTD NEW
NYSE      	XRM                 	Xerium Technologies, Inc.
NASDAQ    	AKSY                	Aksys, Ltd.
TSE       	EOF.UN.TO           	Entertainment One Income Fund
INDEX     	FJW                 	POWERSHARES DYNAMIC FOOD & BEVE
TSE       	APG.TO              	Apollo Gold Cp
NYSE      	AEO                 	AEGON N.V. 5.29964%
TSE       	ITX.TO              	Iteration Energy Ltd
NYSE      	OO                  	Oakley, Inc.
NASDAQ    	BLSI                	Boston Life Sciences, Inc.
TSE       	CFI.TO              	Clarington Corporation
AMEX      	IYH                 	iShares Dow Jones U.S. Health Care Index Fund
NYSE      	BGP                 	Borders Group, Inc.
NASDAQ    	NENG                	Network Engines, Inc
TSE       	CC.TO               	Chai-Na-Ta Cp
NYSE      	ASG                 	Liberty All-Star Growth Fund, Inc.
NASDAQ    	FLDR                	Flanders Corporation
NASDAQ    	CCMP                	Cabot Microelectronics Corporation
NYSE      	BRM                 	BlackRock Insured Municipal 2008 Term Trust Inc. (The)
NYSE      	IRF                 	International Rectifier Corporation
NYSE      	CRK                 	Comstock Resources, Inc.
AMEX      	BHM                 	Merrill Lynch & Co., Inc.
NYSE      	PYJ                 	PPlus Trust
NYSE      	WTM                 	White Mountains Insurance Group, Ltd.
NYSE      	EV                  	Eaton Vance Corporation
NASDAQ    	BMET                	Biomet, Inc.
TSE       	URE.TO              	Ur-Energy
NYSE      	CNT                 	CenterPoint Properties Trust
NYSE      	FLE                 	Fleetwood Enterprises, Inc.
NASDAQ    	LWAY                	Lifeway Foods, Inc.
TSE       	AYP.UN.TO           	ACS Media Income Fund
NASDAQ    	ABFS                	Arkansas Best Corporation
NYSE      	DFR                 	Deerfield Triarc Capital Corp.
NYSE      	ECR                 	ECC Capital Corp.
NASDAQ    	EXAC                	Exactech, Inc.
TSE       	NBS.TO              	NBS Technologies Inc
AMEX      	VAW                 	Vanguard Materials VIPERs
NYSE      	AG                  	AGCO Corporation
INDEX     	DVOL                	NYSE Down Volume
NASDAQ    	INDB                	Independent Bank Corp.
INDEX     	EYM                 	STREETTRACKS DJ WILSHIRE MID CA
TSE       	INZ.UN.TO           	Income Financial Plus Trust
NASDAQ    	FFIN                	First Financial Bankshares, Inc.
NASDAQ    	ALOYD               	ALLOY INC
NASDAQ    	KERX                	Keryx Biopharmaceuticals, Inc.
NASDAQ    	PRAI                	PRA International
NYSE      	OPY                 	Oppenheimer Holdings, Inc.
NYSE      	BOT                 	CBOT HOLDINGS INC
AMEX      	SSB                 	Citigroup Global Markets Holdings Inc
TSE       	DCC.PR.A.TO         	Diversified Canadian Financial
AMEX      	ANO                 	Anooraq Resources Corporation
NASDAQ    	LCCIE               	LCC International, Inc.
NASDAQ    	TACT                	TransAct Technologies Incorporated
NYSE      	TSS                 	Total System Services, Inc.
AMEX      	RNO                 	Rio Narcea Gold Mines, Ltd.
TSE       	LQW.TO              	Liquidation World Inc
NASDAQ    	FUELW               	Streicher Mobile Fueling, Inc.
NYSE      	CQB                 	Chiquita Brands International, Inc.
NASDAQ    	ULGX                	Urologix, Inc.
NYSE      	MLS                 	Mills Corporation (The)
NYSE      	IT                  	Gartner, Inc.
AMEX      	PLI                 	Transpro, Inc.
NYSE      	CVX                 	ChevronTexaco Corporation
NYSE      	NSM                 	National Semiconductor Corporation
NYSE      	HTG                 	Heritage Property Investment Trust Inc
NASDAQ    	ATEA                	Astea International, Inc.
NASDAQ    	MANH                	Manhattan Associates, Inc.
NYSE      	FPL                 	FPL Group, Inc.
AMEX      	ELI                 	Elite Pharmaceuticals, Inc.
NASDAQ    	ASRV                	AmeriServ Financial Inc.
TSE       	TFS.TO              	Thirty Five Split Cp
NASDAQ    	ADRA                	BLDRS Asia 50 ADR Index Fund
NASDAQ    	ACTS                	ACTIO SEMICONDUCTO
AMEX      	HRT                 	Arrhythmia Research Technology Inc.
NASDAQ    	PPTV                	PPT Vision Inc.
NASDAQ    	CALD                	Callidus Software, Inc.
NASDAQ    	CESI                	Catalytica Energy Systems, Inc.
NYSE      	ETS                 	Enterasys Networks, Inc.
AMEX      	ITI                 	Iteris, Inc.
TSE       	CCM.TO              	Canarc Resource Cp
NYSE      	CRG                 	LEHMAN ABS CORPORATION
NASDAQ    	CHCI                	Comstock Homebuilding Companies, Inc.
NYSE      	ASD                 	American Standard Companies, Inc.
NASDAQ    	NSEC                	National Security Group, Inc.
NASDAQ    	TSYS                	TeleCommunication Systems, Inc.
NYSE      	ESF                 	Espirito Santo Financial Grupo S.A.
NYSE      	RDS.B               	ROYAL DUTCH SHELL PLC
NYSE      	BAS                 	BASIC ENERGY SERVICES INC
TSE       	USA.UN.TO           	American Income Trust Unit
TSE       	CAE.TO              	CAE Inc
INDEX     	INSR                	Nasdaq Inurance
NASDAQ    	ELOY                	eLoyalty Corporation
NASDAQ    	USAP                	Universal Stainless & Alloy Products, Inc.
NASDAQ    	MOBE                	Mobility Electronics, Inc.
NASDAQ    	DAVE                	Famous Dave's of America, Inc.
NYSE      	CVG                 	Convergys Corporation
NASDAQ    	SEIC                	SEI Investments Company
NYSE      	NTE                 	Nam Tai Electronics, Inc.
NASDAQ    	DISCA               	Discovery Holding Co
NASDAQ    	CCBN                	Central Coast Bancorp
TSE       	U.TO                	Uranium Participation Cp
AMEX      	YMI                 	YM BioSciences, Inc.
NASDAQ    	MGPI                	MGP Ingredients, Inc.
NASDAQ    	TXCC                	TranSwitch Corporation
TSE       	BVX.TO              	Bow Valley Energy Ltd
NYSE      	BBL                 	BHP BILLITON PLC
NASDAQ    	AERTA               	Advanced Environmental Recycling Technologies, Inc.
INDEX     	YLON                	NYSE New 52 Week Low
NASDAQ    	SNTO                	Sento Corporation
TSE       	CWB.TO              	Canadian Western Bank
NASDAQ    	CWBSP               	Commonwealth Bankshares, Inc.
NYSE      	WAB                 	Westinghouse Air Brake Technologies Corporation
NYSE      	WLV                 	Wolverine Tube, Inc.
INDEX     	DOWE                	INDUSTRIALS EU$
AMEX      	XLS                 	MORGAN STANLEY
TSE       	CM.PR.P.TO          	Cdn Imperial Bank Srs 18 Pfd
AMEX      	DMX                 	I-TRAX INC
TSE       	DFS.TO              	Dofasco Inc
NASDAQ    	ESBF                	ESB Financial Corporation
AMEX      	APT                 	Alpha Pro Tech, Ltd.
NYSE      	PJE                 	Merrill Lynch PreferredPlus Tr
NYSE      	MJH                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	ALO                 	Alpharma, Inc.
NASDAQ    	GILTF               	Gilat Satellite Networks Ltd.
NYSE      	JKJ                 	iShares Morningstar Small Core Index Fund
TSE       	AL.PR.F.TO          	Alcan Inc Series E Pfd
NASDAQ    	YHOO                	Yahoo! Inc.
TSE       	FAS.UN.TO           	First Asset Equal Weight Small Cap Income Fund
AMEX      	AUY                 	Yamana Gold, Inc.
NASDAQ    	APSA                	Alto Palermo S.A.
AMEX      	NVY                 	Nuveen Pennsylvania Dividend Advantage Municipal Fund 2
NYSE      	DIS                 	Walt Disney Company (The)
AMEX      	EIO                 	Eaton Vance Insured Ohio Municipal Bond Fund
NASDAQ    	STRC                	SRI/Surgical Express, Inc.
NASDAQ    	MARSB               	Marsh Supermarkets, Inc.
TSE       	BCA.PR.B.TO         	Brascade Cp Pfd B
NYSE      	STE                 	STERIS Corporation
NASDAQ    	VIVO                	Meridian Bioscience Inc.
NASDAQ    	FRCCO               	First Republic Preferred Capital Corporation
TSE       	SPN.UN.TO           	Starpoint Energy Ltd
NASDAQ    	EAGL                	EGL, Inc.
AMEX      	EWT                 	iShares MSCI Taiwan Index Fund
NASDAQ    	AVTR                	Avatar Holdings Inc.
TSE       	UNC.TO              	United Corporations Ltd
NYSE      	IEM                 	Merrill Lynch & Co., Inc.
NYSE      	TIN                 	Temple-Inland Inc.
NASDAQ    	BRCDE               	Brocade Communications Systems, Inc.
NYSE      	RNT.A               	Aaron Rents, Inc.
TSE       	ARX.TO              	ARC Resources Ltd
TSE       	SGB.TO              	Stratos Global Cp
TSE       	CNR.TO              	Canadian National Railway Co
TSE       	GNR.TO              	Guinor Gold Cp
NASDAQ    	CCPCP               	Capital Crossing Preferred Corporation
TSE       	DST.UN.TO           	Global Discs Trust 2004-1
NYSE      	AVX                 	AVX Corporation
NYSE      	HYP                 	High Yield Plus Fund, Inc. (The)
AMEX      	NAS                 	Citigroup Global Markets Holdings Inc
NASDAQ    	EGBN                	Eagle Bancorp, Inc.
NASDAQ    	NGEN                	Nanogen, Inc.
NASDAQ    	RMKRD               	RAINMAKER SYSTEMS
NASDAQ    	FARM                	Farmer Brothers Company
AMEX      	GGR                 	GeoGlobal Resources Inc.
NASDAQ    	QSII                	Quality Systems, Inc.
INDEX     	EAH                 	Vanguard Extended Market Index
NYSE      	NXR                 	Nuveen Select Tax Free Income Portfolio III
NYSE      	ABY                 	Abitibi-Consolidated, Inc.
NYSE      	SFN                 	Spherion Corporation
NYSE      	TTI                 	Tetra Technologies, Inc.
NYSE      	RX                  	IMS Health Incorporated
NYSE      	IHC                 	Independence Holding Company
AMEX      	BHC.P               	ABC BANCORP CAP TR I
NASDAQ    	BELM                	Bell Microproducts Inc.
NYSE      	NWG                 	Inco Ltd.
NYSE      	GJR                 	SYNTHETIC FIXED-INCOME SECURIT
NASDAQ    	KNBWY               	Kirin Brewery Company,
NYSE      	MCK                 	McKesson Corporation
NYSE      	HJG                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
INDEX     	EMW                 	Wilshire 4500 Completion Index
NASDAQ    	BRCD                	Brocade Communications Systems, Inc.
NYSE      	MIR                 	MIRANT CORPORATION
AMEX      	SRB                 	Citigroup Global Markets Holdings Inc
NASDAQ    	XING                	Qiao Xing Universal Telephone, Inc.
NYSE      	AZR                 	Aztar Corporation
NASDAQ    	ADVNA               	ADVANTA Corp.
NASDAQ    	NTAP                	Network Appliance, Inc.
INDEX     	NXV                 	Consumer Services Sector Fund SPDR UTV
NASDAQ    	JDSU                	JDS Uniphase Corporation
TSE       	DDV.TO              	Duvernay Oil Cp
TSE       	CKI.TO              	Clarke Inc
NASDAQ    	IBCPO               	Independent Bank Corporation
NASDAQ    	ROBO                	Robo Group TEK, Ltd.
AMEX      	SBI                 	Smith Barney Intermediate Municipal Fund, Inc.
NYSE      	MHO                 	M/I Homes, Inc.
NASDAQ    	SCHW                	CHARLES SCHWAB INC
TSE       	TCS.TO              	Tecsys Inc
TSE       	HBC.TO              	Hudsons Bay Company
AMEX      	KSW                 	KSW INC
NASDAQ    	MGYR                	MAGYAR BANCORP INC.
AMEX      	NRO                 	Neuberger Berman Real Estate Securities Income Fund, Inc.
NASDAQ    	BRLI                	Bio-Reference Laboratories, Inc.
NYSE      	RGF                 	R&G Financial Corporation
INDEX     	RXV                 	PHLX DRUG INDEX SETTLEMENT
NASDAQ    	TMIC                	Trend Micro Incorporated
NYSE      	ARE                 	Alexandria Real Estate Equities, Inc.
TSE       	MXT.UN.TO           	MSP Maxxum Trust
NYSE      	PIS                 	Merrill Lynch Depositor, Inc.
AMEX      	UQM                 	UQM TECHNOLOGIES INC
INDEX     	ESX                 	Select European 50 Index
INDEX     	NNYL                	WORLD LEADERS
NASDAQ    	TONE                	TierOne Corporation
NASDAQ    	USLM                	United States Lime & Minerals, Inc.
NASDAQ    	ALNY                	Alnylam Pharmaceuticals, Inc.
NASDAQ    	ATTU                	Attunity Ltd.
NYSE      	DKM                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	MBLA                	National Mercantile Bancorp
NYSE      	FHY                 	FIRST TRUST STRATEGIC HIGH INC
NASDAQ    	SYNT                	Syntel, Inc.
NYSE      	FDP                 	Fresh Del Monte Produce, Inc.
NASDAQ    	LNCE                	Lance, Inc.
TSE       	PHX.UN.TO           	Phoenix Technology Income Fund
TSE       	BCX.A.TO            	BCX Split Cp Cl A Cap
NASDAQ    	WLSC                	WILLIAMS SCOTSMAN
NASDAQ    	EXEL                	Exelixis, Inc.
NASDAQ    	GPRO                	Gen-Probe Incorporated
NASDAQ    	GOLD                	Randgold Resources
NASDAQ    	EFSC                	Enterprise Financial Services Corporation
AMEX      	PWP                 	PowerShares Dynamic Mid Cap Value
NYSE      	SJT                 	San Juan Basin Royalty Trust
NYSE      	HYM                 	Lehman ABS Corporation
INDEX     	PSE                 	Pacific Exchange Technology Index
NASDAQ    	GOODP               	GLADSTONE COMMERCIA
INDEX     	NBI                 	Nasdaq Biotechnology
NYSE      	BCO                 	Pittston Company (The)
NASDAQ    	VSTA                	VistaCare
NASDAQ    	GIII                	G-III Apparel Group, LTD.
NYSE      	ZTR                 	Zweig Total Return Fund, Inc. (The)
AMEX      	OTD                 	O2Diesel Corporation
NYSE      	IRC                 	Inland Real Estate Corporation
NYSE      	FTI                 	FMC Technologies, Inc.
INDEX     	TORN                	Toronto Composite
NASDAQ    	MDII                	MDI, Inc.
NYSE      	NMY                 	Nuveen Maryland Premium Income Municipal Fund
TSE       	GNI.TO              	Gemini Energy Cp
TSE       	SYN.TO              	Synenco Energy Inc
AMEX      	XLB                 	SPDR Material
NYSE      	HVT.A               	Haverty Furniture Companies, Inc.
NASDAQ    	WJCI                	WJ Communications, Inc.
NASDAQ    	IVAC                	Intevac, Inc.
NYSE      	XKI                 	Lehman ABS Corporation
NASDAQ    	GRVY                	Gravity Co., Ltd.
NASDAQ    	EEEE                	Educate, Inc.
NYSE      	DF                  	Dean Foods Company
NYSE      	TCB                 	TCF Financial Corporation
AMEX      	MST                 	MORGAN STANLEY
NYSE      	FGI                 	SUNAMERICA ALPHA FD
NYSE      	PNX                 	Phoenix Companies, Inc. (The)
NASDAQ    	APHT                	Aphton Corp.
NYSE      	CCO                 	CLEAR CHANNEL OUTDOOR HOLDINGS
NYSE      	GAS                 	NICOR INC
TSE       	ESF.UN.TO           	Middlefield Equal Sector Income Fd
NYSE      	PJW                 	Merrill Lynch Depositor Inc
INDEX     	XCI                 	AMEX Computers Index
NYSE      	PYO                 	Merrill Lynch Depositor, Inc.
NYSE      	IJD                 	INDIANA MICH PWR CO
TSE       	MOX.TO              	Midnight Oil Exploration Ltd
INDEX     	OON                 	S&P Global 100 Index
AMEX      	VUG                 	Vanguard Growth VIPERs
NASDAQ    	SEED                	ORIGIN AGRITECH LIMI
INDEX     	IXT                 	Technology Select Sector Index
NASDAQ    	ESST                	ESS Technology, Inc
AMEX      	KUL                 	KUHLMAN COMPANY INC
NASDAQ    	EPEN                	East Penn Financial Corporation
NYSE      	NHY                 	Norsk Hydro ASA
AMEX      	DRU                 	Morgan Stanley Dean Witter & Co.
NYSE      	JRC                 	Journal Register Company
NYSE      	MFV                 	MFS Special Value Trust
NYSE      	GLT                 	GLATFELTER
INDEX     	NJG                 	iShares S&P 500 BARRA Growth Index
TSE       	DTP.UN.TO           	Diversi Trust Income + Fund
INDEX     	FTSM                	FTSE 250
AMEX      	RVP                 	Retractable Technologies, Inc.
TSE       	FAL.PR.A.TO         	Falconbridge Pfd 2
NYSE      	JZS                 	Lehman ABS Corporation
AMEX      	GIF                 	Global Income Fund, Inc.
NASDAQ    	AMTCP               	Ameritrans Capital Corporation
NASDAQ    	FRBK                	Republic First Bancorp, Inc.
NYSE      	NUF                 	Nuveen Florida Quality Income Municipal Fund, Inc.
NASDAQ    	GFLSO               	Greater Community Bancorp
NASDAQ    	MNNY                	Merrill Lynch & Co., Inc.
TSE       	CZZ.TO              	Canadian Royalties Inc
NASDAQ    	SSFT                	ScanSoft, Inc.
AMEX      	PXJ                 	PowerShares Dynamic Oil & Gas
NASDAQ    	BFNB                	Beach First National Bancshares Inc
NASDAQ    	RTRSY               	Reuters Group PLC
NASDAQ    	KOOL                	THERMOGENESIS Corp.
NYSE      	AIZ                 	Assurant, Inc.
NYSE      	CRE                 	CarrAmerica Realty Corporation
TSE       	CAR.UN.TO           	Canadian Apartment Prop REIT
AMEX      	GVP                 	GSE Systems, Inc.
TSE       	BAI.UN.TO           	Barclays Advantagd S&P/TSX
NYSE      	PPL                 	PP&L Corporation
NASDAQ    	ACEL                	Alfacell Corporation
NYSE      	MUC                 	MuniHoldings California Insured Fund, V, Inc.
NYSE      	RGM                 	General Motors Corp Pfd Sr Nts
AMEX      	ONI                 	Oragenics, Inc.
AMEX      	CRC                 	Chromcraft Revington, Inc.
INDEX     	PXS                 	Prudents Underlying Basket Index
INDEX     	TOP                 	AMEX Eurotop 100 Index
AMEX      	EML                 	Eastern Company (The)
NYSE      	SHG                 	Shinhan Financial Group Co Ltd
NASDAQ    	SGHL                	Sentigen Holding Corp.
NASDAQ    	NEWP                	Newport Corporation
NYSE      	WSF                 	Wells Fargo Cap IX
AMEX      	PMU                 	Pacific Rim Mining Corp New
AMEX      	IJK                 	iShares S&P MidCap 400/BARRA Growth Index Fund
TSE       	PAC.TO              	Printera Cp
TSE       	SRC.UN.TO           	Series S1 Income Fund
NASDAQ    	OTIV                	On Track Innovations Ltd
NYSE      	OI                  	Owens-Illinois, Inc.
AMEX      	NZF                 	Nuveen Dividend Advantage Municipal Fund 3
TSE       	SBC.TO              	Brompton Split Banc Corp
NASDAQ    	AMKR                	Amkor Technology, Inc.
NYSE      	PCH                 	Potlatch Corporation
NASDAQ    	EDUC                	Educational Development Corporation
NASDAQ    	ALXN                	Alexion Pharmaceuticals, Inc.
NASDAQ    	CECO                	Career Education Corporation
NASDAQ    	NTCT                	NetScout Systems, Inc.
NASDAQ    	BCBP                	BCB BANCORP INC
TSE       	CVI.A.TO            	Calvalley Petroleum Inc Class A
NYSE      	TRH                 	Transatlantic Holdings, Inc.
NYSE      	SBT                 	SBC Communications Inc.
NYSE      	JKF                 	iShares Trust Morningstar L V I
AMEX      	DBZ                 	MORGAN STANLEY
TSE       	BNS.PR.J.TO         	Bank Of Nova Scotia Pfd J
NASDAQ    	SPPRP               	SUPERTEL HOSP PREF A
NYSE      	AXP                 	American Express Company
NASDAQ    	CHFC                	Chemical Financial Corporation
NASDAQ    	ALGN                	Align Technology, Inc.
TSE       	PSM.TO              	Pioneer Metals Cp
NASDAQ    	FORD                	Forward Industries, Inc.
AMEX      	SVT                 	Servotronics, Inc.
NASDAQ    	ARBA                	Ariba, Inc.
NASDAQ    	NUVO                	Nuvelo, Inc.
NASDAQ    	SCIX                	Scitex Corporation Ltd.
NASDAQ    	RAIL                	FreightCar America, Inc.
TSE       	HBH.M.TO            	HSBC Canada Asset Trust
NYSE      	K                   	Kellogg Company
NYSE      	VMI                 	Valmont Industries, Inc.
TSE       	XBB.TO              	I Units Canadian Bond Market
NASDAQ    	HAUP                	Hauppauge Digital, Inc.
TSE       	SMX.TO              	SMTC Manufacturing Canada
AMEX      	MYR                 	Mayor's Jewelers, Inc.
AMEX      	GBR                 	Greenbriar Corporation
NASDAQ    	CFSI                	Collegiate Funding Services, Inc.
NYSE      	MEU                 	MetLife, Inc.
NASDAQ    	MBWM                	Mercantile Bank Corporation
NYSE      	SHU                 	Shurgard Storage Centers, Inc.
NASDAQ    	WTFC                	Wintrust Financial Corporation
NASDAQ    	GCBS                	Greene County Bancshares, Inc.
AMEX      	EZH                 	Citigroup Funding, Inc.
NYSE      	SFA                 	Scientific-Atlanta, Inc.
NYSE      	AMH.P               	AMERUS GROUP CO.
NYSE      	PDF                 	John Hancock Patriot Premium Dividend Fund I
TSE       	IDC.TO              	International Datacasting Cp
NASDAQ    	LKFN                	Lakeland Financial Corporation
NYSE      	XFL                 	Lehman ABS Corporation
NASDAQ    	AMSC                	American Superconductor Corporation
NASDAQ    	SSFC                	South Street Financial Corporation
NASDAQ    	NRGY                	Inergy, L.P.
TSE       	CMK.TO              	Cline Mining Cp
INDEX     	NWV                 	AMEX NETWORKING INDEX SETTLEMEN
TSE       	AW.UN.TO            	A&W Royalties Income Fund
NYSE      	MMR                 	McMoRan Exploration Company
NASDAQ    	OMRI                	OMRIX BIOPHARMACEUTI
NYSE      	CA                  	Computer Associates International, Inc.
INDEX     	DWO                 	DYNAMIC OIL SERVICES INTELLIDEX
INDEX     	DYL                 	PHARM BXS EST
NYSE      	TMO                 	Thermo Electron Corporation
NYSE      	JWN                 	Nordstrom, Inc.
TSE       	ELF.TO              	E-L Financial Cp Ltd
NYSE      	CHK                 	Chesapeake Energy Corporation
NYSE      	FMX                 	Formento Economico Mexicano S.A. de C.V.
NYSE      	MQT                 	MuniYield Quality Fund II, Inc.
INDEX     	XEX                 	Phlx Europe Sector Index
NYSE      	DCO                 	Ducommun Incorporated
NYSE      	RMK                 	Aramark Corporation
NYSE      	MVK                 	Maverick Tube Corporation
NASDAQ    	PEIX                	Pacific Ethanol, Inc.
AMEX      	FEN                 	Energy Income and Growth Fund
NASDAQ    	MTSP                	Merrill Lynch & Co., Inc.
TSE       	SMG.TO              	Shermag Inc
NYSE      	SY                  	Sybase, Inc.
NASDAQ    	FFKY                	First Financial Service Corporation
TSE       	ORV.TO              	Orvana Minerals Cp
NASDAQ    	RSAS                	RSA Security, Inc.
NYSE      	WPL                 	W.P. Stuart & Co., Ltd.
NASDAQ    	OCCF                	Optical Cable Corporation
TSE       	CAX.TO              	Candax Energy Inc
TSE       	XER.PR.A.TO         	Xerox Capital LLC Pfd A
NYSE      	ECL                 	Ecolab Inc.
NYSE      	MFE                 	Networks Associates, Inc.
NASDAQ    	ARMHY               	ARM Holdings, plc
AMEX      	INO                 	Inovio Biomedical Corporation
TSE       	LNF.TO              	Leons Furniture Ltd
TSE       	EVT.TO              	Economic Investment Trust Ltd
AMEX      	EVJ                 	Eaton Vance New Jersey Municipal Income Trust
AMEX      	TTH                 	HOLDRS Telecom
NYSE      	NAZ                 	Nuveen Arizona Premium Income Municipal Fund, Inc.
NASDAQ    	HORC                	Horizon Health Corporation
NASDAQ    	NETC                	NET Servicos de Comunicacao S.A.
NYSE      	NPF                 	Nuveen Premier Municipal Income Fund, Inc.
NASDAQ    	CBUK                	Cutter & Buck Inc.
NYSE      	PKO                 	Merrill Lynch Depositor, Inc.
NYSE      	DLP                 	Delta and Pine Land Company
TSE       	GDI.UN.TO           	General Donlee Income Fund
TSE       	TIO.TO              	Tiomin Resources Inc
NASDAQ    	NXXI                	Nutrition 21 Inc.
NYSE      	SP                  	Specialty Laboratories, Inc.
NASDAQ    	PPCO                	Penwest Pharmaceuticals Co.
NYSE      	BMM                 	Bimini Mortgage Management, Inc.
NYSE      	ING                 	ING Group, N.V.
AMEX      	MWP                 	MarkWest Hydrocarbon, Inc.
NASDAQ    	IVAN                	Ivanhoe Energy, Inc.
NASDAQ    	SILCF               	Silicom Ltd
TSE       	G.TO                	Goldcorp Inc
NASDAQ    	PTMKW               	Pathmark Stores, Inc.
TSE       	TBR.TO              	Tiberon Minerals Ltd
NYSE      	MAG                 	Magnetek, Inc.
INDEX     	NJZ                 	iShares Dow Jones U.S. Telecommunications Sector Index
NASDAQ    	SFFS                	Sound Federal Bancorp, Inc.
NYSE      	MMC                 	Marsh & McLennan Companies, Inc.
NASDAQ    	SWAT                	A4S Security, Inc.
NASDAQ    	SUPG                	SuperGen, Inc.
NASDAQ    	VICR                	Vicor Corporation
AMEX      	DSV                 	streetTRACKS Dow Jones U.S. Small Cap Value Index Fund
NASDAQ    	RSCR                	Res-Care, Inc.
NYSE      	RDY                 	Dr. Reddy's Laboratories Ltd
NYSE      	WRE                 	Washington Real Estate Investment Trust
NYSE      	NAI                 	Nicholas-Applegate International
AMEX      	NGB                 	Nuveen Virginia Dividend Advantage Municipal Fund
NASDAQ    	CYTO                	Cytogen Corporation
NASDAQ    	MRCIY               	Marconi Corporation
AMEX      	MKO                 	Merrill Lynch & Co., Inc.
NASDAQ    	UBCP                	United Bancorp, Inc.
INDEX     	HGD                 	PHLX HOUSING SECTOR INDEX SETTL
NASDAQ    	HGIC                	Harleysville Group Inc.
NASDAQ    	DWTN                	Merrill Lynch & Co., Inc.
NASDAQ    	BLTI                	BioLase Technology, Inc.
NASDAQ    	MXIM                	Maxim Integrated Products, Inc.
TSE       	IAC.TO              	Amisco Industries Ltd
AMEX      	PLR                 	Citigroup Funding Inc.
NYSE      	JTX                 	Jackson Hewitt Tax Services
NYSE      	KF                  	Korea Fund, Inc. (The)
NASDAQ    	ISIL                	Intersil Corporation
NYSE      	DDT                 	Dillard's, Inc.
NYSE      	RDN                 	Radian Group Inc.
AMEX      	FML                 	Merrill Lynch & Co., Inc.
TSE       	TKY.TO              	Turnkey E&P Inc
INDEX     	GBW                 	POWERSHARES DYNAMIC MID CAP GRO
AMEX      	PUI                 	PowerShares Dynamic Utilities
NASDAQ    	LFINP               	International Bancshares Corporation
NYSE      	DKL                 	Lehman ABS Corporation
NASDAQ    	IDCC                	InterDigital Communications Corp.
NASDAQ    	CLFC                	Center Financial Corporation
NASDAQ    	IDMI                	IDM Pharma, Inc.
NYSE      	ESE                 	ESCO Technologies Inc.
AMEX      	CUP                 	PERU COPPER INC
AMEX      	WHT                 	Westside Energy Corporation
NASDAQ    	SINA                	Sina Corporation
TSE       	LAF.TO              	Lafarge North America Inc
NASDAQ    	OLBK                	Old Line Bancshares, Inc. (MD)
NYSE      	ATE                 	Advantest Corporation (Kabushiki Kaisha Advantest) ADS
NASDAQ    	EGLT                	EAGLE TEST SYSTEMS
TSE       	GLC.UN.TO           	Great Lakes Carbon Income Fund
NASDAQ    	SENEB               	Seneca Foods Corp.
NYSE      	CIK                 	Credit Suisse Asset Management Income Fund, Inc.
NASDAQ    	SHOE                	Shoe Pavilion, Inc
NASDAQ    	COGT                	Cogent, Inc.
NYSE      	TKR                 	Timken Company (The)
NYSE      	DW                  	Drew Industries Incorporated
NASDAQ    	RNHDA               	Reinhold Industries, Inc.
TSE       	CBM.TO              	Mahalo Energy Ltd
NASDAQ    	WARR                	WARRIOR ENERGY SERV
NASDAQ    	LIOX                	Lionbridge Technologies, Inc.
NASDAQ    	RONC                	Ronson Corporation
TSE       	MTZ.UN.TO           	Matrix Income Fund
NYSE      	MDG                 	Meridian Gold Inc.
AMEX      	NOW                 	MAI Systems Corporation
AMEX      	CZP                 	Citigroup Global Markets
NASDAQ    	RUBO                	Rubio's Restaurants, Inc.
NYSE      	GRR                 	Asia Tigers Fund, Inc. (The)
NASDAQ    	STRT                	Strattec Security Corporation
NASDAQ    	BHBC                	Beverly Hills Bancorp Inc.
TSE       	YM.TO               	YM Biosciences Inc
NASDAQ    	ENER                	Energy Conversion Devices, Inc.
AMEX      	HAC.U               	HARBOR ACQUISITION CORPORATION
NYSE      	PMH                 	Putnam Tax-Free Health Care Fund
NASDAQ    	GENE                	Genome Therapeutics, Corp
AMEX      	EGY                 	VAALCO ENERGY INC
TSE       	TEO.TO              	Tesco Cp
NASDAQ    	CCOI                	COGENT COMM GROUP
AMEX      	IGW                 	iShares Goldman Sachs Semiconductor Index Fund
NYSE      	SCI                 	Service Corporation International
NASDAQ    	REDF                	Rediff.com India
TSE       	CFC.TO              	Canadian Finanacial Svcs NT
NASDAQ    	ZICA                	Zi Corporation
NYSE      	NIS                 	NISSIN CO LTD
NASDAQ    	TSEMG               	TOWER SEMICD DBS CNV
NASDAQ    	SNRR                	Sunterra Corporation New
NASDAQ    	MACR                	Macromedia, Inc.
NASDAQ    	MFLO                	Moldflow Corporation
AMEX      	VV                  	Vanguard Large-Cap VIPERs
AMEX      	PRL                 	Prolong International Corporation
NASDAQ    	WERN                	Werner Enterprises, Inc.
NYSE      	CV                  	CENTRAL VT PUB SVC CORP
AMEX      	BCL                 	BlackRock California Municipal Income Trust II
NASDAQ    	BDCO                	Blue Dolphin Energy Company
AMEX      	NGS                 	Natural Gas Services Group, Inc.
TSE       	SMN.UN.TO           	SCI Income Trust Unit
NYSE      	DSW                 	DSW Inc.
NASDAQ    	APRO                	America First Apartment Investors, Inc.
NASDAQ    	LMNX                	Luminex Corporation
TSE       	DNK.TO              	Dynetek Industries Ltd
NYSE      	EFR                 	Eaton Vance Senior Floating-Rate Fund
NASDAQ    	HABC                	Habersham Bancorp
NASDAQ    	SABA                	Saba Software, Inc.
NYSE      	KTS                 	Lehman ABS Corporation
NASDAQ    	EMITF               	Elbit Medical Imaging Ltd.
TSE       	AN.UN.TO            	Alexis Nihon REIT Unit
NASDAQ    	TRGL                	Toreador Resources Corporation
NASDAQ    	WPTE                	WPT Enterprises, Inc.
TSE       	SIF.UN.TO           	Energy Savings Income Fund
NASDAQ    	NXPL                	MS PLUS NDQ 100 IDX
NYSE      	JFC                 	JF China Region  Fund, Inc.
NYSE      	FD                  	Federated Department Stores, Inc.
AMEX      	GNT                 	Gentium SpA
INDEX     	OILBR               	Crude Oil Brent NYMEX
INDEX     	OFIN                	Nasdaq Other Financial Index
AMEX      	PLC                 	PLC Systems Inc.
NYSE      	NRT                 	North European Oil Royality Trust
NASDAQ    	HSTM                	HealthStream, Inc.
NASDAQ    	KNSY                	Kensey Nash Corporation
NYSE      	JNS                 	Stilwell Financial Inc.
TSE       	BXN.PR.B.TO         	B Split II Cp Pfd B
NYSE      	HNZ                 	H.J. Heinz Company
TSE       	MSF.TO              	MedcomSoft Inc
NASDAQ    	PRGX                	PRG-Schultz International Inc.
NYSE      	EWQ                 	iShares MSCI France
NYSE      	BAB                 	British Airways plc
NYSE      	ENC                 	Enesco Group, Inc.
NYSE      	OIC                 	MS Municipal Income Opportunities Trust III
AMEX      	FVI                 	FIRST TRUST/VALUE LINE
NASDAQ    	FLOW                	Flow International Corporation
NASDAQ    	WILC                	G WILLI-FOOD INTL
NASDAQ    	PONR                	Pioneer Companies, Inc. New
NYSE      	GOM                 	General Motors Acceptance Corp
TSE       	N.U.TO              	Inco Ltd US$
NASDAQ    	HRLY                	Herley Industries, Inc.
NYSE      	PJT                 	Preferred Plus Trust GEC-1 6.05
NYSE      	SNN                 	Smith & Nephew SNATS, Inc.
AMEX      	WGA                 	Wells-Gardner Electronics Corporation
NASDAQ    	ANLY                	Analysts International Corporation
AMEX      	GRC                 	Gorman-Rupp Company (The)
TSE       	RNO.TO              	Vector Aerospace Cp
NYSE      	AT                  	ALLTEL Corporation
TSE       	AVN.DB.TO           	Advantage Energy Income 10%
NYSE      	MYN                 	MuniYield New York Insured Fund, Inc.
NASDAQ    	ASGN                	On Assignment, Inc.
TSE       	CR.TO               	Crew Energy Inc
NYSE      	LDR                 	Landauer, Inc.
NYSE      	CNO.W               	COECO IN WTS A
AMEX      	UG                  	United-Guardian, Inc.
INDEX     	HVP                 	Vanguard Consum Staples Vipers
NASDAQ    	MCBF                	Monarch Community Bancorp, Inc.
AMEX      	BYL.P               	BAYLKE CAP TR I
NASDAQ    	IRIX                	IRIDEX Corporation
TSE       	SZ.TO               	Sceptre Investment Counsel Ltd
NYSE      	HDL                 	Handleman Company
TSE       	BTE.UN.TO           	Baytex Energy Trust
INDEX     	QQV                 	QQQ Volatility Index
AMEX      	SDY                 	SPDR Dividend
TSE       	MTM.TO              	Mitec Telecom Inc
NASDAQ    	IBKC                	IBERIABANK Corporation
NASDAQ    	FREEW               	FREESEAS INC
NASDAQ    	DVAX                	Dynavax Technologies Corporation
INDEX     	DJI                 	Dow Jones Industrial Average
NASDAQ    	ORCI                	Opinion Research Corporation
NYSE      	CEM                 	Crompton Corporation
INDEX     	OILSW               	Crude Oil Light Sweet NYMEX
TSE       	AU.PR.A.TO          	Agricore United Pfd A
NYSE      	ANZ                 	Australia & New Zealand Banking Group
NYSE      	TSI                 	TCW STRATEGIC INCOME FUND INC
AMEX      	CBJ                 	Cambior, Inc.
NYSE      	NYB                 	New York Community Bancorp, Inc.
NASDAQ    	CTIB                	CTI Industries Corporation
AMEX      	NKL                 	Nuveen Insured California Dividend Advantage Municipal Fund
NYSE      	AKH                 	Air France ADS
TSE       	CGQ.TO              	Capital Gains Inc Streams Cap
NYSE      	AGN                 	Allergan, Inc.
NYSE      	TK                  	Teekay Shipping Corporation
AMEX      	SMN                 	Citigroup Global Markets
NASDAQ    	JBHT                	J.B. Hunt Transport Services, Inc.
NASDAQ    	SVVS                	SAVVIS, Inc.
NASDAQ    	SYNC                	Intellisync Corporation
TSE       	AG.UN.TO            	Arctic Glacier Income Fund
NYSE      	OLG                 	Offshore Logistics, Inc.
INDEX     	FZM                 	Powershares Dyn Mkt Portfl Index
NYSE      	PYL                 	Merrill Lynch Depositor Inc
NASDAQ    	KTII                	K-Tron International, Inc.
NASDAQ    	SIVBE               	SVB Financial Group
NYSE      	RCI                 	Renal Care Group, Inc.
NASDAQ    	POPEZ               	Pope Resources
NASDAQ    	ACCL                	Accelrys, Inc.
NASDAQ    	LTRX                	Lantronix, Inc.
NASDAQ    	VBFCW               	Village Bank and Trust Financial Corp.
NYSE      	SPF                 	Standard Pacific Lp
NYSE      	BWC                 	Belden Incorporated
AMEX      	VPL                 	Vanguard Pacific VIPERs
TSE       	CBF.UN.TO           	Connors Bros Income Fund
NYSE      	SWY                 	Safeway Inc.
NASDAQ    	ASIA                	AsiaInfo Holdings, Inc.
TSE       	GLG.U.TO            	Glamis Gold Ltd US$
NYSE      	OMM                 	OMI Corporation
AMEX      	UPL                 	Ultra Petroleum Corp.
AMEX      	EIM                 	Eaton Vance Insured Municipal Bond Fund
NYSE      	BUH                 	Buhrmann Nv
NYSE      	NRU                 	National Rural Utilities Cooperative Finance Corp
INDEX     	XDH                 	Broadband Holders Index
NASDAQ    	CKSW                	ClickSoftware Technologies Ltd.
NASDAQ    	LAYN                	Layne Christensen Company
NYSE      	KLD                 	iShares KLD Select Social Index Fund
NYSE      	HTE                 	HARVEST ENERGY TRUST
AMEX      	EDA.U               	ENDEAVOR ACQUISITION CORP
NYSE      	NSS                 	Group, Inc.
TSE       	EAT.UN.TO           	Prime Restaurants Royalty Uts
TSE       	LB.PR.E.TO          	Laurentian Bank Pfd 10
NYSE      	PWI                 	PrimeWest Energy Trust
NASDAQ    	UTIW                	UTi Worldwide Inc.
NYSE      	VTS                 	Veritas DGC, Inc.
TSE       	IPS.TO              	Ipsco Inc
NASDAQ    	PCYO                	Pure Cycle Corporation
NASDAQ    	SPAB                	SPACEHAB, Incorporated
NASDAQ    	NPBCO               	National Penn Bancshares, Inc.
NYSE      	BMY                 	Lehman ABS Corporation
NYSE      	GE                  	General Electric Company
INDEX     	MBM                 	Fincl Svcs Bridges Baskt Value
NASDAQ    	MTEX                	Mannatech, Incorporated
NASDAQ    	PATR                	Patriot Transportation Holding, Inc.
TSE       	WQM.TO              	Western Quebec Mines Inc
INDEX     	XGG                 	iShares S&P Global Financials Sector
NYSE      	BLL                 	Ball Corporation
NYSE      	NCZ                 	Nicholas-Applegate Convertible & Income Fund II
AMEX      	AFT                 	AXESSTEL INC
NASDAQ    	TRFX                	Traffix, Inc.
NYSE      	CDI                 	CDI Corporation
TSE       	SDF.UN.TO           	Signature Diversified Value Tr
NYSE      	JRT                 	JER Investors Trust, Inc.
NASDAQ    	MRGE                	Merge Technologies Inc.
TSE       	TAG.TO              	TD Select Canadian Growth
TSE       	EPM.TO              	European Minerals Cp
NYSE      	IIF                 	Morgan Stanley India Investment Fund, Inc.
AMEX      	ENX                 	Eaton Vance Insured New York Municipal Bond Fund
NASDAQ    	ICTG                	ICT Group, Inc.
TSE       	MPV.TO              	Mountain Province Diamonds Inc
TSE       	GIF.UN.TO           	Gienow Windows & Doors Income
NYSE      	MTS                 	Montgomery Street Income Securities, Inc.
NYSE      	ENR                 	Energizer Holdings, Inc.
INDEX     	HSS                 	AMEX INDICATIVE VALUE FOR WACHO
TSE       	ADS.TO              	Adaltis Inc
NASDAQ    	GRMN                	Garmin Ltd.
NASDAQ    	ONAV                	OMEGA NAVIGATION
NASDAQ    	MEOH                	Methanex Corporation
NASDAQ    	GEOI                	GeoResources, Inc.
NASDAQ    	NAVRE               	NAVARRE CP
NYSE      	IHR                 	MeriStar Hotels & Resorts, Inc.
NYSE      	FIF                 	Financial Federal Corporation
NASDAQ    	CLEC                	US LEC Corp.
AMEX      	SNQ                 	MS PLUS BSD S& P 500
INDEX     	MIH                 	MID HI/LO AVGE
NASDAQ    	CRNS                	Cronos Group (The)
TSE       	CVG.TO              	Clairvest Group Inc
NASDAQ    	ARGN                	Amerigon Incorporated
TSE       	NUR.TO              	Nurun Inc
NYSE      	XFJ                 	Lehman ABS Corporation
NASDAQ    	KEYN                	Keynote Systems, Inc.
NYSE      	NTC                 	Nuveen Connecticut Premium Income Municipal Fund
NYSE      	CRI                 	Carter's, Inc.
NASDAQ    	SPPR                	Supertel Hospitality, Inc.
NASDAQ    	TECD                	Tech Data Corporation
AMEX      	RSB                 	Citigroup Global Markets Holdings Inc
AMEX      	GIT                 	MORGAN STANLEY
NASDAQ    	ARDI                	@Road, Inc.
TSE       	FCC.TO              	Frontera Copper Cp
NYSE      	CLI                 	Mack-Cali Realty Corporation
NASDAQ    	EWST                	Energy West, Inc.
NASDAQ    	INTN                	INTAC International
NYSE      	RUS                 	Russ Berrie and Company, Inc.
NASDAQ    	INMD                	IntegraMed America, Inc.
NASDAQ    	ACTU                	Actuate Corporation
NYSE      	BHE                 	Benchmark Electronics, Inc.
TSE       	PFD.PR.A.TO         	Charterhouse Preferred Share
NASDAQ    	FCFL                	First Community Bank Corporation of America (FL)
NYSE      	CFN                 	Lehman ABS Corporation
TSE       	THY.UN.TO           	Thunder Energy Trust
NYSE      	CLX                 	Clorox Company (The)
INDEX     	TWI                 	Taiwan Weighted
NASDAQ    	EPCT                	EPICEPT CORPORATION
NASDAQ    	PRTR                	Partners Trust Financial Group, Inc.
TSE       	FNX.TO              	FNX Mining Inc
NASDAQ    	EDGR                	EDGAR Online, Inc.
NASDAQ    	TAYD                	Taylor Devices, Inc.
NYSE      	F                   	Ford Motor Credit Company
NYSE      	JPM                 	J.P. Morgan Chase & Co.
AMEX      	SWB                 	Smith & Wesson Holding Corp
NASDAQ    	PRGS                	Progress Software Corporation
NASDAQ    	STRA                	Strayer Education, Inc.
NASDAQ    	JRJC                	China Finance Online Co.
AMEX      	TLT                 	iShares Lehman 20 Year Treasury Bond Fund
NASDAQ    	DASTY               	Dassault Systemes, S.A.
AMEX      	TUX                 	Tuxis Corporation
NASDAQ    	XIDEW               	Exide Technologies
NASDAQ    	FISV                	Fiserv, Inc.
NYSE      	KNO                 	Lehman ABS Corporation
AMEX      	HSB                 	Citigroup Global Markets Holdings Inc
NYSE      	GLG                 	Glamis Gold Ltd.
NASDAQ    	FCAP                	First Capital, Inc.
NASDAQ    	ADEP                	ADEPT TECHNOLOGY
NASDAQ    	SNIC                	Sonic Solutions
TSE       	JNI.TO              	Jaguar Nickel Inc
NASDAQ    	NADX                	National Dentex Corporation
INDEX     	NJKD                	ID JKD INDEX
TSE       	TD.TO               	Toronto Dominion Bank
NYSE      	AVK                 	Advent Claymore Convertible Securities and Income Fund
AMEX      	BTI                 	British American Tobacco  Industries, p.l.c.
NYSE      	KNH                 	Lehman ABS Corporation
NASDAQ    	SMTB                	Smithtown Bancorp Inc
TSE       	DEN.TO              	Denison Mines Inc
NYSE      	WTS                 	Watts Water Technologies, Inc.
NASDAQ    	YANB                	Yardville National Bancorp
NYSE      	IKJ                 	Bank of America Corporation
TSE       	WED.TO              	Westaim Cp
NASDAQ    	ANAD                	ANADIGICS, Inc.
NASDAQ    	INPH                	Interphase Corporation
NASDAQ    	TBHSW               	The Bank Holdings, Inc.
AMEX      	AXJ                 	AXM Pharma, Inc.
AMEX      	VII                 	Vicon Industries, Inc
AMEX      	RNJ                 	BlackRock New Jersey Investment Quality Municipal Trust Inc.
AMEX      	PAL                 	North American Palladium, Ltd.
NYSE      	JOE                 	St. Joe Company (The)
NASDAQ    	DUSA                	DUSA Pharmaceuticals, Inc.
TSE       	CDC.TO              	China Diamond Corp
AMEX      	VGT                 	Vanguard Information Technology VIPERs
NYSE      	ROC                 	Rockwood Holdings, Inc.
TSE       	NEW.PR.B.TO         	Newgrowth Cp Pfd B
NYSE      	CXH                 	Colonial Investment Grade Municipal Trust
NYSE      	NOV                 	National-Oilwell, Inc.
NYSE      	MTB                 	M&T Bank Corporation
NYSE      	RIT                 	Real Estate Income Fund Inc
NASDAQ    	FARO                	FARO Technologies, Inc.
INDEX     	NVW                 	iShares GS Semiconductor Index Fund
NASDAQ    	OBAS                	Optibase Ltd.
NYSE      	IX                  	Orix Corp Ads
NASDAQ    	TCMI                	TRIPLE CRWN MEDIA
NYSE      	TOL                 	Toll Brothers Inc.
AMEX      	MNG                 	Miramar Mining Corporation
AMEX      	OHB                 	Orleans Homebuilders, Inc.
NYSE      	SFL                 	Ship Finance International
NYSE      	VKV                 	Van Kampen Value Municipal Income Trust
NASDAQ    	CNMD                	CONMED Corporation
NYSE      	SZE                 	SUEZ ADS
NYSE      	FSH                 	Fisher Scientific International Inc.
AMEX      	CAW                 	CCA Industries, Inc.
AMEX      	MXM                 	MAXXAM Inc.
NASDAQ    	PTIX                	Performance Technologies, Incorporated
TSE       	ATA.TO              	ATS Automation Tooling Sys
TSE       	DY.TO               	Dynatec Cp
NASDAQ    	TOMO                	Tom Online Inc.
NASDAQ    	BITS                	Bitstream Inc.
NYSE      	AVZ                 	Amvescap Plc
TSE       	GBU.TO              	Gabriel Resources Ltd
AMEX      	CXN                 	Circle Group Holdings, Inc.
AMEX      	CUP.W               	PERU COPPER WTS 2006
NYSE      	PJC                 	Piper Jaffray Companies
INDEX     	TBO                 	AMEX TOBACCO INDEX SETTLEMENT
TSE       	ZEN.TO              	Zenon Environmental Inc
NYSE      	AC                  	Alliance Capital Management Holding L.P.
NASDAQ    	CHRD                	Chordiant Software, Inc.
TSE       	SXR.TO              	SXR Uranium One Inc
NASDAQ    	URBN                	Urban Outfitters, Inc.
AMEX      	MIW                 	Eaton Vance Insure Michigan Municipal Bond Fund
NASDAQ    	VLNC                	Valence Technology, Inc.
NASDAQ    	MUSA                	Metals USA, Inc. New
NASDAQ    	QQQQ                	NASDAQ-100 Index Tracking Stock
NYSE      	AGM                 	Federal Agricultural Mortgage Corporation
NASDAQ    	RBCAA               	Republic Bancorp, Inc.
TSE       	PBI.UN.TO           	Premium Brands Income Fund
NASDAQ    	STXS                	Stereotaxis, Inc.
TSE       	CLB.UN.TO           	Colabor Income Fund
NASDAQ    	LLTC                	Linear Technology Corporation
NASDAQ    	KONG                	KongZhong Corporation
NASDAQ    	MSBK                	Main Street Banks, Inc.
AMEX      	MPL                 	Morgan Stanley Dean Witter & Co.
NASDAQ    	QBAK                	Qualstar Corporation
TSE       	GRZ.TO              	Gold Reserve Inc Cl A
NYSE      	HGR                 	Hanger Orthopedic Group, Inc.
NASDAQ    	ESCH                	Eschelon Telecom, Inc.
NYSE      	LIZ                 	Liz Claiborne, Inc.
NASDAQ    	ITIC                	Investors Title Company
INDEX     	NNY                 	US 100
NASDAQ    	COLT                	COLT Telecom Group plc
NASDAQ    	UBOH                	United Bancshares, Inc.
NYSE      	BKK                 	Blackrock Municipal 2020 Term Trust
NASDAQ    	VBFC                	Village Bank and Trust Financial Corp.
NYSE      	VPQ                 	Van Kampen Pennsylvania Quality Municipal Trust
TSE       	RSF.UN.TO           	Royal Lepage Franchise Service
NYSE      	CNP                 	CenterPoint Energy, Inc (Holding Co)
TSE       	TD.PR.M.TO          	Toronto Dominion Bank Pfd M
TSE       	MEQ.TO              	Mainstreet Equity Cp
NYSE      	HTR                 	Hyperion Total Return Fund, Inc. (The)
NASDAQ    	OVTI                	OmniVision Technologies, Inc.
NYSE      	THS                 	Treehouse Foods, Inc.
NASDAQ    	WWIN                	Waste Industries USA, Inc.
NASDAQ    	MRAE                	Mirae Corporation
NYSE      	CHZ                 	Chittenden Corporation
NYSE      	GJP                 	SYNTHETIC FIXED-INCOME STRATS
NASDAQ    	ETWC                	ETRIALS WORLDWIDE
NASDAQ    	ATGN                	AltiGen Communications, Inc.
NYSE      	PSA.A               	PUBLIC STORAGE INC
TSE       	GMP.TO              	GMP Capital Cp
NASDAQ    	GCFB                	Granite City Food & Brewery Ltd.
NYSE      	NJ                  	Nidec Corporation (Nihon Densan Kabushiki Kaisha)
AMEX      	HBX                 	HANA BIOSCIENCES INC
NASDAQ    	JOYG                	Joy Global Inc.
NYSE      	HIS                 	CIGNA High Income
NYSE      	HJE                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	OCN                 	Ocwen Financial Corporation
NASDAQ    	NITE                	Knight Capital Group, Inc.
NYSE      	WXH                 	Winston Hotels, Inc.
NASDAQ    	UCBC                	Union Community Bancorp
NYSE      	AHS                 	AMN Healthcare Services Inc
NASDAQ    	OPEN                	Open Solutions, Inc.
NYSE      	SBG                 	Salomon Brothers 2008 Worldwide Dollar Government Term Trust I
INDEX     	DZM                 	DYNAMIC MEDIA INTELLIDEX
NYSE      	BLK                 	BlackRock, Inc.
TSE       	ML.TO               	Mercator Minerals Ltd
NYSE      	BCM                 	Canadian Imperial Bank of Commerce
NYSE      	KMG                 	Kerr-McGee Corporation
NYSE      	CFB                 	Commercial Federal Corporation
NYSE      	GFR                 	Great American Financial Resources, Inc.
NASDAQ    	VYFC                	VALLEY FINL CORP
NYSE      	XJT                 	EXPRESSJET HOLDINGS INC
AMEX      	RIV                 	Riviera Holdings Corporation
NASDAQ    	COGN                	Cognos Incorporated
NASDAQ    	MOVE                	HOMESTORE INC
AMEX      	WCS                 	MORGAN STANLEY
TSE       	STR.TO              	Financial Services Inc Cap Yld
NYSE      	EBI                 	EVERGREEN INTERNATIONAL BALANC
AMEX      	NWI                 	Nuveen Maryland Dividend Advantage Municipal Fund 3
NASDAQ    	MGEE                	MGE Energy Inc.
NYSE      	HAE                 	Haemonetics Corporation
NYSE      	BBX                 	BankAtlantic Bancorp, Inc.
NYSE      	DCM                 	NTT Docomo Inc
NASDAQ    	XOMA                	XOMA Ltd.
TSE       	ACU.TO              	African Copper PLC
NASDAQ    	MIGP                	Mercer Insurance Group, Inc.
NASDAQ    	DVSA                	Diversa Corporation
NASDAQ    	LNDU                	Merrill Lynch & Co., Inc.
NASDAQ    	CTHR                	Charles & Colvard Ltd
TSE       	FRG.TO              	Fronteer Development Group Inc
AMEX      	IWN                 	iShares Russell 2000 Value Index Fund
INDEX     	XID                 	AMEX Industrial Sub Index
AMEX      	JEN                 	Jennifer Convertibles, Inc.
NYSE      	RI                  	Ruby Tuesday, Inc.
AMEX      	SSE                 	Southern Connecticut Bancorp Inc
NYSE      	SDX                 	SODEXHO ALLIANCE SA
TSE       	RRL.TO              	Resilient Resources Ltd
NASDAQ    	FSTF                	First State Financial Corporation
TSE       	CLL.TO              	Connacher Oil And Gas Ltd
NYSE      	BYD                 	Boyd Gaming Corporation
AMEX      	MJP                 	Morgan Stanley Dean Witter & Co.
NASDAQ    	RGCO                	RGC Resources Inc.
TSE       	HSG.TO              	Harris Steel Group Inc
NASDAQ    	LABL                	Multi-Color Corporation
NYSE      	IBN                 	ICICI Bank
NYSE      	BID                 	Sotheby's Holdings, Inc.
TSE       	TDB.M.TO            	TD Mortgage Investment Cp
NYSE      	MUE                 	MuniHoldings Insured Fund II, Inc.
INDEX     	MUV                 	S&P MidCap 400/BARRA Value Index
NASDAQ    	NSTR                	NORTHSTAR NEUROSCI
NASDAQ    	GEMS                	Glenayre Technologies, Inc.
NASDAQ    	WASH                	Washington Trust Bancorp, Inc.
NASDAQ    	ROLL                	RBC Bearings Incorporated
AMEX      	TRT                 	Trio-Tech International
TSE       	IUC.TO              	International Uranium Cp
NYSE      	ARG                 	Airgas, Inc.
NASDAQ    	RBIN                	R & B, Inc.
NYSE      	JKD                 	iShares Morningstar Large Core Index Fund
NYSE      	SGY                 	Stone Energy Corporation
INDEX     	ADVN                	NYSE Advances
NASDAQ    	WSTF                	Westaff Inc.
TSE       	XTC.TO              	Exco Technology Ltd
NYSE      	CYE                 	Corporate High Yield Fund III, Inc.
NYSE      	IRE                 	Governor and Company of the Bank of Ireland (The)
NYSE      	MFT                 	MuniYield Florida Fund, Inc.
NASDAQ    	ANPI                	Angiotech Pharmaceuticals, Inc.
NASDAQ    	AMAB                	AMERICASBANK CP NEW
NYSE      	WRI                 	Weingarten Realty Investors
INDEX     	BTD                 	Biotech Boxes Indicative Value
NYSE      	AEL                 	American Equity Investment Life Holding Company
TSE       	BNQ.UN.TO           	Bell Nordiq Income Fund
NASDAQ    	GLNG                	Golar LNG
NASDAQ    	OSBC                	Old Second Bancorp, Inc.
NASDAQ    	RCMT                	RCM Technologies, Inc.
NASDAQ    	ANEN                	Anaren, Inc.
TSE       	DTL.TO              	Dectron Internationale Inc
NYSE      	STT                 	State Street Corp
NYSE      	JHS                 	John Hancock Income Securities Trust
TSE       	IMO.TO              	Imperial Oil Ltd
NYSE      	TAP.A               	MOLSON COORS BREWING CO
AMEX      	BRB                 	BRUWICK BANCORP
NASDAQ    	VIDEE               	VIDEO DISPLAY CP
NASDAQ    	PTMK                	Pathmark Stores, Inc.
TSE       	PCA.TO              	Petro Canada
AMEX      	UTG                 	Reaves Utility Income Fund
TSE       	BEV.TO              	Bennett Environmental Inc
NYSE      	VIP                 	Open Joint Stock Company Vimpel-Communications
NYSE      	TRF                 	Templeton Russia Fund, Inc.
NYSE      	INZ                 	Ing Groep NV
INDEX     	IXR                 	Consumer Staples Select Sector Index
AMEX      	DBX                 	Morgan Stanley Dean Witter & Co.
NASDAQ    	CCBP                	Comm Bancorp, Inc.
NYSE      	PXP                 	Plains Exploration & Production Company
NASDAQ    	KRSL                	Kreisler Manufacturing Corporation
NASDAQ    	ZGEN                	ZymoGenetics, Inc.
NASDAQ    	NDSN                	Nordson Corporation
NYSE      	PKS                 	Six Flags, Inc.
NYSE      	NAV                 	Navistar International Corporation
NASDAQ    	ALOY                	Alloy, Inc.
INDEX     	DDO                 	AMEX DISK DRIVE INDEX FINAL SET
NASDAQ    	STFC                	State Auto Financial Corporation
AMEX      	NES                 	MORGAN STANLEY
NYSE      	BAX                 	BAXTER INTL INC
NYSE      	BPP                 	Blackrock Preferred Oopportunity Trust
NYSE      	IAK                 	ISHARES DOW JONES U.S. IURAN
NYSE      	LYO                 	Lyondell Chemical Company
NYSE      	NLY                 	Annaly Mortgage Management, Inc.
NYSE      	WSH                 	Willis Group Holdings
TSE       	GRS.TO              	GLR Resources Inc
NYSE      	KMX                 	CARMAX INC
INDEX     	XS                  	Merrill Lyn Stable Growth Index
NASDAQ    	EBAY                	eBay Inc.
NASDAQ    	LCAV                	LCA-Vision Inc.
TSE       	LPV.UN.TO           	Global Strategy Master Lp Unit
NASDAQ    	MIDD                	Middleby Corporation (The)
TSE       	EXA.TO              	ExAlta Energy Inc
NASDAQ    	CTZN                	Citizens First Bancorp, Inc.
NASDAQ    	CATS                	Catalyst Semiconductor, Inc.
INDEX     	DWU                 	DYNAMIC UTILITIES INTELLIDEX
NYSE      	PBI                 	PITNEY BOWES INC
NYSE      	GMW                 	General Motors Corporation
NYSE      	PNI                 	Pimco New York Municipal Income Fund II
AMEX      	QCC                 	QUEST CAP CORP
NYSE      	CG                  	Loews Corporation
NYSE      	CGO                 	CALAMOS GLOBAL TOTAL RETURN FU
NASDAQ    	BJRI                	BJ's Restaurants, Inc.
NASDAQ    	SOHU                	Sohu.com Inc.
NYSE      	HMY                 	Harmony Gold Mining Co. Ltd.
NASDAQ    	RCCC                	Rural Cellular Corporation
TSE       	SCX.SV.A.TO         	Stonington Capital Cp Cl A
NYSE      	RRA                 	RailAmerica, Inc.
AMEX      	TEC                 	Teton Energy Corporation
NASDAQ    	MBAYD               	MEDIABAY INC NEW
NASDAQ    	SRTI                	Sunrise Telecom Incorporated
NYSE      	SSP                 	E.W. Scripps Company (The)
AMEX      	LNG                 	Cheniere Energy, Inc.
NYSE      	SHI                 	SINOPEC Shangai Petrochemical Company, Ltd.
NYSE      	EC                  	Engelhard Corporation
NASDAQ    	ZUMZ                	Zumiez Inc.
NASDAQ    	INSM                	Insmed, Inc.
NYSE      	ETF                 	Emerging Markets Telecommunications Fund (The)
TSE       	SLR.TO              	Solitario Resources Cp
NASDAQ    	ATLRS               	Atlantic Realty Trust
NYSE      	CSH                 	Cash America International, Inc.
AMEX      	EAD                 	Evergreen Income Advantage Fund
TSE       	CRU.TO              	Crew Gold Cp
NASDAQ    	CLRK                	Color Kinetics Incorporated
NASDAQ    	ULTI                	Ultimate Software Group, Inc. (The)
NASDAQ    	MTXCP               	Matrix Bancorp, Inc
NYSE      	WC                  	WELLCHOICE INC
AMEX      	SDM                 	MORGAN STANLEY
NYSE      	TAL                 	TAL INTERNATIONAL GROUP INC
TSE       	GND.TO              	Gennum Cp
NYSE      	BPO                 	Brookfield Properties Corporation
NASDAQ    	WRLD                	World Acceptance Corporation
NASDAQ    	CYAN                	Cyanotech Corporation
NASDAQ    	HWKN                	Hawkins, Inc.
NYSE      	OCA                 	Orthodontic Centers of America, Inc.
NYSE      	MTU                 	MITSUBISHI UFJ FINANCIAL GROUP
NYSE      	CVD                 	Covance Inc.
NYSE      	EIX                 	Edison International
NASDAQ    	DIIB                	Dorel Industries, Inc.
NASDAQ    	BOOT                	LaCrosse Footwear, Inc.
NASDAQ    	OSBCP               	Old Second Bancorp, Inc.
NYSE      	MMP                 	Magellan Midstream Partners L.P.
NASDAQ    	CRESY               	Cresud S.A.C.I.F. y A.
NASDAQ    	PWEI                	PW Eagle Inc.
AMEX      	DJE                 	Citigroup Global Markets Holdings Inc
NYSE      	MFC                 	Manulife Financial Corp
AMEX      	AID                 	Law Enforcement Associates Corporation
NYSE      	SLH                 	Strategic Hotel Capital Inc
NYSE      	TMM                 	Grupo TMM, S.A.
NASDAQ    	NWECW               	NorthWestern Corporation
NYSE      	LMC.B               	LIBERTY MEDIA CORP NEW
NYSE      	DRQ                 	Dril-Quip, Inc.
NASDAQ    	LCCI                	LCC International, Inc.
NASDAQ    	BMTI                	BIOMIMETIC THERAPEUT
NYSE      	PFO                 	Flaherty & Crumrine Preferred Income Opportunity Fund Inc
NYSE      	DRE                 	Duke Realty Corporation
AMEX      	FEP                 	Franklin Electronic Publishers, Inc.
TSE       	BBD.PR.C.TO         	Bombardier Inc 6.25% Ser 4 Pfd
NYSE      	SQM.A               	SOCIEDAD QUIMICA Y MINERA DE
NYSE      	BDN                 	Brandywine Realty Trust
AMEX      	TAG                 	Tag-It Pacific, Inc.
NYSE      	JZO                 	Corporate Backed Trust Ctfs
NYSE      	TPC                 	Triton PCS Holdings, Inc.
AMEX      	SHY                 	iShares Lehman 1-3 Year Treasury Bond Fund
NASDAQ    	IFIN                	Investors Financial Services Corp.
NYSE      	SRR                 	Stride Rite Corporation (The)
AMEX      	ILY                 	Citigroup Global Markets Holdings Inc
NYSE      	HZO                 	MarineMax, Inc.
NASDAQ    	DGAS                	Delta Natural Gas Company, Inc.
NASDAQ    	CPST                	Capstone Turbine Corporation
NYSE      	AXR                 	AMREP Corporation
NASDAQ    	CSJB                	Merrill Lynch & Co., Inc.
NYSE      	IAI                 	ISHARES DOW JONES U.S. BROKER-
NASDAQ    	TSAI                	Transaction Systems Architects , Inc.
TSE       	AMR.TO              	AMR Technologies Inc
NYSE      	SAX                 	Saxon Capital, Inc.
NASDAQ    	HIFN                	hi/fn, inc.
NYSE      	PDX                 	Pediatrix Medical Group, Inc.
NASDAQ    	VLTS                	Valentis, Inc.
TSE       	XRE.TO              	iUnits S&P/TSX REIT
NYSE      	KAI                 	KADANT INC
NASDAQ    	CWST                	Casella Waste Systems, Inc.
NASDAQ    	CUBA                	Herzfeld Caribbean Basin Fund, Inc. (The)
NASDAQ    	PBTC                	Peoples BancTrust Company, Inc. (The)
AMEX      	CDY                 	Cardero Resource Corporation
NASDAQ    	CVGW                	Calavo Growers, Inc.
TSE       	GNA.TO              	Gerdau Ameristeel Cp
NYSE      	BNS                 	Bank of Nova Scotia (The)
INDEX     	RUT                 	Russell 2000 Index
NYSE      	CHI                 	Calamos Convertible Opportunities and Income Fund
AMEX      	JAX                 	J. Alexanders Cp
NYSE      	MDZ                 	MDS, Inc.
TSE       	BME.TO              	Burmis Energy Inc
NYSE      	ADC                 	Agree Realty Corporation
NYSE      	EOP                 	Equity Office Properties Trust
AMEX      	PHO                 	PowerShares Water Resources
NYSE      	OIA                 	MS Municipal Income Opportunities Trust
AMEX      	MRB                 	Metallica Resources Inc.
NASDAQ    	PKBK                	Parke Bancorp, Inc.
NASDAQ    	WPPGY               	WPP Group plc
NASDAQ    	ALTU                	ALTUS PHARMACEUTICAL
NYSE      	IFX                 	INFINEON TECHNOLOGIES AG
NYSE      	CTS                 	CTS Corporation
NYSE      	HPT                 	Hospitality Properites Trust
NYSE      	KRG                 	Kite Realty Group Trust
NASDAQ    	MKTAY               	Makita Corp.
NYSE      	AMH                 	Amerus Group Company
NYSE      	PHD                 	Pioneer Floating Rate Trust
NYSE      	HD                  	Home Depot, Inc. (The)
AMEX      	FSM                 	Foodarama Supermarkets, Inc.
NASDAQ    	WEDX                	Westaim Corporation (The)
NYSE      	HNI                 	HON INDUSTRIES Inc.
NYSE      	TPP                 	TEPPCO Partners, L.P.
TSE       	STB.UN.TO           	Student Transport Of America
NASDAQ    	GRIF                	Griffin Land & Nurseries, Inc.
NASDAQ    	FWLTZ               	Foster Wheeler Ltd.
NASDAQ    	CSCQ                	Correctional Services Corporation
TSE       	TPX.LV.A.TO         	Molson Coors Canada Cl A Exch
NASDAQ    	ACLI                	AMERICAN COMML LN
NASDAQ    	SSAG                	SSA Global Technologies, Inc.
NASDAQ    	PCNTF               	Pacific Internet
NASDAQ    	CRME                	Cardiome Pharma Corporation
NYSE      	DDR                 	Developers Diversified Realty Corporation
AMEX      	AMM                 	Advantage Marketing Systems, Inc.
NYSE      	ATG                 	AGL Resources, Inc.
AMEX      	FVL                 	First Trust Value Line 100 Fund
AMEX      	CGS                 	Citigroup Global Markets
INDEX     	MKT                 	PHLX ADV MARKETS
NASDAQ    	CRFN                	Crescent Financial Corporation
NASDAQ    	TTIL                	TTI Team Telecom International Ltd.
TSE       	WB.TO               	Workbrain Cp
NASDAQ    	SONT                	Sontra Medical Corporation
NYSE      	PH                  	Parker-Hannifin Corporation
NASDAQ    	BLKB                	Blackbaud, Inc.
NYSE      	KSJ                 	Structured Products Inc 8% CorTS
NASDAQ    	CTTY                	Catuity Inc.
NYSE      	GRP                 	Grant Prideco, Inc.
NASDAQ    	CALM                	Cal-Maine Foods, Inc.
TSE       	AO.TO               	Algo Group Inc
NYSE      	PVH                 	Phillips-Van Heusen Corporation
NYSE      	AJG                 	Arthur J. Gallagher & Co.
NYSE      	DNA                 	Genentech, Inc.
NYSE      	GG                  	Goldcorp Incorporated
AMEX      	TOX                 	Medtox Scientific, Inc.
TSE       	FXL.TO              	Fairborne Energy Ltd
AMEX      	NKO                 	Nuveen Insured New York Dividend Advantage Municipal Fund
TSE       	FTX.TO              	FET Resources Ltd
NASDAQ    	TQNT                	TriQuint Semiconductor, Inc.
AMEX      	MHG                 	Meritage Hospitality Group Inc.
NASDAQ    	CMCSA               	Comcast Corporation
TSE       	SSI.UN.TO           	Sterling Shoes Income Fund
AMEX      	HTL                 	Heartland Partners, L.P.
NASDAQ    	AFBKW               	Albemarle First Bank (Charlottesville, VA)
INDEX     	RLV                 	Cboe 1000 Value Index
NASDAQ    	CRDN                	Ceradyne, Inc.
INDEX     	SML                 	S&P Small Caps 600 Index
NYSE      	NVH                 	National R.V. Holdings, Inc.
INDEX     	PHP                 	Healthcare Prudents Undly Bskt
NASDAQ    	GLGC                	Gene Logic Inc.
NASDAQ    	CMBC                	Community Bancorp Inc.
NASDAQ    	THRX                	Theravance, Inc.
NASDAQ    	ALTH                	Allos Therapeutics, Inc.
TSE       	PBK.UN.TO           	Crown Hill Dividend Fund
AMEX      	TOI                 	TARGETS TRUST XXIV
INDEX     	DXV                 	Diamonds Tr Index
AMEX      	VBR                 	Vanguard Small-Cap Value VIPERs
TSE       	NPR.UN.TO           	Northern Property REIT Uts
NASDAQ    	MYGN                	Myriad Genetics, Inc.
AMEX      	AVM                 	Advanced Magnetics, Inc.
NASDAQ    	MAIN                	Main Street Restaurant Group, Inc.
NYSE      	LXP                 	Lexington Corporate Properties Trust
AMEX      	LQD                 	iShares GS$ InvesTop Corporate Bond
AMEX      	JDO                 	JED OIL INC
NASDAQ    	ATML                	Atmel Corporation
NYSE      	KTB                 	Lehman ABS Corporation
NASDAQ    	PKDY                	Packaging Dynamics Corporation
NYSE      	CP                  	Canadian Pacific Railway
NYSE      	IVW                 	iShares S&P 500 Growth
AMEX      	NUJ                 	Nuveen New Jersey Dividend Advantage Municipal Fund 2
NASDAQ    	HAVNP               	New York Community Bancorp, Inc.
TSE       	IGM.TO              	IGM Financial Inc
NASDAQ    	IPCR                	IPC Holdings,
NYSE      	TKP                 	Technip
NASDAQ    	BOSC                	B.O.S. Better Online Solutions
NYSE      	EPB                 	Consolidated Edison, Inc.
NYSE      	COL                 	Rockwell Collins, Inc.
TSE       	LIQ.UN.TO           	Liquor Stores Income Fund
TSE       	EWP.UN.TO           	First Asset Equal Weight Pipes
NYSE      	TZF                 	Bear Stearns Depositor, Inc.
NASDAQ    	LNBB                	LNB Bancorp, Inc.
NASDAQ    	SOFO                	Sonic Foundry, Inc.
AMEX      	NTI                 	Northern Technologies International Corporation
AMEX      	PLE                 	Pinnacle Bancshares, Inc.
NYSE      	PCW                 	Pacific Century CyberWorks
NYSE      	NMI                 	Nuveen Municipal Income Fund, Inc.
NYSE      	MGB                 	Morgan Stanley Global Opportunity Bond Fund, Inc.
NYSE      	RES                 	RPC, Inc.
NYSE      	MYL                 	Mylan Laboratories, Inc.
NASDAQ    	VVTV                	ValueVision International, Inc.
TSE       	TWH.TO              	Tri White Cp
NYSE      	AXE                 	Anixter International Inc.
NYSE      	NY                  	iShares NYSE Composite Index Fund
NYSE      	NEM                 	Newmont Mining Corporation (Holding Company)
NASDAQ    	RTEC                	Rudolph Technologies, Inc.
NYSE      	DHF                 	Dreyfus High Yield Strategies Fund
NASDAQ    	AINV                	Apollo Investment Corporation
INDEX     	BOJ                 	Oil Industry Bridges Basket Vl
NASDAQ    	WSPI                	WEBSITE PROS INC.
AMEX      	NGA                 	North American Galvanizing & Coatings Inc
INDEX     	RCE                 	Stockcar Stocks Index
NYSE      	FSL.B               	FREESCALE SEMICONDUCTOR INC
NASDAQ    	GTSI                	GTSI Corp.
NYSE      	PJR                 	Merrill Lynch Depositor, Inc.
NASDAQ    	FFCO                	FedFirst Financial Corporation
NASDAQ    	CFHI                	Coast Financial Holdings, Inc.
NASDAQ    	SWWC                	Southwest Water Company
NASDAQ    	PSRC                	PalmSource, Inc.
AMEX      	HIV                 	Calypte Biomedical Corporation
NASDAQ    	FLXS                	Flexsteel Industries, Inc.
NYSE      	PLT                 	Plantronics, Inc.
NYSE      	LNC.P               	LINCOLN NATL CP PF 3
NASDAQ    	VRTY                	Verity, Inc.
TSE       	SKG.UN.TO           	Skylon Growth & Income Trust
INDEX     	NLF                 	iShares Dow Jones U.S. Financial Services Sector Index
TSE       	CRY.TO              	Cryptologic Inc
NYSE      	UNP                 	Union Pacific Corporation
NYSE      	HJK                 	MS Structured Asset SATUR BellSouth Cl A
AMEX      	NRB                 	Nuveen North Carolina Dividend Advantage Municipal Fund
NASDAQ    	CMRG                	Casual Male Retail Group, Inc.
NASDAQ    	LSCC                	Lattice Semiconductor Corporation
AMEX      	IG                  	IGI, Inc.
NASDAQ    	CAKE                	Cheesecake Factory Incorporated (The)
TSE       	FIT.UN.TO           	International Financial Income & Growth Trust
AMEX      	MAB                 	Eaton Vance Insured Massachusetts Municipal Bond Fund
NYSE      	CUZ                 	Cousins Properties Incorporated
AMEX      	PRH.W               	VITACUBE SYSTEMS HOLDINGS INC
NYSE      	ELY                 	Callaway Golf Company
NASDAQ    	FSTW                	Firstwave Technologies Inc.
NASDAQ    	FNBN                	FNB Corp.
TSE       	COM.TO              	Cardiome Pharma Cp
NYSE      	PMF                 	PIMCO Municipal Income Fund
NASDAQ    	AMPLP               	Ampal-American Israel Corporation
TSE       	EBR.TO              	Ember Resources Inc
NASDAQ    	WOLV                	NetWolves Corporation
AMEX      	IOC                 	Interoil Corp
NYSE      	MSD                 	Morgan Stanley Emerging Markets Debt Fund, Inc.
AMEX      	EKH                 	HOLDRS Europe
NASDAQ    	MUSAW               	Metals USA, Inc. New
NASDAQ    	CSCD                	Cascade Microtech, Inc.
NASDAQ    	PSAI                	Pediatric Services of America, Inc.
NYSE      	BWA                 	BorgWarner Inc.
AMEX      	IWO                 	iShares Russell 2000 Growth Index Fund
NASDAQ    	WRNC                	Warnaco Group Inc (The)
NASDAQ    	VPRT                	VISTAPRINT
NASDAQ    	AQNT                	aQuantive, Inc.
NYSE      	DTG                 	Dollar Thrifty Automotive Group, Inc.
AMEX      	VSR                 	Versar, Inc.
NASDAQ    	SORC                	Source Interlink Companies, Inc.
TSE       	DGI.UN.TO           	The Data Group Income Fund
NASDAQ    	CONR                	Conor Medsystems, Inc.
NYSE      	USU                 	USEC Inc.
AMEX      	IIA                 	ING Clarion Real Estate Income Fund
INDEX     	CIB                 	CONTINUOUS CRB INDEX
NYSE      	TSG                 	Sabre Holdings Corporation
NYSE      	HPC                 	Hercules Incorporated
TSE       	SCT.TO              	Solectron Global Services
AMEX      	PFT                 	Puradyn Filter Technologies Inc
NYSE      	CAM                 	Cooper Cameron Corporation
NASDAQ    	ESPD                	eSpeed, Inc.
INDEX     	BWW                 	POWERSHARES DYNAMIC LARGE CAP G
NASDAQ    	RLRN                	Renaissance Learning, Inc.
NASDAQ    	LBBB                	Liberty Bell Bank (NJ)
NASDAQ    	IPCC                	Infinity Property and Casualty Corporation
TSE       	ADC.PR.A.TO         	AIC Diversified Canada Pfd
NASDAQ    	JOBS                	51job, Inc.
NYSE      	NNI                 	Nelnet, Inc.
NASDAQ    	WINA                	Winmark Corporation
NYSE      	LNY                 	Landry's Restaurants, Inc.
TSE       	CDI.UN.TO           	Custom Direct Income Fund
NASDAQ    	MCCC                	Mediacom Communications Corporation
NASDAQ    	MSGI                	MSGI Security Solutions, Inc.
TSE       	YTU.UN.TO           	Years Financial Trust
NASDAQ    	PETM                	PETsMART, Inc.
NYSE      	PPC                 	Pilgrim's Pride Corporation
TSE       	EIA.TO              	Ecopia Biosciences Inc
NYSE      	FRX                 	Forest Laboratories, Inc.
NASDAQ    	TZIX                	TriZetto Group, Inc. (The)
TSE       	SGI.TO              	Signalenergy Inc
NASDAQ    	UPFC                	United PanAm Financial Corporation
NYSE      	XOM                 	Exxon Mobil Corporation
AMEX      	TGE                 	TGC Industries, Inc.
INDEX     	DJC                 	Dow Jones Composite
NASDAQ    	MTRX                	Matrix Service Company
NYSE      	XKS                 	Lehman ABS Corporation
NASDAQ    	MBFIP               	MB Financial Inc.
NASDAQ    	SCLN                	SciClone Pharmaceuticals, Inc.
NASDAQ    	SNSA                	Stolt-Nielsen S.A.
TSE       	PMD.TO              	PreMD Inc
TSE       	CTI.TO              	Chemokine Therapeutics Cp
AMEX      	ANS                 	AIRNET SYSTEMS INC
NASDAQ    	SBUX                	Starbucks Corporation
TSE       	SMT.TO              	Samuel Manufacturing Tech Inc
NASDAQ    	TARR                	Tarragon Corporation
NASDAQ    	IDTI                	Integrated Device Technology, Inc.
TSE       	PDT.TO              	Precision Assessment Tech Cp
NASDAQ    	FFSX                	First Federal Bankshares, Inc.
NYSE      	CMO                 	Capstead Mortgage Corporation
INDEX     	WWK                 	iShares MSCI Korea Index
NASDAQ    	INOW                	InfoNow Corporation
TSE       	GRY.SV.A.TO         	Graystone Cp Cl A
AMEX      	BNP                 	BNP Residential Properties, Inc.
TSE       	SAP.TO              	Saputo Inc
NASDAQ    	CRGI                	CORGI INTL LTD ADR
TSE       	WN.PR.A.TO          	George Weston Ltd Pfd A
NYSE      	VZC                 	Verizon South Inc.
NASDAQ    	STTX                	Steel Technologies Inc.
NYSE      	BEO                 	ENHANCED S&P
AMEX      	XLU                 	SPDR Utilities
NYSE      	RLI                 	RLI Corporation
NASDAQ    	DPTR                	Delta Petroleum Corporation
NASDAQ    	TSCC                	Technology Solutions Company
NYSE      	GPN                 	Global Payments Inc.
NYSE      	ICO                 	INTERNATIONAL COAL GROUP INC
NASDAQ    	CAVB                	Cavalry Bancorp, Inc.
NYSE      	KRV                 	Lehman ABS Corporation
NASDAQ    	CPTH                	Critical Path, Inc.
NASDAQ    	NWRE                	Neoware Systems Inc.
NYSE      	TRY                 	Triarc Companies, Inc.
NYSE      	ACP.P               	AMERICAN REAL ESTATE L P PFD
NYSE      	ENT                 	Equant, N.V.
NYSE      	TCO                 	Taubman Centers, Inc.
NASDAQ    	BPOPO               	Popular, Inc.
NYSE      	FF                  	First Financial Fund, Inc.
AMEX      	IJH                 	iShares S&P MidCap 400 Index Fund
INDEX     	BVP                 	Vanguard Small Cap Vipers Index
NASDAQ    	PXLW                	Pixelworks, Inc.
TSE       	TPW.UN.TO           	Transalta Power LP Unit
NYSE      	MJW                 	MS DW Structured Asset Corp
NASDAQ    	QEPC                	Q.E.P. Co., Inc.
NYSE      	IHP                 	IHOP Corporation
NYSE      	TV                  	Grupo Televisa S.A.
TSE       	PMU.TO              	Pacific Rim Mining Cp
NYSE      	SWW                 	Sitel Corporation
NYSE      	LCM                 	Advent/Claymore Enhanced Growth & Income Fund
NASDAQ    	CHCO                	City Holding Company
NYSE      	CPF                 	CPB Inc.
TSE       	AIM.UN.TO           	Art In Motion Income Fund
NYSE      	KVU                 	Lehman ABS Corporation
AMEX      	DRP                 	MORGAN STANLEY
NASDAQ    	CTAS                	Cintas Corporation
NASDAQ    	PFSW                	PFSweb, Inc.
NYSE      	ETN                 	Eaton Corporation
NASDAQ    	SMBI                	Symbion, Inc.
TSE       	NAL.UN.TO           	Newalta Income Fund
NASDAQ    	CWEI                	Clayton Williams Energy, Inc.
NASDAQ    	NTEC                	Neose Technologies, Inc.
TSE       	BCE.PR.Y.TO         	BCE Inc Pfd Y
TSE       	QC.TO               	Quest Capital Cp
NYSE      	PMI                 	PMI Group, Inc. (The)
NASDAQ    	XATA                	XATA Corporation
NYSE      	MHK                 	Mohawk Industries, Inc.
TSE       	SDT.UN.TO           	Sentry Select Diversified Uts
NYSE      	JPG                 	NUVEEN EQTY PREMIUM AND GROWTH
TSE       	NWI.TO              	Nuinsco Resources Ltd
TSE       	TUI.TO              	True Energy Inc
NASDAQ    	CBST                	Cubist Pharmaceuticals, Inc.
TSE       	RNG.TO              	Rio Narcea Gold Mines Ltd
NYSE      	MSO                 	Martha Stewart Living Omnimedia, Inc.
AMEX      	VTI                 	Vanguard Total Stock Market VIPERs
NYSE      	GDT                 	Guidant Corporation
NASDAQ    	ELGX                	Endologix  Inc
NYSE      	CEY                 	Certegy Inc.
NYSE      	ACF                 	AmeriCredit Corporation
NASDAQ    	DSWL                	Deswell Industries, Inc.
NYSE      	CPC                 	CENTRAL PKG CORP
TSE       	GBO.TO              	Groupe Bocenor Inc
NYSE      	STZ                 	Constellation Brands, Inc.
TSE       	CTD.UN.TO           	Citadel Diversified Investment
NASDAQ    	TLCV                	TLC Vision Corporation
NYSE      	AA                  	Alcoa Inc.
NYSE      	LU                  	Lucent Technologies, Inc.
NASDAQ    	SRVY                	Greenfield Online, Inc.
INDEX     	GNX                 	GSCI Spot Return
TSE       	GDS.TO              	Gendis Inc
NASDAQ    	APCFY               	Atlas Pacific
NYSE      	UN                  	Unilever NV
AMEX      	THM                 	THOMAS EQUIPMENT INC
NYSE      	SNA                 	Snap-On Incorporated
TSE       	BDA.UN.TO           	FirstAsset/BlackRock North American Dividend Achievers Trust
NASDAQ    	LONG                	eLong, Inc.
NYSE      	BGG                 	Briggs & Stratton Corporation
AMEX      	PDC                 	PIONEER DRILLING CO
NASDAQ    	SNTS                	Santarus, Inc.
NASDAQ    	WBSTP               	Webster Preferred Capital Corp
NYSE      	HYT                 	Corporate High Yield Fund VI Inc
TSE       	FSP.UN.TO           	Front Street Performance Fund
NYSE      	MKC.V               	MCCORMICK & CO INC
NYSE      	CLK                 	Clark Inc.
NYSE      	ASP                 	American Strategic Income Portfolio
NYSE      	OSK                 	Oshkosh Truck Corporation
TSE       	CET.UN.TO           	Cathedral Energy Services Uts
TSE       	ABF.UN.TO           	Associated Brands Income Fund
NASDAQ    	SGMA                	SigmaTron International, Inc.
AMEX      	ONT                 	On2 Technologies, Inc.
NYSE      	MX                  	Metso Corporation
AMEX      	WOC                 	Wilshire Enterprises Inc
NYSE      	CRD.A               	Crawford & Company
NYSE      	HQL                 	H&Q Life Sciences Investors
NYSE      	TPK                 	Travelers Property Casualty Corporation
NASDAQ    	HWAY                	HEALTHWAYS INC
NASDAQ    	ATPL                	Atlantis Plastics, Inc.
NYSE      	MOV                 	Movado Group Inc.
NASDAQ    	MOGN                	MGI PHARMA, Inc.
NYSE      	SRI                 	Stoneridge, Inc.
NYSE      	SIE                 	Sierra Health Services, Inc.
TSE       	LCP.UN.TO           	Lawrence Consv Payout Ratio Tr
TSE       	DSA.TO              	Dalsa Cp
AMEX      	CHC                 	CHARTERMAC
NASDAQ    	ARRS                	Arris Group Inc
NYSE      	UYE                 	Cabco Tr Jcp 7.625
NASDAQ    	WMGI                	Wright Medical Group, Inc.
NYSE      	VIN                 	Van Kampen Income Trust
NASDAQ    	SURG                	SYNERGETICS USA INC
NASDAQ    	GAIT                	Langer Inc.
TSE       	RAV.UN.TO           	Ravensource Fund
NASDAQ    	NAVG                	Navigators Group, Inc. (The)
INDEX     	PVOT                	S&P 500 Volume
NYSE      	TSP                 	Telecomunicacoes de Sao Paulo S.A.
NYSE      	TEU                 	CP Ships
NYSE      	IKL                 	Bank of America Corporation
TSE       	CCK.UN.TO           	Connor Clark & Lunn Conservative Income Fd II
NYSE      	LNN                 	Lindsay Manufacturing Co.
NYSE      	AP                  	Ampco-Pittsburgh Corporation
NASDAQ    	TBUS                	Digital Recorders, Inc.
NASDAQ    	VASO                	Vasomedical, Inc.
NASDAQ    	CYCC                	CYCLACEL PHARMACEUTI
NASDAQ    	YAVY                	Yadkin Valley Bank and Trust Company
NYSE      	WGL                 	Washington Gas Light Company
AMEX      	PWT                 	PowerShares Dynamic Small Cap Growth
AMEX      	MRI.B               	McRae Industries, Inc.
NASDAQ    	TIVO                	TiVo Inc.
NASDAQ    	CHAP                	Chaparral Steel Company
NASDAQ    	ITRA                	Intraware, Inc.
AMEX      	NFC                 	Nuveen Connecticut Dividend Advantage Municipal Fund
NASDAQ    	CFCI                	CFC International, Inc.
NYSE      	EQR                 	EQUITY RESIDENTIAL
NASDAQ    	BORD                	Boardwalk Bank
NASDAQ    	SMTS                	Somanetics Corporation
INDEX     	SSMI                	Swiss Market
NASDAQ    	ANSL                	Ansell
NASDAQ    	ASML                	ASML Holding N.V.
TSE       	GIL.TO              	Gildan Activewear Inc
NYSE      	SYM                 	SYMS CORP
TSE       	PFS.UN.TO           	PFD Securities Income Fd
TSE       	YRI.TO              	Yamana Gold Inc
NYSE      	MOG.B               	MOOG INC
INDEX     	NWO                 	DEUTSCHE BANK ENERGY INDEX FINA
NYSE      	RYL                 	Ryland Group, Inc. (The)
NASDAQ    	USIH                	USI Holdings Corporation
NASDAQ    	FSRV                	FirstService Corporation
TSE       	PVC.TO              	Pet Valu Canada Inc
NASDAQ    	MEAS                	MEASUREMENT SPEC INC
NASDAQ    	RMTIZ               	ROCKWELL MEDICAL TEC
NASDAQ    	SVNT                	Savient Pharmaceuticals Inc
NYSE      	ETO                 	Eaton Vance Tax-Advantage Global Dividend Opp
NASDAQ    	GBTB                	GB&T Bancshares
NYSE      	BWS                 	Brown Shoe Company, Inc.
NASDAQ    	EICU                	VISICU INC.
NYSE      	PYS                 	MERRILL LYNCH DEPOSITOR INC
TSE       	MIC.PR.A.TO         	Manufacturers Life Insurance
NASDAQ    	CELG                	Celgene Corporation
NYSE      	INT                 	World Fuel Services Corporation
INDEX     	NIW                 	iShares Russell Midcap Index Growth Fund
AMEX      	CAU                 	Canyon Resources Corporation
NASDAQ    	SYNP                	Synplicity, Inc.
NASDAQ    	NCIT                	NCI INC
NASDAQ    	MOBI                	Mobius Management Systems, Inc
NYSE      	NU                  	Northeast Utilities
TSE       	OFF.TO              	Crossoff Inc
NASDAQ    	GMXR                	GMX Resources, Inc.
NASDAQ    	ADZA                	Adeza Biomedical Corporation
NASDAQ    	SRLSE               	SERACARE LIFE SCI
TSE       	WSA.TO              	Western Areas NL
TSE       	NLC.TO              	National Challenge Systems Inc
NASDAQ    	TIBX                	TIBCO Software, Inc.
TSE       	ARF.UN.TO           	Armtec Infrastructure Income
NYSE      	NFI                 	NovaStar Financial, Inc.
TSE       	BRB.TO              	Brick Brewing Co Ltd
AMEX      	IDJ                 	Citigroup Global Markets Holdings Inc
TSE       	OTT.UN.TO           	Otelco Inc
NYSE      	LVB                 	Steinway Musical Instruments, Inc.
INDEX     	HVI                 	Vanguard Info Tech Vipers Index
INDEX     	TLZ                 	iShares Tr Lehman 20 Year Treasury Bond
NASDAQ    	OSIP                	OSI Pharmaceuticals Inc.
AMEX      	GLQ                 	Clough Global Equity Fund
NYSE      	KMI                 	Kinder Morgan, Inc.
NASDAQ    	CRMT                	America's Car-Mart, Inc.
NYSE      	ONB                 	Old National Bancorp Capital Trust I
NYSE      	CRT                 	Cross Timbers Royalty Trust
NASDAQ    	GSIC                	GSI Commerce, Inc.
NYSE      	LDL                 	Lydall, Inc.
NASDAQ    	ROIAK               	Radio One, Inc.
INDEX     	HXZ                 	POWERSHARES ZACKS MICRO CAP NAV
NASDAQ    	OYOG                	OYO Geospace Corporation
AMEX      	CSN                 	City Network, Inc.
NASDAQ    	CWCO                	Consolidated Water Co. Ltd.
INDEX     	EEV                 	iShares MSCI Emerg Market Index Fund
NASDAQ    	MNRTA               	Monmouth Real Estate Investment Corporation
NASDAQ    	TCHCZ               	21st Century Holding Company
NASDAQ    	VRSO                	Verso Technologies, Inc.
NASDAQ    	UEIC                	Universal Electronics Inc.
NASDAQ    	IVIL                	iVillage, Inc.
NASDAQ    	ACAT                	Arctic Cat Inc.
NYSE      	KRC                 	Kilroy Realty Corporation
NYSE      	TLP                 	Transmontaigne Partners L.P.
NYSE      	VSH                 	Vishay Intertechnology, Inc.
AMEX      	IMX.W               	IMPLANT SCIENCES WS
NASDAQ    	NCST                	NUCRYST PHARMACEUTIC
NYSE      	HS                  	HUGHES ELEC CORP
INDEX     	NNYP                	HEALTH CARE
NYSE      	OTL                 	Octel Corporation
NASDAQ    	HOLL                	Hollywood Media Corp.
NASDAQ    	SWKS                	Skyworks Solutions, Inc.
NYSE      	VPV                 	Van Kampen Pennsylvania Value Municipal Income Trust
NYSE      	NFX                 	Newfield Exploration Company
TSE       	ONC.TO              	Oncolytics Biotech Inc
AMEX      	CVN                 	CONVERSION SERVICES
NASDAQ    	SPPI                	Spectrum Pharmaceuticals, Inc.
TSE       	ACA.TO              	Ashton Mining Of Canada Inc
INDEX     	FTSA                	FTSE 350
NASDAQ    	HANA                	hanarotelecom incorporated
TSE       	TCW.TO              	Trican Well Service Ltd
TSE       	HR.UN.TO            	H&R Real Estate Investment
NASDAQ    	PEGS                	Pegasus Solutions Inc
NYSE      	IGA                 	ING GLOBAL ADVANTAGE AND PREMI
NYSE      	USA                 	Liberty All-Star Equity Fund
NYSE      	IPR                 	International Power Plc
NYSE      	ARA                 	Aracruz Celulose S.A.
NYSE      	BPK                 	Blackrock Municipal 2018 Term Trust
NASDAQ    	ADCT                	ADC Telecommunications, Inc.
TSE       	ADX.TO              	Advantex Marketing Intl Inc
NYSE      	XPP                 	Merrill Lynch Depositor, Inc.
NASDAQ    	LICB                	Long Island Financial Corp.
NYSE      	GNA                 	Gerdau AmeriSteel
INDEX     	TXV                 	Industrial Sector Fund SPDR UTV
TSE       	ARE.TO              	Aecon Group Inc
AMEX      	SMK                 	STOCK MARKET UPTURN NOTES LINK
NASDAQ    	PSUN                	Pacific Sunwear of California, Inc.
NYSE      	FBP                 	First BanCorp.
NASDAQ    	BWNG                	Broadwing Corporation
INDEX     	CTN                 	Csfb Technology Index
TSE       	NA.TO               	National Bank Of Canada
TSE       	ITW.TO              	Intrawest Cp
NYSE      	KCH                 	Lehman ABS Corporation
NASDAQ    	SBIT                	Summit Bancshares, Inc.
INDEX     	SEZ                 	SEMICON EQ
NASDAQ    	XRAY                	DENTSPLY International Inc.
NYSE      	MWJ                 	Morgan Stanley Capital Trust II
INDEX     	TAY                 	Ten Co Bridges Bskt Vl For Tpa
NASDAQ    	WSCI                	WSI Industries Inc.
NASDAQ    	SIVBO               	SVB Financial Group
NYSE      	PPP                 	Pogo Producing Company
NASDAQ    	BKBK                	Britton & Koontz Capital Corporation
AMEX      	EVP                 	Eaton Vance Pennsylvania Municipal Income Trust
NASDAQ    	EPIQ                	EPIQ Systems, Inc.
NYSE      	IYJ                 	iShares Dow Jones US Industrial Index
NYSE      	CCK                 	Crown Cork & Seal Company, Inc.
INDEX     	DZO                 	DYNAMIC BIOTECH & GENOME INTELL
NYSE      	GIS                 	General Mills, Inc.
NASDAQ    	FFDB                	FirstFed Bancorp, Inc.
NASDAQ    	VIAC                	ViaCell, Inc.
TSE       	NPC.TO              	Allon Therapeutics Inc
NASDAQ    	HBOS                	Heritage Financial Group
TSE       	DLR.TO              	Drillers Technology Cp
INDEX     	NBE                 	iShares Russell 3000 Growth Index
AMEX      	COI                 	Cogent Communications Group, Inc.
NASDAQ    	NEBS                	NEW ENGLAND BANC[CT]
NASDAQ    	KNOL                	Knology, Inc.
NYSE      	CFD                 	40/86 Strategic Income Fund
NYSE      	PGI                 	PTEK Holdings, Inc.
NYSE      	BBY                 	Best Buy Co., Inc.
NASDAQ    	XTLB                	XTL BIOPHARMACEUTICA
NYSE      	CDE                 	Coeur d'Alene Mines Corporation
AMEX      	EBK                 	MS PROPELS Value of Three International Indices
NYSE      	NYT                 	New York Times Company (The)
NYSE      	CAH                 	Cardinal Health, Inc.
AMEX      	BDL                 	Flanigan's Enterprises, Inc.
NYSE      	TFX                 	Teleflex Incorporated
NYSE      	NCI                 	Navigant Consulting, Inc.
TSE       	BLS.TO              	Boliden Ab
NYSE      	DNP                 	Duff & Phelps Utilities Income, Inc.
AMEX      	IEL                 	MERRILL LYNCH
NYSE      	PKD                 	Parker Drilling Company
NASDAQ    	CFFC                	Community Financial Corp.
NASDAQ    	IPSUW               	Imperial Sugar Company
NYSE      	FCY                 	Forest City Enterprises Inc
NASDAQ    	CHEV                	Cheviot Financial Corp
NASDAQ    	CHRZ                	Computer Horizons Corp.
TSE       	CTO.TO              	Circa Enterprises Inc
NASDAQ    	FREE                	FREESEAS INC
NYSE      	CSU                 	Capital Senior Living Corporation
NYSE      	JOF                 	Japan Smaller Capitalization Fund Inc
TSE       	PWX.TO              	Primewest Energy Inc
NYSE      	BFS                 	Saul Centers, Inc.
NASDAQ    	KBALB               	Kimball International, Inc.
NYSE      	PTP                 	Platinum Underwriters Holdings Ltd
INDEX     	XLR                 	RYDEX RUSSELL TOP 50 INDEX
NYSE      	DB                  	Deutsche Bank AG
NYSE      	BIF                 	USLIFE Income Fund, Inc.
NYSE      	PXR                 	Paxar Corporation
NYSE      	BNA                 	BlackRock Income Opportunity Trust Inc. (The)
AMEX      	BEM                 	Structured Product
AMEX      	OIH                 	HOLDRS Oil Service
NYSE      	WMT                 	Wal-Mart Stores, Inc.
INDEX     	CSO                 	MORGAN STANLEY COUMER INDEX F
NASDAQ    	WSFS                	WSFS Financial Corporation
INDEX     	RDM                 	FT  DJ SEL MICRO CAP INDEX FUND
INDEX     	CSE                 	All Share
AMEX      	GWM                 	Merrill Lynch & Co., Inc.
NYSE      	BCK                 	Blackrock California Insured Municipal Income Trust
NASDAQ    	APAGF               	APCO Argentina Inc.
NYSE      	BOY                 	Boykin Lodging Company
NYSE      	XCO                 	EXCO RESOURCES INC
NASDAQ    	INTT                	inTest Corporation
NYSE      	PJA                 	Preferred Plus Trust Ser QWS 2 Tr Ctf
NYSE      	MTL                 	Mechel Steel Group OAO
NYSE      	HRP                 	HRPT Properties Trust
NASDAQ    	PCBC                	Pacific Capital Bancorp
NYSE      	BNG                 	Benetton Group SPA
AMEX      	AWX                 	Avalon Holdings Corporation
NASDAQ    	IVTA                	InfoVista S.A.
TSE       	WRX.TO              	Wireless Matrix Cp
TSE       	TMC.TO              	TM Bioscience Cp
AMEX      	IIH                 	HOLDRS Internet Infrastructure
NYSE      	SBP                 	SANTANDER BANCORP
TSE       	KCA.TO              	Kasten Chase Applied Research
TSE       	RRZ.TO              	Rider Resources Ltd
NYSE      	EDV                 	COOLIDATED EDISON CO N Y I
NASDAQ    	PLCC                	Paulson Capital Corp.
NASDAQ    	RNWK                	RealNetworks, Inc.
NASDAQ    	AFCE                	AFC Enterprises, Inc.
AMEX      	FSI                 	Flexible Solutions International Inc.
TSE       	CU.PR.T.TO          	Canadian Utilities 2nd Pfd Q
NASDAQ    	BABY                	Natus Medical Incorporated
NASDAQ    	CTCO                	Commonwealth Telephone Enterprises, Inc.
NASDAQ    	WBPRZ               	W Holding Company Incorporated
NASDAQ    	UCBA                	UNITED COMMUNITY BAN
NYSE      	DSU                 	Debt Strategies Fund, Inc.
INDEX     	SCP                 	DJ Containers & Packaging
NASDAQ    	THFF                	First Financial Corporation Indiana
NYSE      	WR                  	WESTAR ENERGY INC
NASDAQ    	ARRB                	Merrill Lynch & Co., Inc.
NASDAQ    	CEMH                	Merrill Lynch & Co., Inc.
NYSE      	ISP                 	ING Groep NV
TSE       	GTU.UN.TO           	Central Gold Trust Uts
NASDAQ    	QGLY                	Quigley Corporation (The)
NASDAQ    	ALSCE               	ALLIANCE SEMICON
NYSE      	PHY                 	Prospect Street High Income Portfolio Inc.
AMEX      	RMI                 	Rotonics Manufacturing, Inc.
NASDAQ    	DSTI                	DayStar Technologies, Inc.
NASDAQ    	RAMR                	RAM HOLDINGS LTD.
NYSE      	GPT                 	Greenpoint Financial Corp
NASDAQ    	HLIT                	Harmonic Inc.
NYSE      	MYG                 	Maytag Corporation
NYSE      	DHI                 	D.R. Horton, Inc.
NYSE      	GP                  	Georgia-Pacific Corporation
TSE       	TNT.TO              	Triant Holdings Inc
NYSE      	HED                 	Head N.V.
TSE       	BC.PR.A.TO          	Bell Canada Pfd A
AMEX      	PGJ                 	PowerShares Golden Dragon Halter USX China Portfolio
TSE       	HMZ.TO              	HMZ Metals Inc
NYSE      	FTD                 	FTD Group, Inc.
NASDAQ    	SGEN                	Seattle Genetics, Inc.
INDEX     	DJT                 	Dow Jones Transport Average
NASDAQ    	APCS                	Alamosa Holdings, Inc.
NASDAQ    	AMSWA               	American Software, Inc.
NASDAQ    	SPSN                	SPAION INC.
NASDAQ    	NAHC                	National Atlantic Holdings Corporation
TSE       	BCE.PR.Z.TO         	BCE Inc Pfd Z
NASDAQ    	ELNK                	EarthLink, Inc.
NYSE      	MFA                 	America First Mortgage Investments, Inc.
AMEX      	VXF                 	Vanguard Extended Market VIPERs
NASDAQ    	BPFH                	Boston Private Financial Holdings, Inc.
AMEX      	BIZ                 	DSL.net, Inc.
NYSE      	WY                  	Weyerhaeuser Company
NYSE      	TDI                 	Telephone and Data Systems, Inc.
AMEX      	NYH                 	Eaton Vance Insured New York Municipal Bond Fund II
NASDAQ    	RURL                	Rural/Metro Corporation
NASDAQ    	GHCI                	Genesis HealthCare Corporation
NYSE      	ETB                 	Eaton Vance Tax-Managed Buy-Write Income Fund
NASDAQ    	SSTI                	Silicon Storage Technology, Inc.
AMEX      	PNO.W               	PATH 1 NETWORK WTS
NASDAQ    	UHCO                	Universal American Financial Corp.
NYSE      	TI.A                	TELECOM ITALIA S P A NEW
NASDAQ    	EMAG                	Emageon Inc.
INDEX     	SPMAT               	SP500 Materials Sector
NASDAQ    	ASBC                	Associated Banc-Corp
NYSE      	TXU                 	TXU Corporation
NYSE      	AET                 	Aetna Inc.
INDEX     	XNA                 	AMEX Natural Resources Sub Index
NASDAQ    	CHRK                	Cherokee International Corporation
TSE       	RIM.U.TO            	Research In Motion Ltd US$
NASDAQ    	TRAC                	Track Data Corporation
NASDAQ    	KEYW                	Essex Corp
NYSE      	SLF                 	Sun Life Financial Incorporated
NASDAQ    	MDCA                	MDC Partners Inc.
NASDAQ    	TRMP                	TRUMP ENTERTAINMENT
NYSE      	LRY                 	Liberty Property Trust
NYSE      	HVT                 	Haverty Furniture Companies, Inc.
TSE       	NIF.UN.TO           	Noranda Income Fund
NYSE      	AFC                 	Allmerica Financial Corporation
NYSE      	ATW                 	Atwood Oceanics, Inc.
AMEX      	RGN                 	Regenerx Biopharmaceuticals Inc
NYSE      	NQS                 	Nuveen Select Quality Municipal Fund, Inc.
NYSE      	JFP                 	Nuveen Tax-Advantaged Floating Rate Fund
NYSE      	BXC                 	Bluelinx Holdings Inc.
AMEX      	AFP                 	United Capital Corporation
NASDAQ    	MFNC                	Mackinac Financial Corporation
TSE       	PD.UN.TO            	Precision Drilling Trust Units
AMEX      	PW                  	Pittsburgh & West Virginia Railroad
AMEX      	ELR                 	streetTRACKS DJ Wilshire Large Cap
NASDAQ    	WBPRK               	W Holding Company Incorporated
NYSE      	MYI                 	MuniYield Insured Fund, Inc.
NYSE      	AEE                 	Ameren Corporation
NYSE      	MJY                 	MDSW Structured Asset Corporation
AMEX      	RUD                 	Citigroup Global Markets Holdings Inc
NASDAQ    	IMAX                	Imax Corporation
AMEX      	IOT                 	Income Opportunity Realty Trust
NASDAQ    	EPAX                	Ambassadors Group, Inc.
NASDAQ    	ILOG                	ILOG S.A.
TSE       	AEU.UN.TO           	Activenergy Income Fund
NASDAQ    	WAVX                	Wave Systems Corp.
AMEX      	SYS                 	SYS
NASDAQ    	LTRE                	Learning Tree International, Inc.
NASDAQ    	MPAC                	MOD-PAC CORP.
NYSE      	PVR                 	Penn Virginia Resource Partners LP
TSE       	RHE.TO              	Occulogix Inc
NASDAQ    	ASFI                	Asta Funding, Inc.
NASDAQ    	MCRI                	Monarch Casino & Resort, Inc.
NASDAQ    	OXGN                	OXiGENE, Inc.
TSE       	MIG.TO              	Milagro Energy Inc
TSE       	BUI.TO              	Buhler Industries Inc
NYSE      	MAV                 	Pioneer Municipal High Income Advantage Trust
INDEX     	FKO                 	POWERSHARES DIVIDEND ACHIEVERS
TSE       	BWI.UN.TO           	Business Trust Equal Weight Fd
NASDAQ    	HSVLY               	Highveld Steel and Vanadium Corporation
NASDAQ    	NOVL                	Novell, Inc.
NYSE      	EPE                 	Enterprise GP Holdings L.P.
NYSE      	XKD                 	Lehman ABS Corporation
NASDAQ    	TGAL                	Tegal Corporation
NASDAQ    	APAB                	APPALACHIAN BANCSHS
NASDAQ    	BVSN                	BroadVision, Inc.
NYSE      	AFR                 	American Financial Realty Trust
NASDAQ    	UNCA                	Unica Corporation
NASDAQ    	ITRN                	ITURAN LOCATION
NASDAQ    	ATAR                	Atari, Inc.
NASDAQ    	SCHS                	School Specialty, Inc.
TSE       	NWF.UN.TO           	North West Company Fund Unit
NASDAQ    	MSEX                	Middlesex Water Company
NASDAQ    	CPCI                	Ciprico Inc.
TSE       	TKE.UN.TO           	TKE Energy Trust
NYSE      	PII                 	Polaris Industries Inc.
NASDAQ    	AWGI                	Alderwoods Group Inc
INDEX     	AJT                 	POWERSHARES DYNAMIC PHARMA PORT
TSE       	LIF.UN.TO           	Labrador Iron Ore Royalty Uts
NYSE      	ACW                 	Accuride Corporation
TSE       	WLF.TO              	Wolfden Resources Inc
NASDAQ    	OPWV                	Openwave Systems Inc
NASDAQ    	TLVT                	Telvent GIT, S.A.
NASDAQ    	RIVR                	River Valley Bancorp.
AMEX      	INS                 	Intelligent Systems Corporation
NYSE      	XTO                 	XTO Energy Inc.
NYSE      	SCM                 	SWISSCOM AG
NASDAQ    	STNJ                	Sterling Bank
NASDAQ    	PACT                	PacificNet Inc.
NASDAQ    	OPHC                	OptimumBank Holdings, Inc.
NYSE      	WPP                 	Wausau-Mosinee Paper Corporation
NYSE      	NUS                 	Nu Skin Enterprises, Inc.
NASDAQ    	ISONL               	Isonics Corporation
NASDAQ    	FNSR                	Finisar Corporation
AMEX      	EWQ                 	iShares MSCI France Index Fund
NASDAQ    	FSCI                	Fisher Communications, Inc.
NASDAQ    	NTRS                	Northern Trust Corporation
NYSE      	CVB                 	Lehman ABS Corporation
NYSE      	KFN                 	KKR Financial Corp.
NYSE      	CR                  	Crane Company
NASDAQ    	ATAC                	Aftermarket Technology Corp.
TSE       	CCO.TO              	Cameco Cp
NYSE      	FST                 	Forest Oil Corporation
AMEX      	TSH                 	Teche Holding Company
TSE       	WPK.TO              	Winpak Ltd
NYSE      	CBI                 	Chicago Bridge & Iron Company N.V.
TSE       	ACC.TO              	Amica Mature Lifestyles Inc
NYSE      	GI                  	Giant Industries, Inc.
AMEX      	FDM                 	First Trust Dow Jones Select Microcap
NYSE      	MWY                 	Midway Games Inc.
TSE       	ECA.TO              	Encana Cp
NASDAQ    	LJPCD               	LA JOLLA PHARM CO
NYSE      	RF                  	REGIO FINANCING TR I
NASDAQ    	RGNC                	REGENCY ENERGY PARTN
NYSE      	KSS                 	Kohl's Corporation
INDEX     	NLU                 	iShares Dow Jones U.S. Utilities Sector Index
NYSE      	IRM                 	Iron Mountain Incorporated
NASDAQ    	NIHD                	NII Holdings Inc
TSE       	TCA.PR.X.TO         	Transcan Pipelines Ltd Pfd X
AMEX      	CKX                 	Calcasieu Real Estate
AMEX      	AQA                 	AquaCell Technologies, Inc.
NASDAQ    	PBIP                	Prudential Bancorp, Inc. of Pennsylvania
TSE       	CDM.TO              	Coeur Dalene Mines Cp
AMEX      	XAN                 	PEGASUS COMM CL A
AMEX      	GTE                 	GlobeTel Communications Corp
NYSE      	ASA                 	ASA
TSE       	CNK.TO              	Clearlink Capital Cp
INDEX     	RUI                 	Russell 1000 Index
NASDAQ    	QTWW                	Quantum Fuel Systems Technologies Worldwide, Inc.
NYSE      	WLS                 	William Lyon Homes
AMEX      	PFI                 	Pelican Financial, Inc.
TSE       	MDI.TO              	Major Drilling Group Intl Inc
INDEX     	AEX                 	AEX General - Netherlands
NASDAQ    	LFUS                	Littelfuse, Inc.
TSE       	NOC.TO              	Northern Peru Copper Cp
NASDAQ    	SINT                	SI International, Inc.
AMEX      	OFI                 	Overhill Farms, Inc.
NASDAQ    	VNLS                	Vernalis plc
NYSE      	SRZ                 	Sunrise Senior Living, Inc.
NASDAQ    	AMCS                	AMICAS, Inc.
NASDAQ    	PDII                	PDI, Inc.
NASDAQ    	SONC                	Sonic Corp.
TSE       	ABK.A.TO            	Allbanc Split Cp
TSE       	ACO.Y.TO            	Atco Ltd Cl Y
NYSE      	ZZ                  	SEALY CORPORATION
AMEX      	DPP                 	Morgan Stanley Capital Protected Nts
NYSE      	LFG                 	LandAmerica Financial Group, Inc.
NYSE      	FCL                 	Foundation Coal Holdings, Inc.
AMEX      	ERH                 	Evergreen Utilities and High Income Fund
TSE       	K.TO                	Kinross Gold Cp
NYSE      	GAM                 	General American Investors Company, Inc.
NASDAQ    	FFNM                	First Federal of Northern Michigan Bancorp, Inc.
NYSE      	EL                  	Estee Lauder Companies, Inc. (The)
TSE       	TOT.UN.TO           	Total Energy Services Trust
AMEX      	BVX                 	Bovie Medical Corporation
NASDAQ    	AMLN                	Amylin Pharmaceuticals, Inc.
NYSE      	NAL                 	NewAlliance Bancshares, Inc.
NYSE      	MKK                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
AMEX      	APO                 	American Community Properties Trust
NASDAQ    	PEDE                	Great Pee Dee Bancorp, Inc.
NASDAQ    	SGTL                	Sigmatel, Inc.
AMEX      	ISR                 	I-Sector Corporation
NYSE      	TXN                 	Texas Instruments Incorporated
INDEX     	NLO                 	iShares Russell 2000 Growth Index
NASDAQ    	CYTK                	Cytokinetics, Incorporated
AMEX      	VNQ                 	Vanguard REIT VIPERs
NYSE      	SUR                 	CNA Surety Corporation
INDEX     	IXI                 	Industrial Select Sector Index
TSE       	CGI.TO              	Canadian General Investments
INDEX     	MVH                 	MORGAN STANLEY HIGH-TECHNOLOGY
NASDAQ    	LIPD                	Lipid Sciences Incorporated
NYSE      	SBC                 	SBC Communications Inc.
NYSE      	MXF                 	Mexico Fund, Inc. (The)
NYSE      	GJE                 	Strats Tr for Bellsouth Telecommunications Ctfs
NASDAQ    	VSGN                	Vasogen Inc.
NASDAQ    	CARS                	Capital Automotive REIT
NYSE      	ABG                 	Asbury Automotive Group Inc
AMEX      	IVX                 	IVAX Corporation
NASDAQ    	GPIC                	Gaming Partners International Corporation
NYSE      	THX                 	Houston Exploration Company (The)
INDEX     	COMP                	Nasdaq Composite
NYSE      	XFE                 	Lehman ABS Corporation
NYSE      	KOR                 	Koor Industries Ltd.
NASDAQ    	SPRI                	Sports Resorts International, Inc.
NASDAQ    	YRCW                	YRC WORLDWIDE
NYSE      	RAD                 	Rite Aid Corporation
NYSE      	GWW                 	W.W. Grainger, Inc.
NYSE      	PRU                 	Prudential Financial Inc
NYSE      	REP                 	Repsol YPF S.A.
NYSE      	WBK                 	Westpac Banking Corporation
NYSE      	ORH                 	Odyssey Re Holdings Corporation
AMEX      	IVD                 	IVAX Diagnostics, Inc.
NASDAQ    	PDSN                	PowerDsine Ltd.
NASDAQ    	XLNX                	Xilinx, Inc.
INDEX     	NJKH                	ID JKH INDEX
AMEX      	PED                 	SmartPros Ltd.
AMEX      	PWC                 	Power XTF: Dynamic Market Portfolio
NASDAQ    	FMSB                	First Mutual Bancshares, Inc.
TSE       	SXC.TO              	Systems Xcellence Inc
NYSE      	RNS                 	Merrill Lynch Depositor, Inc.
NASDAQ    	OPTN                	OPTION CARE, Inc.
NYSE      	MAC                 	Macerich Company (The)
NASDAQ    	HIBB                	Hibbett Sporting Goods, Inc.
INDEX     	SET                 	Thailand SET
NASDAQ    	ARQL                	ArQule, Inc.
NYSE      	HJM                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
TSE       	PDG.U.TO            	Placer Dome Inc US$
TSE       	AR.PR.B.TO          	Argus Cp Ltd Pfd B
TSE       	GBG.TO              	Great Basin Gold Ltd
NYSE      	PEG                 	Public Service Enterprise Group Incorporated
NYSE      	GMK                 	GRUMA, S.A. de C.V.
NYSE      	GCS                 	Scudder Global Commodities Stock Fund Inc
TSE       	PWF.PR.F.TO         	Power Financial Cp 5.25% Pfd E
AMEX      	UPI                 	UROPLASTY INC
TSE       	ALC.TO              	Algoma Central Cp
NYSE      	JPZ                 	Nuveen Equity Premium Income Fund
NASDAQ    	BULK                	NAVIOS MARITIME
NASDAQ    	NAVR                	Navarre Corporation
AMEX      	PCR.P               	PERINI CP PFD
NASDAQ    	EVST                	Everlast Worldwide Inc.
NASDAQ    	NHRXW               	NationsHealth, Inc.
AMEX      	FVE                 	Five Star Quality Care, Inc.
NYSE      	JBL                 	Jabil Circuit, Inc.
AMEX      	IIG                 	IMERGENT INC
NYSE      	BAF                 	BLACKROCK FLORIDA IURED MUNICIPAL INCOME TRUST
NASDAQ    	DOCX                	Document Sciences Corporation
NASDAQ    	MFSF                	MutualFirst Financial Inc.
TSE       	HSE.TO              	Husky Energy Inc
NASDAQ    	GEHL                	Gehl Company
NYSE      	RSH                 	Radioshack Corporation
INDEX     	OFB                 	SPDR 0-STRIP
NYSE      	EMQ                 	Entergy Mississippi, Inc.
INDEX     	NTS                 	WEBS NETHER SHR
NASDAQ    	GCFBW               	Granite City Food & Brewery Ltd.
NASDAQ    	PSDV                	pSivida
TSE       	ZAR.UN.TO           	Zargon Energy Trust
TSE       	TOC.PR.B.TO         	Thomson Cp Pfd B
NYSE      	BTE                 	BAYTEX ENERGY TRUST
NYSE      	GPC                 	Genuine Parts Company
AMEX      	REX                 	VIREXX MEDICAL INC
NASDAQ    	CMFB                	COMMERCEFIRST BANCORP INC
NASDAQ    	BBNK                	Bridge Capital Holdings
NYSE      	PCE.P               	PROVIDENT CAPITAL TRUST PFD
NYSE      	IFS                 	Infrasource Services Inc.
TSE       	MDF.TO              	Mediagrif Interactive Tech Inc
NASDAQ    	FSTR                	L.B. Foster Company
AMEX      	IGR                 	ING Clarion Global Real Estate Income Fund
NASDAQ    	VERT                	VerticalNet, Inc.
NYSE      	MSB                 	Mesabi Trust
TSE       	MOY.TO              	Moydow Mines International Inc
AMEX      	RTC                 	Riviera Tool Company
NYSE      	TM                  	Toyota Motor Corporation
NASDAQ    	AGIX                	AtheroGenics, Inc.
TSE       	UTC.C.TO            	Utility Cp
NASDAQ    	BWINB               	Baldwin & Lyons, Inc.
AMEX      	VKI                 	Van Kampen Advantage Municipal Income Trust II
TSE       	CIP.UN.TO           	CI Master Ltd Partner Units
NASDAQ    	LINKE               	INTERLINK ELECTRON
TSE       	YUS.UN.TO           	Years US Trust
INDEX     	FLV                 	streetTRACKS Dow Jones US LargeCap Value Index Fund
NYSE      	MCY                 	Mercury General Corporation
NASDAQ    	EONC                	eOn Communications Corporation
NYSE      	MEL                 	Mellon Financial Corporation
NASDAQ    	XLTC                	Excel Technology, Inc.
NASDAQ    	ABMC                	American Bio Medica Corp.
NYSE      	ADO                 	Adecco SA
NYSE      	FLO                 	Flowers Foods, Inc.
AMEX      	MSW                 	Mission West Properties, Inc.
AMEX      	UUY                 	Structured Product
NYSE      	MCR                 	MFS Charter Income Trust
NASDAQ    	INDBN               	Independent Bank Corp.
AMEX      	RMX                 	Ready Mix Inc.
INDEX     	VLA                 	VALUE LINE INDEX
NYSE      	CM                  	Coles Meyer
NYSE      	HJA                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
TSE       	KTI.TO              	Kelman Technologies Inc
NYSE      	RBN                 	Robbins & Myers, Inc.
AMEX      	TDS                 	Telephone and Data Systems, Inc.
AMEX      	RPI                 	Roberts Realty Investors, Inc.
NASDAQ    	MHGC                	MORGA HOTEL GROUP
NYSE      	DST                 	DST Systems, Inc.
NYSE      	EEQ                 	Enbridge Energy Management LLC
NASDAQ    	HTCH                	Hutchinson Technology Incorporated
NASDAQ    	SPPX                	Merrill Lynch & Co., Inc.
NYSE      	RGA                 	Reinsurance Group of America, Incorporated
NYSE      	NTT                 	Nippon Telegraph and Telephone Corporation
NYSE      	ALQ                 	ALABAMA POWER CO
NYSE      	SAB                 	Grupo Casa Saba, S.A. de C.V.
TSE       	IAG.TO              	Industrial Alliance Insurance
NASDAQ    	CYBS                	CyberSource Corporation
NASDAQ    	MACE                	Mace Security International, Inc.
NASDAQ    	NATR                	Nature's Sunshine Products, Inc.
NASDAQ    	CERS                	Cerus Corporation
AMEX      	BWN                 	MS TG INC STG TRS
NASDAQ    	ROSE                	ROSETTA RESOURCES
TSE       	RY.PR.S.TO          	Royal Bank Pfd S
INDEX     	OOE                 	S&P GL 100 ECA
AMEX      	BHB                 	Bar Harbor Bankshares, Inc.
NASDAQ    	AMFI                	Amcore Financial, Inc.
AMEX      	GGN                 	The Gabelli Global Goldn Natural Resources & Income Trust
AMEX      	QMM.W               	Q COMM WARRANT
NASDAQ    	CTBC                	CT BANK & TRUST CO
NASDAQ    	ATLO                	Ames National Corporation
NASDAQ    	PHLY                	Philadelphia Consolidated Holding Corp.
NYSE      	GLH                 	Gallaher Group, PLC
NYSE      	DVF                 	Diversified Income Strategies Portfolio, Inc.
NASDAQ    	TOPP                	Topps Company, Inc. (The)
NASDAQ    	LWSN                	Lawson Software, Inc.
NYSE      	CPK                 	Chesapeake Utilities Corporation
NASDAQ    	GETI                	GenTek, Inc. New
NYSE      	SDA                 	Sadia S.A.
AMEX      	RNY                 	BlackRock New York Investment Quality Municipal Trust Inc. (Th
NASDAQ    	SYMM                	Symmetricom, Inc.
TSE       	MDN.TO              	Minieres Du Nord
NYSE      	UPM                 	UPM-Kymmene Oyj
TSE       	PDG.TO              	Placer Dome Inc
NYSE      	HYA                 	Lehman ABS Corporation
NYSE      	HIO                 	High Income Opportunity Fund, Inc.
NASDAQ    	PSBC                	Pacific State  Bancorp CA
TSE       	PAM.UN.TO           	Pro-AMS US Trust Uts
NYSE      	RPM                 	RPM, Inc.
NYSE      	ICI                 	Imperial Chemical Industries Plc
NASDAQ    	NWSBP               	Northwest Bancorp, Inc.
NASDAQ    	WACLY               	Wacoal Corp.
NASDAQ    	NSANY               	Nissan Motor Co., Ltd.
NYSE      	GIB                 	CGI Group, Inc.
NASDAQ    	LANC                	Lancaster Colony Corporation
AMEX      	BBH                 	HOLDRS Biotech
NASDAQ    	PRTL                	Primus Telecommunications Group, Inc.
NYSE      	GG.W                	GOLDCORP INC. SERIES C WARRANTS
NASDAQ    	CGNX                	Cognex Corporation
NASDAQ    	OCNB                	Bridge Street Financial, Inc.
NYSE      	CHH                 	Choice Hotels International, Inc.
NASDAQ    	IRETS               	Investors Real Estate Trust
INDEX     	DXG                 	AMEX
NASDAQ    	FOXH                	FoxHollow Technologies, Inc.
AMEX      	SEA.U               	STAR MARITIME ACQUISITION CORP
INDEX     	IBC                 	Venezuela IBC
NYSE      	STC                 	Stewart Information Services Corporation
NASDAQ    	FPTB                	First PacTrust Bancorp, Inc.
NASDAQ    	CSBC                	Citizens South Banking Corporation
AMEX      	MTK                 	streetTRACKS Morgan Stanley Technology Index Fund
INDEX     	SXV                 	SPDR S&P Dep Rcpt
NASDAQ    	WWWW                	WEB.COM INC
TSE       	PSL.TO              	Prairie Schooner Petroleum Ltd
NASDAQ    	AMZN                	Amazon.com, Inc.
NASDAQ    	WBMD                	WEBMD HEALTH CORP
INDEX     	PSV                 	streetTRACKS Dow Jones U.S. SmallCap Value Index Fund
NYSE      	Q                   	Qwest Communications International Inc.
NYSE      	CBL                 	CBL & Associates Properties, Inc.
NYSE      	VTO                 	Vitro S.A. de C.V.
NASDAQ    	FSGI                	First Security Group, Inc.
NASDAQ    	TOPT                	TOP Tankers Inc.
NYSE      	PXT                 	PXRE Group Ltd.
NYSE      	RAI                 	REYNOLDS AMERICAN INC
NYSE      	FDX                 	FedEx Corporation
AMEX      	LAQ                 	LATIN AMER EQUITY FD
NASDAQ    	LCAPB               	LIBERTY MED CP B
NASDAQ    	ICOPW               	ICOP DIGITAL WARRANT
INDEX     	DVC                 	STREETTRACKS DJ WILSHIRE SMALL
NASDAQ    	AUXL                	Auxilium Pharmaceuticals, Inc.
NYSE      	NCV                 	Nicholas-Applegate Convertible & Income Fund
NASDAQ    	DSCP                	Datascope Corp.
NYSE      	BOL                 	Bausch & Lomb Incorporated
NYSE      	GTN.A               	GRAY TELEVISION INC
NASDAQ    	INFA                	Informatica Corporation
TSE       	GRY.MV.B.TO         	Graystone Cp Cl B
NYSE      	JKL                 	iShares Morningstar Small Value Index Fund
AMEX      	AIH                 	Ablest Inc.
AMEX      	BIW                 	BIW
AMEX      	CYB                 	CYBEX INTERNATIONAL, INC.
NYSE      	PFH                 	Cabco Tr Jcp 7.625
NASDAQ    	DWID                	Merrill Lynch & Co., Inc.
TSE       	MFC.PR.A.TO         	Manulife Financial Cp Pfd A
AMEX      	UTK                 	UTEK Corporation
NASDAQ    	JBSS                	John B. Sanfilippo & Son, Inc.
NASDAQ    	SECDP               	Sky Financial Group, Inc.
TSE       	MKX.TO              	MKS Inc
NYSE      	HTO                 	Hyperion 2005 Investment Grade Opportunity Term Trust, Inc.
NASDAQ    	ONCY                	Oncolytics Biotech, Inc.
AMEX      	CAS                 	Castle (A.M.) & Co.
NYSE      	SYK                 	Stryker Corporation
NYSE      	MPA                 	MuniYield Pennsylvania Insured Fund
AMEX      	IPI                 	Island Pacific, Inc.
NYSE      	ACH                 	Aluminum Corporation of China Ltd
NASDAQ    	BEAV                	BE Aerospace, Inc.
NYSE      	XKO                 	Lehman ABS Corporation
NYSE      	THI                 	TIM HORTO INC
NASDAQ    	VTAL                	Vital Images, Inc.
TSE       	RON.TO              	RONA Inc
NYSE      	NMP                 	Nuveen Michigan Premium Income Municipal Fund, Inc.
AMEX      	EWG                 	iShares MSCI Germany Index Fund
NYSE      	NVP.P               	NEVADA POWER CO PFD
INDEX     	NBZ                 	NASDAQ BIOTECH INDEX FINAL SET
NASDAQ    	INCX                	Interchange Corporation
NASDAQ    	GRIL                	Grill Concepts Inc.
AMEX      	ATX                 	Cross (A.T.) Company
TSE       	FAL.LV.U.TO         	Falconbridge
AMEX      	PMD                 	Psychemedics Corporation
INDEX     	QCN                 	WEBS CANADA SHR
NASDAQ    	VRSOD               	VERSO TECH INC NEW
TSE       	FPI.UN.TO           	First Premium Income Trust Uts
NASDAQ    	CCBL                	C-COR Incorporated
NYSE      	CEW                 	Lehman ABS Corporation
NASDAQ    	IIIN                	Insteel Industries, Inc.
NASDAQ    	NSTK                	Nastech Pharmaceutical Company, Inc.
NYSE      	SIG                 	Signet Group plc
NYSE      	AN                  	AutoNation, Inc.
AMEX      	SPJ                 	Lehman Brothers Fin SA
NASDAQ    	FFFS                	First Federal Financial Services, Inc.
NASDAQ    	ADAT                	Authentidate Holding Corp.
NASDAQ    	SIGM                	Sigma Designs, Inc.
NASDAQ    	UBSH                	Union Bankshares Corporation
NASDAQ    	FCNCA               	First Citizens BancShares, Inc.
NASDAQ    	RITT                	RIT Technologies Ltd.
TSE       	CM.PR.A.TO          	Cdn Imperial Bank Srs 23 Pfd
NASDAQ    	WABC                	Westamerica Bancorporation
NASDAQ    	SNBI                	STATE NATIONAL BANCS
NYSE      	EN                  	ENEL S.p.A.
NYSE      	VKA                 	Van Kampen Advantage Municipal Income Trust
INDEX     	INM                 	iShares MSCI Malaysia Index - IOPV
TSE       	GW.TO               	Garda World Security Cp
NASDAQ    	OCPI                	Optical Communication Products, Inc.
INDEX     	IIB                 	SEMI INDS PLUS
NYSE      	RYN                 	Rayonier Inc. REIT
NASDAQ    	CNLG                	Conolog Corporation
NYSE      	MOT                 	Motorola, Inc.
NYSE      	BRT                 	BRT Realty Trust
INDEX     	HMO                 	AMEX M S Healthcare Payor Index
NASDAQ    	SNAK                	Poore Brothers, Inc.
NASDAQ    	QUIK                	QuickLogic Corporation
NASDAQ    	VLLY                	Valley Bancorp
NASDAQ    	APFC                	American Pacific Corporation
NYSE      	MDS                 	Midas, Inc.
NASDAQ    	SCBT                	SCBT Financial Corporation
NYSE      	CQB.W               	CHIQUITA BRANDS WTS
AMEX      	FPP                 	FIELDPOINT PETROLEUM CORPORATI
TSE       	FAL.PR.G.TO         	Falconbridge Pfd G
INDEX     	QSG                 	WEBS SINGAP SHR
AMEX      	GLO                 	CLOUGH GLOBAL OPPORTUNITIES FU
NASDAQ    	PDEX                	Pro-Dex, Inc.
NASDAQ    	RTWI                	RTW, Inc.
TSE       	MFL.TO              	Minefinders Cp Ltd
NASDAQ    	CDIS                	Cal Dive International, Inc.
AMEX      	DEZ                 	Desert Sun Mining Corp
TSE       	PRT.UN.TO           	PRT Forest Regeneration Inc
NASDAQ    	TGIS                	THOMAS GROUP INC
NYSE      	KOK                 	Lehman ABS Corporation
NYSE      	PAY                 	Veriphone Holdings, Inc.
NYSE      	KDN                 	Kaydon Corporation
NYSE      	FMP                 	Feldman Mall Properties, Inc.
NASDAQ    	UCTT                	Ultra Clean Holdings, Inc.
AMEX      	DSO                 	Merrill Lynch & Co., Inc.
NASDAQ    	SHFL                	Shuffle Master, Inc.
TSE       	EFX.TO              	Enerflex Systems Ltd
NYSE      	MCI                 	MassMutual Corporate Investors
NASDAQ    	AIRM                	Air Methods Corporation
NASDAQ    	RECN                	Resources Connection, Inc.
NASDAQ    	TRBR                	Trailer Bridge, Inc.
NASDAQ    	MOVI                	Movie Gallery, Inc.
INDEX     	CRB                 	CRB INDEX
NASDAQ    	DLLR                	Dollar Financial Corp.
AMEX      	APK                 	MORGAN STANLEY
NASDAQ    	SDAY                	SUNDAY Communications
NASDAQ    	CVCO                	Cavco Industries, Inc.
NYSE      	PJN                 	Pplus Tr
NYSE      	GDV                 	Gabelli Dividend
NASDAQ    	IMMU                	Immunomedics, Inc.
NASDAQ    	RDTA                	Raining Data Corporation
NYSE      	TRK                 	Speedway Motorsports, Inc.
NYSE      	RNE                 	Morgan Stanley Eastern Europe Fund, Inc.
NYSE      	LAQ                 	Latin America Equity Fund, Inc. (The)
AMEX      	SNJ                 	Citigroup Global Markets Holdings Inc
NASDAQ    	INXIW               	INX INC WARRANTS
TSE       	IEX.TO              	Inex Pharmaceuticals Cp
AMEX      	CNY                 	Carver Bancorp, Inc.
NYSE      	B                   	Barnes Group, Inc.
AMEX      	IMR                 	IMA Exploration, Inc.
NASDAQ    	BSQR                	BSQUARE Corporation
NYSE      	OSM                 	SLM Corporation
NASDAQ    	RICK                	Rick's Cabaret International, Inc.
TSE       	EPF.UN.TO           	Energy Plus Income Trust
INDEX     	TBK                 	ISHR LEH TIPS ZZ
NYSE      	XGM                 	General Motors Corporation
NASDAQ    	MAFB                	MAF Bancorp, Inc.
AMEX      	IAO                 	IA Global, Inc.
AMEX      	HH                  	Hooper Holmes, Inc.
TSE       	LUX.TO              	Luxell Technologies Inc
NYSE      	HYV                 	Corporate High Yield Fund V Inc
AMEX      	TOF                 	Tofutti Brands Inc.
NASDAQ    	RVEP                	Rio Vista Energy Partners L.P.
NYSE      	KTO                 	K2 Inc.
NYSE      	MZ                  	Milacron Inc.
TSE       	XSP.TO              	iUnits S&P 500 C$ Index Fund
NYSE      	PFK                 	PRUDENTIAL FINANCIAL INC
NYSE      	TOO                 	Too, Inc.
AMEX      	ROX                 	CASTLE BRANDS INC
AMEX      	THK                 	CGI Holding Corporation
TSE       	VOX.UN.TO           	Voxcom Income Fund
NYSE      	UNT                 	Unit Corporation
NASDAQ    	APTM                	APTIMUS INC
INDEX     	SKH                 	ISHRS VAL 1000
NASDAQ    	PFBIP               	Premier Financial Bancorp, Inc.
NASDAQ    	SHPGY               	Shire Pharmaceuticals Group plc
NYSE      	WWE                 	World Wrestling Entertainment, Inc.
INDEX     	DVL                 	VANG INDS
INDEX     	YXV                 	Cyclicals Trans Sector Fund SPDR UTV
AMEX      	MS                  	Milestone Scientific, Inc.
TSE       	TDG.UN.TO           	Trinidad Energy Services Trust
TSE       	APF.UN.TO           	Algonquin Power Income Unit
TSE       	TXK.UN.TO           	Triax CaRTS Trust
TSE       	IGT.TO              	iShares COMEX Gold Trust
NYSE      	WRS                 	Windrose Medical Properties Trust
NASDAQ    	DRCT                	Direct General Corporation
TSE       	ENB.TO              	Enbridge Inc
NYSE      	PEC                 	Pike Electric Corp.
NASDAQ    	DRYS                	DryShips Inc.
NASDAQ    	AMIE                	Ambassadors International, Inc.
NYSE      	IYH                 	iShares Dow Jones US Healthcare Index
AMEX      	MBP                 	Mid Penn Bancorp
NASDAQ    	REXI                	Resource America, Inc.
TSE       	NA.PR.K.TO          	National Bank Srs 15 Pfd
NASDAQ    	AMGN                	Amgen Inc.
TSE       	BAA.TO              	Banro Corporation
TSE       	SCI.UN.TO           	SCITI ROCS Trust
NYSE      	SCD                 	Salomon Brothers Capital and Income Fund Inc.
AMEX      	CTO                 	Consolidated-Tomoka Land Co.
NYSE      	HSY                 	Hershey Foods Corporation
NASDAQ    	HBNC                	Horizon Bancorp (IN)
NYSE      	JBJ                 	Lehman ABS Corporation
TSE       	ERD.TO              	Erdene Gold Inc
NASDAQ    	DCTH                	Delcath Systems, Inc.
AMEX      	AEN                 	Austral Pacific Energy Ltd.
TSE       	WYL.TO              	Weyerhaeuser Co Ltd
INDEX     	KLCI                	Kuala Lumpur Composite
INDEX     	SVY                 	VANGUARD PACIFIC VIPERS
TSE       	FAP.TO              	Aberdeen Asia Pacific Income
NASDAQ    	VOXW                	VOXWARE INC
NASDAQ    	PTIL                	PROTHERICS PLC
NASDAQ    	STLY                	Stanley Furniture Company, Inc.
NYSE      	AHO                 	Koninklijke Ahold, N.V.
NYSE      	FBN                 	Furniture Brands International, Inc.
NYSE      	CVO                 	Mail-Well, Inc.
NYSE      	IDA                 	IDACORP, Inc.
NASDAQ    	ENTU                	Entrust, Inc.
INDEX     	HKB                 	POWERSHARES DYNAMIC BULDING & C
NASDAQ    	AAZST               	TEST AAZST
NYSE      	BOE                 	Blackrock Global
NASDAQ    	TKLC                	Tekelec
NYSE      	BVN                 	Compania Mina Buenaventura, S.A.
NYSE      	GXP.P               	Great Plains Energy Inc PR
TSE       	SSB.TO              	Stressgen Biotech Cp
NASDAQ    	GRIC                	GoRemote Internet Communications, Inc.
NASDAQ    	CRWN                	Crown Media Holdings, Inc.
NYSE      	SSL                 	Sasol Ltd.
NASDAQ    	GBTS                	Gateway Financial Holdings, Inc.
NYSE      	MSM                 	MSC Industrial Direct Company, Inc.
NASDAQ    	JADE                	LJ International, Inc.
NYSE      	PQ                  	PETROQUEST ENERGY INC WD
NASDAQ    	OFIX                	Orthofix International N.V.
NASDAQ    	LPSN                	LivePerson, Inc.
NYSE      	MLM                 	Martin Marietta Materials, Inc.
INDEX     	XTC                 	AMEX North Ameican Telecom Index
TSE       	SON.UN.TO           	Select 50 S-1 Income Trust
NASDAQ    	TATTF               	TAT Technologies Ltd.
TSE       	P.TO                	Railpower Technologies Cp
TSE       	FAL.PR.B.TO         	Falconbridge Pfd 3
TSE       	SSG.TO              	Sierra Systems Group Inc
INDEX     	JDT                 	POWERSHARES DYNAMIC NANOTECH
NASDAQ    	ANDE                	Andersons, Inc. (The)
NASDAQ    	UTHR                	United Therapeutics Corporation
NYSE      	RGS                 	Regis Corporation
NYSE      	AGI                 	Alliance Gaming Corporation
NASDAQ    	HAYZ                	Hayes Lemmerz International, Inc. New
NASDAQ    	KNAP                	Knape & Vogt Manufacturing Company
NASDAQ    	UBNK                	United Financial Bancorp, Inc.
NASDAQ    	CMVT                	Comverse Technology, Inc.
NYSE      	LVS                 	Las Vegas Sands Corp.
TSE       	AGA.TO              	Algoma Steel Inc
NYSE      	PHH                 	PHH CORP
NYSE      	VLY                 	Valley National Bancorp
TSE       	NIR.TO              	Napier Environmental Tech Inc
NASDAQ    	NGPC                	NGP Capital Resources Company
NASDAQ    	CSCO                	Cisco Systems, Inc.
NASDAQ    	MAIL                	INCREDIMAIL LTD ORD
NASDAQ    	MERX                	Merix Corporation
TSE       	VIP.UN.TO           	Brompton VIP Income Fund
NASDAQ    	VOCL                	VocalTec Communications Ltd.
NYSE      	MUA                 	MuniAssets Fund, Inc.
NYSE      	MEE                 	Massey Energy Company
NYSE      	KNL                 	Knoll, Inc.
INDEX     	BXV                 	Basic Industries Sector Fund SPDR UTV
INDEX     	IXV                 	Healthcare Select Sector Index
NASDAQ    	PGWC                	PEGASUS WIRELESS NV
TSE       	CPI.TO              	CPI Plastics Group Ltd
NYSE      	EPC                 	EPCOS AG
INDEX     	EPK                 	iShares Trust MSCI Pacific Ex Japan Fund
NYSE      	ARC                 	Affordable Residential Communities Inc
INDEX     	XTV                 	NORTH AMERICAN TELECOMMUNICATIO
NYSE      	FUR                 	First Union Real Estate Equity and Mortgage Investments
NYSE      	GJF                 	Strats Tr for Bellsouth Telecommunications Ctfs
NYSE      	PL                  	Protective Life Corporation
NYSE      	IM                  	Ingram Micro Inc.
INDEX     	MOY                 	MORGAN STANLEY INTERNET INDEX F
TSE       	LNR.TO              	Linamar Cp
NASDAQ    	CBMX                	Acacia Research Corporation
NASDAQ    	PRFT                	Perficient, Inc.
NYSE      	NVS                 	Novartis AG
INDEX     	UGT                 	streetTRACKS Dow Jones Global Titans Index Fund
NYSE      	PVD                 	Administradora de Fondos de Pensiones-Provida, S.A.
NYSE      	BSD                 	BlackRock Strategic Municipal Trust Inc. (The)
NASDAQ    	CRRB                	Carrollton Bancorp
NASDAQ    	CNQR                	Concur Technologies, Inc.
INDEX     	CXV                 	MORGAN STANLEY COMMODITY RELATE
TSE       	SDI.TO              	Spectral Diagnostics Inc
TSE       	EMP.PR.B.TO         	Empire Company Ltd Srs 2 Pfd B
TSE       	UTS.TO              	UTS Energy Cp
NASDAQ    	TRMA                	TRICO MARINE SVC NEW
NASDAQ    	GBBK                	Greater Bay Bancorp
NASDAQ    	CNVX                	CancerVax Corporation
AMEX      	NGD                 	NEW GOLD INC.
AMEX      	AX                  	Archipelago Holdings, Inc.
NYSE      	FPT                 	Federated Premier Intermediate Municipal Income Fund
NYSE      	PRF                 	POWERSHARES EXCHANGE TRADED FU
TSE       	CWT.UN.TO           	Calloway REIT Unit
NASDAQ    	IPSU                	Imperial Sugar Company
NASDAQ    	BULKW               	NAVIOS MARITIME WTS
NASDAQ    	GEPT                	Global ePoint, Inc.
NASDAQ    	TRNS                	Transcat, Inc.
NASDAQ    	TIII                	TII Network Technologies, Inc.
TSE       	ISA.TO              	Isotechnika Inc
NYSE      	MPS                 	Modis Professional Services, Inc.
NYSE      	TSN                 	Tyson Foods, Inc.
INDEX     	MDO                 	MID OPN/CLS AVGE
NASDAQ    	BDSIW               	BioDelivery Sciences International, Inc.
NASDAQ    	PSFC                	Peoples-Sidney Financial Corporation
NYSE      	ROH                 	Rohm and Haas Company
NYSE      	CC                  	Circuit City Stores, Inc.
NYSE      	NRF                 	Northstar Realty Finance Corp.
NYSE      	KYN                 	Kayne Anderson MLP Investment Company
AMEX      	ETC                 	Environmental Tectonics Corp.
NASDAQ    	PSPT                	PeopleSupport, Inc.
AMEX      	GCGC                	GOLDEN CYCLE GOLD CO
NASDAQ    	ARBX                	Arbinet-thexchange, Inc.
NASDAQ    	DDMX                	Dynamex, Inc.
NASDAQ    	SAPE                	Sapient Corporation
NYSE      	NEW                 	New Century Financial Corp.
NYSE      	BCH                 	BANCO DE CHILE
NYSE      	BDX                 	Becton, Dickinson and Company
NYSE      	MRN                 	Medical Staffing Network Holdings Inc
NYSE      	SBR                 	Sabine Royalty Trust
NYSE      	HU                  	HUDSON UNITED BANCORP
NASDAQ    	HAWK                	Petrohawk Energy Corporation
NASDAQ    	BSML                	Britesmile, Inc.
NASDAQ    	LPNT                	LifePoint Hospitals, Inc.
NYSE      	SVQ                 	Stilwell Financial Inc.
NYSE      	KEM                 	Kemet Corporation
NYSE      	WST                 	West Pharmaceutical Services, Inc.
NYSE      	TNM                 	Thomas Nelson, Inc.
NYSE      	IAG                 	IAMGOLD CORPORATION
NYSE      	STX                 	Seagate Technology Holdings
NASDAQ    	YDNT                	Young Innovations, Inc.
NASDAQ    	PATK                	Patrick Industries, Inc.
NYSE      	GRK                 	Credit and Asset Repackaging Vehicle Corporation
NASDAQ    	DRAX                	Draxis Health Inc.
NYSE      	FMT.P               	FREMONT GENL FINANCING INC PFD
NYSE      	XSS                 	USX Corporation
AMEX      	BHV                 	BlackRock Virginia Municipal Bond Trust
NASDAQ    	PBNC                	PFS Bancorp, Inc.
NYSE      	ATB                 	Arlington Tankers, LTD.
NYSE      	WEN                 	Wendy's International, Inc.
NYSE      	RRC                 	Range Resources Corporation
NYSE      	SHS                 	Sauer-Danfoss Inc.
AMEX      	BDM                 	Merrill Lynch & Co., Inc.
TSE       	CGX.UN.TO           	Cineplex Galaxy Income Fund
INDEX     	JKSE                	Jakarta Composite
TSE       	COZ.UN.TO           	Core IncomePlus Fund
NYSE      	GAB                 	Gabelli Equity Trust, Inc. (The)
AMEX      	CUO                 	Continental Materials Corporation
AMEX      	HTC                 	Hungarian Telephone & Cable Corp.
AMEX      	XLP                 	SPDR Consumer Staples
INDEX     	FXV                 	Financial Sector Fund SPDR UTV
NASDAQ    	COHU                	Cohu, Inc.
NASDAQ    	JRCC                	James River Coal Company
NYSE      	BMO                 	Bank Of Montreal
NYSE      	POM                 	Potomac Electric Power Company
NYSE      	ZIF                 	Zenix Income Fund Inc.
NASDAQ    	DMLP                	Dorchester Minerals, L.P.
TSE       	FAY.UN.TO           	1st Asset Yield Opportunity Tr
INDEX     	HXI                 	HALTER USX INDIA INDEX
NASDAQ    	AAON                	AAON, Inc.
NASDAQ    	NSSC                	Napco Security Systems, Inc.
TSE       	EVD.TO              	Evolved Digital Systems Inc
AMEX      	PNS                 	Pinnacle Data Systems, Inc.
NASDAQ    	DSGIF               	DSG International
TSE       	IUR.UN.TO           	IPC US REIT Unts
NASDAQ    	SGXP                	SGX PHARMACEUTICALS
TSE       	CLT.TO              	Celtic Exploration Ltd
NYSE      	MKL                 	Markel Corporation
INDEX     	EXV                 	Energy Sector Fund SPDR UTV
NYSE      	PIK                 	Water Pik Technologies, Inc.
TSE       	BPO.PR.U.TO         	Brookfield Props US$ Pfd G
NASDAQ    	MGRM                	MONOGRAM BIOSCIENCES
NASDAQ    	SYXI                	IXYS Corporation
NASDAQ    	SNDK                	SanDisk Corporation
TSE       	BLX.A.TO            	Boralex Inc Cl A
NYSE      	GWR                 	Genesee & Wyoming, Inc.
TSE       	RTU.UN.TO           	Can Resources Income Trust
NYSE      	LEO                 	Dreyfus Strategic Municipals, Inc.
NASDAQ    	DELL                	Dell Inc.
NASDAQ    	IACI                	IAC/InterActiveCorp
NYSE      	RRE                 	AIM Select Real Estate Income Fund
NYSE      	DLR                 	Digital Realty Trust, Inc.
NASDAQ    	NYER                	Nyer Medical Group, Inc.
NASDAQ    	STLW                	Stratos International, Inc.
NYSE      	FCJ                 	Ford Motor Credit Company
AMEX      	NNO                 	Nuveen North Carolina Dividend Advantage Municipal Fund 2
AMEX      	IGE                 	iShares Goldman Sachs Natural Resources Index Fund
NYSE      	HSF                 	Hartford Income Fund Inc
AMEX      	XSD                 	SPDR Semiconductor
NASDAQ    	FMAR                	First Mariner Bancorp
TSE       	SJ.TO               	Stella Jones Inc
NYSE      	AEG                 	AEGON N.V.
NYSE      	JZK                 	Lehman ABS Corporation
NASDAQ    	PMRYE               	POMEROY IT SOLUT
TSE       	PTM.TO              	Platinum Group Metals Ltd
TSE       	CNV.UN.TO           	Convertible & Yield Advantage
NASDAQ    	VSAT                	ViaSat, Inc.
NASDAQ    	CFFN                	Capitol Federal Financial
INDEX     	SPTEC               	SP500 Technology Sector
NASDAQ    	HNBC                	Harleysville National Corporation
NASDAQ    	IOMI                	IOMAI CORPORATION
NASDAQ    	MORN                	Morningstar, Inc.
NASDAQ    	EASY                	EasyLink Services Corporation
NASDAQ    	PRGO                	Perrigo Company
AMEX      	MLP                 	Maui Land & Pineapple Company, Inc.
NYSE      	FAM                 	First Trust/Aberdeen Global Opportunity Income Fund
NASDAQ    	IMNY                	I-many, Inc.
NASDAQ    	LBTYK               	LIBERTY GLOBAL C
NASDAQ    	ROST                	Ross Stores, Inc.
NASDAQ    	ODSY                	Odyssey Healthcare, Inc.
NYSE      	MMT                 	MFS Multimarket Income Trust
NYSE      	NRC                 	National Rural Utilities Cooperative Finance Corp
NASDAQ    	LANV                	LanVision Systems, Inc.
INDEX     	MERV                	Merval - Argentina
NASDAQ    	SIMO                	Silicon Motion Technology Corporation
AMEX      	EWS                 	iShares MSCI Singapore Index Fund
TSE       	CMF.TO              	Comaplex Minerals Cp
NASDAQ    	CPTS                	Conceptus, Inc.
NASDAQ    	AMIC                	American Independence Corporation
NYSE      	ZNT                 	Zenith National Insurance Corporation
TSE       	SCR.SV.TO           	Score Media Inc
TSE       	CU.PR.A.TO          	Canadian Utilities 2nd Pfd W
TSE       	LCI.PR.E.TO         	Lafarge Canada Inc Pfd E
NYSE      	EOS                 	Eaton Vance Enhanced Equity Income Fund II
NYSE      	UNA                 	UNOVA, Inc.
NASDAQ    	TRDO                	Intrado Inc.
NASDAQ    	MTMD                	Microtek Medical Holdings Inc
TSE       	EGI.TO              	EGI Canada Cp
TSE       	VFC.TO              	VFC Inc
NASDAQ    	BRID                	Bridgford Foods Corporation
NASDAQ    	SYNA                	Synaptics Incorporated
NASDAQ    	CCPCN               	Capital Crossing Preferred Corporation
NASDAQ    	PAYX                	Paychex, Inc.
NASDAQ    	FEIC                	FEI Company
NASDAQ    	CMPP                	Champps Entertainment, Inc
NYSE      	ARO                 	Aeropostale Inc
NYSE      	JFR                 	Nuveen Floating Rate Income Fund
AMEX      	CEF                 	Central Fund of Canada
NASDAQ    	STAK                	Staktek Holdings, Inc.
AMEX      	FCO                 	Aberdeen Global Income Fund, Inc.
NASDAQ    	SUPX                	Supertex, Inc.
INDEX     	DAY                 	MERGENT DIV 50
TSE       	RET.TO              	Reitmans Ltd
NASDAQ    	GFED                	Guaranty Federal Bancshares, Inc.
NYSE      	KSU                 	KAAS CITY SOUTHERN
NYSE      	XKX                 	Lehman ABS Corporation
NASDAQ    	CXSP                	Chemgenex Pharmaceuticals Ltd
NYSE      	DTV                 	The DirecTV Group Inc
NASDAQ    	SONE                	S1 Corporation
TSE       	MB.TO               	Mega Bloks Inc
NASDAQ    	MACC                	MACC Private Equities Inc.
NASDAQ    	DIOD                	Diodes Incorporated
NASDAQ    	LARK                	Landmark Bancorp Inc.
NASDAQ    	IOSP                	INNOSPEC INC.
NASDAQ    	BLUD                	Immucor, Inc.
NASDAQ    	SMDI                	Sirenza Microdevices, Inc.
NASDAQ    	DAKT                	Daktronics, Inc.
NYSE      	SPG                 	Simon Property Group, Inc.
NASDAQ    	PFED                	Park Bancorp, Inc.
NYSE      	WYE                 	WYETH
TSE       	SZH.UN.TO           	Sceptre Income & High Growth
INDEX     	HKO                 	AMEX Hong Kong Opt Flt Rt Index
AMEX      	PSC                 	Citigroup Global Markets
TSE       	STN.TO              	Stantec Inc
TSE       	CSG.TO              	Capstone Gold Cp
TSE       	FAL.PR.Y.TO         	Falconbridge Pfd J2
TSE       	SRV.UN.TO           	SIR Royalty Income Fnd
NASDAQ    	WBPRM               	W Holding Company Incorporated
TSE       	PAY.TO              	High Income Principal & Yield
TSE       	FGF.UN.TO           	Fairway Invstmnt Grade Income
NASDAQ    	BOBJ                	Business Objects S.A.
NASDAQ    	FNSC                	FIRST NATL BANCSH SC
NYSE      	TYC                 	Tyco International, Ltd.
NASDAQ    	PBCT                	People's Bank
TSE       	CCU.TO              	Constellation Copper Cp
NYSE      	SGR                 	Shaw Group Inc. (The)
TSE       	RAL.TO              	Rally Energy Cp
NASDAQ    	SCMM                	SCM Microsystems, Inc.
AMEX      	IXP                 	iShares S&P Global Telecommunications Index Fund
TSE       	BDE.B.TO            	Bulldog Energy Inc Cl B
NYSE      	GSL                 	GLOBAL SIGNAL INC
TSE       	COS.UN.TO           	Canadian Oil Sands Trust Units
NASDAQ    	SRSL                	SRS Labs, Inc.
NASDAQ    	FPBI                	FPB Bancorp, Inc.
NYSE      	WTR.P               	AQUA AMERICA INC
NASDAQ    	EWEB                	Euroweb International Corp.
NYSE      	MUR                 	Murphy Oil Corporation
AMEX      	NQH                 	Citigroup Global Markets Holdings Inc
NASDAQ    	FBST                	Fiberstars, Inc.
NASDAQ    	RMTIW               	Rockwell Medical Technologies, Inc.
NASDAQ    	PHELK               	Petroleum Helicopters, Inc.
TSE       	CU.PR.V.TO          	Canadian Utilities 2nd Pfd R
NYSE      	RD                  	Royal Dutch Petroleum Company
NASDAQ    	VLCM                	Volcom, Inc.
NYSE      	WTU                 	Williams Coal Seam Gas Royalty Trust
NASDAQ    	UACL                	Universal Truckload Services, Inc.
INDEX     	EJR                 	POWERSHARES DYNAMIC NETWORKING
TSE       	CGA.TO              	Central Asia Gold Ltd
AMEX      	CVP                 	Volume Services America Holdings, Inc.
NASDAQ    	CRYP                	Cryptologic, Inc.
NYSE      	IYG                 	iShares Dow Jones US Financial Services Index
NASDAQ    	ICGN                	Icagen, Inc.
NASDAQ    	SLFI                	Sterling Financial Corporation
TSE       	FLP.UN.TO           	Fidelity Partnership 1994 Unit
NYSE      	HUN                 	Huntsman Corporation
NASDAQ    	ANGN                	Angeion Corporation
NASDAQ    	AVCT                	Avocent Corporation
NASDAQ    	USBI                	United Security Bancshares, Inc.
TSE       	TXZ.UN.TO           	Triax CaRTS III Trust
AMEX      	PMR                 	PowerShares Dynamic Retail
AMEX      	IMA                 	Inverness Medical Innovations, Inc.
NASDAQ    	BUSE                	First Busey Corporation
NASDAQ    	CSWC                	Capital Southwest Corporation
NYSE      	HNP                 	Huaneng Power Intl
TSE       	CSW.TO              	Canada Southern Petroleum Ltd
NASDAQ    	TCAM                	Transport Corporation of America, Inc.
TSE       	MSO.TO              	Mission Oil & Gas Inc
INDEX     	SLV                 	Silver Index
NASDAQ    	HNAB                	HANA BIOSCIENCES INC
TSE       	MYT.UN.TO           	Maccs Sustainable Yield Trust
NASDAQ    	FRNT                	Frontier Airlines, Inc.
NYSE      	GFI                 	Gold Fields Ltd.
NYSE      	PVA                 	Penn Virginia Corporation
NASDAQ    	MCHP                	Microchip Technology Incorporated
NASDAQ    	WAUW                	WAUWATOSA HOLDINGS
AMEX      	KCE                 	streetTRACKS KBW Capital markets
TSE       	VSM.TO              	VSM Medtech Ltd
NYSE      	FMO                 	Fiduciary/Claymore MLP Opportunity Fund
NASDAQ    	EURO                	EuroTrust A/S
INDEX     	KBT                 	PHILADELPHIA STOCK EXCHANGE
NYSE      	CSC                 	Computer Sciences Corporation
NASDAQ    	MTDW                	Merrill Lynch & Co., Inc.
NYSE      	ACI                 	Arch Coal, Inc.
NASDAQ    	CBIZ                	CBIZ, Inc.
NYSE      	GHL                 	Greenhill
NYSE      	EMS                 	EMERGENCY MEDICAL SERVICES COR
INDEX     	NJKF                	ID JKF INDEX
NYSE      	BLN                 	BlackRock New York Insured Municipal 2008 Term Trust Inc. (The
NASDAQ    	HERO                	HERCULES OFFSHORE I
NASDAQ    	ORBT                	Orbit International Corporation
AMEX      	XMR                 	MS XM RADIO SPARQS
NYSE      	SXL                 	Sunoco Logistics Partners LP
NYSE      	IJK                 	iShares S&P Mid Cap 400 Growth
NASDAQ    	SBGA                	Summit Bank Corporation
NASDAQ    	COBH                	Pennsylvania Commerce Bancorp, Inc.
AMEX      	DRA                 	DRA
NASDAQ    	NHRXU               	NationsHealth, Inc.
NYSE      	ITG                 	Investment Technology Group, Inc.
NASDAQ    	KBAY                	Kanbay International, Inc.
NASDAQ    	NHRX                	NationsHealth, Inc.
NYSE      	RSF                 	RMK Strategic Income Fd, Inc
NASDAQ    	ESCL                	ESCALA GROUP INC
NASDAQ    	MNTA                	Momenta Pharmaceuticals, Inc.
NYSE      	DEO                 	Diageo plc
NYSE      	AXA                 	AXA
NASDAQ    	ESRX                	Express Scripts, Inc.
NYSE      	GCF                 	GLOBAL INCOME & CURRENC    Y FUN
NASDAQ    	GKIS                	Gold Kist Inc.
TSE       	IMX.TO              	IMAX Cp
NASDAQ    	ISRG                	Intuitive Surgical, Inc.
AMEX      	EDA.W               	ENDEAVOR ACQ CORP WT
NYSE      	OMC                 	Omnicom Group Inc.
NYSE      	IKN                 	IKON Office Solutions, Inc.
TSE       	EIT.UN.TO           	Enervest Diversified Unit
NYSE      	PYB                 	PPlus Trust
NASDAQ    	LRCX                	Lam Research Corporation
NYSE      	TRZ                 	TRIZEC PROPERTIES INC
INDEX     	TSE                 	TSX 60 INDEX
NYSE      	RNT                 	Aaron Rents, Inc.
NASDAQ    	OSUR                	OraSure Technologies, Inc.
NYSE      	JZH                 	Lehman ABS Corporation
NASDAQ    	ESGR                	Enstar Group Inc
AMEX      	NPG                 	Nuveen Georgia Premium Income Municipal Fund
AMEX      	NLP                 	NTS Realty Holdings Partnership
NYSE      	TMB                 	Telemig Celular Participacoes S.A.
AMEX      	PRB                 	PRB Gas Transportation, Inc.
TSE       	BPO.PR.F.TO         	Brookfield Props AAA Pfd F
TSE       	AIT.TO              	Aliant Inc
AMEX      	MSS.W               	MILESTONE SC WARRANT
TSE       	DSM.TO              	Desert Sun Mining Cp
TSE       	BRK.UN.TO           	The Brick Group Income Fund
TSE       	ZCL.TO              	ZCL Composites Inc
NYSE      	JH                  	John H. Harland Company
NYSE      	DY                  	Dycom Industries, Inc.
TSE       	PAA.U.TO            	Pan American Silver Cp US$
NYSE      	CPA                 	COPA HOLDINGS S.A. CLASS A CO
TSE       	DSG.TO              	Descartes Systems Group Inc
NASDAQ    	NDPS                	Morgan Stanley
TSE       	OAX.UN.TO           	Oceanex Income Fund
NASDAQ    	RHEO                	OccuLogix, Inc.
AMEX      	SIM                 	Grupo Simec, S.A. de C.V.
TSE       	HPX.TO              	Highpine Oil & Gas Ltd
NYSE      	AAI                 	AirTran Holdings, Inc.
NYSE      	JCI                 	Johnson Controls, Inc.
TSE       	LUR.TO              	Lumina Resources Cp
NYSE      	RGC                 	Regal Entertainment Group
NASDAQ    	CAMP                	CalAmp Corp.
NYSE      	FDI                 	Fort Dearborn Income Securities, Inc.
NYSE      	AZ                  	Allianz Aktiengesellschaft
NASDAQ    	PARL                	Parlux Fragrances, Inc.
NYSE      	WXS                 	Wright Express Corporation
NYSE      	SLA                 	American Select Portfolio, Inc.
NYSE      	CTG                 	Computer Task Group, Inc.
TSE       	POW.PR.E.TO         	Power Cp Of Canada Part Pfd E
NYSE      	AHC.P               	AMER HESS CRP CNVRT PFD ACES
NYSE      	EGP                 	EastGroup Properties, Inc.
NASDAQ    	NTLS                	NTELOS HOLDINGS CORP
TSE       	SNP.PR.U.TO         	SNP Split Cp Cl A Pfd US$
NYSE      	ME                  	MARINER ENERGY INC
NASDAQ    	DLIAR               	DELIA'S TRA RIGHTS
NYSE      	HYC                 	Hypercom Corporation
NASDAQ    	ACPW                	Active Power, Inc.
TSE       	AVM.TO              	Anvil Mining Ltd
NASDAQ    	HUBG                	Hub Group, Inc.
INDEX     	NLB                 	iShares Dow Jones U.S. Basic Materials Sector Index
TSE       	EXC.TO              	Extreme CCTV Inc
NASDAQ    	PSBI                	PSB Bancorp, Inc.
AMEX      	PIC                 	PowerShares Dynamic Insurance
AMEX      	NMB                 	Nuveen Massachusetts Dividend Advantage Municipal Fund
NYSE      	LBC                 	Lehman Brothers/First Trust Income Opportunity Fund
NASDAQ    	DLPX                	DelphaxTechnologies Inc.
AMEX      	MED                 	MEDIFAST INC
AMEX      	INB                 	Integrated BioPharma, Inc.
NASDAQ    	ABBI                	ABRAXIS BIOSCIENCE
NYSE      	KOP                 	KOPPERS HOLDINGS INC
NYSE      	FGP                 	Ferrellgas Partners, L.P.
NASDAQ    	FFFD                	North Central Bancshares, Inc.
NASDAQ    	NTOL                	Natrol, Inc.
NASDAQ    	MDCC                	Molecular Devices Corporation
NYSE      	CAI                 	CACI International, Inc.
TSE       	STZ.UN.TO           	Stars Income Fund Uts
NASDAQ    	SOCB                	Southcoast Financial Corporation
TSE       	RFI.UN.TO           	Canadian Fundamental 100 Income Fund
TSE       	FAL.LV.TO           	Falconbridge
NASDAQ    	SCUR                	Secure Computing Corporation
NYSE      	PRS                 	Primus Guaranty, LTD.
NYSE      	ABV                 	Companhia de Bebidas das Americas - AmBev
NYSE      	UL                  	Unilever PLC
NASDAQ    	AANB                	Abigail Adams National Bancorp, Inc.
NYSE      	SNP                 	China Petroleum & Chemical Corporation
TSE       	AIQ.TO              	Atlantis Systems Cp
NYSE      	CHF                 	Converium Holding AG
NASDAQ    	SMSC                	Standard Microsystems Corporation
TSE       	CAS.TO              	Cascades Inc
AMEX      	KIE                 	streetTRACKS KBW Insurance
NYSE      	PKX                 	Pohang Iron & Steel Co., Ltd.
NYSE      	NCX                 	Nova Chemicals Corporation
NASDAQ    	PUMP                	Animas Corporation
NYSE      	NTR                 	New York Mortgage Trust Inc
AMEX      	RDI.B               	READING INTERNATIONAL INC
NYSE      	FSE                 	Financial Security Assurance Holdings Ltd
NYSE      	HUB.A               	Hubbell Inc A
NASDAQ    	RNOW                	RightNow Technologies, Inc.
NYSE      	IMF                 	Salomon Brothers Inflation
AMEX      	DXR                 	Daxor Corporation
INDEX     	XAX                 	AMEX Composite Index
NYSE      	CWT                 	CALIFORNIA WTR SVC GROUP
NASDAQ    	HOMF                	Home Federal Bancorp
NYSE      	LIN                 	Linens 'n Things, Inc.
AMEX      	GIW                 	Wilber Corporation
AMEX      	VSF                 	Vita Food Products, Inc.
NASDAQ    	AMNB                	American National Bankshares, Inc.
NYSE      	GTI                 	GrafTech International Ltd
TSE       	PSX.TO              	Prospex Resources Ltd
TSE       	ATN.TO              	ATNA Resources Ltd
NASDAQ    	MTLMW               	Metal Management , Inc.
NYSE      	AIB                 	Allied Irish Banks, p.l.c.
TSE       	BGC.TO              	Bolivar Gold Cp
AMEX      	EWM                 	iShares MSCI Malaysia Index Fund
NASDAQ    	EMAK                	EMAK Worldwide, Inc.
TSE       	WFT.TO              	West Fraser Timber Co Ltd
NYSE      	OSG                 	Overseas Shipholding Group, Inc.
TSE       	TNP.U.TO            	Transatlantic Petroleum Cp US$
NASDAQ    	RMBS                	Rambus, Inc.
NASDAQ    	NXST                	Nexstar Broadcasting Group, Inc.
INDEX     	NLA                 	iShares Dow Jones U.S. Total Market Index
NASDAQ    	BNCC                	Bnccorp, Inc.
AMEX      	SVL                 	SILVERLEAF RESORTS
NASDAQ    	PRAN                	Prana Biotechnology Ltd
AMEX      	MWH                 	BayCorp Holdings, Ltd.
NASDAQ    	SBAC                	SBA Communications Corporation
NYSE      	NCT                 	Newcastle Investment Corporation
NASDAQ    	SWRG                	Smith & Wollensky Restaurant Group, Inc. (The)
INDEX     	MEB                 	ENERGY INDS CPN
NYSE      	BRE                 	BRE Properties, Inc.
NASDAQ    	SUNN                	Suntron Corporation
NYSE      	KSO                 	Lehman ABS Corporation
INDEX     	IXTC                	Nasdaq Telecommunications
TSE       	QAR.TO              	Questair Technologies Inc
TSE       	ICS.TO              	Intrinsyc Software Intl
AMEX      	LGN                 	Lodgian, Inc.
NASDAQ    	WGATE               	WORLDGATE COMM INC
NASDAQ    	TMWD                	Tumbleweed Communications Corp.
NASDAQ    	VOCS                	VOCUS INC.
NASDAQ    	CSFL                	Centerstate Banks of Florida, Inc.
NYSE      	AEH                 	AEGON N.V.
NYSE      	MPV                 	MassMutual Participation Investors
NYSE      	JSM                 	SLM Corporation
INDEX     	UUO                 	The Select Utility Index
NYSE      	AYI                 	ACUITY BRANDS INC
TSE       	HAM.UN.TO           	Specialty Foods Group Fund
NASDAQ    	PEFX                	S&P 500 Protected Equity Fund, Inc. (The)
TSE       	GSX.TO              	Global Resource Split Cp Cl A
NASDAQ    	PSTI                	Per-Se Technologies, Inc.
NYSE      	PG                  	Procter & Gamble Company (The)
INDEX     	XBS                 	AMEX SECURITIES BROKER/DEALER I
NASDAQ    	DXPE                	DXP Enterprises, Inc.
NYSE      	RWF                 	Cohen & Steers Worldwide Realty Income Fund, Inc.
NASDAQ    	RDCM                	Radcom Ltd.
NYSE      	LSE                 	Capital Lease Funding Inc
AMEX      	VCR                 	Vanguard Consumer Discretionary VIPERs
NYSE      	MAS                 	Masco Corporation
NASDAQ    	REMX                	RemedyTemp, Inc.
NASDAQ    	PSMTR               	PriceSmart, Inc.
NASDAQ    	MKSI                	MKS Instruments, Inc.
NYSE      	BCF                 	Burlington Coat Factory Corporation
AMEX      	ACU                 	Acme United Corporation.
NYSE      	MPG                 	Maguire Properties Inc
NYSE      	OEH                 	Orient-Express Hotels, Ltd.
AMEX      	PDW                 	CITIGROUP GLB MARKETS 1.5 Dow Jones Gbl Titans 50 Index
AMEX      	GFX                 	Media Sciences International Inc.
NYSE      	FLS                 	Flowserve Corporation
NYSE      	SQA.P               	SEQUA CP PFD
NASDAQ    	INSG                	Insignia Solutions, plc
TSE       	BMT.TO              	Bmont Split Cp
NASDAQ    	WGOV                	Woodward Governor Company
NYSE      	XEC                 	Cimarex Energy Co
NYSE      	LI                  	Laidlaw International, Inc.
TSE       	AXA.TO              	Eiger Technology Inc
AMEX      	XMM                 	Cross Media Marketing Corp
AMEX      	API                 	Advanced Photonix, Inc.
TSE       	AET.UN.TO           	ARC Energy Trust Unit
NYSE      	DKT                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NYSE      	ARL                 	American Realty Investors, Inc.
NASDAQ    	RFMD                	RF Micro Devices, Inc.
INDEX     	ICG                 	iShares Cohen & Steers Realty Majors Index
NASDAQ    	HGGR                	Haggar Corp.
NASDAQ    	DDIC                	DDi Corp. New
NASDAQ    	ABXA                	ABX Air, Inc.
NYSE      	MCO                 	Moody's Corporation
NASDAQ    	FACT                	First Albany Companies, Inc.
NYSE      	GPW                 	Georgia Power Company
NASDAQ    	MANA                	Manatron, Inc.
NASDAQ    	ISRL                	Isramco, Inc.
NASDAQ    	UTEK                	Ultratech, Inc.
NYSE      	PDA                 	Perdigao S.A.
TSE       	GT.A.TO             	Global Telecom Split Cl A
TSE       	SIA.U.TO            	Skylon International Adv A US$
TSE       	DYI.UN.TO           	diversiYield Income Fund
NYSE      	KFI                 	K&F Industries Holdings, Inc.
NASDAQ    	REXMY               	Rexam, Plc
NYSE      	DMH                 	Ducati Motor Hld Ads
NASDAQ    	WBPRN               	W Holding Company Incorporated
NASDAQ    	TSBK                	Timberland Bancorp, Inc.
NYSE      	JEF                 	Jefferies Group, Inc.
NASDAQ    	UMPQ                	Umpqua Holdings Corporation
TSE       	TDS.TO              	TD Split Inc
TSE       	SMF.TO              	Semafo Inc
AMEX      	MSL                 	MidSouth Bancorp
NYSE      	CIB                 	BanColombia S.A.
TSE       	BC.PR.B.TO          	Bell Canada Srs 17 Pfd B
TSE       	HTE.UN.TO           	Harvest Energy Trust Unit
AMEX      	JCS                 	Communications Systems, Inc.
NASDAQ    	KOSN                	Kosan Biosciences Incorporated
AMEX      	RIC                 	Richmont Mines, Inc.
NASDAQ    	HHGP                	Hudson Highland Group, Inc.
NYSE      	ILD                 	AQUILA INC
TSE       	CRW.TO              	Cinram International Inc
NASDAQ    	USHS                	U.S. Home Systems, Inc.
NYSE      	SKS                 	Saks Incorporated
NASDAQ    	MCHM                	MacroChem Corporation
NASDAQ    	MTCT                	MTC Technologies, Inc.
AMEX      	LSM                 	MORGAN STANLEY
NASDAQ    	SKYW                	SkyWest, Inc.
AMEX      	ERC                 	Evergreen Managed Income Fund
NASDAQ    	NAII                	Natural Alternatives International, Inc.
NASDAQ    	MTSM                	Merrill Lynch & Co., Inc.
NASDAQ    	CHFN                	Charter Financial Corp.
TSE       	SU.U.TO             	Suncor Energy Inc US$
NASDAQ    	SDIX                	Strategic Diagnostics Inc.
INDEX     	XI                  	Merrill Lyn Int-Rt Senstiv Index
NASDAQ    	GDYS                	Goody's Family Clothing, Inc.
NASDAQ    	KYPH                	Kyphon Inc.
NASDAQ    	AMGIU               	AMERICAN MOLD GUARD
NASDAQ    	IVIS                	ICOS Vision Systems Corporation N.V.
NYSE      	DOV                 	Dover Corporation
NYSE      	TKS                 	Tomkins PLC
TSE       	VTN.TO              	Vitran Cp Inc
TSE       	PMZ.UN.TO           	Primaris Retail REIT Units
NASDAQ    	SEMI                	All American Semiconductor, Inc.
NYSE      	KTX                 	Lehman ABS Corporation
NASDAQ    	CGFW                	CyberGuard Corporation
NASDAQ    	VSTY                	Varsity Group Inc
TSE       	ADW.B.TO            	Andres Wines Ltd Cl B
AMEX      	QIA                 	Citigroup Global Markets Sequins
NASDAQ    	SNSTA               	Sonesta International Hotels Corporation
NYSE      	WNA.P               	WACHOVIA PRF FUNDING CP PFD
NASDAQ    	TRPS                	Tripos, Inc.
AMEX      	MDV                 	MEDIVATION INC
INDEX     	SYW                 	SPDR DIVIDEND INDEX FUND
NYSE      	AVP                 	Avon Products, Inc.
TSE       	NKO.TO              	Niko Resources Ltd
AMEX      	DLA                 	Delta Apparel, Inc.
NYSE      	CYP                 	Lehman ABS Corporation
NASDAQ    	WWVY                	Warwick Valley Telephone Company
NASDAQ    	CSPIE               	CSP INC
NYSE      	NAD                 	Nuveen Dividend Advantage Municipal Fund
NASDAQ    	CPNO                	Copano Energy, L.L.C.
NASDAQ    	ELRC                	Electro Rent Corporation
AMEX      	ANX                 	ADVENTRX Pharmaceuticals, Inc.
AMEX      	WTZ                 	Western Silver Corporation
NASDAQ    	PVSA                	Parkvale Financial Corporation
AMEX      	PAX                 	Paxson Communications Corporation
NYSE      	BNL                 	Bunzl, plc
NYSE      	LAZ                 	Lazard LTD.
TSE       	CSS.UN.TO           	Contrans Income Fund
NYSE      	KVN                 	Lehman ABS Corporation
INDEX     	RSQ                 	RSQ TRADE& LIST
INDEX     	CPH                 	CAPITAL PACIFIC HOLDINGS INC
NASDAQ    	CSTR                	Coinstar, Inc.
NYSE      	HPY                 	Heartland Payment Systems, Inc.
NASDAQ    	ENCY                	Encysive Pharmaceuticals Inc
NASDAQ    	CBSAN               	Hibernia Corporation
NYSE      	THG                 	HANOVER IURANCE GROUP INC
NYSE      	BBT                 	BB&T Corporation
NASDAQ    	CARSO               	Capital Automotive REIT
NASDAQ    	ADLR                	Adolor Corporation
NASDAQ    	SPEX                	Spherix Incorporated
NYSE      	WM                  	Washington Mutual, Inc.
TSE       	PRC.UN.TO           	Mulvihill Pro-AMS 100Plus Cdn$
AMEX      	BIO                 	Bio-Rad Laboratories, Inc.
NASDAQ    	CVBK                	Central Virginia Bankshares, Inc.
NASDAQ    	MXRE                	Max Re Capital Ltd.
NASDAQ    	NCEM                	Nevada Chemicals, Inc.
NYSE      	CNF                 	CNF, Inc.
NYSE      	GSH                 	Guangshen Railway Company
NYSE      	PYG                 	PPLUS Trust
AMEX      	SSK                 	9.50% SPARQS LINKED TO SUNOCO
AMEX      	CKN                 	CASH SYSTEMS INC
NYSE      	KEY                 	KeyCorp
TSE       	IRC.TO              	International Royalty Cp
NYSE      	UBS                 	UBS PFD FUNDING TR III
TSE       	RCH.TO              	Richelieu Hardware Ltd
TSE       	WFC.TO              	Wall Financial Cp
NYSE      	JZY                 	Lehman ABS Corporation
TSE       	NXY.PR.U.TO         	Nexen Inc 7.35% Note US$
NYSE      	ENZ                 	Enzo Biochem, Inc.
AMEX      	VMM                 	Delaware Investments Minnesota Municipal Income Fund II, Inc.
NASDAQ    	ONEQ                	Fidelity Nasdaq Composite Index Tracking Stock
INDEX     	XUH                 	Utilities Holders Index
AMEX      	SCB                 	Community Bankshares, Inc.
AMEX      	NXK                 	Nuveen New York Dividend Advantage Municipal Fund 2
AMEX      	FCM                 	First Trust/Four Corners Senior Floating Rate Income Fund
NYSE      	FPO                 	First Potomac Realty Trust
NYSE      	GUL                 	Gulf Power Company
TSE       	BMO.PR.G.TO         	Bank Of Montreal Pfd G
NASDAQ    	SHBK                	Shore Financial Corporation
NYSE      	BDG                 	Bandag, Incorporated
NASDAQ    	CWLZ                	Cowlitz Bancorporation
NASDAQ    	TWMC                	Trans World Entertainment Corp.
TSE       	SHB.TO              	Shellbridge Oil & Gas Inc
NYSE      	ALF                 	Alabama Power Company
NASDAQ    	PVFC                	PVF Capital Corp.
NASDAQ    	ULBI                	Ultralife Batteries, Inc.
NASDAQ    	TAIT                	Taitron Components Incorporated
NASDAQ    	RAND                	Rand Capital Corporation
NYSE      	JNJ                 	JOHON & JOHON
NYSE      	XFD                 	Lehman ABS Corporation
NYSE      	PJL                 	Preferredplus Tr
NASDAQ    	ARNA                	Arena Pharmaceuticals, Inc.
NYSE      	GGG                 	Graco Inc.
NYSE      	AUO                 	AU OPTRONICS CORP
NASDAQ    	ILMN                	Illumina, Inc.
NYSE      	RHD                 	R.H. Donnelley Corporation
AMEX      	PMN                 	Putnam New York Investment Grade Municipal Trust
NYSE      	AHM                 	American Home Mortgage Investment Corp
INDEX     	SCY                 	DJ Consumer Cyclical
NYSE      	KOS                 	Lehman ABS Corporation
NYSE      	PUK.P               	Prudential Public Company PR
NASDAQ    	ASYS                	Amtech Systems, Inc.
INDEX     	FKJ                 	POWERSHARES INTNL DIVIDEND ACHI
NYSE      	BFO                 	Blackrock Florida Municipal 2020 Term Trust
NASDAQ    	ENTG                	Entegris, Inc.
NYSE      	STN                 	Station Casinos, Inc.
NASDAQ    	FCCO                	First Community Corporation
TSE       	ONT.TO              	Ontex Resources Ltd
NASDAQ    	AKAM                	Akamai Technologies, Inc.
NASDAQ    	NARA                	Nara Bancorp, Inc.
NYSE      	SNV                 	Synovus Financial Corporation
NYSE      	SQM                 	Sociedad Quimica y Minera S.A.
TSE       	BMO.TO              	Bank Of Montreal
NYSE      	VIA                 	Viacom, Inc.
NYSE      	HYH                 	Lehman ABS Corporation
NASDAQ    	SLXA                	Solexa, Inc.
NASDAQ    	DXCM                	DexCom, Inc.
NYSE      	BHK                 	Blackrock Core Bond Trust
TSE       	TEK.SV.B.TO         	Teck Cominco Ltd Cl B
NASDAQ    	NRGP                	Inergy Holdings, L.P.
NYSE      	LR                  	Lafarge S.A.
NASDAQ    	ASPV                	Aspreva Pharmaceuticals Corporation
NYSE      	TOA                 	Technical Olympic USA Inc
INDEX     	NNV                 	iShares S&P 500 Index
NYSE      	GFY                 	Salomon Brothers Variable Rate Strategic Fund Inc.
TSE       	REF.UN.TO           	Canadian REIT Uts
NASDAQ    	COKE                	Coca-Cola Bottling Co. Consolidated
NASDAQ    	MERC                	MERCER INTL INC
NASDAQ    	GTRC                	Guitar Center, Inc.
NASDAQ    	QMAR                	Quintana Maritime
NYSE      	BMT                 	BlackRock Insured Municipal Term Trust Inc. (The)
NYSE      	KOF                 	Coca-Cola FEMSA, S.A. de C.V.
INDEX     	UTY                 	Phlx Utility Index
NYSE      	DPZ                 	Domino's Pizza Inc
NASDAQ    	AVAN                	Avant Immunotherapeutics, Inc.
NYSE      	ACS                 	Affiliated Computer Services, Inc.
NASDAQ    	ISBC                	INVESTORS BANCORP
NASDAQ    	QCOM                	QUALCOMM Incorporated
NYSE      	XKA                 	Lehman ABS Corporation
NYSE      	MFM                 	MFS Municipal Income Trust
NASDAQ    	EMMSP               	Emmis Communications Corporation
TSE       	TFS.PR.A.TO         	Thirty Five Split Cp Pfd A
NYSE      	EWU                 	iShares MSCI United Kingdom
TSE       	IUR.U.TO            	IPC US REIT Unts US$
TSE       	PTI.TO              	Patheon Inc
NYSE      	EVG                 	Eaton Vance Short Diversified Income Fund
AMEX      	SPY                 	SPDR Trust Series I
NYSE      	PPD                 	Pre-Paid Legal Services, Inc.
TSE       	AFU.UN.TO           	Acuity Focused Total Return Tr
NASDAQ    	ROCM                	Rochester Medical Corporation
TSE       	WTL.TO              	West Energy Ltd
NYSE      	GT                  	Goodyear Tire & Rubber Company (The)
NYSE      	TOT                 	TotalFinaElf, S.A.
NASDAQ    	BSTE                	Biosite, Inc.
NYSE      	CBG                 	CB Richard Ellis Group Inc
NASDAQ    	PANC                	Panacos Pharmaceuticals, Inc.
NASDAQ    	ECOL                	American Ecology Corporation
NYSE      	AVA                 	Avista Corporation
AMEX      	SBB                 	SUSSEX BANCORP
NASDAQ    	PBHC                	Pathfinder Bancorp, Inc.
NYSE      	TWN                 	Taiwan Fund, Inc. (The)
NYSE      	HOT                 	Starwood Hotels & Resorts Worldwide, Inc.
TSE       	CM.PR.G.TO          	Cdn Imperial Bank Srs 29 Pfd
NYSE      	SRE                 	SEMPRA ENERGY
TSE       	MCZ.TO              	Mad Catz Interactive Inc
INDEX     	XWY                 	PHILADELPHIA STOCK EXCHANGE
NASDAQ    	TRMK                	Trustmark Corporation
NYSE      	SGH                 	Star Gas Partners, L.P.
NYSE      	SQA.A               	Sequa Corporation
TSE       	SHQ.TO              	Shire Acquisition
INDEX     	MRJ                 	PHILADELPHIA STOCK EXCHANGE
NYSE      	GJH                 	Strats Tr for Bellsouth Telecommunications Ctfs
NYSE      	ALB                 	Albemarle Corporation
NASDAQ    	CSLMF               	Consolidated Mercantile Inc
NASDAQ    	CWTR                	Coldwater Creek, Inc.
NYSE      	SHO                 	Sunstone Hotel Investors, Inc.
TSE       	HKY.TO              	Husky Injection Molding System
NYSE      	MYS                 	Masisa Sa Ads
NASDAQ    	MCIP                	MCI, Inc.
INDEX     	ZRS                 	ZACKS SMALL CAP INDEX
NASDAQ    	TCLP                	TC PipeLines, LP
NYSE      	TY                  	TRI CONTL CORP
TSE       	GLG.TO              	Glamis Gold Ltd
TSE       	PGL.TO              	PLM Group Ltd
NASDAQ    	CCCG                	CCC Information Services Group  Inc.
NASDAQ    	MITT                	Merrill Lynch & Co., Inc.
AMEX      	SRK                 	Merril Lynch Strategic Return Notes Linked to the Industrial 1
AMEX      	ECI                 	Encision Inc.
NYSE      	OKE                 	ONEOK, Inc.
NYSE      	MTH                 	Meritage Corporation
AMEX      	DDD                 	SCOLR Inc
NASDAQ    	SFBC                	Slade's Ferry Bancorp
NASDAQ    	NMTI                	NMT Medical Inc.
NYSE      	KPN                 	Royal KPN N.V.
NASDAQ    	BITI                	Bio-Imaging Technologies, Inc.
NASDAQ    	WQNI                	WQN, Inc.
NYSE      	KWD                 	Kellwood Company
AMEX      	MKH                 	HOLDRS Market 2000
NASDAQ    	RUSHB               	Rush Enterprises, Inc.
NYSE      	SNE                 	Sony Corporation
TSE       	NFC.TO              	Northern Financial Cp
NASDAQ    	SYNMZ               	Syntroleum Corporation
NYSE      	BDV                 	Blackrock Dividend Achievers Trust
NYSE      	PMM                 	Putnam Managed Municipal Income Trust
NYSE      	CER.P               	CENTRAL ILLINOIS LIGHT CO PFD
NASDAQ    	NOVB                	North Valley Bancorp
NYSE      	JLA                 	Nuveen Equity Premium Advantage Fund
AMEX      	XSB                 	Citigroup Global Markets Holdings Inc
NASDAQ    	BPOPN               	Popular, Inc.
NASDAQ    	CTRA                	Centra Software, Inc.
NYSE      	NRI                 	Neuberger Berman Inc.
TSE       	VCM.TO              	Vcom Inc
AMEX      	SBN                 	SOFTBRANDS INC
TSE       	RCS.TO              	Rentcash Inc
NASDAQ    	CYPB                	Cypress Bioscience, Inc.
AMEX      	PXQ                 	PowerShares Dynamic Networking
NASDAQ    	PTSX                	Point.360
NASDAQ    	RNST                	Renasant Corporation
NYSE      	BXG                 	Bluegreen Corporation
NYSE      	BKD                 	BROOKDALE SENIOR LIVING INC.
NASDAQ    	ALLB                	Greater Delaware Valley Savings Bank
NASDAQ    	CNVLZ               	City Investing Company Liquidating Trust
TSE       	PNG.PR.A.TO         	Pacific Northern Gas 6.75% Pfd
NYSE      	LNT                 	Alliant Energy Corporation
NASDAQ    	SILC                	SILICOM
AMEX      	FAX                 	Aberdeen Asia-Pacific Income Fund Inc
NYSE      	NQM                 	Nuveen Investment Quality Municipal Fund, Inc.
TSE       	POT.TO              	Potash Cp Of Saskatchewan Inc
TSE       	FCI.PR.A.TO         	Faircourt Income Split Pfd A
AMEX      	AMS                 	American Shared Hospital Services
NASDAQ    	SPCHA               	SPORT CHALET INC
NYSE      	GVT                 	MS Government Income Trust
NASDAQ    	PLXT                	PLX Technology, Inc.
TSE       	CEF.NV.U.TO         	Central Fund Of Canada US$
NYSE      	CAB                 	Cabela's Inc
NYSE      	AKP                 	Alliance California Municipal Income Fund Inc
INDEX     	ADR                 	AMEX Internationl Market Index
TSE       	BPP.PR.M.TO         	BPO Properties Ltd Pfd M
TSE       	DD.TO               	Digital Dispatch Systems Inc
TSE       	DTC.PR.A.TO         	Domtar Inc $2.25 Pfd A
TSE       	TLC.TO              	TLC Vision Cp
NASDAQ    	PMTCD               	PARAMETRIC TECH CP
NYSE      	APC                 	Anadarko Petroleum Corporation
AMEX      	IJR                 	iShares S&P SmallCap 600 Index Fund
NYSE      	EAC                 	Encore Acquisition Company
TSE       	FMI.TO              	Forbes Medi-Tech Inc
NASDAQ    	LMRA                	Lumera Corporation
NYSE      	MS                  	MORGAN STANLEY
NYSE      	SJI                 	South Jersey Industries, Inc.
TSE       	ESI.TO              	Ensign Energy Services Inc
AMEX      	GLV                 	Clough Global Allocation Fund
NASDAQ    	CHRW                	C.H. Robinson Worldwide, Inc.
NASDAQ    	JUPM                	Jupitermedia Corporation
TSE       	CHL.UN.TO           	Canadian Helicopters Income Fund
TSE       	AVZ.TO              	Amvescap Inc
AMEX      	RTH                 	HOLDRS Retail
TSE       	BNA.PR.A.TO         	BNN Split Cp Pfd A
NASDAQ    	ENWV                	Endwave Corporation
NYSE      	NE                  	Noble Corporation
NASDAQ    	PICO                	PICO Holdings Inc.
NYSE      	CSQ                 	Calamos Strategic Total Return
NYSE      	RWT                 	Redwood Trust, Inc.
TSE       	BNC.TO              	Bioniche Life Sciences Inc
NASDAQ    	GLAD                	Gladstone Capital Corporation
NYSE      	R                   	Ryder System, Inc.
TSE       	GO.A.TO             	Galleon Energy Inc Cl A
NASDAQ    	HSKA                	Heska Corporation
TSE       	FTS.PR.C.TO         	Fortis Inc 1st Pfd C
TSE       	ISE.TO              	Canlan Ice Sports Cp
AMEX      	AKC                 	Access Pharmaceuticals, Inc.
NASDAQ    	ENMD                	EntreMed, Inc.
AMEX      	ILB                 	Citigroup Global Markets LASERS
TSE       	HYG.TO              	Hydrogenics Cp
NYSE      	DNB                 	Dun & Bradstreet Corporation (The)
TSE       	ASI.UN.TO           	Alliance Split Income Tr Units
NYSE      	VMC                 	Vulcan Materials Company
NASDAQ    	GISX                	Global Imaging Systems, Inc.
TSE       	CPG.UN.TO           	Crescent Point Energy Trust
TSE       	NDQ.TO              	Novadaq Technologies Inc
NASDAQ    	TPTH                	TriPath Imaging Inc.
TSE       	EP.UN.TO            	EPCOR Power LP
NYSE      	FMC                 	FMC Corporation
AMEX      	SCC                 	Security Capital Corporation
AMEX      	XOS                 	Citigroup Global Markets Holdings Inc
AMEX      	BPG                 	BPI INDUSTRIES INC
NASDAQ    	CNSL                	Consolidated Communications Holdings, Inc.
NYSE      	AFG                 	American Financial Group, Inc.
AMEX      	FLT.W               	FLIGHT SAFETY WARNTS
NASDAQ    	SNDA                	Shanda Interactive Entertainment
NYSE      	MCC                 	Mestek, Inc.
NASDAQ    	DCBK                	Desert Community Bank
NYSE      	IQI                 	MS Quality Municipal Income Trust
NASDAQ    	NEON                	NEON Systems, Inc.
NASDAQ    	BLSC                	Bio-Logic Systems Corp.
NYSE      	GNW                 	Genworth Financial Inc
NYSE      	ABC                 	AmerisourceBergen Corporation (Holding Co)
INDEX     	IXM                 	Financial Select Sector Index
NASDAQ    	FFBH                	First Federal Bancshares of Arkansas, Inc.
TSE       	AF.TO               	Alarmforce Industries Inc
INDEX     	SCF                 	SIG CABLE MEDIA & ENT INDEX SE
NASDAQ    	USTR                	United Stationers Inc.
NASDAQ    	BRCM                	Broadcom Corporation
INDEX     	IAV                 	IAV AMEX INDEX
NYSE      	SYY                 	Sysco Corporation
NASDAQ    	VIFL                	Food Technology Service, Inc.
TSE       	BLD.TO              	Ballard Power Systems Inc
NASDAQ    	NWEC                	NorthWestern Corporation
NYSE      	NUN                 	Nuveen New York Quality Income Municipal Fund, Inc.
AMEX      	CRB.W               	COURTSIDE ACQ WTS
AMEX      	PST                 	Franklin Capital Corporation
AMEX      	QSC                 	Questcor Pharmaceuticals, Inc.
NYSE      	EDR                 	Education Realty Trust Inc.
INDEX     	OOI                 	S&P Global 100 Index
INDEX     	QGE                 	WEBS GRMNY SHR
AMEX      	HAF                 	Hallmark Financial Services, Inc.
NYSE      	GGI                 	Geo Group Inc (The)
NASDAQ    	AGEN                	Antigenics Inc.
NASDAQ    	AABC                	Access Anytime Bancorp, Inc.
NYSE      	CPP                 	Merrill Lynch Depositor, Inc.
AMEX      	GAX                 	GALAXY ENERGY CORP
NYSE      	TMR                 	Meridian Resource Corporation (The)
NASDAQ    	CPSI                	Computer Programs and Systems, Inc.
AMEX      	NVR                 	NVR, Inc.
TSE       	SNI.PR.A.TO         	Sonor Investments Ltd 9.0% Pfd
NYSE      	C                   	Citigroup, Inc.
TSE       	TBC.TO              	Tembec Inc
NASDAQ    	AZPN                	Aspen Technology, Inc.
NYSE      	XKP                 	Lehman ABS Corporation
NYSE      	SFI                 	iStar Financial Inc.
NYSE      	TPX                 	Tempur-pedic International Inc
NYSE      	FFG                 	FBL Financial Group, Inc.
AMEX      	DBC                 	DB Commodity Index Tracking Fund
NYSE      	JTP                 	Nuveen Quality Preferred Income Fund
NYSE      	BLT                 	Blount International, Inc.
NASDAQ    	PREM                	Premier Community Bankshares Inc
NASDAQ    	USEYE               	US ENERGY SYSTEMS
NASDAQ    	AIXG                	Aixtron Aktiengesellschaft
NASDAQ    	SHOO                	Steven Madden, Ltd.
NYSE      	BF.A                	Brown-Forman Corporation
NASDAQ    	GBBKO               	Greater Bay Bancorp
NYSE      	LDZ                 	Lazard LTD.
TSE       	ENE.TO              	Endev Energy Inc
TSE       	BNA.PR.B.TO         	BNN Split Cp AA Pfd B
NYSE      	BTA                 	BLACKROCK LONG TERM MUNICIPAL
NYSE      	ENH                 	Endurance Specialty Holdings Ltd
NYSE      	SSW                 	Seaspan Corporation
INDEX     	DWCF                	DJ Wilshire 5000 Index
NASDAQ    	GPOR                	GULFPORT ENERGY CORP
NASDAQ    	ELOS                	Syneron Medical Ltd.
TSE       	MGI.TO              	Migenix Inc
TSE       	WXX.TO              	West 49 Inc
NASDAQ    	WTNY                	Whitney Holding Corporation
NASDAQ    	MBRX                	Metabasis Therapeutics, Inc
NASDAQ    	AVZA                	AVIZA TECHNOLOGY IN
AMEX      	DMP                 	Merrill Lynch & Co., Inc.
NYSE      	LFB                 	Longview Fibre Company
NASDAQ    	RUSHA               	Rush Enterprises, Inc.
NYSE      	SQA.B               	Sequa Corporation
AMEX      	SEB                 	Seaboard Corporation
NYSE      	MHI                 	Pioneer Municipal High Income Trust
NYSE      	CFI                 	Culp, Inc.
TSE       	XNS.TO              	Xenos Group Inc
NYSE      	MJM                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	TSCM                	TheStreet.com, Inc.
AMEX      	MZP                 	PLUS LINKED TO THE S& P    500 I
NYSE      	OHI                 	Omega Healthcare Investors, Inc.
NYSE      	SNS                 	Steak n Shake Company (The)
TSE       	XSR.SV.TO           	Canadian Satellite Radio Holdings Inc
INDEX     	DAH                 	MERGENT HIGH GROWTH RATE DIVIDE
NYSE      	MDP                 	Meredith Corporation
NASDAQ    	ATPG                	ATP Oil & Gas Corporation
NYSE      	GAI                 	Global-Tech Appliances Inc.
INDEX     	DECN                	NYSE Decliners
NASDAQ    	ISIS                	Isis Pharmaceuticals, Inc.
NASDAQ    	OZRK                	Bank of the Ozarks
INDEX     	KDY                 	AMEX HONG KONG INDEX FLOAT RATE
TSE       	SGT.UN.TO           	Sentry Select Global Index Uts
AMEX      	NFZ                 	Nuveen Arizona Dividend Advantage Municipal Fund
NYSE      	IYE                 	iShares Dow Jones US Energy Index
NYSE      	RMD                 	ResMed Inc.
NYSE      	GEC                 	General Electric Capital Corporation
INDEX     	BVSP                	Bovespa - Brazil
NASDAQ    	LMLP                	LML Payment Systems, Inc.
NYSE      	BRK.B               	Berkshire Hathaway Inc.
NASDAQ    	CSPLF               	Canada Southern Petroleum Ltd.
AMEX      	PCV                 	PACERS BASED UPON THE COMMON S
NASDAQ    	TRGT                	TARGACEPT INC.
NYSE      	WBD                 	WIMM BILL DANN FOODS OJSC
NASDAQ    	CURN                	Curon Medical, Inc.
TSE       	XSC.UN.TO           	XS Cargo Income Fund
AMEX      	ELV                 	streetTRACKS Dow Jones U.S. Large Cap Value Index Fund
NASDAQ    	REVU                	Princeton Review, Inc. (The)
NYSE      	FED                 	FirstFed Financial Corporation
AMEX      	ICH                 	Investors Capital Holdings, Ltd.
NYSE      	CMH.P               	COMPASS TRUST III 7.35% CAPITAL
TSE       	RPC.TO              	Revenue Properties Co Ltd
TSE       	GUY.TO              	Guyana Goldfields Inc
NYSE      	KRL                 	Lehman ABS Corporation
NASDAQ    	WPCS                	WPCS International Incorporated
NYSE      	STZ.B               	Constellation Brands, Inc.
NASDAQ    	PRST                	Presstek, Inc.
NYSE      	EP                  	El Paso Corporation
AMEX      	NBO                 	Neuberger Berman New York Intermediate Municipal Fund Inc.
NASDAQ    	WHIT                	WHITTIER ENERGY CORP
NASDAQ    	FFHS                	First Franklin Corporation
NYSE      	TRP                 	Transcananda Pipelines, Ltd.
NASDAQ    	TFCO                	Tufco Technologies, Inc.
INDEX     	EBL                 	AMEX
NYSE      	NVN                 	Nuveen New York Select Quality Municipal Fund, Inc.
AMEX      	XNN                 	Xenonics Holdings, Inc.
AMEX      	CIM                 	CIM High Yield Securities
NASDAQ    	CLFCE               	Center Financial Corporation
NYSE      	WPD                 	Wells Fargo Cap IX
TSE       	RE.TO               	Rock Energy Inc
NYSE      	DFG                 	Delphi Financial Group, Inc.
NYSE      	ET.P                	E* TRADE FINANCIAL CORPORATION
NYSE      	DVM                 	Cohen & Steers Dividend Majors Fund
AMEX      	HEM                 	HemoSense Inc.
NYSE      	OME                 	Omega Protein Corporation
TSE       	RIV.TO              	River Gold Mines Ltd
TSE       	HML.TO              	Hemosol Inc
AMEX      	AIM                 	Aerosonic Corporation
NYSE      	RDA                 	Reader's Digest Association, Inc. (The)
AMEX      	IHM                 	Merrill Lynch & Co., Inc.
NYSE      	SAN                 	Banco Santiago, S.A.
TSE       	LSC.TO              	Lifeco Split Cp Inc A Capital
NASDAQ    	PFDC                	Peoples Bancorp
NYSE      	FEU                 	streetTRACKS Dow Jones STOXX 50
NYSE      	FNB                 	F.N.B. Corporation
NYSE      	KYO                 	Kyocera Corporation
INDEX     	QAW                 	WEBS AUSTR SHR
AMEX      	EIV                 	Eaton Vance Insured Municipal Bond Fund II
NYSE      	HES.P               	HESS CORPORATION
INDEX     	BSESN               	BSE 30 - India
NYSE      	NMR                 	Nomura Holdings Inc ADR
NASDAQ    	AAUK                	Anglo American plc
TSE       	ROC.TO              	Rothmans Inc
NYSE      	DLX                 	Deluxe Corporation
NYSE      	ANR                 	Alpha Natural Resources, inc.
NYSE      	UVV                 	Universal Corporation
TSE       	ARA.TO              	Art Advanced Research Tech
NYSE      	CHU                 	CHINA UNICOM LTD
AMEX      	MCU                 	Morgan Stanley Dean Witter & Co.
TSE       	HBM.TO              	Hudbay Minerals Inc
AMEX      	XBI                 	SPDR Biotech
AMEX      	CAQ                 	Citigroup Global Markets
NYSE      	LTC                 	LTC Properties, Inc.
NYSE      	TKG                 	Telkom SA Ltd
AMEX      	NXZ                 	Nuveen Dividend Advantage Municipal Fund 2
NYSE      	FRO                 	Frontline Ltd.
NASDAQ    	AWRE                	Aware, Inc.
NYSE      	WHG                 	Westwood Holdings Group Inc
AMEX      	LAN                 	Lancer Corporation
NYSE      	FS                  	Four Seasons Hotels, Inc.
AMEX      	NVE                 	MORGAN STANLEY
NASDAQ    	WLFC                	Willis Lease Finance Corporation
NYSE      	EGN                 	Energen Corporation
NYSE      	BED                 	Bedford Property Investors, Inc.
NASDAQ    	FLYIQ               	FLYI INC
NYSE      	LUB                 	Luby's, Inc.
NYSE      	CCH                 	COCA COLA HELLENIC BOTTLING CO
NASDAQ    	SYBR                	Synergy Brands Inc.
NYSE      	PYD                 	PPlus Trust
NYSE      	APH                 	Amphenol Corporation
NYSE      	UBB                 	Unibanco Brasileiros S.A.
TSE       	MPC.TO              	Madison Pacific Properties Inc
INDEX     	WWM                 	iShares MSCI Taiwan Index
NASDAQ    	ACAP                	American Physicians Capital, Inc.
NYSE      	UBP                 	Urstadt Biddle Properties Inc.
TSE       	MCB.TO              	McCoy Cp
TSE       	REK.TO              	Reko International Group Inc
NASDAQ    	SMANP               	Standard Management Corporation
TSE       	PTF.UN.TO           	Petrofund Energy Trust
NYSE      	BLS                 	Structured Products Corp.
NYSE      	ROG                 	Rogers Corporation
TSE       	SMY.TO              	SAMsys Technologies Inc
AMEX      	KFX                 	KFX Inc.
NASDAQ    	FBTX                	Franklin Bank Corp.
NASDAQ    	DEIX                	DIRECTED ELECTRONICS
AMEX      	SME                 	Merrill Lynch & Co., Inc.
NYSE      	GMR                 	General Maritime Corporation
AMEX      	FLT                 	Flight Safety Technologies, Inc.
TSE       	Symbol.TO           	Description
NASDAQ    	STAA                	STAAR Surgical Company
NASDAQ    	ALSK                	Alaska Communications Systems Group, Inc.
NYSE      	DHM                 	Structured Obligations Corp 8.125 COBALTS
AMEX      	NTO                 	Northern Orion Resources, Inc.
NYSE      	PKM                 	Merrill Lynch Depositor, Inc.
INDEX     	SPMI                	SP500 E-Mini Index
NYSE      	HNR                 	Benton Oil and Gas Company
NYSE      	CHD                 	Church & Dwight Company, Inc.
AMEX      	MPE                 	Mpower Holding Corporation New
NYSE      	SVR                 	Syniverse Holdings, Inc.
TSE       	ELR.TO              	Eastern Platinum Ltd
AMEX      	GSS                 	Golden Star Resources, Ltd
TSE       	SGD.TO              	Sterlite Gold Ltd
NASDAQ    	MMSI                	Merit Medical Systems, Inc.
NYSE      	IFC                 	Irwin Financial Corporation
NYSE      	AL                  	ALCAN, Inc.
NASDAQ    	GGAL                	Grupo Financiero Galicia S.A.
NASDAQ    	KELYA               	Kelly Services, Inc.
NYSE      	ELN                 	Elan Corporation, plc
TSE       	FHR.TO              	Fairmont Hotels & Resorts Inc
NASDAQ    	ALAB                	Alabama National BanCorporation
AMEX      	CSM                 	Merrill Lynch & Co., Inc.
NYSE      	ATS                 	APT Satellite Holdings
NYSE      	FIA                 	FIAT S.p.A.
INDEX     	WDG                 	iShares MSCI Germany Index
NASDAQ    	EDMC                	Education Management Corporation
NASDAQ    	MEDW                	MEDIWARE Information Systems, Inc.
NYSE      	MYF                 	MuniYield Florida Fund
NASDAQ    	HBHC                	Hancock Holding Company
AMEX      	DFB                 	Morgan Stanley Dean Witter & Co.
TSE       	LB.PR.D.TO          	Laurentian Bank Pfd 9
NYSE      	NCA                 	Nuveen California Municipal Value Fund, Inc.
TSE       	IST.TO              	Innicor Subsurface Technologs
NYSE      	MJB                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
TSE       	BAD.UN.TO           	Badger Daylighting Inc
TSE       	AAC.A.TO            	Alliance Atlantis Comms Cl A
NASDAQ    	TRISW               	Tri-S Security Corporation
TSE       	ANO.TO              	Anatolia Minerals Development
NYSE      	SYX                 	Systemax Inc.
NASDAQ    	TERNE               	TERAYON COMMUN SYS
NASDAQ    	CEVA                	CEVA, Inc.
INDEX     	EFV                 	iShares MSCI EAFE Index Fund
NYSE      	NCR                 	NCR Corporation
NYSE      	JBP                 	Corporate Backed Trust Ctfs
AMEX      	WMH                 	HOLDRS Wireless
NASDAQ    	BRKL                	Brookline Bancorp, Inc.
NASDAQ    	PESI                	Perma-Fix Environmental Services, Inc.
NASDAQ    	FKFS                	First Keystone Financial, Inc.
AMEX      	EWO                 	iShares MSCI Austria Index Fund
NASDAQ    	CHUX                	O'Charley's Inc.
NYSE      	MIG                 	Meadowbrook Insurance Group, Inc.
AMEX      	JPK                 	Morgan Stanley Plus
NASDAQ    	MBHI                	Midwest Banc Holdings, Inc.
NYSE      	OSI                 	Outback Steakhouse, Inc.
TSE       	SC.TO               	Shoppers Drug Mart
NYSE      	KTZ                 	Structured Products Inc 8% CorTS
AMEX      	ELG                 	streetTRACKS Dow Jones U.S. Large Cap Growth Index Fund
NYSE      	BQH                 	Blackrock New York Municipal Bond Trust
TSE       	CXS.TO              	Counsel Cp
NYSE      	ISM                 	SLM CORPORATION
NYSE      	RHI                 	Robert Half International Inc.
NYSE      	EMN                 	Eastman Chemical Company
NYSE      	ABT                 	Abbott Laboratories
TSE       	BSR.UN.TO           	Brompton Stable Income Fund
INDEX     	SPENE               	SP500 Energy Sector
NASDAQ    	APSG                	Applied Signal Technology, Inc.
TSE       	MAE.TO              	Miramar Mining Cp
NYSE      	UFI                 	Unifi, Inc.
AMEX      	PHW                 	PowerShares Dynamic Hardware & Consumer Electronics
NASDAQ    	EGOV                	NIC Inc.
TSE       	HBG.TO              	Hub International Ltd
AMEX      	CJM                 	CAPITAL AUTOMOTIVE REIT
TSE       	CAL.TO              	Caledonia Mining Cp
NYSE      	BMC                 	BMC Software, Inc.
NYSE      	FO                  	Fortune Brands, Inc.
NASDAQ    	HLND                	Hiland Partners, LP
AMEX      	PLM                 	Morgan Stanley PLUS
NASDAQ    	SASR                	Sandy Spring Bancorp, Inc.
NASDAQ    	EQTX                	Equitex, Inc.
NYSE      	ZF                  	Zweig Fund, Inc. (The)
TSE       	CXI.TO              	Comnetix Inc
TSE       	CTL.TO              	Catalyst Paper Cp
NASDAQ    	SYKEE               	SYKES ENTERPRISES
NASDAQ    	FBMT                	First National Bancshares, Inc. (FL)
NASDAQ    	SSRI                	Silver Standard Resources, Inc
NYSE      	TTC                 	Toro Company (The)
NASDAQ    	BBBY                	Bed Bath & Beyond Inc.
NASDAQ    	BORDW               	Boardwalk Bank
INDEX     	STOXX               	DJ Stoxx 50 Index Euro
NASDAQ    	WEBM                	webMethods, Inc.
NASDAQ    	NVTL                	Novatel Wireless, Inc.
NYSE      	BMR                 	Biomed Realty Trust
AMEX      	IWV                 	iShares Russell 3000 Index Fund
INDEX     	NHG                 	iShares Dow Jones U.S. Healthcare Sector Index
AMEX      	BAA                 	BANRO CORPORATION
NYSE      	GPU                 	Georgia Power Company
AMEX      	SLW                 	SILVER WHEATON CORP
TSE       	SVM.TO              	Silvercorp Metals Inc
NYSE      	DOX                 	Amdocs
NYSE      	TNS                 	T, Inc.
INDEX     	DZE                 	DYNAMIC SEMICONDUCTOR INTELLIDE
NASDAQ    	FSNM                	First State Bancorporation
NASDAQ    	WFII                	Wireless Facilities, Inc.
NASDAQ    	MTTT                	Merrill Lynch & Co., Inc.
NASDAQ    	PDRT                	Particle Drilling Technologies, Inc.
AMEX      	ANK                 	Atlantic Tele-Network, Inc.
TSE       	HSB.PR.C.TO         	HSBC Bank Canada Pfd Srs C
NYSE      	CGV                 	Lehman ABS Corporation
AMEX      	LGL                 	Lynch Corporation
NASDAQ    	ABVA                	Alliance Bankshares Corporation
AMEX      	ELC                 	Electric City Corporation
NASDAQ    	IINT                	Indus International, Inc.
NYSE      	BDE                 	Bois D'Arc Energy, Inc.
TSE       	PWF.PR.D.TO         	Power Financial Cp Pfd C
NYSE      	COT                 	Cott Corporation
TSE       	PAE.LV.TO           	Peace Arch Entertainment Group
AMEX      	EZM                 	E-Z-EM, Inc.
TSE       	SWG.TO              	Southwestern Gold Cp
NASDAQ    	FSBK                	First South Bancorp Inc
TSE       	AIT.PR.A.TO         	Aliant Inc Pfd A
NASDAQ    	CETV                	Central European Media Enterprises Ltd.
NASDAQ    	HAIN                	Hain Celestial Group, Inc. (The)
NASDAQ    	RTSX                	Radiation Therapy Services, Inc.
TSE       	SSJ.UN.TO           	Sentry Select Commodities Income Trust
NASDAQ    	INOD                	Innodata Isogen Inc
NASDAQ    	SKIL                	SkillSoft plc
NYSE      	RWY                 	Rent-Way, Inc.
AMEX      	ISL                 	FIRST ISRAEL FD INC
NYSE      	IKR                 	Bank of America Corporation
AMEX      	ICF                 	iShares Cohen & Steers Realty Majors Index Fund
NASDAQ    	MSCC                	Microsemi Corporation
NASDAQ    	MOTV                	Motive, Inc.
NYSE      	TAC                 	TransAlta Corporation
NASDAQ    	ONFC                	Oneida Financial Corp.
NYSE      	ICS                 	MS Insured California Municipal Securities
NYSE      	GKK                 	Gramercy Capital Corp
NYSE      	MIL                 	Millipore Corporation
NASDAQ    	SBSA                	Spanish Broadcasting System, Inc.
NASDAQ    	PULB                	Pulaski Financial Corporation
NYSE      	BRC                 	Brady Corporation
AMEX      	PNB                 	PanAmerican Bancorp
NASDAQ    	TEAM                	TechTeam Global, Inc.
NASDAQ    	ESCA                	Escalade, Incorporated
NASDAQ    	ARTL                	The Aristotle Corporation
NASDAQ    	MOSS                	Mossimo Inc.
NYSE      	FOE                 	Ferro Corporation
NASDAQ    	DGICB               	Donegal Group, Inc.
NASDAQ    	DRRAP               	Dura Automotive Systems, Inc.
TSE       	MFT.M.TO            	Manulife Financial Capl Macs
NYSE      	ARJ                 	Arch Chemicals, Inc.
NYSE      	DKR                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
AMEX      	AVD                 	American Vanguard Corporation
NASDAQ    	RAMEW               	RAM ENERGY RESOURCES
NYSE      	EWH                 	iShares MSCI Hong Kong
NYSE      	PTY                 	Pimco Corporate Opportunity Fund
NYSE      	RDC                 	Rowan Companies, Inc.
NYSE      	GFZ                 	AAG Holding Company Inc.
TSE       	PGE.TO              	Progress Energy Ltd
NYSE      	IOM                 	Iomega Corporation
NYSE      	HYJ                 	Lehman ABS Corporation
TSE       	BLE.TO              	Blue Pearl Mining Ltd
NASDAQ    	WSBC                	WesBanco, Inc.
NASDAQ    	SLXP                	Salix Pharmaceuticals, Ltd.
NASDAQ    	CZNC                	Citizens & Northern Corp
NASDAQ    	FFIC                	Flushing Financial Corporation
NYSE      	LTR                 	Loews Corporation
NASDAQ    	AMWD                	American Woodmark Corporation
NYSE      	TBE                 	Tele Leste Celular Participacoes S.A.
TSE       	NOV.TO              	Novicourt Inc
NASDAQ    	DRAD                	Digirad Corporation
NASDAQ    	MVIS                	Microvision, Inc.
NASDAQ    	MGIC                	Magic Software Enterprises Ltd.
NYSE      	RUK                 	Reed Elsevier PLC
NYSE      	MVC                 	MVC Capital
NYSE      	CMA                 	Comerica Incorporated
NYSE      	NPP                 	Nuveen Performance Plus Municipal Fund, Inc.
NYSE      	PLL                 	Pall Corporation
TSE       	DTN.UN.TO           	Diversi Trust Energy Income Fd
NASDAQ    	HAST                	Hastings Entertainment, Inc.
NYSE      	IWA                 	Iowa Telecommunications Services, Inc.
NYSE      	KTK                 	Lehman ABS Corporation
NYSE      	JWF                 	Wells Fargo Cap IX
NASDAQ    	NASB                	NASB Financial Inc.
NYSE      	HDB                 	HDFC Bank
INDEX     	VXP                 	MORGAN STANLEY HEALTHCARE PRODU
TSE       	EEE.UN.TO           	Esprit Energy Trust
TSE       	ANP.TO              	Angiotech Pharmaceuticals Inc
NYSE      	WFT                 	Weatherford International, Inc.
NASDAQ    	CMRO                	COMARCO, Inc.
NASDAQ    	TELK                	Telik, Inc.
NASDAQ    	DAIEY               	Dai'ei, Inc.
NASDAQ    	PFGC                	Performance Food Group Company
NASDAQ    	QLTY                	Quality Distribution, Inc.
NASDAQ    	ANSI                	Advanced Neuromodulation Systems, Inc.
TSE       	FSL.UN.TO           	Nuveen Senior Floatng Rate Uts
AMEX      	PZI                 	PowerShares Zacks Microcap Index
NYSE      	CYN                 	City National Corporation
NYSE      	KNW                 	Lehman ABS Corporation
NASDAQ    	RELL                	Richardson Electronics, Ltd.
NASDAQ    	CMCSK               	Comcast Corporation
NYSE      	FBR                 	Friedman, Billings, Ramsey Group, Inc.
TSE       	WFS.TO              	World Financial Split Cp
NYSE      	SXI                 	Standex International Corporation
NYSE      	AGM.A               	FEDERAL AGRIC MTG CORP
NASDAQ    	CAMT                	Camtek Ltd.
NYSE      	HLN                 	Hilton Hotels Corporation
NYSE      	DPM                 	DCP MIDSTREAM PARTNERS LP
NYSE      	PJJ                 	Merrill Lynch Depositor Inc Preferred Plus Trust ELP-1
NYSE      	SGP                 	Schering-Plough Corp
INDEX     	BKX                 	Phlx Bank Index
NASDAQ    	IMGC                	Intermagnetics General Corporation
INDEX     	SJE                 	ISH MSCI EMU
NASDAQ    	MDRX                	Allscripts Healthcare Solutions Inc
NYSE      	GOT                 	Gottschalks Inc.
TSE       	Z.UN.TO             	Sleep Country Canada Income Fd
NASDAQ    	WOOF                	VCA Antech, Inc.
NYSE      	RHB                 	Rehabcare Group, Inc.
AMEX      	PFM                 	PowerShares Dividend Achievers
AMEX      	NXI                 	Nuveen Ohio Dividend Advantage Municipal Fund
NASDAQ    	IASG                	Integrated Alarm Services Group, Inc.
NYSE      	LOW                 	Lowe's Companies, Inc.
NYSE      	SOR.P               	SOURCE CAPITAL INC PFD
NYSE      	SRX                 	SRA International, Inc
AMEX      	SMX                 	Citigroup Global Markets Holdings Inc
NYSE      	IGD                 	ING Global Equity Dividend and Premium Opportunity Fund
TSE       	TVL.TO              	Tri Vision International Ltd
NASDAQ    	CECE                	CECO Environmental Corp.
AMEX      	VAZ                 	Delaware Investments Arizona Municipal Income Fund, Inc.
NYSE      	MLI                 	Mueller Industries, Inc.
TSE       	CDJ.UN.TO           	Criterion DJ-AIG Commodity Fd
AMEX      	MEH                 	MIDWEST AIR GRP INC
NYSE      	TW                  	21st Century Insurance Group
NASDAQ    	RUTH                	Ruth's Chris Steak House, Inc.
NASDAQ    	GILD                	Gilead Sciences, Inc.
TSE       	KEC.TO              	Kick Energy Cp
NASDAQ    	FNBF                	FNB Financial Services Corporation
AMEX      	QD                  	QuadraMed Corporation
TSE       	MVP.UN.TO           	Brompton MVP Income Fund
TSE       	EQN.TO              	Equinox Minerals Ltd
NASDAQ    	TPPHD               	TAPESTRY PHARMA INC
NYSE      	STL                 	STERLING BANCORP
TSE       	CLC.UN.TO           	CML Healthcare Inc
AMEX      	FNX                 	FNX Mining Company, Inc.
NASDAQ    	JJSF                	J & J Snack Foods Corp.
NYSE      	WES                 	WestCorp
NASDAQ    	LDSH                	Ladish Co., Inc.
NASDAQ    	NVEC                	NVE Corporation
NASDAQ    	UNTY                	Unity Bancorp, Inc.
NYSE      	MU                  	Micron Technology, Inc.
NYSE      	UIL                 	UIL Holdings Corporation
NASDAQ    	SSCC                	Smurfit-Stone Container Corporation
NYSE      	SPN                 	Superior Energy Services, Inc.
AMEX      	RKE                 	Cap Rock Energy Corporation
NASDAQ    	CODI                	COMPASS DIVERSIFIED
NYSE      	DEL                 	Deltic Timber Corporation
NASDAQ    	HTRN                	HealthTronics, Inc.
AMEX      	NPS                 	MORGAN STANLEY
NASDAQ    	ORGN                	Origen Financial, Inc.
NYSE      	AGE                 	A.G. Edwards, Inc.
NYSE      	BRP                 	Brasil Telecom Participacoes S.A.
TSE       	IDB.TO              	ID Biomedical Cp
NASDAQ    	TLWT                	Telewest Global Inc
NASDAQ    	EXPD                	Expeditors International of Washington, Inc.
NASDAQ    	ESLR                	Evergreen Solar, Inc.
TSE       	MXZ.UN.TO           	Maxin Income Fund
NYSE      	PPR                 	ING Prime Rate Trust
NASDAQ    	KOSP                	Kos Pharmaceuticals, Inc.
TSE       	PIC.A.TO            	Premium Inc Cp Cl A
INDEX     	TRIN                	NYSE Short Term Trade Index
NASDAQ    	XIDE                	Exide Technologies
NYSE      	CY                  	Cypress Semiconductor Corporation
INDEX     	HVK                 	Vanguard Sml Cap Growth Vipers
NASDAQ    	LKQX                	LKQ Corporation
TSE       	CLE.UN.TO           	Clean Power Income Fund Unit
NYSE      	DT                  	Deutsche Telekom AG
NYSE      	CMC                 	Commercial Metals Company
NYSE      	MRX                 	Medicis Pharmaceutical Corporation
TSE       	FAL.PR.H.TO         	Falconbridge Pfd H
NASDAQ    	DENN                	Denny's Corporation
TSE       	ELD.TO              	Eldorado Gold Cp
TSE       	DFN.TO              	Dividend 15 Split Cp
NYSE      	HB                  	Hillenbrand Industries, Inc.
NASDAQ    	RVSB                	Riverview Bancorp Inc
NASDAQ    	VYYO                	Vyyo, Inc.
NYSE      	GJJ                 	Strats Tr for Bellsouth Telecommunications Ctfs
AMEX      	MBS                 	MORGAN STANLEY
INDEX     	RXP                 	AMEX M S Healthcare Products Index
NYSE      	CEC                 	CEC Entertainment, Inc.
NASDAQ    	HARB                	Harbor Florida Bancshares Inc
NASDAQ    	CPKI                	California Pizza Kitchen, Inc.
NASDAQ    	GLBZ                	Glen Burnie Bancorp
NASDAQ    	MCHXP               	Marchex, Inc.
NASDAQ    	GNBT                	Generex Biotechnology Corporation
NYSE      	VFC                 	V.F. Corporation
NYSE      	SMV.B               	Smedvig Asa Ads Cla
INDEX     	UNCN                	NYSE Unchanged
TSE       	WTE.UN.TO           	Westshore Terminals Inc Unit
AMEX      	DOR                 	DOR BIOPHARMA INC
INDEX     	DJB                 	POWERSHARES DYNAMIC LEISURE & E
NASDAQ    	MPET                	Magellan Petroleum Corporation
NYSE      	BNY                 	BlackRock New York Municipal Income Trust
NASDAQ    	STRZ                	Star Buffet, Inc.
NASDAQ    	AAPL                	Apple Computer, Inc.
TSE       	ADV.TO              	Addenda Capital Inc
NASDAQ    	KONA                	Kona Grill, Inc.
NASDAQ    	SNHY                	Sun Hydraulics Corporation
NASDAQ    	HCSG                	Healthcare Services Group, Inc.
TSE       	DFI.TO              	Diamond Fields International
NYSE      	NKT                 	NEWKIRK REALTY TRUST INC
NYSE      	CN                  	China Netcom Group Corporation (Hong Kong)
NYSE      	JZZ                 	Lehman ABS Corporation
NASDAQ    	AINN                	Applied Innovation Inc.
NYSE      	EWS                 	iShares MSCI Singapore
NASDAQ    	EMBX                	Embrex, Inc.
NYSE      	TGT                 	Target Corporation
AMEX      	BEY                 	8% SPARQS LINKED TO BEST BUY
TSE       	BAC.UN.TO           	Barclays Advantaged Corp Bond
TSE       	BDS.UN.TO           	Barclays Income Growth Tr Ut
NYSE      	PYI                 	Merrill Lynch Depositor Inc
NASDAQ    	GGBMW               	GIGABEAM CORP WT
AMEX      	CDS.W               	COLD SPRING CAP WTS
NASDAQ    	CRUS                	Cirrus Logic, Inc.
NASDAQ    	SANYY               	Sanyo Electric Co., Ltd.
NASDAQ    	CYBX                	Cyberonics, Inc.
INDEX     	XBD                 	AMEX Securities Broker Dealer
NYSE      	TRA                 	Terra Industries Inc.
NASDAQ    	TSCCD               	TECH SOLUTIO NEW
NASDAQ    	CASB                	Cascade Financial Corp.
NASDAQ    	QSFT                	Quest Software, Inc.
NYSE      	XFB                 	Lehman ABS Corporation
NYSE      	DRH                 	Diamondrock Hospitality Company
AMEX      	BBC                 	Bodisen Biotech, Inc.
NASDAQ    	NTGR                	NETGEAR, Inc.
NASDAQ    	ANNB                	Annapolis Bancorp Inc.
NYSE      	MKC                 	McCormick & Company, Incorporated
NYSE      	UZG                 	United States Cellular Corporation
NASDAQ    	KHDH                	KHD HUMBOLDT WEDAG
NASDAQ    	DEVC                	Devcon International Corp.
TSE       	ACG.TO              	Ascalade Communications Inc
NYSE      	IYT                 	iShares Dow Jones US Transportation Index
TSE       	MS.TO               	BioMS Medical Cp
TSE       	MAX.TO              	Maximizer Software Inc
NYSE      	BKS                 	Barnes & Noble, Inc.
AMEX      	AEY                 	ADDvantage Technologies Group, Inc.
NYSE      	MOH                 	MOLINA HEALTHCARE INC
NYSE      	CRN                 	Cornell Corrections, Inc.
NASDAQ    	ABTL                	Autobytel Inc.
NASDAQ    	RGEN                	Repligen Corporation
NYSE      	PFE                 	Pfizer, Inc.
NASDAQ    	MRSS                	Merrill Lynch & Co., Inc.
NYSE      	PFV                 	Provident Financial Group Inc
NYSE      	HOV                 	HOVNANIAN ENTERPRISES INC
INDEX     	WPB                 	iShares MSCI Canada Index
NASDAQ    	WRES                	Warren Resources, Inc.
AMEX      	TPA                 	Morgan Stanley Dean Witter & Co.
NASDAQ    	ASRVP               	AmeriServ Financial Inc.
NYSE      	ERJ                 	Embraer-Empresa Brasileira de Aeronautica
TSE       	DND.TO              	Cipher Pharmaceuticals Inc
NASDAQ    	CLAY                	CLAYTON HOLDINGS
NASDAQ    	ASBI                	Ameriana Bancorp
NASDAQ    	LQDT                	LIQUIDITY SERVICES
NYSE      	IMI                 	Sanpaolo IMI S.p.A.
TSE       	CDL.A.TO            	Corby Distilleries Ltd Cl A
NYSE      	CTC                 	Compania de Telecomunicaciones de Chile S.A.
AMEX      	EWJ                 	iShares MSCI Japan Index Fund
TSE       	BYD.UN.TO           	Boyd Group Income Fund Tr Uts
NASDAQ    	PXPL                	PIXELPLUS CO. LTD.
AMEX      	AMV                 	AmeriVest Properties, Inc.
AMEX      	HLM.P               	HILLMAN GR CAP 11.6
AMEX      	PNO                 	Path 1 Network Technologies, Inc.
NASDAQ    	PQUE                	Petroquest Energy Inc
NASDAQ    	TWTI                	Third Wave Technologies, Inc.
NYSE      	MNE                 	Muni New York Intermediate Duration Fund Inc
NYSE      	GIZ                 	Lehman Brothers Fin SA
AMEX      	IWW                 	iShares Russell 3000 Value Index Fund
INDEX     	INK                 	iShares MSCI Belgium Index - IOPV
NYSE      	CPN                 	Calpine Corporation
NYSE      	SJM                 	J.M. Smucker Company (The)
NYSE      	IYY                 	iShares Dow Jones US Total Market
NASDAQ    	ODFL                	Old Dominion Freight Line, Inc.
NYSE      	LRW                 	Labor Ready, Inc.
NYSE      	AKS                 	AK Steel Holding Corporation
NYSE      	KVM                 	Lehman ABS Corporation
NASDAQ    	TFIN                	Team Financial, Inc.
TSE       	CIF.UN.TO           	Citadel Income & Growth Fund
AMEX      	WIS.P               	WISCOIN PWR PR
NYSE      	FIC                 	Fair, Isaac and Company, Incorporated
NYSE      	PNP                 	Pan Pacific Retail Properties, Inc.
NYSE      	WLL                 	Whiting Petroleum Corporation
NYSE      	WDC                 	Western Digital Corporation
TSE       	SEF.UN.TO           	Strategic Energy Fund
NYSE      	VTJ                 	Van Kampen Trust for Investment Grade New Jersey Municipals
NASDAQ    	OPTC                	Optelecom-NKF, Inc.
INDEX     	CJK                 	POWERSHARES DYNAMIC SOFTWARE PO
NASDAQ    	RCII                	Rent-A-Center Inc.
NYSE      	VLO                 	Valero Energy Corporation
AMEX      	CCA                 	Colonial California Insured Municipal Fund
NASDAQ    	QFAB                	Quaker Fabric Corporation
NASDAQ    	JOUT                	Johnson Outdoors Inc.
NASDAQ    	MPWRE               	MONOLITHIC POWER SYS
NASDAQ    	SKYF                	Sky Financial Group, Inc.
AMEX      	PZZ                 	Prospect Medical Hldgs Inc
NYSE      	PUK                 	Prudential Public Company
AMEX      	VO                  	Vanguard Mid-Cap VIPERs
NASDAQ    	CVNS                	Covansys Corporation
NASDAQ    	NICK                	Nicholas Financial, Inc.
TSE       	HIS.TO              	Hart Stores Inc
NYSE      	GMA                 	General Motors Acceptance Corp
TSE       	BCE.PR.R.TO         	BCE Inc Pfd R
NYSE      	GKM                 	General Motors Acceptance Corp
NASDAQ    	SMOD                	SMART MODULAR TEC
NASDAQ    	MANT                	ManTech International Corporation
NYSE      	NXL                 	New Plan Excel Realty Trust, Inc.
NYSE      	PFG                 	Principal Financial Group Inc
TSE       	GPX.TO              	Great Plains Explorations Inc
NYSE      	RCS                 	RCM Strategic Global Government Fund, Inc.
NYSE      	NRG                 	NRG Energy, Inc.
NYSE      	UPS                 	United Parcel Service, Inc.
NASDAQ    	ZOMX                	Zomax Incorporated
NYSE      	ASO                 	AmSouth Bancorporation
TSE       	CNQ.U.TO            	Canadian Natural Resources US$
NASDAQ    	JDAS                	JDA Software Group, Inc.
TSE       	TWG.TO              	Twin Mining Cp
NYSE      	PV                  	Pfeiffer Vacuum Technology AG
NASDAQ    	RBAK                	Redback Networks Inc.
TSE       	FTU.PR.A.TO         	US Financial 15 Split Cp Pfd
NASDAQ    	SBEI                	SBE, Inc.
NYSE      	CSS                 	CSS Industries, Inc.
NYSE      	EXE                 	Extendicare Inc.
NYSE      	HJS                 	MS STRUCTURED ASSET CORP
NASDAQ    	CDSS                	Citadel Security Software Inc.
NYSE      	JNY                 	Jones Apparel Group, Inc.
TSE       	GWO.TO              	Great West Lifeco Inc
NASDAQ    	DYII                	Dynacq Healthcare, Inc.
AMEX      	NBJ                 	Nuveen Ohio Dividend Advantage Municipal Fund 2
NYSE      	GBL                 	Gabelli Asset Management Inc.
NASDAQ    	CVGI                	Commercial Vehicle Group, Inc.
NASDAQ    	CBSS                	Compass Bancshares, Inc.
TSE       	CRN.TO              	Cross Lake Minerals Ltd
NASDAQ    	STAN                	Standard Parking Corporation
NYSE      	TLB                 	Talbots, Inc. (The)
AMEX      	PEJ                 	PowerShares Dynamic Leisure & Entertainment
AMEX      	IEF                 	iShares Lehman 7-10 Year Treasury Bond Fund
TSE       	EXE.PR.B.TO         	Extendicare Inc Series 2 Pfd B
NYSE      	ANT                 	Anteon International Corporation
NYSE      	IFF                 	Internationa Flavors & Fragrances, Inc.
NASDAQ    	JRVR                	James River Group, Inc.
AMEX      	NKW                 	ML 50/150 NIKKEI 225
AMEX      	BMD                 	Birch Mountain Resources, Ltd.
NASDAQ    	XGEN                	Xenogen Corporation
NASDAQ    	MATK                	Martek Biosciences Corporation
NYSE      	GET                 	Gaylord Entertainment Company
AMEX      	CPI                 	Capital Properties, Inc.
NYSE      	CBE                 	Cooper Industries, Ltd.
INDEX     	IFJ                 	ISHARES MSCI VALUE INDEX
AMEX      	EEI                 	Ecology and Environment, Inc.
INDEX     	DXE                 	AMEX Deutsche Bank Energy Index
NYSE      	APA                 	Apache Corporation
AMEX      	HAQ                 	HEALTHCARE ACQUISITION CORP
NASDAQ    	IMDC                	Inamed Corporation
NASDAQ    	WSBA                	Western Sierra Bancorp
NYSE      	MDR                 	McDermott International, Inc.
TSE       	NTP.UN.TO           	Northwater Top 75 Income Tr
TSE       	FEC.TO              	FairWest Energy Corporation
TSE       	QMI.TO              	Queenston Mining Inc
AMEX      	BOI                 	Morgan Stanley Dean Witter & Co.
NYSE      	TSO                 	Tesoro Petroleum Corporation
NASDAQ    	FBIZ                	FIRST BUSINESS FINAN
AMEX      	FTG                 	Farmstead Telephone Group, Inc.
AMEX      	PPJ                 	PRINCIPAL-PROTECTED NOTES BASE
TSE       	GFV.TO              	Global 45 Split Cp Cl A
TSE       	NRM.TO              	Neurochem Inc
NYSE      	KMB                 	Kimberly-Clark Corporation
NASDAQ    	NAPS                	Napster, Inc.
NYSE      	T                   	AT&T Corporation
NYSE      	CNI                 	Canadian National Railway Company
AMEX      	USM                 	United States Cellular Corporation
INDEX     	XWH                 	Software Holders Index
NASDAQ    	ICUI                	ICU Medical, Inc.
NASDAQ    	RITA                	RITA Medical Systems, Inc.
NASDAQ    	HURC                	Hurco Companies, Inc.
TSE       	GBY.UN.TO           	Granby Industries Income Fund
NASDAQ    	BWINA               	Baldwin & Lyons, Inc.
AMEX      	IVV                 	iShares S&P 500 Index Fund
AMEX      	FPU                 	Florida Public Utilities Company
NASDAQ    	AGYS                	Agilysys, Inc.
NASDAQ    	ALOG                	Analogic Corporation
NYSE      	BG                  	Bunge
TSE       	TGN.TO              	Turbo Genset Inc
TSE       	NA.PR.L.TO          	National Bank Of Canada Pfd 16
NASDAQ    	VRSN                	VeriSign, Inc.
TSE       	FRU.UN.TO           	Freehold Royalty Trust Uts
NASDAQ    	PHHM                	Palm Harbor Homes, Inc.
NASDAQ    	ICOCZ               	ICO, Inc.
NYSE      	SFG                 	StanCorp Financial Group, Inc.
TSE       	LKE.TO              	Luke Energy Ltd
TSE       	GBI.TO              	Global Railway Industries Ltd
TSE       	MRG.TO              	Merge Cedara ExchangeCo
TSE       	NGX.TO              	Northgate Minerals Cp
NYSE      	NAN                 	Nuveen New York Dividend Advantage Municipal Fund
NYSE      	EMC                 	EMC Corporation
NASDAQ    	SYNM                	Syntroleum Corporation
NYSE      	SOR                 	Source Capital, Inc.
NYSE      	WOR                 	Worthington Industries, Inc.
INDEX     	NCMP                	Nasdaq NM Composite
NASDAQ    	AMSG                	Amsurg Corp.
TSE       	WJA.RV.TO           	WestJet Airlines Ltd
NASDAQ    	HLTH                	WebMD Corporation
NASDAQ    	FBNKM               	First Banks, Inc.
NASDAQ    	CECX                	Castle Energy Corporation
TSE       	RNC.TO              	RNC Gold Inc
NASDAQ    	CCRT                	CompuCredit Corporation
NASDAQ    	PCTY                	Party City Corporation
TSE       	CSN.TO              	Cognos Inc
TSE       	HII.SV.A.TO         	Homburg Invest Inc SV
NASDAQ    	LBAI                	Lakeland Bancorp, Inc.
NYSE      	MJO                 	MS Structured Asset Corp Saturns GE Cap Corp Series 2002-14
NASDAQ    	NRVN                	Nature Vision, Inc.
NYSE      	RS                  	Reliance Steel & Aluminum Company
NASDAQ    	GIFI                	Gulf Island Fabrication, Inc.
NYSE      	BNJ                 	BlackRock New Jersey Municipal Income Trust
NYSE      	EWK                 	iShares MSCI Belgium
NASDAQ    	USPI                	United Surgical Partners International, Inc.
NYSE      	KCS                 	KCS Energy, Inc.
NASDAQ    	ISON                	Isonics Corporation
NYSE      	IYC                 	iShares Dow Jones US Consumer Services Index
AMEX      	GV                  	Goldfield Corporation (The)
INDEX     	FTSE                	FTSE 100
NASDAQ    	NUTR                	Nutraceutical International Corporation
AMEX      	SGB                 	Southwest Georgia Financial Corporation
NYSE      	TER                 	Teradyne, Inc.
AMEX      	BXB                 	Morgan Stanley Dean Witter & Co.
AMEX      	EPP                 	iShares MSCI Pacific Ex-Japan Index Fund
NASDAQ    	TRINC               	Trinsic, Inc.
NASDAQ    	TRFC                	TRAFFIC.COM INC.
NASDAQ    	AEOS                	American Eagle Outfitters, Inc.
TSE       	NVL.TO              	Novelis Inc
AMEX      	NQL                 	Citigroup Global Markets Holdings Inc
NYSE      	ADM                 	Archer-Daniels-Midland Company
AMEX      	DIO                 	Diomed Holdings, Inc
TSE       	CYT.TO              	Cryocath Technologies Inc
NASDAQ    	HOLX                	Hologic, Inc.
NYSE      	RMA                 	RMK Advantage Income Fund, Inc.
NYSE      	CHS                 	Chico's FAS, Inc.
NASDAQ    	ALCO                	Alico, Inc.
TSE       	GWO.PR.G.TO         	Great West Lifeco Inc Pfd G
NYSE      	PGH                 	Pengrowth Energy Trust
NYSE      	MBT                 	Mobile TeleSystems
NYSE      	CVT                 	TCW Convertible Securities Fund, Inc.
NYSE      	TRN                 	Trinity Industries, Inc.
NYSE      	HBP                 	Huttig Building Products, Inc.
NASDAQ    	ADTN                	ADTRAN, Inc.
NASDAQ    	VFGI                	Virginia Financial Group Inc
TSE       	TZT.TO              	Tranzeo Wireless Technologies
NASDAQ    	COOL                	Majesco Entertainment Company
TSE       	FFN.TO              	Financial 15 Split Cp II
TSE       	VGZ.TO              	Vista Gold Cp
NYSE      	HIX                 	Salomon Brothers High Income Fund II Inc.
NASDAQ    	NGRU                	netGuru inc
TSE       	BEN.TO              	Berens Energy Ltd
NYSE      	TZK                 	Trust Ctfs 2002 1 Bear Stearns Depositor Inc Acting as Deposit
NASDAQ    	BOFL                	Bancshares of Florida, Inc.
NYSE      	LPL                 	LG.PHILIPS
NYSE      	YPF                 	YPF Sociedad Anonima
NASDAQ    	MEDC                	Med-Design Corporation (The)
NASDAQ    	NBAN                	North Bay Bancorp
NYSE      	JZD                 	Lehman ABS Corporation
NYSE      	VHI                 	Valhi, Inc.
NYSE      	PYV                 	Merrill Lynch Depositor Inc
TSE       	KGI.TO              	Kirkland Lake Gold Inc
TSE       	SNP.U.TO            	SNP Split Cp Cl A Cap US$
NYSE      	NMT                 	Nuveen Massachusetts Premium Income Municipal Fund
NYSE      	WPF                 	Wells Fargo Cap IX
TSE       	VBI.TO              	Viventia Biotech Inc
NYSE      	CH                  	Chile Fund, Inc. (The)
NASDAQ    	TIMHY               	TIM Hellas Telecommunications S.A.
NYSE      	CNX                 	COOL Energy Inc.
NASDAQ    	GEAC                	Geac Computer Corporation Ltd
NASDAQ    	SCMFO               	Southern Community Financial Corporation
AMEX      	CIK                 	CREDIT SUISSE INCME
NASDAQ    	HDNG                	Hardinge, Inc.
NASDAQ    	TCHC                	21st Century Holding Company
NYSE      	BOX                 	BOC Group plc (The)
INDEX     	ZAX                 	ZACKS MICRO CAP INDEX
NYSE      	AIQ                 	Alliance Imaging, Inc.
NASDAQ    	CDNS                	CADENCE DESIGN SYS
NYSE      	CCJ                 	Cameco Corporation
AMEX      	DEV                 	8.5% SPARQS LINKED TO DEVON EN
NYSE      	STI                 	SUNTRUST CAP IV
NYSE      	IOO                 	iShares S&P Global 100 Index Fund
TSE       	YP.UN.TO            	YIELDPLUS Income Fund
NYSE      	MRK                 	Merck & Company, Inc.
TSE       	BFC.UN.TO           	BFI Canada Income Fund Unit
NASDAQ    	SCHL                	Scholastic Corporation
TSE       	MGS.UN.TO           	Sentry Select MBS Fund II
INDEX     	IWH                 	Wireless Holdrs Index
NYSE      	KEF                 	Korea Equity Fund, Inc.
NYSE      	GYC                 	Corporate Asset Backed Corp CABCO
AMEX      	IYT                 	iShares Dow Jones Transportation Average Index Fund
AMEX      	GLE                 	Glencairn Gold Corporation
NYSE      	PRX                 	Pharmaceutical Resources, Inc.
NYSE      	MYD                 	MuniYield Fund, Inc.
TSE       	PBG.TO              	Petrobank Energy & Resources
TSE       	PWF.TO              	Power Financial Cp
NYSE      	GEA                 	General Electric Capital Corporation
NYSE      	MPT                 	Municipal Partners Fund II, Inc.
NASDAQ    	ECIL                	ECI Telecom Ltd.
TSE       	FNA.UN.TO           	First National AlarmCap Income Fund
NYSE      	TDG                 	TRADIGM GROUP INCORPORATED
AMEX      	PHF                 	Pacholder High Yield Fund, Inc.
NYSE      	MCD                 	McDonald's Corporation
NYSE      	KMM                 	Scudder Multi-Market Income Trust
NASDAQ    	ENPT                	En Pointe Technologies, Inc.
NYSE      	CHB                 	Champion Enterprises, Inc.
AMEX      	TGM                 	TARGETS Trust
NASDAQ    	AMED                	Amedisys Inc
NASDAQ    	CROX                	CROCS INC.
NYSE      	WPS                 	WPS Resources Corporation
NYSE      	NMA                 	Nuveen Municipal Advantage Fund, Inc.
TSE       	ISO.TO              	Isotis SA
NASDAQ    	UFBS                	Union Financial Bancshares, Inc.
TSE       	ONR.TO              	Open Range Energy Corp
NASDAQ    	GSLA                	GS Financial Corp.
NASDAQ    	NETL                	NetLogic Microsystems, Inc.
AMEX      	TRE                 	Tan Range Exploration Corp
NASDAQ    	UTBI                	United Tennessee Bankshares, Inc.
NYSE      	XKK                 	Lehman ABS Corporation
INDEX     	KIX                 	Phlx Kbw Insurance Index
NYSE      	HRH                 	Hilb, Rogal and Hamilton Company
NYSE      	GTK                 	GTECH Holdings Corporation
NASDAQ    	AFOP                	Alliance Fiber Optic Products, Inc.
NYSE      	PKK                 	Merrill Lynch Depositor, Inc.
INDEX     	DWB                 	POWERSHARES DYNAMIC SMALL CAP G
NYSE      	SCH                 	Charles Schwab Corporation (The)
NYSE      	DE                  	Deere & Company
NASDAQ    	EMMS                	Emmis Communications Corporation
NYSE      	ABR                 	Arbor Realty Trust
INDEX     	GLI                 	Merrill Lynch Glbl Market Index
NYSE      	BF                  	Brown-Forman Corporation
NYSE      	FCS                 	Fairchild Semiconductor International, Inc.
NYSE      	FRB                 	Floating Rate Income
NYSE      	AMG                 	Affiliated Managers Group, Inc.
NYSE      	YSI                 	U-Store-It Trust
NYSE      	SE                  	7-Eleven, Inc.
AMEX      	EDA                 	ENDEAVOR ACQ CORP
NASDAQ    	MSFT                	Microsoft Corporation
NYSE      	XFP                 	Lehman ABS Corporation
NASDAQ    	WBKC                	WestBank Corporation
NASDAQ    	JHFT                	John Hancock Financial Trends Fund, Inc.
TSE       	SIT.UN.TO           	Sentry Select Blue Chip Inc Tr
TSE       	ER.TO               	Eastmain Resources Inc
NYSE      	CEA                 	China Eastern Airlines Corporation Ltd.
NYSE      	OMG                 	OM Group, Inc.
NASDAQ    	OPOF                	Old Point Financial Corporation
NYSE      	RTI                 	RTI International Metals, Inc.
NASDAQ    	MKTY                	Mechanical Technology Incorporated
TSE       	K.U.TO              	Kinross Gold Cp US$
NASDAQ    	OIIMD               	O2MICRO INTL LTD
AMEX      	VIS                 	Vanguard Industrials VIPERs
NASDAQ    	MIPS                	MIPS Technologies, Inc.
NYSE      	RAS                 	RAIT Investment Trust
NYSE      	PSD.P               	PUGET ENERGY INC PFD
NYSE      	MHS                 	MedcoHealth Solutions Inc
NASDAQ    	JMAR                	JMAR Technologies, Inc.
NYSE      	ADF                 	ACM Managed Dollar Income Fund, Inc.
NASDAQ    	FNFI                	First Niles Financial, Inc.
NYSE      	AVT                 	Avnet, Inc.
\.


--
-- TOC entry 1677 (class 2606 OID 41133)
-- Dependencies: 1352 1352 1352
-- Name: names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "names"
    ADD CONSTRAINT names_pkey PRIMARY KEY (stockexchange, ticker);


--
-- TOC entry 1680 (class 0 OID 0)
-- Dependencies: 1352
-- Name: names; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE "names" FROM PUBLIC;
REVOKE ALL ON TABLE "names" FROM postgres;
GRANT ALL ON TABLE "names" TO postgres;
GRANT ALL ON TABLE "names" TO qtrend;


-- Completed on 2006-06-08 07:31:22 Eastern Daylight Time

--
-- PostgreSQL database dump complete
--

CREATE FUNCTION GetPreviousClose(exchange VARCHAR, ticker VARCHAR, thisPeriodSeq int, delta int)
    RETURNS REAL
    AS $$
        SELECT COALESCE((SELECT CLOSE FROM STOCKQUOTES WHERE ticker=$2 and stockexchange=$1 and periodsequence=($3 - $4)), CAST(1.0 AS REAL));
    $$
    LANGUAGE SQL;
GRANT ALL ON FUNCTION GetPreviousClose(VARCHAR, VARCHAR, int, int) TO qtrend;

CREATE VIEW V_TICKERS
    AS
        SELECT T2.TICKER, NAME, T2.STOCKEXCHANGE, DATE, PERIODSEQUENCE, CLOSE, VOLUME, AVERAGEVOLUME, RSI, MACD, SIGNAL, CLOSEVAR1, CLOSEVAR3, CLOSEVAR7
        FROM
            (   SELECT T.TICKER, NAME, T.STOCKEXCHANGE, DATE, PERIODSEQUENCE, CLOSE, VOLUME, AVERAGEVOLUME, RSI, MACD, SIGNAL,
                        ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE1)/PREVIOUSCLOSE1) * 100 AS NUMERIC), 2) AS CLOSEVAR1,
                        ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE3)/PREVIOUSCLOSE3) * 100 AS NUMERIC), 2) AS CLOSEVAR3,
                        ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE7)/PREVIOUSCLOSE7) * 100 AS NUMERIC), 2) AS CLOSEVAR7
                FROM
                    (SELECT
                        T.TICKER, NAME, T.STOCKEXCHANGE, DATE, PERIODSEQUENCE, CLOSE, VOLUME, AVERAGEVOLUME, RSI, MACD, SIGNAL,
                        GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 1) AS PREVIOUSCLOSE1,
                        GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 3) AS PREVIOUSCLOSE3,
                        GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 7) AS PREVIOUSCLOSE7
                    FROM
                        STOCKQUOTES AS T
                            INNER JOIN LANGFORD
                                ON REFID=ID
                            INNER JOIN NAMES AS N
                                ON (T.TICKER = N.TICKER AND T.STOCKEXCHANGE=N.STOCKEXCHANGE)
                    ) AS T
            ) AS T2
        ORDER BY T2.TICKER, T2.PERIODSEQUENCE DESC;
GRANT ALL ON V_TICKERS TO qtrend;