enum HAPAttributeNumber
{
   HAP_VALUE = 0,
   HAP_RESERVED1 = 1,
   HAP_UNITROW = 2,
   HAP_UNITCOL = 3,
   HAP_RESERVED2 = 4,
   HAP_OPTIONLIST = 5,
   HAP_RECORDTYPE = 6,
   HAP_ENTERABLE = 7,
   HAP_UPPERLIMIT = 8,
   HAP_LOWERLIMIT = 9,
   HAP_VALUEDEFAULT = 10,
   HAP_USERENTERED = 11,
   HAP_COMPSTATUS = 12,
   HAP_BASIS = 13,
   HAP_INOUT = 14,
   HAP_PORTSEX = 15,
   HAP_MULTIPORT = 16,
   HAP_PORTTYPE = 17,
   HAP_OUTVAR = 18,
   HAP_PROMPT = 19,
   HAP_PRETENDNOTENTERED = 20,
   HAP_HELPFILENAME = 21,
   HAP_HELPID = 22,
   HAP_FIRSTPAIR = 23,
   HAP_NODENAME = 24,
   HAP_METHOD = 25,
   HAP_MARKED = 26,
   HAP_VOLATILE = 27,
   HAP_SECTION = 28,
   HAP_DEFNAME = 29,
   HAP_CANADD = 30,
   HAP_CANDELETE = 31,
   HAP_CANRENAME = 32,
   HAP_CANHIDE = 33,
   HAP_CANREVEAL = 34,
   HAP_CANCLEAR = 35,
   HAP_CANCOPY = 36,
   HAP_CANPASTE = 37,
   HAP_HASCHILDREN = 38,
   HAP_PLOTLABEL = 39,
   HAP_BIRDCAGE = 40,
   HAP_STREAMCLASS = 42,
   HAP_HASCOMMENTS = 43,
   HAP_CANHAVECOMMENTS = 44,
   HAP_UNDERLYINGPATH = 45,
   HAP_ISHIDDEN = 47,
   HAP_HIDEVIEW = 48,
   HAP_ANALYSISFLAG = 49,
   HAP_SPECSTREAM = 50,
   HAP_REORDER = 51,
   HAP_ISREALSYMBOL = 52,
   HAP_CANEXPORT = 58,
   HAP_BASETYPE = 59,
   HAP_HIERARCHYFLAG = 63,
   HAP_HIERPATH = 64,
   HAP_FULLNAME = 65,
   HAP_CANTEMPLAPPEND = 66,
   HAP_ACTIVATESTATE = 67,
   HAP_CANIMPORT = 68,
   HAP_HASEOMSG = 69,
   HAP_SHOWEOMSG = 70,
   HAP_EOEXPORT = 72,
   HAP_EOIMPORT = 73,
   HAP_NAVPATH = 74,
   HAP_HIERNAME = 76,
   HAP_REVEALLIST = 77,
   HAP_DEFRECONCILE = 78,
   HAP_EONODENAME = 79,
   HAP_UOM = 81,
   HAP_UOMSET = 82,
}

enum HAPCompStatusCode
{
   HAP_RESULTS_SUCCESS = 1,
   HAP_NORESULTS = 2,
   HAP_RESULTS_WARNINGS = 4,
   HAP_RESULTS_INACCESS = 8,
   HAP_RESULTS_INCOMPAT = 16,
   HAP_RESULTS_ERRORS = 32,
   HAP_INPUT_INCOMPLETE = 64,
   HAP_INPUT_COMPLETE = 128,
   HAP_INPUT_INACCESS = 256,
   HAP_INPUT_NEUTRAL = 512,
   HAP_UNRECONCILED = 1024,
   HAP_RECONCILED = 2048,
   HAP_DISABLED = 4096,
   HAP_ENABLED = 8192,
   HAP_EOSYNC = 16384,
   HAP_EOSYNC_WARNINGS = 32768,
   HAP_EOSYNC_ERRORS = 65536,
   HAP_EODISABLE = 2097152,
   HAP_EOFAIL = 262144,
   HAP_EOERROR = 524288,
   HAP_EOSYNC_UNSYNC = 1048576,
   HAP_NOT_RUN = 2097152,
}

enum HAPEXPType
{
   HAPEXP_USRDEF = 0,
   HAPEXP_BACKUP = 1,
   HAPEXP_REPORT = 2,
   HAPEXP_SUMMARY = 3,
   HAPEXP_INPUT = 4,
   HAPEXP_INPUT_GRAPHICS = 5,
   HAPEXP_RUNMSG = 6,
   HAPEXP_REPORT_INPUT = 7,
   HAPEXP_REPORT_SUMMARY = 8,
   HAPEXP_FLOWDYN = 9,
   HAPEXP_PDYN = 10,
   HAPEXP_DXF = 11,
   HAPEXP_SUMXML = 12,
   HAPEXP_HISTORY = 13,
   HAPEXP_PFS = 14,
   HAPEXP_PDF = 15,
   HAPEXP_EOATSLV = 16,
   HAPEXP_EOATACT = 17,
   HAPEXP_INPUT_WITH_GRAPHICS = 18,
   HAPEXP_APRBACKUP = 19,
   HAPEXP_APRPDF = 20,
   HAPEXP_APRREPORT = 21,
}

enum HAPP_ENABLE_CODE
{
   HAPP_ENABLE_DEACTIVATE = 0,
   HAPP_ENABLE_ACTIVATE = 1,
   HAPP_ENABLE_NOT_APPLICABLE = 2,
}

enum HAPP_RECONCILE_CODE
{
   HAPP_RECONCILE_INPUT = 1,
   HAPP_RECONCILE_ONLY = 2,
   HAPP_RECONCILE_TP = 4,
   HAPP_RECONCILE_TV = 8,
   HAPP_RECONCILE_PV = 16,
   HAPP_RECONCILE_CF = 32,
   HAPP_RECONCILE_TF = 64,
   HAPP_RECONCILE_MICFMOLE = 128,
   HAPP_RECONCILE_MICFMASS = 256,
   HAPP_RECONCILE_MICFSTDVOL = 512,
   HAPP_RECONCILE_MITFMOLE = 1024,
   HAPP_RECONCILE_MITFMASS = 2048,
   HAPP_RECONCILE_MITFSTDVOL = 4096,
   HAPP_RECONCILE_CICFMOLE = 16384,
   HAPP_RECONCILE_CICFMASS = 32768,
   HAPP_RECONCILE_CITFMOLE = 65536,
   HAPP_RECONCILE_CITFMASS = 131072,
   HAPP_RECONCILE_QUIET = 1048576,
   HAPP_RECONCILE_DONTASKWARN = 2097152,
   HAPP_RECONCILE_ONLYSTREAMS = 16777216,
   HAPP_RECONCILE_NOSTREAMS = 33554432,
   HAPP_RECONCILE_TEARSTREAMS = 67108864,
}

enum HAPReportType
{
   HAP_REPORT_INTERACTIVE = 0,
   HAP_REPORT_BLOCK = 1,
   HAP_REPORT_CONVERGENCE = 2,
   HAP_REPORT_COST = 3,
   HAP_REPORT_ECONOMIC = 4,
   HAP_REPORT_SENSITIVITY = 5,
   HAP_REPORT_TRANSFER = 6,
   HAP_REPORT_CALCULATOR = 7,
   HAP_REPORT_UTILITY = 8,
   HAP_REPORT_STREAMS = 9,
   HAP_REPORT_BALANCE = 10,
   HAP_REPORT_PRES_RELIEF = 11,
   HAP_REPORT_REGRESSION = 12,
   HAP_REPORT_REPORT = 13,
   HAP_REPORT_TOC = 14,
   HAP_REPORT_FLOWSHEET_BALANCE = 15,
   HAP_REPORT_PROP_TABLE = 16,
   HAP_REPORT_DESIGN_SPEC = 17,
   HAP_REPORT_CONNECTING_STREAMS = 18,
   HAP_REPORT_CONSTRAINT = 19,
   HAP_REPORT_OPTIMIZATION = 20,
}

enum HAPSpecialNodeType
{
   HAP_SPECIAL_ANALYSIS = 0,
   HAP_SPECIAL_PURE = 1,
   HAP_SPECIAL_UNIGROUP = 2,
   HAP_SPECIAL_PSD = 3,
   HAP_SPECIAL_SUBOBJECT = 4,
   HAP_SPECIAL_STREAM = 5,
}

enum HASELTYPE
{
   HASEL_UNDEFINED = -1,
   HASEL_CHNODE = 0,
   HASEL_SELECTION = 1,
   HASEL_LABEL = 2,
   HASEL_LABELNODE = 3,
   HASEL_VOLATILECHNODE = 4,
   HASEL_HEADERLABEL = 90,
   HASEL_LBTU_UNITS = 96,
   HASEL_LBTU_BASIS = 97,
   HASEL_LBTU_UNITS_BASIS = 98,
   HASEL_UNDERLYINGNODE = 99,
   HASEL_SELECT_INDIRECT = 100,
}

enum IAP_CONFLICT_OPTION
{
   IAP_CONF_UNKNOWN = -1,
   IAP_CONF_NOACTION = 0,
   IAP_CONF_REPLACE = 2,
   IAP_CONF_MERGE = 3,
   IAP_CONF_HIDE = 4,
}

enum IAP_ENGINEFILES
{
   IAP_PP1A = 0,
   IAP_PP1B = 1,
   IAP_PP2A = 2,
   IAP_PP2B = 3,
   IAP_PP2C = 4,
   IAP_INSERTLIB = 5,
   IAP_COST = 6,
   IAP_STREAMLIB = 7,
   IAP_RUNDEF = 8,
   IAP_LINKEROPT = 9,
}

enum IAP_MOVETO_TYPE
{
   IAP_MOVETO_BLOCK = 0,
   IAP_MOVETO_CONVERGENCE = 1,
   IAP_MOVETO_SENSITIVITY = 2,
   IAP_MOVETO_CALCULATOR = 3,
   IAP_MOVETO_TRANSFER = 4,
   IAP_MOVETO_EQUIPMENT = 5,
   IAP_MOVETO_ECONOMIC = 6,
   IAP_MOVETO_UTILITY = 7,
   IAP_MOVETO_PRESRELIEF = 8,
   IAP_MOVETO_REGRESSION = 9,
   IAP_MOVETO_BALANCE = 10,
   IAP_MOVETO_START = 11,
   IAP_MOVETO_MEASUREMENT = 20,
}

enum IAP_REINIT_TYPE
{
   IAP_REINIT_SIMULATION = 4,
   IAP_REINIT_BLOCK = 1,
   IAP_REINIT_CONVERGENCE = 2,
   IAP_REINIT_STREAM = 3,
}

enum IAP_RUN_OPTION
{
   IAP_RUN_EXPRESS = 0,
   IAP_RUN_INTERTACTIVE = 1,
   IAP_RUN_MUSTBECOMPLETE = 2,
   IAP_RUN_COPY_DRS_PCES = 3,
   IAP_RUN_COPY_DRS = 4,
   IAP_RUN_COPY_PCES = 5,
   IAP_RUN_COPY_RETRIEVED = 6,
}

enum IAP_STOPPOINT_TYPE
{
   IAP_STOPPOINT_BLOCK = 1,
   IAP_STOPPOINT_CONVERGENCE = 2,
   IAP_STOPPOINT_SENSITIVITY = 3,
   IAP_STOPPOINT_CALCULATOR = 4,
   IAP_STOPPOINT_TRANSFER = 5,
   IAP_STOPPOINT_EQUIPMENT = 6,
   IAP_STOPPOINT_ECONOMIC = 7,
   IAP_STOPPOINT_UTILITY = 8,
   IAP_STOPPOINT_PRESRELIEF = 9,
   IAP_STOPPOINT_REGRESSION = 10,
   IAP_STOPPOINT_BALANCE = 11,
}

enum SIM_CONTAINER_EVENT
{
   SIM_EVENT_OBJECT_SOLVING = 1000,
   SIM_EVENT_OBJECT_DELETED = 1001,
   SIM_EVENT_SHOWDATABROWSER = 1002,
   SIM_EVENT_UPDATE_BROWSER = 1003,
   SIM_EVENT_UPDATE_STATUS = 1004,
   SIM_EVENT_REFRESH = 1005,
   SIM_SET_SEQUENCE = 1006,
   SIM_EVENT_WAIT_CURSOR = 1007,
   SIM_EVENT_CONNECTING = 1008,
   SIM_EVENT_STOPPOINT = 1009,
   SIM_EVENT_REMOVE_STOPPOINT = 1010,
   SIM_EVENT_REMOVEALL_STOPPOINT = 1011,
   SIM_EVENT_CLOSE = 1012,
   SIM_EVENT_VISIBLE = 1013,
   SIM_EVENT_AUTOMATION_OPEN = 1014,
   SIM_EVENT_SAVED = 1015,
   SIM_EVENT_SHOW_ITEM = 1016,
   SIM_EVENT_QUIT = 1017,
   SIM_START_PSV_ACTION = 1018,
   SIM_EVENT_PSV_ERROR_STATUS = 1019,
   SIM_EVENT_TRACKITEM = 1020,
   SIM_EVENT_STREAM_PROPERTY_CHANGE = 1021,
}


struct __MIDL_IWinTypes_0009
{
   /* Fields */
   int hInproc;
   int hRemote;
}

struct FILETIME
{
   /* Fields */
   uint dwLowDateTime;
   uint dwHighDateTime;
}

struct LARGE_INTEGER
{
   /* Fields */
   long QuadPart;
}

struct PLOTTEXT
{
   /* Fields */
   Double x;
   Double y;
   string text;
   int color;
   string fontname;
   short alignment;
   short size;
   short style;
   short pad;
}

struct RemotableHandle
{
   /* Fields */
   int fContext;
   __MIDL_IWinTypes_0009 u;
}

struct RemSNB
{
   /* Fields */
   uint ulCntStr;
   uint ulCntChar;
   IntPtr rgString;
}

struct SAFEARRAY
{
   /* Fields */
   ushort cDims;
   ushort fFeatures;
   uint cbElements;
   uint cLocks;
   IntPtr pvData;
   IntPtr rgsabound;
}

struct SAFEARRAYBOUND
{
   /* Fields */
   uint cElements;
   int lLbound;
}

struct STATSTG
{
   /* Fields */
   string pwcsName;
   uint type;
   ULARGE_INTEGER cbSize;
   FILETIME mtime;
   FILETIME ctime;
   FILETIME atime;
   uint grfMode;
   uint grfLocksSupported;
   Guid clsid;
   uint grfStateBits;
   uint reserved;
}

struct ULARGE_INTEGER
{
   /* Fields */
   ulong QuadPart;
}



[Guid("623a7830-34f0-11d1-8a58-0000c0237df9")]
interface CHAdhocPlot
{
}

[Guid("623a7830-34f0-11d1-8a58-0000c0237df9")]
interface CHAdhocPlotAProp
{
}

[Guid("11677780-b72b-11d0-a943-0000c0a118db")]
interface CHPlotVal
{
}

[Guid("72f9fd70-9ed4-11d0-9475-0000c07972e4")]
interface CHReadOnlyCompositeNode
{
}

[Guid("72f9fd70-9ed4-11d0-9475-0000c07972e4")]
interface CHReadWriteCompositeNode
{
}

[Guid("8008c730-1a3e-11d1-8a4d-0000c0237df9")]
interface CHWizardPlot
{
}

[Guid("8008c730-1a3e-11d1-8a4d-0000c0237df9")]
interface CHWizardPlotAProp
{
}

[Guid("8e567521-f9ba-11cf-90b2-0000c0a810c4")]
interface HappAProp
{
}

[Guid("8e567521-f9ba-11cf-90b2-0000c0a810c4")]
interface HappAPropIP
{
}

[Guid("8e567521-f9ba-11cf-90b2-0000c0a810c4")]
interface HappIP
{
}

[Guid("8e567521-f9ba-11cf-90b2-0000c0a810c4")]
interface HappLS
{
}

[Guid("681c2530-74a1-4094-9939-73276031fcb4")]
interface IAPConflict
{
   /* Properties */
   string displayname { get; }
   string ID { get; set; }
   bool Merge { get; set; }
   IAP_CONFLICT_OPTION Action { get; set; }
}

[Guid("681c2531-74a1-4094-9939-73276031fcb4")]
interface IAPConflicts
{
   /* Methods */
   IAPConflict Item(object index);
   IEnumerator GetEnumerator();
   void Clear();
   /* Properties */
   int Count { get; }
}

[Guid("681c2532-74a1-4094-9939-73276031fcb4")]
interface IAPGroup
{
   /* Methods */
   void Clear();
   void Add(object Item);
   void Remove(object Item);
   object Item(object index);
   IEnumerator GetEnumerator();
   void Export([Optional] string filename);
   void CopyToClipboard();
   /* Properties */
   int Count { get; }
   object DataObject { get; }
}

[Guid("503fd632-f63e-11d1-8d3e-0000c033eaf2")]
interface IAPHappEvents
{
   /* Methods */
   void OnDialogSuppressed(string msg, string result);
   void OnControlPanelMessage(int Clear, string msg);
   void OnGUIClosing();
   void OnInClosing(int Clear, string msg);
   void OnDataChanged(object pObj);
   void OnUpdateMessage(int msg_code, string msg_hint, object msg_object, int source_handle);
   void OnEngineCommandCompleted();
   void OnBeforeCalculate(bool IsStep, Boolean& Cancel);
   void OnBeforeSave(string filename, Boolean& Cancel);
   void OnCalculationCompleted();
   void OnCalculationStopped();
   void OnGUIClosed();
   void OnDocumentClosing();
}

[Guid("681c2537-74a1-4094-9939-73276031fcb4")]
interface IAPPasteBuffer
{
   /* Methods */
   void Import([Optional] string filename);
   void Export([Optional] string filename);
   void Commit([Optional] object force, [Optional] object errorLog);
   /* Properties */
   IAPPasteItems Items { get; }
   IAPPasteParams Params { get; }
   IAPConflicts Conflicts { get; }
   object Context { set; }
}

[Guid("681c2533-74a1-4094-9939-73276031fcb4")]
interface IAPPasteItem
{
   /* Properties */
   string displayname { get; }
   string ID { get; set; }
   bool Deleted { get; set; }
   int PathLen { get; }
   string path(int index) { get; }
   bool HasChildren { get; }
   IAPPasteItems Items { get; }
}

[Guid("681c2534-74a1-4094-9939-73276031fcb4")]
interface IAPPasteItems
{
   /* Methods */
   IEnumerator GetEnumerator();
   /* Properties */
   IAPPasteItem Item(object index) { get; }
   int Count { get; }
}

[Guid("681c2535-74a1-4094-9939-73276031fcb4")]
interface IAPPasteParam
{
   /* Properties */
   string ID { get; }
   string Label { get; set; }
   string Value { get; set; }
}

[Guid("681c2536-74a1-4094-9939-73276031fcb4")]
interface IAPPasteParams
{
   /* Methods */
   IEnumerator GetEnumerator();
   /* Properties */
   IAPPasteParam Item(object index) { get; }
   int Count { get; }
}

[Guid("d6fecde0-ba92-11d1-9b3f-0000c07ee8f2")]
interface IAPPDF
{
   /* Methods */
   void GetAPPDF(string filename, int flags);
}

[Guid("0b61e982-00b4-4308-994e-66c15d8f5cac")]
interface IAPropData
{
   /* Methods */
   void GetAvailableDatabanks([Out] Int32& plNumDatabanks, [Out] Object& pvtDatabankArray);
   void GetDefaultDatabanks([Out] Int32& plNumDatabanks, [Out] Object& pvtDatabankArray);
   void SetQueryForComponents(object vtDatabanksArray, string bstrMatchNameAlias, int bMatchAlternate, int bMatchStringBeginOnly, string bstrCompClass, string bstrCASRN, Double dblMWfrom, Double dblMWto, Double dblBPfrom, Double dblBPto, string bstrBPUnit);
   void FetchNextComponent(int bInit, [Out] String& bstrAlias, [Out] String& bstrName, [Out] Double& dblBP, [Out] Double& dblMW, [Out] String& bstrDatabank, [Out] String& bstrCASRN, [Out] String& bstrCompClass, [Out] String& bstrSynonym);
}

[Guid("8ad467d8-0c32-11d2-9b42-0000c07ee8f2")]
interface IEnumAModelLibrary
{
   /* Methods */
   void Next(uint uCount, [Out] Object& ppModel, [Out] UInt32& pnumFetched);
   void Skip(uint uCount);
   void Reset();
   void Clone([Out] IEnumAModelLibrary& ppEnum);
}

[Guid("0000000d-0000-0000-c000-000000000046")]
interface IEnumSTATSTG
{
   /* Methods */
   void RemoteNext(uint celt, [Out] STATSTG& rgelt, [Out] UInt32& pceltFetched);
   void Skip(uint celt);
   void Reset();
   void Clone([Out] IEnumSTATSTG& ppEnum);
}

[Guid("623a7830-34f0-11d1-8a58-0000c0237df9")]
interface IHAdhocPlot
{
   /* Methods */
   void ReadyToPlot();
   void SetIndependentVariable();
   void SetDependentVariable();
   void SetParametricVariable();
   void Refresh();
   /* Properties */
   CHPlotVal PlotVal { get; }
}

[Guid("472c18a0-2603-11d1-9b33-0000c07ee8f2")]
interface IHAPEngine
{
   /* Methods */
   void Run();
   void Step();
   void Stop();
   void Reinit([Optional] object object_type, [Optional] object object_id);
   void MoveTo(IAP_MOVETO_TYPE object_type, [Optional] object object_id);
   void ConnectionDialog();
   bool Host(int host_type, [Optional] object node, [Optional] object username, [Optional] object password, [Optional] object working_directory);
   string HostDescription(int host_type);
   void RunSettings();
   void StopPoints();
   void GetStopPoint(int index, [Out] IAP_STOPPOINT_TYPE& type, [Out] String& object_id, [Out] Int32& before_or_after);
   void AddStopPoint(IAP_STOPPOINT_TYPE type, string object_id, int before_or_after);
   void DeleteStopPoint(int index);
   void ClearStopPoints();
   void Dummy(IAP_REINIT_TYPE rtype);
   void Run2([Optional] object async);
   void ProcessInput();
   void ExportReport(string filename, HAPReportType contents, [Optional] object object_id);
   void SynchronizeEO([Optional] object reserved);
   void ReinitializeEO([Optional] object reserved);
   /* Properties */
   bool RunControl { get; set; }
   bool ControlPanel { get; set; }
   bool Ready { get; }
   int HostCount { get; }
   string EngineFilesSettings(IAP_ENGINEFILES file) { get; set; }
   bool OptionSettings(IAP_RUN_OPTION type) { get; set; }
   int StopPointCount { get; }
   bool IsRunning { get; }
}

[Guid("adbb8c5b-2bc3-4320-80e9-1173394ed542")]
interface IHAPHandle
{
   /* Properties */
   int MainHWnd { get; }
   int ProcessHandle { get; }
}

[Guid("8e567525-f9ba-11cf-90b2-0000c0a810c4")]
interface IHAPLibRef
{
   /* Methods */
   string InsertLibrary(string path, short location);
   void RemoveLibrary(short location);
   void MoveLibrary(short fromloc, short toloc);
   void MoveCategory(short fromloc, short toloc);
   void Enum([Out] IEnumAModelLibrary& ppEnum);
   void SetLibraryActive(string displayname);
   /* Properties */
   short CountLibs { get; }
   string LibraryName(short index) { get; }
   string LibraryPath(short index) { get; }
   string CategoryName(short index) { get; }
   short CategorySelected(string Name) { get; set; }
   short CategoryLocSelected(short index) { get; set; }
}

[Guid("8e567521-f9ba-11cf-90b2-0000c0a810c4")]
interface IHapp
{
   /* Methods */
   void Restore(string filename);
   void InitNew([Optional] object filename, [Optional] object overwrite);
   void InitFromFile(String& filename, [Optional] object readonly);
   void InitFromArchive(String& filename);
   void Save();
   void SaveAs(String& filename, [Optional] object overwrite);
   void WriteArchive(String& filename);
   void Run();
   void Close([Optional] object reserved);
   IHSelection NewSelection(string Key);
   void DeleteSelection(string Key);
   void SaveSelection(string Key);
   void Reinit();
   void InitFromTemplate(String& filename);
   IHNode CreateRouteTree(String& propname, String& routeid, String& opsetid, short flag);
   void SetAsync();
   void SaveLink(IStream pStrm, int format);
   void LoadLink(IStream pStrm, int format);
   void RefreshExportedLinks();
   void Activate();
   void SetCompat(int flag);
   void Reconcile(int code);
   void AdviseParent(int dAdviseType, int lParam);
   void Generate(string filename, [Optional] int mode);
   void Readback(string filename, [Optional] int mode);
   void SetParent(IParentAdviseSink pParentAdviseSink, int dwCookie);
   void WriteArchive2(String& filename, int bSaveChildren);
   void InitNew2([Optional] object notused, [Optional] object notused2, [Optional] object host_type, [Optional] object node, [Optional] object username, [Optional] object password, [Optional] object working_directory, [Optional] object failmode);
   void InitFromFile2(String& filename, [Optional] object readonly, [Optional] object host_type, [Optional] object node, [Optional] object username, [Optional] object password, [Optional] object working_directory, [Optional] object failmode);
   void InitFromArchive2(String& filename, [Optional] object host_type, [Optional] object node, [Optional] object username, [Optional] object password, [Optional] object working_directory, [Optional] object failmode);
   void Run2([Optional] object async);
   void InitFromTemplate2(String& filename, [Optional] object host_type, [Optional] object node, [Optional] object username, [Optional] object password, [Optional] object working_directory, [Optional] object failmode);
   void Export(HAPEXPType reptype, string filename);
   void UIDisable(string Key);
   void InitFromXML(string argument);
   void InitFromArchive3(String& filename, object open_type, [Optional] object host_type, [Optional] object node, [Optional] object username, [Optional] object password, [Optional] object working_directory, [Optional] object failmode);
   void Import(string filename);
   void EditCompoundDocument(string filename);
   void RunScript(string filename);
   void AutoSave();
   void Save2();
   void SaveAs2(String& filename, [Optional] object overwrite);
   void Quit([Optional] object reserved);
   void CloseDocument([Optional] object Save);
   /* Properties */
   IHapp Application { get; }
   IHapp Parent { get; }
   string FullName { get; }
   string Name { get; }
   bool Visible { get; set; }
   IHapp New([Optional] object filename) { get; }
   IHNode Tree { get; }
   IHNode Choose([Out,In] Int16& flag) { get; }
   IHSelection Selection(string Key) { get; }
   IHapp NewAsync([Optional] object filename) { get; }
   IHAPEngine Engine { get; }
   IHapp New2([Optional] object filename, [Optional] int bSync) { get; }
   IHapp New3([Optional] object filename, [Optional] object host_type, [Optional] object node, [Optional] object username, [Optional] object password, [Optional] object working_directory, [Optional] object failmode) { get; }
   object Restore2(string filename) { get; }
   IHAPLibRef LibRef { get; }
   int SuppressDialogs { get; set; }
   object EngineSimulation { get; }
   object EngineServer { get; }
   int ProcessId { get; }
   object RootModel(string path) { get; }
   int StrongReferences { get; }
   bool RefreshOff { get; set; }
   string FailedToOpenKey { get; }
   string FailedToOpenDescription { get; }
}

[Guid("35f04526-f10a-4d0d-9c6d-193e8ccd3a5f")]
interface IHappConnectInfo
{
   /* Properties */
   string Version { get; }
   string filename { get; }
   string RunID { get; }
   string ClientDirectory { get; }
   bool IsRemote { get; }
   string username { get; }
   string Server { get; }
   string ServerDirectory { get; }
}

[Guid("f98a1533-d1c7-4222-903c-87e3d47589aa")]
interface IHappServiceProvider
{
   /* Methods */
   object GetService(string bService);
}

[Guid("72f9fd70-9ed4-11d0-9475-0000c07972e4")]
interface IHComposite
{
   /* Methods */
   void AddChild(string Name, IHNode child);
   void RemoveChild(string Name);
   IHNode GetChild(int index);
   string GetChildName(int index);
   void DumpToDataBase(string filename, string tablename, int create);
   /* Properties */
   int ChildCount { get; }
}

[Guid("8e567522-f9ba-11cf-90b2-0000c0a810c4")]
interface IHNode
{
   /* Methods */
   void SetValueAndUnit(object Value, short unitcol, [Optional] object force);
   void SetValueUnitAndBasis(object Value, short unitcol, string basis, [Optional] object force);
   void Delete();
   void RemoveAll();
   void AddClassAttribute(string classid, short type);
   void DeleteClassAttribute(string classid);
   void Copy();
   void CopyWithFormat();
   void PrintUseful(short append, string filename);
   IHNode FindNode(string path);
   bool Paste();
   bool PasteSpecial();
   bool IsLinked();
   void RemoveLink();
   string NextIncomplete([Out,Optional] Object& code);
   string BrowseNext(short direction, short io);
   void Dummy(HAPAttributeNumber __MIDL__IHNode0000, HAPCompStatusCode __MIDL__IHNode0001);
   void Hide(string Name);
   void Reveal([Optional] string Name);
   void Clear();
   void NotifyRunStep();
   void HoldNotifies(bool hold);
   bool IsValid();
   void NewChild([Out,In] String& Name);
   void RenameChild([Out,In] String& Name);
   bool IsSpecialType(HAPSpecialNodeType type);
   void Reaquire();
   void PFSSelectModel();
   void PFSClearSelection();
   void Reconcile(int code);
   void NewID([Out,In] String& Name);
   void Export([Optional] string filename);
   short DoObjectVerb(int oleverb);
   void AppendTemplate(object pUnkTempl, [Optional] object flag);
   void Import([Optional] string filename);
   /* Properties */
   IHapp Application { get; }
   IHapp Parent { get; }
   string Name([Optional] object force) { get; set; }
   int Dimension { get; }
   short ValueType { get; }
   object Value([Optional] object force) { get; set; }
   bool HasAttribute(short attrnumber) { get; }
   short AttributeType(short attrnumber) { get; }
   object AttributeValue(short attrnumber, [Optional] object force) { get; set; }
   bool HasClassAttribute(string classid) { get; }
   short ClassAttributeType(string classid) { get; }
   object ClassAttributeValue(string classid, [Optional] object force) { get; set; }
   IHNodeCol Elements { get; }
   int Process { get; }
   string UnitString { get; }
   object ValueForUnit(short unitrow, short unitcol) { get; }
   bool RefreshOff { set; }
}

[Guid("f66c0817-da74-4d72-a4ad-60fb6895701f")]
interface IHNode2
{
   /* Methods */
   void SetValueAndUnit(object Value, short unitcol, [Optional] object force);
   void SetValueUnitAndBasis(object Value, short unitcol, string basis, [Optional] object force);
   void Delete();
   void RemoveAll();
   void AddClassAttribute(string classid, short type);
   void DeleteClassAttribute(string classid);
   void Copy();
   void CopyWithFormat();
   void PrintUseful(short append, string filename);
   IHNode FindNode(string path);
   bool Paste();
   bool PasteSpecial();
   bool IsLinked();
   void RemoveLink();
   string NextIncomplete([Out,Optional] Object& code);
   string BrowseNext(short direction, short io);
   void Dummy(HAPAttributeNumber __MIDL__IHNode0000, HAPCompStatusCode __MIDL__IHNode0001);
   void Hide(string Name);
   void Reveal([Optional] string Name);
   void Clear();
   void NotifyRunStep();
   void HoldNotifies(bool hold);
   bool IsValid();
   void NewChild([Out,In] String& Name);
   void RenameChild([Out,In] String& Name);
   bool IsSpecialType(HAPSpecialNodeType type);
   void Reaquire();
   void PFSSelectModel();
   void PFSClearSelection();
   void Reconcile(int code);
   void NewID([Out,In] String& Name);
   void Export([Optional] string filename);
   short DoObjectVerb(int oleverb);
   void AppendTemplate(object pUnkTempl, [Optional] object flag);
   void Import([Optional] string filename);
   void Clear2(int code);
   /* Properties */
   IHapp Application { get; }
   IHapp Parent { get; }
   string Name([Optional] object force) { get; set; }
   int Dimension { get; }
   short ValueType { get; }
   object Value([Optional] object force) { get; set; }
   bool HasAttribute(short attrnumber) { get; }
   short AttributeType(short attrnumber) { get; }
   object AttributeValue(short attrnumber, [Optional] object force) { get; set; }
   bool HasClassAttribute(string classid) { get; }
   short ClassAttributeType(string classid) { get; }
   object ClassAttributeValue(string classid, [Optional] object force) { get; set; }
   IHNodeCol Elements { get; }
   int Process { get; }
   string UnitString { get; }
   object ValueForUnit(short unitrow, short unitcol) { get; }
   bool RefreshOff { set; }
}

[Guid("89e81f60-019a-11d0-9be7-0000c05375d5")]
interface IHNodeCol
{
   /* Methods */
   IEnumerator GetEnumerator();
   IHNode Add([Optional] object loc_or_name, [Optional] object loc_or_name2, [Optional] object loc_or_name3, [Optional] object loc_or_name4, [Optional] object loc_or_name5);
   void Insert(IHNode element, [Optional] object loc_or_name, [Optional] object loc_or_name2, [Optional] object loc_or_name3, [Optional] object loc_or_name4, [Optional] object loc_or_name5);
   IHNode Remove(object loc_or_name, [Optional] object loc_or_name2, [Optional] object loc_or_name3, [Optional] object loc_or_name4, [Optional] object loc_or_name5);
   void InsertRow(int Dimension, int location);
   void RemoveRow(int Dimension, int location);
   void Reorder(object loc_or_name, short dir);
   /* Properties */
   IHapp Application { get; }
   IHapp Parent { get; }
   int Count { get; }
   int RowCount(int Dimension) { get; }
   int Dimension { get; }
   bool IsNamedDimension([Optional] object Dimension) { get; }
   IHNode Item(object loc_or_name, [Optional] object loc_or_name2, [Optional] object loc_or_name3, [Optional] object loc_or_name4, [Optional] object loc_or_name5) { get; }
   string ItemName(int location, [Optional] object Dimension, [Optional] object force) { get; set; }
   string Label(int Dimension, int location, [Optional] object force) { get; set; }
   IHNode LabelNode(int Dimension, int location, [Out,Optional] Object& Label) { get; }
   int LabelLocation(string Label, int Dimension) { get; }
   object LabelAttribute(int Dimension, int location, short attrnum, [Optional] object force) { get; set; }
   short LabelAttributeType(int Dimension, int location, short attrnum) { get; }
   string DimensionName(int Dimension) { get; }
}

[Guid("d5dff720-922a-40bd-8a2c-229913792d9c")]
interface IHNodeSelection
{
   /* Methods */
   IHSelection Select(string nodePath);
   object SelectNodes(string nodePath);
   object SelectValues(string nodePath);
   object SelectAttributes(string nodePath, object attributes);
   object SelectLabelAttributes(string nodePath, int Dimension, object attributes);
   object SelectSingleNodeAttributes(string nodePath, object attributes);
   object SelectAttributesOnNodes(object nodePathArray, object attributes);
}

[Guid("11677780-b72b-11d0-a943-0000c0a118db")]
interface IHPlotVal
{
   /* Methods */
   void GetXData(int index, int datano, [Out] Int16& attr, [Out] Object& Value);
   void GetYData(int index, int datano, [Out] Int16& attr, [Out] Object& Value);
   void Clear();
   void AddAnnotationText(PLOTTEXT& text);
   void RemoveAnnotationText();
   /* Properties */
   IHNode Context { get; set; }
   string Title { get; set; }
   string TitleInt { get; }
   string XAxisTitle { get; set; }
   string XAxisTitleInt { get; }
   string YAxisTitle([Optional] object nAxis) { get; set; }
   string YAxisTitleInt([Optional] object nAxis) { get; }
   string Label(int index) { get; set; }
   string LabelInt(int index) { get; }
   int NPoints { get; set; }
   int NVariables { get; set; }
   int NXVariables { get; set; }
   Double XDataValue(int index, int datano) { get; }
   object XData(int index, int datano, short attr) { set; }
   Double YDataValue(int index, int datano) { get; }
   object YData(int index, int datano, short attr) { set; }
   bool SwapAxises { get; set; }
   bool ReverseXAxis { get; set; }
   bool AddTimeStamp { get; set; }
   bool ShowLegend { get; set; }
   int PlotType { get; set; }
   bool Parametric { get; set; }
   string ZAxisTitle { get; set; }
   string ZAxisTitleInt { get; }
   bool Live { get; set; }
   int AnnotationCount { get; }
   PLOTTEXT AnnotationText(int index) { get; }
   short GridType { get; set; }
   short MarkerSize { get; set; }
   bool ShowDiagonalLine { get; set; }
   short LineStyle { get; set; }
   bool XDataInteger(int index) { get; }
   bool ShowZeroLine { get; set; }
   int AxisMap(int index) { get; set; }
   int CurveStyle(int index) { get; set; }
   bool SquarePlot { get; set; }
   bool CanLive { get; set; }
   int AxisScale(int VarNo) { get; set; }
}

[Guid("ee89ddb7-133d-4657-a64a-4a36e3564c89")]
interface IHPlotVal2
{
   /* Methods */
   void GetXData(int index, int datano, [Out] Int16& attr, [Out] Object& Value);
   void GetYData(int index, int datano, [Out] Int16& attr, [Out] Object& Value);
   void Clear();
   void AddAnnotationText(PLOTTEXT& text);
   void RemoveAnnotationText();
   short GetVarLineInfo([Out] Int16& iColor, [Out] Int16& iLineType, [Out] Int16& iMarker, [Out] Int16& iSize);
   /* Properties */
   IHNode Context { get; set; }
   string Title { get; set; }
   string TitleInt { get; }
   string XAxisTitle { get; set; }
   string XAxisTitleInt { get; }
   string YAxisTitle([Optional] object nAxis) { get; set; }
   string YAxisTitleInt([Optional] object nAxis) { get; }
   string Label(int index) { get; set; }
   string LabelInt(int index) { get; }
   int NPoints { get; set; }
   int NVariables { get; set; }
   int NXVariables { get; set; }
   Double XDataValue(int index, int datano) { get; }
   object XData(int index, int datano, short attr) { set; }
   Double YDataValue(int index, int datano) { get; }
   object YData(int index, int datano, short attr) { set; }
   bool SwapAxises { get; set; }
   bool ReverseXAxis { get; set; }
   bool AddTimeStamp { get; set; }
   bool ShowLegend { get; set; }
   int PlotType { get; set; }
   bool Parametric { get; set; }
   string ZAxisTitle { get; set; }
   string ZAxisTitleInt { get; }
   bool Live { get; set; }
   int AnnotationCount { get; }
   PLOTTEXT AnnotationText(int index) { get; }
   short GridType { get; set; }
   short MarkerSize { get; set; }
   bool ShowDiagonalLine { get; set; }
   short LineStyle { get; set; }
   bool XDataInteger(int index) { get; }
   bool ShowZeroLine { get; set; }
   int AxisMap(int index) { get; set; }
   int CurveStyle(int index) { get; set; }
   bool SquarePlot { get; set; }
   bool CanLive { get; set; }
   int AxisScale(int VarNo) { get; set; }
   short VarLineInfo(short iColor, short iLineType, short iMarker, short iSize) { set; }
   short LineColor(short index) { get; set; }
   short LineType(short index) { get; set; }
   short MarkerType(short index) { get; set; }
   short MarkerSize_2(short index) { get; set; }
}

[Guid("71f9fd70-9ed4-11d0-9475-0000c07972e4")]
interface IHSelection
{
   /* Methods */
   void Add(object loc_or_name, short type, object Item, object owner, [Optional] object scrollarea, [Optional] object row, [Optional] object col, [Optional] object index, [Optional] object xtwip, [Optional] object ytwip);
   void Clear();
   void Remove(object loc_or_name);
   bool Find(object object);
   void Copy();
   void CopyWithFormat();
   bool Paste();
   bool PasteSpecial([Optional] object format, [Optional] object link);
   void Lock(bool fLock);
   void ClearOwned(object owner);
   bool CanPrint();
   object PreparePrinting();
   /* Properties */
   IHapp Application { get; }
   IHapp Parent { get; }
   int Count { get; }
   object Item(object loc_or_name) { get; }
   short ItemType(object loc_or_name) { get; }
   string Key { get; }
   string Label(int location) { get; set; }
}

[Guid("3e9d8e11-dbf3-4a5e-8922-5d9a7a4a6ebd")]
interface IHSelectionCallback
{
   /* Methods */
   void LoadSelection(IHSelection arg1);
   /* Properties */
   int Count { get; }
   int EditsAllowed { get; }
}

[Guid("10c28ccd-993c-43ae-832d-a71490bd97b5")]
interface IHSimContainer
{
   /* Methods */
   void SerializeAllViews(IStorage pStg, int bLoad);
   void ShowSimView(int bShow);
   void OnMessage(uint msg, uint wparam, int lParam, [Out] Int32& result);
   void SetEventDelegate(object pEventDelegate);
   void DocumentClosed();
}

[Guid("35dd0090-488a-11d0-a90e-0000c0a118db")]
interface IHWinApp
{
   /* Methods */
   void GetVisible(Int32& pbVisible);
   void SetVisible(int bVisible);
   void GetDefaultDir(IntPtr pDefDir);
   void FrameworkInitNew(int bAutomation);
   void FrameworkOpenFile(SByte& fn, int bAutomation);
   void FrameworkRestoreFile(SByte& fn, int bAutomation, int openType);
   void FrameworkSaveFile(SByte& fn);
   void AutoSave();
   void FrameworkClose();
   void DeleteCompoundFileDirectory();
   void FrameworkRefreshForms(int lFlags, SByte& szcHint);
   void GetActiveDocStorage(IntPtr& pStg);
   void GetFrameworkUsingApt(Int32& pbUsingApt);
   void SetFrameworkUsingApt(int bUsingApt);
   void GetSimpanelVisible(Int32& retval);
   void SetSimpanelVisible(int bShow);
   void GetRunControlVisible(Int32& retval);
   void SetRunControlVisible(int bShow);
   void GetPlotList(IntPtr plots);
   void DriveNewDialog(IntPtr pHnode, String& Name);
   void DriveRenameDialog(IntPtr pHnode, String& Name);
   void DriveReorderDialog(IntPtr pHnode);
   void DriveNewIDDialog(IntPtr pHnode, String& Name);
   void Activate();
   void FrameworkHappNotify(ushort cNotifyFlag, IntPtr pObject);
   void GetEmbedding(SByte& Name, Object& ppobj);
   void FrameworkLinkSourceDataChange(int bAdd, IntPtr pLinkSource);
   void FrameworkLinkContainerDataChange(IntPtr pLinkContainer);
   void PFSSelectModel(object pUnk);
   void PFSClearSelection();
   void FrameworkDoObjectVerb(int oleverb, object pObj);
   void ExportDocument(SByte& szcFilename, int nFiletype);
   void ImportDocument(SByte& szcFilename);
   void DisableMenuItem(SByte& szcItem);
   void get_MainHWnd(IntPtr lphWnd);
   void get_ProcessHandle(IntPtr& lphproc);
   void get_RealCLSID_Happ(Guid& clsid);
   void DoEvents();
   void UpdateIdleStatus();
   void EditCompoundDocument(string fn);
   void FrameworkExit();
}

[Guid("8008c730-1a3e-11d1-8a4d-0000c0237df9")]
interface IHWizardPlot
{
   /* Methods */
   void SetIndependentVariable(IHNode pContext, string indepvar);
   void AddDependentVariable(IHNode pContext, string depvar);
   void RemoveDependentVariable(IHNode pContext, string depvar);
   void RemoveAllDependentVariable();
   void AddVariablePair(IHNode pContext, string indepvar, string depvar, short sort);
   void Clear();
   void GetIndependentVariable([Out] String& indepvar);
   void GetDependentVariable([Out,In] String[]& depvar);
   void GetPlotList([Out,In] CHPlotVal[]& plots);
   /* Properties */
   CHPlotVal PlotVal { get; }
   int basis { get; set; }
   int unitrow([Optional] object curve) { get; set; }
   int unitcol([Optional] object curve) { get; set; }
   bool HasDependentVariable(IHNode pContext, string depvar) { get; }
   object WizardData(int Step) { get; set; }
   int ErrorNumber { get; }
   bool ErrorStatus(int index) { set; }
   string RefreshCallBack { get; set; }
   CHPlotVal AddToPlot { get; set; }
   int XUnitRow { get; }
   int XUnitCol { get; set; }
}

[Guid("5da88fb5-5b29-4eae-acdf-e45de2319d99")]
interface IHWizardPlot2
{
   /* Methods */
   void SetIndependentVariable(IHNode pContext, string indepvar);
   void AddDependentVariable(IHNode pContext, string depvar);
   void RemoveDependentVariable(IHNode pContext, string depvar);
   void RemoveAllDependentVariable();
   void AddVariablePair(IHNode pContext, string indepvar, string depvar, short sort);
   void Clear();
   void GetIndependentVariable([Out] String& indepvar);
   void GetDependentVariable([Out,In] String[]& depvar);
   void GetPlotList([Out,In] CHPlotVal[]& plots);
   void SetMultIndependentVariables(IHNode pContext, string indepvar);
   void RemoveIndependentVariable(IHNode pContext, string indepvar, int index);
   void RemoveAllIndependentVariable();
   /* Properties */
   CHPlotVal PlotVal { get; }
   int basis { get; set; }
   int unitrow([Optional] object curve) { get; set; }
   int unitcol([Optional] object curve) { get; set; }
   bool HasDependentVariable(IHNode pContext, string depvar) { get; }
   object WizardData(int Step) { get; set; }
   int ErrorNumber { get; }
   bool ErrorStatus(int index) { set; }
   string RefreshCallBack { get; set; }
   CHPlotVal AddToPlot { get; set; }
   int XUnitRow { get; }
   int XUnitCol { get; set; }
}

[Guid("f9688b90-65a9-11d1-8a9d-0000c0237df9")]
interface IMMControlVerb
{
   /* Methods */
   void EnumVerbs([Out,In] Object& pEnumOleVerb);
   void DoVerb(int iVerb);
}

[Guid("503fd631-f63e-11d1-8d3e-0000c033eaf2")]
interface IParentAdviseSink
{
   /* Methods */
   void OnDataChange(int dwCookie, int nSeverity);
}

[Guid("0000010c-0000-0000-c000-000000000046")]
interface IPersist
{
   /* Methods */
   void GetClassID([Out] Guid& pClassID);
}

[Guid("00000109-0000-0000-c000-000000000046")]
interface IPersistStream
{
   /* Methods */
   void GetClassID([Out] Guid& pClassID);
   void IsDirty();
   void Load(IStream pstm);
   void Save(IStream pstm, int fClearDirty);
   void GetSizeMax([Out] ULARGE_INTEGER& pcbSize);
}

[Guid("657e4330-ed8d-11d0-a991-0000c0237df9")]
interface IScrollAreaInfo
{
   /* Methods */
   void GetMaximum([Out,In] Int32& pRow, [Out,In] Int16& pRowExt, [Out,In] Int32& pCol, [Out,In] Int16& pColExt);
   /* Properties */
   IHNode NodeAt(int row, int col, short index) { get; }
}

[Guid("0c733a30-2a1c-11ce-ade5-00aa0044773d")]
interface ISequentialStream
{
   /* Methods */
   void RemoteRead([Out] Byte& pv, uint cb, [Out] UInt32& pcbRead);
   void RemoteWrite(Byte& pv, uint cb, [Out] UInt32& pcbWritten);
}

[Guid("0000000b-0000-0000-c000-000000000046")]
interface IStorage
{
   /* Methods */
   void CreateStream(string pwcsName, uint grfMode, uint reserved1, uint reserved2, [Out] IStream& ppstm);
   void RemoteOpenStream(string pwcsName, uint cbReserved1, Byte& reserved1, uint grfMode, uint reserved2, [Out] IStream& ppstm);
   void CreateStorage(string pwcsName, uint grfMode, uint reserved1, uint reserved2, [Out] IStorage& ppstg);
   void OpenStorage(string pwcsName, IStorage pstgPriority, uint grfMode, RemSNB& snbExclude, uint reserved, [Out] IStorage& ppstg);
   void RemoteCopyTo(uint ciidExclude, Guid& rgiidExclude, RemSNB& snbExclude, IStorage pstgDest);
   void MoveElementTo(string pwcsName, IStorage pstgDest, string pwcsNewName, uint grfFlags);
   void Commit(uint grfCommitFlags);
   void Revert();
   void RemoteEnumElements(uint reserved1, uint cbReserved2, Byte& reserved2, uint reserved3, [Out] IEnumSTATSTG& ppEnum);
   void DestroyElement(string pwcsName);
   void RenameElement(string pwcsOldName, string pwcsNewName);
   void SetElementTimes(string pwcsName, FILETIME& pctime, FILETIME& patime, FILETIME& pmtime);
   void SetClass(Guid& clsid);
   void SetStateBits(uint grfStateBits, uint grfMask);
   void Stat([Out] STATSTG& pstatstg, uint grfStatFlag);
}

[Guid("0000000c-0000-0000-c000-000000000046")]
interface IStream
{
   /* Methods */
   void RemoteRead([Out] Byte& pv, uint cb, [Out] UInt32& pcbRead);
   void RemoteWrite(Byte& pv, uint cb, [Out] UInt32& pcbWritten);
   void RemoteSeek(LARGE_INTEGER dlibMove, uint dwOrigin, [Out] ULARGE_INTEGER& plibNewPosition);
   void SetSize(ULARGE_INTEGER libNewSize);
   void RemoteCopyTo(IStream pstm, ULARGE_INTEGER cb, [Out] ULARGE_INTEGER& pcbRead, [Out] ULARGE_INTEGER& pcbWritten);
   void Commit(uint grfCommitFlags);
   void Revert();
   void LockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, uint dwLockType);
   void UnlockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, uint dwLockType);
   void Stat([Out] STATSTG& pstatstg, uint grfStatFlag);
   void Clone([Out] IStream& ppstm);
}


