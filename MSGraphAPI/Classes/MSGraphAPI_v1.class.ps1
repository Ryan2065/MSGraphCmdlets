$Script:MSGraphAPIClassHash = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
$Script:MSGraphAPICreateArray = New-Object -TypeName System.Collections.ArrayList
$Script:MSGraphAPIDeleteArray = New-Object -TypeName System.Collections.ArrayList
$Script:MSGraphAPIUpdateArray = New-Object -TypeName System.Collections.ArrayList

Function Start-MSGraphAPIAction {
    Param (
        [string]$BaseURI,
        [string]$Action,
        [Hashtable]$ParamHash
    )
    $InvokeHash = @{
        'query' = "$($BaseURI)/$($Action)"
        'method' = 'Post'
    }
    if($null -ne $ParamHash) {
        $InvokeHash.Add('ContentType', 'application/json')
        $InvokeHash.Add('body', ($ParamHash | ConvertTo-JSON -Depth 10) )
    }
    Invoke-MSGraphMethod @InvokeHash
}

Function Start-MSGraphAPIFunction {
    Param (
        [string]$BaseURI,
        [string]$Function,
        [Hashtable]$ParamHash
    )
    $InvokeHash = @{
        'query' = "$($BaseURI)/$($Function)"
        'method' = 'Get'
    }
    if($null -ne $ParamHash) {
        $InvokeHash.Add('ContentType', 'application/json')
        $InvokeHash.Add('body', ($ParamHash | ConvertTo-JSON -Depth 10) )
    }
    Invoke-MSGraphMethod @InvokeHash
}

Class MSGraphAPI_Base {
    [hashtable] $AdditionalProperties
    hidden [string] $GraphPath
}


Enum MSGraphAPI_v1_automaticRepliesStatus {
    disabled = 0
    alwaysEnabled = 1
    scheduled = 2
}


Enum MSGraphAPI_v1_externalAudienceScope {
    none = 0
    contactsOnly = 1
    all = 2
}


Enum MSGraphAPI_v1_attendeeType {
    required = 0
    optional = 1
    resource = 2
}


Enum MSGraphAPI_v1_freeBusyStatus {
    free = 0
    tentative = 1
    busy = 2
    oof = 3
    workingElsewhere = 4
    unknown = -1
}


Enum MSGraphAPI_v1_activityDomain {
    unknown = 0
    work = 1
    personal = 2
    unrestricted = 3
}


Enum MSGraphAPI_v1_bodyType {
    text = 0
    html = 1
}


Enum MSGraphAPI_v1_importance {
    low = 0
    normal = 1
    high = 2
}


Enum MSGraphAPI_v1_inferenceClassificationType {
    focused = 0
    other = 1
}


Enum MSGraphAPI_v1_calendarColor {
    lightBlue = 0
    lightGreen = 1
    lightOrange = 2
    lightGray = 3
    lightYellow = 4
    lightTeal = 5
    lightPink = 6
    lightBrown = 7
    lightRed = 8
    maxColor = 9
    auto = -1
}


Enum MSGraphAPI_v1_responseType {
    none = 0
    organizer = 1
    tentativelyAccepted = 2
    accepted = 3
    declined = 4
    notResponded = 5
}


Enum MSGraphAPI_v1_sensitivity {
    normal = 0
    personal = 1
    private = 2
    confidential = 3
}


Enum MSGraphAPI_v1_recurrencePatternType {
    daily = 0
    weekly = 1
    absoluteMonthly = 2
    relativeMonthly = 3
    absoluteYearly = 4
    relativeYearly = 5
}


Enum MSGraphAPI_v1_dayOfWeek {
    sunday = 0
    monday = 1
    tuesday = 2
    wednesday = 3
    thursday = 4
    friday = 5
    saturday = 6
}


Enum MSGraphAPI_v1_weekIndex {
    first = 0
    second = 1
    third = 2
    fourth = 3
    last = 4
}


Enum MSGraphAPI_v1_recurrenceRangeType {
    endDate = 0
    noEnd = 1
    numbered = 2
}


Enum MSGraphAPI_v1_eventType {
    singleInstance = 0
    occurrence = 1
    exception = 2
    seriesMaster = 3
}


Enum MSGraphAPI_v1_meetingMessageType {
    none = 0
    meetingRequest = 1
    meetingCancelled = 2
    meetingAccepted = 3
    meetingTenativelyAccepted = 4
    meetingDeclined = 5
}


Enum MSGraphAPI_v1_phoneType {
    home = 0
    business = 1
    mobile = 2
    other = 3
    assistant = 4
    homeFax = 5
    businessFax = 6
    otherFax = 7
    pager = 8
    radio = 9
}


Enum MSGraphAPI_v1_websiteType {
    other = 0
    home = 1
    work = 2
    blog = 3
    profile = 4
}


Enum MSGraphAPI_v1_plannerPreviewType {
    automatic = 0
    noPreview = 1
    checklist = 2
    description = 3
    reference = 4
}


Enum MSGraphAPI_v1_operationStatus {
    NotStarted = 0
    Running = 1
    Completed = 2
    Failed = 3
}


Enum MSGraphAPI_v1_onenotePatchInsertPosition {
    After = 0
    Before = 1
}


Enum MSGraphAPI_v1_onenotePatchActionType {
    Replace = 0
    Append = 1
    Delete = 2
    Insert = 3
    Prepend = 4
}


Enum MSGraphAPI_v1_onenoteSourceService {
    Unknown = 0
    OneDrive = 1
    OneDriveForBusiness = 2
    OnPremOneDriveForBusiness = 3
}


Enum MSGraphAPI_v1_onenoteUserRole {
    Owner = 0
    Contributor = 1
    Reader = 2
    None = -1
}


Enum MSGraphAPI_v1_educationUserRole {
    student = 0
    teacher = 1
    none = 2
    unknownFutureValue = 3
}


Enum MSGraphAPI_v1_educationExternalSource {
    sis = 0
    manual = 1
    unknownFutureValue = 2
}


Enum MSGraphAPI_v1_educationGender {
    female = 0
    male = 1
    other = 2
    unknownFutureValue = 3
}


Enum MSGraphAPI_v1_educationContactRelationship {
    parent = 0
    relative = 1
    aide = 2
    doctor = 3
    guardian = 4
    child = 5
    other = 6
    unknownFutureValue = 7
}


Enum MSGraphAPI_v1_installIntent {
    available = 0
    required = 1
    uninstall = 2
    availableWithoutEnrollment = 3
}


Enum MSGraphAPI_v1_mobileAppPublishingState {
    notPublished = 0
    processing = 1
    published = 2
}


Enum MSGraphAPI_v1_windowsArchitecture {
    none = 0
    x86 = 1
    x64 = 2
    arm = 4
    neutral = 8
}


Enum MSGraphAPI_v1_managedAppAvailability {
    global = 0
    lineOfBusiness = 1
}


Enum MSGraphAPI_v1_mobileAppContentFileUploadState {
    success = 0
    transientError = 1
    error = 2
    unknown = 3
    azureStorageUriRequestSuccess = 100
    azureStorageUriRequestPending = 101
    azureStorageUriRequestFailed = 102
    azureStorageUriRequestTimedOut = 103
    azureStorageUriRenewalSuccess = 200
    azureStorageUriRenewalPending = 201
    azureStorageUriRenewalFailed = 202
    azureStorageUriRenewalTimedOut = 203
    commitFileSuccess = 300
    commitFilePending = 301
    commitFileFailed = 302
    commitFileTimedOut = 303
}


Enum MSGraphAPI_v1_windowsDeviceType {
    none = 0
    desktop = 1
    mobile = 2
    holographic = 4
    team = 8
}


Enum MSGraphAPI_v1_microsoftStoreForBusinessLicenseType {
    offline = 0
    online = 1
}


Enum MSGraphAPI_v1_vppTokenAccountType {
    business = 0
    education = 1
}


Enum MSGraphAPI_v1_complianceStatus {
    unknown = 0
    notApplicable = 1
    compliant = 2
    remediated = 3
    nonCompliant = 4
    error = 5
    conflict = 6
}


Enum MSGraphAPI_v1_actionState {
    none = 0
    pending = 1
    canceled = 2
    active = 3
    done = 4
    failed = 5
    notSupported = 6
}


Enum MSGraphAPI_v1_complianceState {
    unknown = 0
    compliant = 1
    noncompliant = 2
    conflict = 3
    error = 4
    inGracePeriod = 254
    configManager = 255
}


Enum MSGraphAPI_v1_managementAgentType {
    eas = 1
    mdm = 2
    easMdm = 3
    intuneClient = 4
    easIntuneClient = 5
    configurationManagerClient = 8
    configurationManagerClientMdm = 10
    configurationManagerClientMdmEas = 11
    unknown = 16
    jamf = 32
    googleCloudDevicePolicyController = 64
}


Enum MSGraphAPI_v1_deviceEnrollmentType {
    unknown = 0
    userEnrollment = 1
    deviceEnrollmentManager = 2
    appleBulkWithUser = 3
    appleBulkWithoutUser = 4
    windowsAzureADJoin = 5
    windowsBulkUserless = 6
    windowsAutoEnrollment = 7
    windowsBulkAzureDomainJoin = 8
    windowsCoManagement = 9
}


Enum MSGraphAPI_v1_deviceRegistrationState {
    notRegistered = 0
    registered = 2
    revoked = 3
    keyConflict = 4
    approvalPending = 5
    certificateReset = 6
    notRegisteredPendingEnrollment = 7
    unknown = 8
}


Enum MSGraphAPI_v1_deviceManagementExchangeAccessState {
    none = 0
    unknown = 1
    allowed = 2
    blocked = 3
    quarantined = 4
}


Enum MSGraphAPI_v1_deviceManagementExchangeAccessStateReason {
    none = 0
    unknown = 1
    exchangeGlobalRule = 2
    exchangeIndividualRule = 3
    exchangeDeviceRule = 4
    exchangeUpgrade = 5
    exchangeMailboxPolicy = 6
    other = 7
    compliant = 8
    notCompliant = 9
    notEnrolled = 10
    unknownLocation = 12
    mfaRequired = 13
    azureADBlockDueToAccessPolicy = 14
    compromisedPassword = 15
    deviceNotKnownWithManagedApp = 16
}


Enum MSGraphAPI_v1_managedDevicePartnerReportedHealthState {
    unknown = 0
    activated = 1
    deactivated = 2
    secured = 3
    lowSeverity = 4
    mediumSeverity = 5
    highSeverity = 6
    unresponsive = 7
}


Enum MSGraphAPI_v1_deviceManagementSubscriptionState {
    pending = 0
    active = 1
    warning = 2
    disabled = 3
    deleted = 4
    blocked = 5
    lockedOut = 8
}


Enum MSGraphAPI_v1_appListType {
    none = 0
    appsInListCompliant = 1
    appsNotInListCompliant = 2
}


Enum MSGraphAPI_v1_androidRequiredPasswordType {
    deviceDefault = 0
    alphabetic = 1
    alphanumeric = 2
    alphanumericWithSymbols = 3
    lowSecurityBiometric = 4
    numeric = 5
    numericComplex = 6
    any = 7
}


Enum MSGraphAPI_v1_webBrowserCookieSettings {
    browserDefault = 0
    blockAlways = 1
    allowCurrentWebSite = 2
    allowFromWebsitesVisited = 3
    allowAlways = 4
}


Enum MSGraphAPI_v1_ratingAustraliaMoviesType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    parentalGuidance = 3
    mature = 4
    agesAbove15 = 5
    agesAbove18 = 6
}


Enum MSGraphAPI_v1_ratingAustraliaTelevisionType {
    allAllowed = 0
    allBlocked = 1
    preschoolers = 2
    children = 3
    general = 4
    parentalGuidance = 5
    mature = 6
    agesAbove15 = 7
    agesAbove15AdultViolence = 8
}


Enum MSGraphAPI_v1_ratingCanadaMoviesType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    parentalGuidance = 3
    agesAbove14 = 4
    agesAbove18 = 5
    restricted = 6
}


Enum MSGraphAPI_v1_ratingCanadaTelevisionType {
    allAllowed = 0
    allBlocked = 1
    children = 2
    childrenAbove8 = 3
    general = 4
    parentalGuidance = 5
    agesAbove14 = 6
    agesAbove18 = 7
}


Enum MSGraphAPI_v1_ratingFranceMoviesType {
    allAllowed = 0
    allBlocked = 1
    agesAbove10 = 2
    agesAbove12 = 3
    agesAbove16 = 4
    agesAbove18 = 5
}


Enum MSGraphAPI_v1_ratingFranceTelevisionType {
    allAllowed = 0
    allBlocked = 1
    agesAbove10 = 2
    agesAbove12 = 3
    agesAbove16 = 4
    agesAbove18 = 5
}


Enum MSGraphAPI_v1_ratingGermanyMoviesType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    agesAbove6 = 3
    agesAbove12 = 4
    agesAbove16 = 5
    adults = 6
}


Enum MSGraphAPI_v1_ratingGermanyTelevisionType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    agesAbove6 = 3
    agesAbove12 = 4
    agesAbove16 = 5
    adults = 6
}


Enum MSGraphAPI_v1_ratingIrelandMoviesType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    parentalGuidance = 3
    agesAbove12 = 4
    agesAbove15 = 5
    agesAbove16 = 6
    adults = 7
}


Enum MSGraphAPI_v1_ratingIrelandTelevisionType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    children = 3
    youngAdults = 4
    parentalSupervision = 5
    mature = 6
}


Enum MSGraphAPI_v1_ratingJapanMoviesType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    parentalGuidance = 3
    agesAbove15 = 4
    agesAbove18 = 5
}


Enum MSGraphAPI_v1_ratingJapanTelevisionType {
    allAllowed = 0
    allBlocked = 1
    explicitAllowed = 2
}


Enum MSGraphAPI_v1_ratingNewZealandMoviesType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    parentalGuidance = 3
    mature = 4
    agesAbove13 = 5
    agesAbove15 = 6
    agesAbove16 = 7
    agesAbove18 = 8
    restricted = 9
    agesAbove16Restricted = 10
}


Enum MSGraphAPI_v1_ratingNewZealandTelevisionType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    parentalGuidance = 3
    adults = 4
}


Enum MSGraphAPI_v1_ratingUnitedKingdomMoviesType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    universalChildren = 3
    parentalGuidance = 4
    agesAbove12Video = 5
    agesAbove12Cinema = 6
    agesAbove15 = 7
    adults = 8
}


Enum MSGraphAPI_v1_ratingUnitedKingdomTelevisionType {
    allAllowed = 0
    allBlocked = 1
    caution = 2
}


Enum MSGraphAPI_v1_ratingUnitedStatesMoviesType {
    allAllowed = 0
    allBlocked = 1
    general = 2
    parentalGuidance = 3
    parentalGuidance13 = 4
    restricted = 5
    adults = 6
}


Enum MSGraphAPI_v1_ratingUnitedStatesTelevisionType {
    allAllowed = 0
    allBlocked = 1
    childrenAll = 2
    childrenAbove7 = 3
    general = 4
    parentalGuidance = 5
    childrenAbove14 = 6
    adults = 7
}


Enum MSGraphAPI_v1_ratingAppsType {
    allAllowed = 0
    allBlocked = 1
    agesAbove4 = 2
    agesAbove9 = 3
    agesAbove12 = 4
    agesAbove17 = 5
}


Enum MSGraphAPI_v1_requiredPasswordType {
    deviceDefault = 0
    alphanumeric = 1
    numeric = 2
}


Enum MSGraphAPI_v1_iosNotificationAlertType {
    deviceDefault = 0
    banner = 1
    modal = 2
    none = 3
}


Enum MSGraphAPI_v1_firewallPreSharedKeyEncodingMethodType {
    deviceDefault = 0
    none = 1
    utF8 = 2
}


Enum MSGraphAPI_v1_firewallCertificateRevocationListCheckMethodType {
    deviceDefault = 0
    none = 1
    attempt = 2
    require = 3
}


Enum MSGraphAPI_v1_firewallPacketQueueingMethodType {
    deviceDefault = 0
    disabled = 1
    queueInbound = 2
    queueOutbound = 3
    queueBoth = 4
}


Enum MSGraphAPI_v1_stateManagementSetting {
    notConfigured = 0
    blocked = 1
    allowed = 2
}


Enum MSGraphAPI_v1_appLockerApplicationControlType {
    notConfigured = 0
    enforceComponentsAndStoreApps = 1
    auditComponentsAndStoreApps = 2
    enforceComponentsStoreAppsAndSmartlocker = 3
    auditComponentsStoreAppsAndSmartlocker = 4
}


Enum MSGraphAPI_v1_applicationGuardBlockFileTransferType {
    notConfigured = 0
    blockImageAndTextFile = 1
    blockImageFile = 2
    blockNone = 3
    blockTextFile = 4
}


Enum MSGraphAPI_v1_applicationGuardBlockClipboardSharingType {
    notConfigured = 0
    blockBoth = 1
    blockHostToContainer = 2
    blockContainerToHost = 3
    blockNone = 4
}


Enum MSGraphAPI_v1_bitLockerEncryptionMethod {
    aesCbc128 = 3
    aesCbc256 = 4
    xtsAes128 = 6
    xtsAes256 = 7
}


Enum MSGraphAPI_v1_diagnosticDataSubmissionMode {
    userDefined = 0
    none = 1
    basic = 2
    enhanced = 3
    full = 4
}


Enum MSGraphAPI_v1_edgeCookiePolicy {
    userDefined = 0
    allow = 1
    blockThirdParty = 2
    blockAll = 3
}


Enum MSGraphAPI_v1_defenderThreatAction {
    deviceDefault = 0
    clean = 1
    quarantine = 2
    remove = 3
    allow = 4
    userDefined = 5
    block = 6
}


Enum MSGraphAPI_v1_weeklySchedule {
    userDefined = 0
    everyday = 1
    sunday = 2
    monday = 3
    tuesday = 4
    wednesday = 5
    thursday = 6
    friday = 7
    saturday = 8
}


Enum MSGraphAPI_v1_defenderMonitorFileActivity {
    userDefined = 0
    disable = 1
    monitorAllFiles = 2
    monitorIncomingFilesOnly = 3
    monitorOutgoingFilesOnly = 4
}


Enum MSGraphAPI_v1_defenderPromptForSampleSubmission {
    userDefined = 0
    alwaysPrompt = 1
    promptBeforeSendingPersonalData = 2
    neverSendData = 3
    sendAllDataWithoutPrompting = 4
}


Enum MSGraphAPI_v1_defenderScanType {
    userDefined = 0
    disabled = 1
    quick = 2
    full = 3
}


Enum MSGraphAPI_v1_defenderCloudBlockLevelType {
    notConfigured = 0
    high = 1
    highPlus = 2
    zeroTolerance = 3
}


Enum MSGraphAPI_v1_windowsStartMenuAppListVisibilityType {
    userDefined = 0
    collapse = 1
    remove = 2
    disableSettingsApp = 4
}


Enum MSGraphAPI_v1_windowsStartMenuModeType {
    userDefined = 0
    fullScreen = 1
    nonFullScreen = 2
}


Enum MSGraphAPI_v1_visibilitySetting {
    notConfigured = 0
    hide = 1
    show = 2
}


Enum MSGraphAPI_v1_windowsSpotlightEnablementSettings {
    notConfigured = 0
    disabled = 1
    enabled = 2
}


Enum MSGraphAPI_v1_automaticUpdateMode {
    userDefined = 0
    notifyDownload = 1
    autoInstallAtMaintenanceTime = 2
    autoInstallAndRebootAtMaintenanceTime = 3
    autoInstallAndRebootAtScheduledTime = 4
    autoInstallAndRebootWithoutEndUserControl = 5
}


Enum MSGraphAPI_v1_safeSearchFilterType {
    userDefined = 0
    strict = 1
    moderate = 2
}


Enum MSGraphAPI_v1_edgeSearchEngineType {
    default = 0
    bing = 1
}


Enum MSGraphAPI_v1_prereleaseFeatures {
    userDefined = 0
    settingsOnly = 1
    settingsAndExperimentations = 2
    notAllowed = 3
}


Enum MSGraphAPI_v1_sharedPCAccountDeletionPolicyType {
    immediate = 0
    diskSpaceThreshold = 1
    diskSpaceThresholdOrInactiveThreshold = 2
}


Enum MSGraphAPI_v1_sharedPCAllowedAccountType {
    guest = 1
    domain = 2
}


Enum MSGraphAPI_v1_windowsDeliveryOptimizationMode {
    userDefined = 0
    httpOnly = 1
    httpWithPeeringNat = 2
    httpWithPeeringPrivateGroup = 3
    httpWithInternetPeering = 4
    simpleDownload = 99
    bypassMode = 100
}


Enum MSGraphAPI_v1_windowsUpdateType {
    userDefined = 0
    all = 1
    businessReadyOnly = 2
}


Enum MSGraphAPI_v1_internetSiteSecurityLevel {
    userDefined = 0
    medium = 1
    mediumHigh = 2
    high = 3
}


Enum MSGraphAPI_v1_siteSecurityLevel {
    userDefined = 0
    low = 1
    mediumLow = 2
    medium = 3
    mediumHigh = 4
    high = 5
}


Enum MSGraphAPI_v1_windowsUserAccountControlSettings {
    userDefined = 0
    alwaysNotify = 1
    notifyOnAppChanges = 2
    notifyOnAppChangesWithoutDimming = 3
    neverNotify = 4
}


Enum MSGraphAPI_v1_miracastChannel {
    userDefined = 0
    one = 1
    two = 2
    three = 3
    four = 4
    five = 5
    six = 6
    seven = 7
    eight = 8
    nine = 9
    ten = 10
    eleven = 11
    thirtySix = 36
    forty = 40
    fortyFour = 44
    fortyEight = 48
    oneHundredFortyNine = 149
    oneHundredFiftyThree = 153
    oneHundredFiftySeven = 157
    oneHundredSixtyOne = 161
    oneHundredSixtyFive = 165
}


Enum MSGraphAPI_v1_welcomeScreenMeetingInformation {
    userDefined = 0
    showOrganizerAndTimeOnly = 1
    showOrganizerAndTimeAndSubject = 2
}


Enum MSGraphAPI_v1_editionUpgradeLicenseType {
    productKey = 0
    licenseFile = 1
}


Enum MSGraphAPI_v1_windows10EditionType {
    windows10Enterprise = 0
    windows10EnterpriseN = 1
    windows10Education = 2
    windows10EducationN = 3
    windows10MobileEnterprise = 4
    windows10HolographicEnterprise = 5
    windows10Professional = 6
    windows10ProfessionalN = 7
    windows10ProfessionalEducation = 8
    windows10ProfessionalEducationN = 9
    windows10ProfessionalWorkstation = 10
    windows10ProfessionalWorkstationN = 11
}


Enum MSGraphAPI_v1_deviceComplianceActionType {
    noAction = 0
    notification = 1
    block = 2
    retire = 3
    wipe = 4
    removeResourceAccessProfiles = 5
}


Enum MSGraphAPI_v1_deviceThreatProtectionLevel {
    unavailable = 0
    secured = 1
    low = 2
    medium = 3
    high = 4
    notSet = 10
}


Enum MSGraphAPI_v1_policyPlatformType {
    android = 0
    iOS = 2
    macOS = 3
    windowsPhone81 = 4
    windows81AndLater = 5
    windows10AndLater = 6
    all = 100
}


Enum MSGraphAPI_v1_iosUpdatesInstallStatus {
    success = 0
    available = 1
    idle = 2
    downloading = -2016330712
    downloadFailed = -2016330711
    downloadRequiresComputer = -2016330710
    downloadInsufficientSpace = -2016330709
    downloadInsufficientPower = -2016330708
    downloadInsufficientNetwork = -2016330707
    installing = -2016330706
    installInsufficientSpace = -2016330705
    installInsufficientPower = -2016330704
    installPhoneCallInProgress = -2016330703
    installFailed = -2016330702
    notSupportedOperation = -2016330701
    sharedDeviceUserLoggedInError = -2016330699
}


Enum MSGraphAPI_v1_deviceManagementExchangeConnectorSyncType {
    fullSync = 0
    deltaSync = 1
}


Enum MSGraphAPI_v1_mdmAuthority {
    unknown = 0
    intune = 1
    sccm = 2
    office365 = 3
}


Enum MSGraphAPI_v1_windowsHelloForBusinessPinUsage {
    allowed = 0
    required = 1
    disallowed = 2
}


Enum MSGraphAPI_v1_enablement {
    notConfigured = 0
    enabled = 1
    disabled = 2
}


Enum MSGraphAPI_v1_deviceManagementExchangeConnectorStatus {
    none = 0
    connectionPending = 1
    connected = 2
    disconnected = 3
}


Enum MSGraphAPI_v1_deviceManagementExchangeConnectorType {
    onPremises = 0
    hosted = 1
    serviceToService = 2
    dedicated = 3
}


Enum MSGraphAPI_v1_mobileThreatPartnerTenantState {
    unavailable = 0
    available = 1
    enabled = 2
    unresponsive = 3
}


Enum MSGraphAPI_v1_deviceManagementPartnerTenantState {
    unknown = 0
    unavailable = 1
    enabled = 2
    terminated = 3
    rejected = 4
    unresponsive = 5
}


Enum MSGraphAPI_v1_deviceManagementPartnerAppType {
    unknown = 0
    singleTenantApp = 1
    multiTenantApp = 2
}


Enum MSGraphAPI_v1_managedAppDataTransferLevel {
    allApps = 0
    managedApps = 1
    none = 2
}


Enum MSGraphAPI_v1_managedAppClipboardSharingLevel {
    allApps = 0
    managedAppsWithPasteIn = 1
    managedApps = 2
    blocked = 3
}


Enum MSGraphAPI_v1_managedAppPinCharacterSet {
    numeric = 0
    alphanumericAndSymbol = 1
}


Enum MSGraphAPI_v1_managedAppDataStorageLocation {
    oneDriveForBusiness = 1
    sharePoint = 2
    localStorage = 6
}


Enum MSGraphAPI_v1_managedAppDataEncryptionType {
    useDeviceSettings = 0
    afterDeviceRestart = 1
    whenDeviceLockedExceptOpenFiles = 2
    whenDeviceLocked = 3
}


Enum MSGraphAPI_v1_windowsInformationProtectionEnforcementLevel {
    noProtection = 0
    encryptAndAuditOnly = 1
    encryptAuditAndPrompt = 2
    encryptAuditAndBlock = 3
}


Enum MSGraphAPI_v1_windowsInformationProtectionPinCharacterRequirements {
    notAllow = 0
    requireAtLeastOne = 1
    allow = 2
}


Enum MSGraphAPI_v1_managedAppFlaggedReason {
    none = 0
    rootedDevice = 1
}


Enum MSGraphAPI_v1_notificationTemplateBrandingOptions {
    none = 0
    includeCompanyLogo = 1
    includeCompanyName = 2
    includeContactInformation = 4
}


Enum MSGraphAPI_v1_installState {
    notApplicable = 0
    installed = 1
    failed = 2
    notInstalled = 3
    uninstallFailed = 4
    unknown = 5
}


Enum MSGraphAPI_v1_remoteAssistanceOnboardingStatus {
    notOnboarded = 0
    onboarding = 1
    onboarded = 2
}


Enum MSGraphAPI_v1_applicationType {
    universal = 1
    desktop = 2
}


Enum MSGraphAPI_v1_deviceEnrollmentFailureReason {
    unknown = 0
    authentication = 1
    authorization = 2
    accountValidation = 3
    userValidation = 4
    deviceNotSupported = 5
    inMaintenance = 6
    badRequest = 7
    featureNotSupported = 8
    enrollmentRestrictionsEnforced = 9
    clientDisconnected = 10
}

$null = $Script:MSGraphAPIClassHash.Add('entity', 'MSGraphAPI_v1_entity')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.entity', 'MSGraphAPI_v1_entity')


class MSGraphAPI_v1_entity : MSGraphAPI_Base {
    [string] $id



}
$null = $Script:MSGraphAPIClassHash.Add('directoryObject', 'MSGraphAPI_v1_directoryObject')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.directoryObject', 'MSGraphAPI_v1_directoryObject')


class MSGraphAPI_v1_directoryObject : MSGraphAPI_v1_entity {


    [object]checkMemberGroups([string[]]$groupIds){
        $ParamHash = @{
            'groupIds'=$groupIds
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'checkMemberGroups' -ParamHash $ParamHash)
    }
    [object]getMemberGroups([Nullable[bool]]$securityEnabledOnly){
        $ParamHash = @{
            'securityEnabledOnly'=$securityEnabledOnly
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'getMemberGroups' -ParamHash $ParamHash)
    }
    [object]getMemberObjects([Nullable[bool]]$securityEnabledOnly){
        $ParamHash = @{
            'securityEnabledOnly'=$securityEnabledOnly
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'getMemberObjects' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('device', 'MSGraphAPI_v1_device')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.device', 'MSGraphAPI_v1_device')


class MSGraphAPI_v1_device : MSGraphAPI_v1_directoryObject {
    [Nullable[bool]] $accountEnabled
    [MSGraphAPI_v1_alternativeSecurityId[]] $alternativeSecurityIds
    [Nullable[DateTimeOffset]] $approximateLastSignInDateTime
    [string] $deviceId
    [string] $deviceMetadata
    [Nullable[int]] $deviceVersion
    [string] $displayName
    [Nullable[bool]] $isCompliant
    [Nullable[bool]] $isManaged
    [Nullable[DateTimeOffset]] $onPremisesLastSyncDateTime
    [Nullable[bool]] $onPremisesSyncEnabled
    [string] $operatingSystem
    [string] $operatingSystemVersion
    [string[]] $physicalIds
    [string] $trustType
    [object]Get_registeredOwners(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/registeredOwners")
    }
    [object]Get_registeredUsers(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/registeredUsers")
    }
    [object]Get_extensions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/extensions")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('alternativeSecurityId', 'MSGraphAPI_v1_alternativeSecurityId')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.alternativeSecurityId', 'MSGraphAPI_v1_alternativeSecurityId')


class MSGraphAPI_v1_alternativeSecurityId : MSGraphAPI_Base {
    [Nullable[int]] $type
    [string] $identityProvider
    [object] $key
}
$null = $Script:MSGraphAPIClassHash.Add('extension', 'MSGraphAPI_v1_extension')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.extension', 'MSGraphAPI_v1_extension')


class MSGraphAPI_v1_extension : MSGraphAPI_v1_entity {




}
$null = $Script:MSGraphAPIClassHash.Add('directoryRole', 'MSGraphAPI_v1_directoryRole')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.directoryRole', 'MSGraphAPI_v1_directoryRole')


class MSGraphAPI_v1_directoryRole : MSGraphAPI_v1_directoryObject {
    [string] $description
    [string] $displayName
    [string] $roleTemplateId
    [object]Get_members(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/members")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('directoryRoleTemplate', 'MSGraphAPI_v1_directoryRoleTemplate')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.directoryRoleTemplate', 'MSGraphAPI_v1_directoryRoleTemplate')


class MSGraphAPI_v1_directoryRoleTemplate : MSGraphAPI_v1_directoryObject {
    [string] $description
    [string] $displayName



}
$null = $Script:MSGraphAPIClassHash.Add('domain', 'MSGraphAPI_v1_domain')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.domain', 'MSGraphAPI_v1_domain')


class MSGraphAPI_v1_domain : MSGraphAPI_v1_entity {
    [string] $authenticationType
    [string] $availabilityStatus
    [Nullable[bool]] $isAdminManaged
    [Nullable[bool]] $isDefault
    [Nullable[bool]] $isInitial
    [Nullable[bool]] $isRoot
    [Nullable[bool]] $isVerified
    [string[]] $supportedServices
    [MSGraphAPI_v1_domainState] $state
    [object]Get_serviceConfigurationRecords(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/serviceConfigurationRecords")
    }
    [object]Get_verificationDnsRecords(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/verificationDnsRecords")
    }
    [object]Get_domainNameReferences(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/domainNameReferences")
    }
    [object]verify(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'verify')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('domainState', 'MSGraphAPI_v1_domainState')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.domainState', 'MSGraphAPI_v1_domainState')


class MSGraphAPI_v1_domainState : MSGraphAPI_Base {
    [string] $status
    [string] $operation
    [Nullable[DateTimeOffset]] $lastActionDateTime
}
$null = $Script:MSGraphAPIClassHash.Add('domainDnsRecord', 'MSGraphAPI_v1_domainDnsRecord')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.domainDnsRecord', 'MSGraphAPI_v1_domainDnsRecord')


class MSGraphAPI_v1_domainDnsRecord : MSGraphAPI_v1_entity {
    [Nullable[bool]] $isOptional
    [string] $label
    [string] $recordType
    [string] $supportedService
    [Nullable[int]] $ttl



}
$null = $Script:MSGraphAPIClassHash.Add('domainDnsCnameRecord', 'MSGraphAPI_v1_domainDnsCnameRecord')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.domainDnsCnameRecord', 'MSGraphAPI_v1_domainDnsCnameRecord')


class MSGraphAPI_v1_domainDnsCnameRecord : MSGraphAPI_v1_domainDnsRecord {
    [string] $canonicalName



}
$null = $Script:MSGraphAPIClassHash.Add('domainDnsMxRecord', 'MSGraphAPI_v1_domainDnsMxRecord')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.domainDnsMxRecord', 'MSGraphAPI_v1_domainDnsMxRecord')


class MSGraphAPI_v1_domainDnsMxRecord : MSGraphAPI_v1_domainDnsRecord {
    [string] $mailExchange
    [Nullable[int]] $preference



}
$null = $Script:MSGraphAPIClassHash.Add('domainDnsSrvRecord', 'MSGraphAPI_v1_domainDnsSrvRecord')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.domainDnsSrvRecord', 'MSGraphAPI_v1_domainDnsSrvRecord')


class MSGraphAPI_v1_domainDnsSrvRecord : MSGraphAPI_v1_domainDnsRecord {
    [string] $nameTarget
    [Nullable[int]] $port
    [Nullable[int]] $priority
    [string] $protocol
    [string] $service
    [Nullable[int]] $weight



}
$null = $Script:MSGraphAPIClassHash.Add('domainDnsTxtRecord', 'MSGraphAPI_v1_domainDnsTxtRecord')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.domainDnsTxtRecord', 'MSGraphAPI_v1_domainDnsTxtRecord')


class MSGraphAPI_v1_domainDnsTxtRecord : MSGraphAPI_v1_domainDnsRecord {
    [string] $text



}
$null = $Script:MSGraphAPIClassHash.Add('domainDnsUnavailableRecord', 'MSGraphAPI_v1_domainDnsUnavailableRecord')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.domainDnsUnavailableRecord', 'MSGraphAPI_v1_domainDnsUnavailableRecord')


class MSGraphAPI_v1_domainDnsUnavailableRecord : MSGraphAPI_v1_domainDnsRecord {
    [string] $description



}
$null = $Script:MSGraphAPIClassHash.Add('licenseDetails', 'MSGraphAPI_v1_licenseDetails')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.licenseDetails', 'MSGraphAPI_v1_licenseDetails')


class MSGraphAPI_v1_licenseDetails : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_servicePlanInfo[]] $servicePlans
    [Nullable[Guid]] $skuId
    [string] $skuPartNumber



}
$null = $Script:MSGraphAPIClassHash.Add('servicePlanInfo', 'MSGraphAPI_v1_servicePlanInfo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.servicePlanInfo', 'MSGraphAPI_v1_servicePlanInfo')


class MSGraphAPI_v1_servicePlanInfo : MSGraphAPI_Base {
    [Nullable[Guid]] $servicePlanId
    [string] $servicePlanName
    [string] $provisioningStatus
    [string] $appliesTo
}
$null = $Script:MSGraphAPIClassHash.Add('group', 'MSGraphAPI_v1_group')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.group', 'MSGraphAPI_v1_group')


class MSGraphAPI_v1_group : MSGraphAPI_v1_directoryObject {
    [string] $classification
    [Nullable[DateTimeOffset]] $createdDateTime
    [string] $description
    [string] $displayName
    [string[]] $groupTypes
    [string] $mail
    [Nullable[bool]] $mailEnabled
    [string] $mailNickname
    [Nullable[DateTimeOffset]] $onPremisesLastSyncDateTime
    [string] $onPremisesSecurityIdentifier
    [Nullable[bool]] $onPremisesSyncEnabled
    [string[]] $proxyAddresses
    [Nullable[DateTimeOffset]] $renewedDateTime
    [Nullable[bool]] $securityEnabled
    [string] $visibility
    [Nullable[bool]] $allowExternalSenders
    [Nullable[bool]] $autoSubscribeNewMembers
    [Nullable[bool]] $isSubscribedByMail
    [Nullable[int]] $unseenCount
    [object]Get_members(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/members")
    }
    [object]Get_memberOf(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/memberOf")
    }
    [object]Get_createdOnBehalfOf(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/createdOnBehalfOf")
    }
    [object]Get_owners(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/owners")
    }
    [object]Get_settings(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/settings")
    }
    [object]Get_extensions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/extensions")
    }
    [object]Get_threads(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/threads")
    }
    [object]Get_calendar(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendar")
    }
    [object]Get_calendarView(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendarView")
    }
    [object]Get_events(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/events")
    }
    [object]Get_conversations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/conversations")
    }
    [object]Get_photo(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/photo")
    }
    [object]Get_photos(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/photos")
    }
    [object]Get_acceptedSenders(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/acceptedSenders")
    }
    [object]Get_rejectedSenders(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/rejectedSenders")
    }
    [object]Get_drive(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/drive")
    }
    [object]Get_drives(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/drives")
    }
    [object]Get_sites(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sites")
    }
    [object]Get_planner(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/planner")
    }
    [object]Get_onenote(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/onenote")
    }
    [object]Get_groupLifecyclePolicies(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/groupLifecyclePolicies")
    }
    [object]subscribeByMail(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'subscribeByMail')
    }
    [object]unsubscribeByMail(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'unsubscribeByMail')
    }
    [object]addFavorite(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'addFavorite')
    }
    [object]removeFavorite(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'removeFavorite')
    }
    [object]resetUnseenCount(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'resetUnseenCount')
    }
    [object]renew(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'renew')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('groupSetting', 'MSGraphAPI_v1_groupSetting')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.groupSetting', 'MSGraphAPI_v1_groupSetting')


class MSGraphAPI_v1_groupSetting : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $templateId
    [MSGraphAPI_v1_settingValue[]] $values



}
$null = $Script:MSGraphAPIClassHash.Add('conversationThread', 'MSGraphAPI_v1_conversationThread')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.conversationThread', 'MSGraphAPI_v1_conversationThread')


class MSGraphAPI_v1_conversationThread : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_recipient[]] $toRecipients
    [string] $topic
    [Nullable[bool]] $hasAttachments
    [Nullable[DateTimeOffset]] $lastDeliveredDateTime
    [string[]] $uniqueSenders
    [MSGraphAPI_v1_recipient[]] $ccRecipients
    [string] $preview
    [Nullable[bool]] $isLocked
    [object]Get_posts(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/posts")
    }
    [object]reply([object]$Post){
        $ParamHash = @{
            'Post'=$Post
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'reply' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('calendar', 'MSGraphAPI_v1_calendar')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.calendar', 'MSGraphAPI_v1_calendar')


class MSGraphAPI_v1_calendar : MSGraphAPI_v1_entity {
    [string] $name
    [MSGraphAPI_v1_calendarColor] $color
    [string] $changeKey
    [Nullable[bool]] $canShare
    [Nullable[bool]] $canViewPrivateItems
    [Nullable[bool]] $canEdit
    [MSGraphAPI_v1_emailAddress] $owner
    [object]Get_events(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/events")
    }
    [object]Get_calendarView(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendarView")
    }
    [object]Get_singleValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/singleValueExtendedProperties")
    }
    [object]Get_multiValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/multiValueExtendedProperties")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('outlookItem', 'MSGraphAPI_v1_outlookItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.outlookItem', 'MSGraphAPI_v1_outlookItem')


class MSGraphAPI_v1_outlookItem : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $changeKey
    [string[]] $categories



}
$null = $Script:MSGraphAPIClassHash.Add('event', 'MSGraphAPI_v1_event')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.event', 'MSGraphAPI_v1_event')


class MSGraphAPI_v1_event : MSGraphAPI_v1_outlookItem {
    [string] $originalStartTimeZone
    [string] $originalEndTimeZone
    [MSGraphAPI_v1_responseStatus] $responseStatus
    [string] $iCalUId
    [Nullable[int]] $reminderMinutesBeforeStart
    [Nullable[bool]] $isReminderOn
    [Nullable[bool]] $hasAttachments
    [string] $subject
    [MSGraphAPI_v1_itemBody] $body
    [string] $bodyPreview
    [MSGraphAPI_v1_importance] $importance
    [MSGraphAPI_v1_sensitivity] $sensitivity
    [MSGraphAPI_v1_dateTimeTimeZone] $start
    [Nullable[DateTimeOffset]] $originalStart
    [MSGraphAPI_v1_dateTimeTimeZone] $end
    [MSGraphAPI_v1_location] $location
    [Nullable[bool]] $isAllDay
    [Nullable[bool]] $isCancelled
    [Nullable[bool]] $isOrganizer
    [MSGraphAPI_v1_patternedRecurrence] $recurrence
    [Nullable[bool]] $responseRequested
    [string] $seriesMasterId
    [MSGraphAPI_v1_freeBusyStatus] $showAs
    [MSGraphAPI_v1_eventType] $type
    [MSGraphAPI_v1_attendee[]] $attendees
    [MSGraphAPI_v1_recipient] $organizer
    [string] $webLink
    [string] $onlineMeetingUrl
    [object]Get_calendar(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendar")
    }
    [object]Get_instances(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/instances")
    }
    [object]Get_extensions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/extensions")
    }
    [object]Get_attachments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/attachments")
    }
    [object]Get_singleValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/singleValueExtendedProperties")
    }
    [object]Get_multiValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/multiValueExtendedProperties")
    }
    [object]accept([string]$Comment,[Nullable[bool]]$SendResponse){
        $ParamHash = @{
            'Comment'=$Comment
            'SendResponse'=$SendResponse
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'accept' -ParamHash $ParamHash)
    }
    [object]decline([string]$Comment,[Nullable[bool]]$SendResponse){
        $ParamHash = @{
            'Comment'=$Comment
            'SendResponse'=$SendResponse
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'decline' -ParamHash $ParamHash)
    }
    [object]tentativelyAccept([string]$Comment,[Nullable[bool]]$SendResponse){
        $ParamHash = @{
            'Comment'=$Comment
            'SendResponse'=$SendResponse
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'tentativelyAccept' -ParamHash $ParamHash)
    }
    [object]snoozeReminder([object]$NewReminderTime){
        $ParamHash = @{
            'NewReminderTime'=$NewReminderTime
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'snoozeReminder' -ParamHash $ParamHash)
    }
    [object]dismissReminder(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'dismissReminder')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('conversation', 'MSGraphAPI_v1_conversation')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.conversation', 'MSGraphAPI_v1_conversation')


class MSGraphAPI_v1_conversation : MSGraphAPI_v1_entity {
    [string] $topic
    [Nullable[bool]] $hasAttachments
    [Nullable[DateTimeOffset]] $lastDeliveredDateTime
    [string[]] $uniqueSenders
    [string] $preview
    [object]Get_threads(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/threads")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('profilePhoto', 'MSGraphAPI_v1_profilePhoto')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.profilePhoto', 'MSGraphAPI_v1_profilePhoto')


class MSGraphAPI_v1_profilePhoto : MSGraphAPI_v1_entity {
    [Nullable[int]] $height
    [Nullable[int]] $width



}
$null = $Script:MSGraphAPIClassHash.Add('baseItem', 'MSGraphAPI_v1_baseItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.baseItem', 'MSGraphAPI_v1_baseItem')


class MSGraphAPI_v1_baseItem : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_identitySet] $createdBy
    [Nullable[DateTimeOffset]] $createdDateTime
    [string] $description
    [string] $eTag
    [MSGraphAPI_v1_identitySet] $lastModifiedBy
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $name
    [MSGraphAPI_v1_itemReference] $parentReference
    [string] $webUrl
    [object]Get_createdByUser(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/createdByUser")
    }
    [object]Get_lastModifiedByUser(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/lastModifiedByUser")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('drive', 'MSGraphAPI_v1_drive')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.drive', 'MSGraphAPI_v1_drive')


class MSGraphAPI_v1_drive : MSGraphAPI_v1_baseItem {
    [string] $driveType
    [MSGraphAPI_v1_identitySet] $owner
    [MSGraphAPI_v1_quota] $quota
    [MSGraphAPI_v1_sharepointIds] $sharePointIds
    [MSGraphAPI_v1_systemFacet] $system
    [object]Get_items(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/items")
    }
    [object]Get_list(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/list")
    }
    [object]Get_root(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/root")
    }
    [object]Get_special(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/special")
    }

    [object]recent(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'recent')
    }
    [object]search([string]$q){
        $ParamHash = @{
            'q'=$q
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'search' -ParamHash $ParamHash)
    }
    [object]sharedWithMe(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'sharedWithMe')
    }
}
$null = $Script:MSGraphAPIClassHash.Add('site', 'MSGraphAPI_v1_site')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.site', 'MSGraphAPI_v1_site')


class MSGraphAPI_v1_site : MSGraphAPI_v1_baseItem {
    [string] $displayName
    [MSGraphAPI_v1_root] $root
    [MSGraphAPI_v1_sharepointIds] $sharepointIds
    [MSGraphAPI_v1_siteCollection] $siteCollection
    [object]Get_columns(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/columns")
    }
    [object]Get_contentTypes(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/contentTypes")
    }
    [object]Get_drive(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/drive")
    }
    [object]Get_drives(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/drives")
    }
    [object]Get_items(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/items")
    }
    [object]Get_lists(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/lists")
    }
    [object]Get_sites(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sites")
    }
    [object]Get_onenote(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/onenote")
    }

    [object]getByPath([string]$path){
        $ParamHash = @{
            'path'=$path
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getByPath' -ParamHash $ParamHash)
    }
}
$null = $Script:MSGraphAPIClassHash.Add('plannerGroup', 'MSGraphAPI_v1_plannerGroup')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerGroup', 'MSGraphAPI_v1_plannerGroup')


class MSGraphAPI_v1_plannerGroup : MSGraphAPI_v1_entity {

    [object]Get_plans(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/plans")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('onenote', 'MSGraphAPI_v1_onenote')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenote', 'MSGraphAPI_v1_onenote')


class MSGraphAPI_v1_onenote : MSGraphAPI_v1_entity {

    [object]Get_notebooks(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/notebooks")
    }
    [object]Get_sections(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sections")
    }
    [object]Get_sectionGroups(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sectionGroups")
    }
    [object]Get_pages(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/pages")
    }
    [object]Get_resources(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/resources")
    }
    [object]Get_operations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/operations")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('groupLifecyclePolicy', 'MSGraphAPI_v1_groupLifecyclePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.groupLifecyclePolicy', 'MSGraphAPI_v1_groupLifecyclePolicy')


class MSGraphAPI_v1_groupLifecyclePolicy : MSGraphAPI_v1_entity {
    [Nullable[int]] $groupLifetimeInDays
    [string] $managedGroupTypes
    [string] $alternateNotificationEmails

    [object]addGroup([string]$groupId){
        $ParamHash = @{
            'groupId'=$groupId
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'addGroup' -ParamHash $ParamHash)
    }
    [object]removeGroup([string]$groupId){
        $ParamHash = @{
            'groupId'=$groupId
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'removeGroup' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('contract', 'MSGraphAPI_v1_contract')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.contract', 'MSGraphAPI_v1_contract')


class MSGraphAPI_v1_contract : MSGraphAPI_v1_directoryObject {
    [string] $contractType
    [Nullable[Guid]] $customerId
    [string] $defaultDomainName
    [string] $displayName



}
$null = $Script:MSGraphAPIClassHash.Add('subscribedSku', 'MSGraphAPI_v1_subscribedSku')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.subscribedSku', 'MSGraphAPI_v1_subscribedSku')


class MSGraphAPI_v1_subscribedSku : MSGraphAPI_v1_entity {
    [string] $capabilityStatus
    [Nullable[int]] $consumedUnits
    [MSGraphAPI_v1_licenseUnitsDetail] $prepaidUnits
    [MSGraphAPI_v1_servicePlanInfo[]] $servicePlans
    [Nullable[Guid]] $skuId
    [string] $skuPartNumber
    [string] $appliesTo



}
$null = $Script:MSGraphAPIClassHash.Add('licenseUnitsDetail', 'MSGraphAPI_v1_licenseUnitsDetail')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.licenseUnitsDetail', 'MSGraphAPI_v1_licenseUnitsDetail')


class MSGraphAPI_v1_licenseUnitsDetail : MSGraphAPI_Base {
    [Nullable[int]] $enabled
    [Nullable[int]] $suspended
    [Nullable[int]] $warning
}
$null = $Script:MSGraphAPIClassHash.Add('organization', 'MSGraphAPI_v1_organization')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.organization', 'MSGraphAPI_v1_organization')


class MSGraphAPI_v1_organization : MSGraphAPI_v1_directoryObject {
    [MSGraphAPI_v1_assignedPlan[]] $assignedPlans
    [string[]] $businessPhones
    [string] $city
    [string] $country
    [string] $countryLetterCode
    [string] $displayName
    [string[]] $marketingNotificationEmails
    [Nullable[DateTimeOffset]] $onPremisesLastSyncDateTime
    [Nullable[bool]] $onPremisesSyncEnabled
    [string] $postalCode
    [string] $preferredLanguage
    [MSGraphAPI_v1_provisionedPlan[]] $provisionedPlans
    [string[]] $securityComplianceNotificationMails
    [string[]] $securityComplianceNotificationPhones
    [string] $state
    [string] $street
    [string[]] $technicalNotificationMails
    [MSGraphAPI_v1_verifiedDomain[]] $verifiedDomains
    [MSGraphAPI_v1_mdmAuthority] $mobileDeviceManagementAuthority
    [object]Get_extensions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/extensions")
    }
    [object]setMobileDeviceManagementAuthority(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'setMobileDeviceManagementAuthority')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('assignedPlan', 'MSGraphAPI_v1_assignedPlan')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.assignedPlan', 'MSGraphAPI_v1_assignedPlan')


class MSGraphAPI_v1_assignedPlan : MSGraphAPI_Base {
    [Nullable[DateTimeOffset]] $assignedDateTime
    [string] $capabilityStatus
    [string] $service
    [Nullable[Guid]] $servicePlanId
}
$null = $Script:MSGraphAPIClassHash.Add('provisionedPlan', 'MSGraphAPI_v1_provisionedPlan')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.provisionedPlan', 'MSGraphAPI_v1_provisionedPlan')


class MSGraphAPI_v1_provisionedPlan : MSGraphAPI_Base {
    [string] $capabilityStatus
    [string] $provisioningStatus
    [string] $service
}
$null = $Script:MSGraphAPIClassHash.Add('verifiedDomain', 'MSGraphAPI_v1_verifiedDomain')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.verifiedDomain', 'MSGraphAPI_v1_verifiedDomain')


class MSGraphAPI_v1_verifiedDomain : MSGraphAPI_Base {
    [string] $capabilities
    [Nullable[bool]] $isDefault
    [Nullable[bool]] $isInitial
    [string] $name
    [string] $type
}
$null = $Script:MSGraphAPIClassHash.Add('user', 'MSGraphAPI_v1_user')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.user', 'MSGraphAPI_v1_user')


class MSGraphAPI_v1_user : MSGraphAPI_v1_directoryObject {
    [Nullable[bool]] $accountEnabled
    [MSGraphAPI_v1_assignedLicense[]] $assignedLicenses
    [MSGraphAPI_v1_assignedPlan[]] $assignedPlans
    [string[]] $businessPhones
    [string] $city
    [string] $companyName
    [string] $country
    [string] $department
    [string] $displayName
    [string] $givenName
    [string[]] $imAddresses
    [string] $jobTitle
    [string] $mail
    [string] $mailNickname
    [string] $mobilePhone
    [string] $onPremisesImmutableId
    [Nullable[DateTimeOffset]] $onPremisesLastSyncDateTime
    [string] $onPremisesSecurityIdentifier
    [Nullable[bool]] $onPremisesSyncEnabled
    [string] $passwordPolicies
    [MSGraphAPI_v1_passwordProfile] $passwordProfile
    [string] $officeLocation
    [string] $postalCode
    [string] $preferredLanguage
    [MSGraphAPI_v1_provisionedPlan[]] $provisionedPlans
    [string[]] $proxyAddresses
    [string] $state
    [string] $streetAddress
    [string] $surname
    [string] $usageLocation
    [string] $userPrincipalName
    [string] $userType
    [MSGraphAPI_v1_mailboxSettings] $mailboxSettings
    [string] $aboutMe
    [Nullable[DateTimeOffset]] $birthday
    [Nullable[DateTimeOffset]] $hireDate
    [string[]] $interests
    [string] $mySite
    [string[]] $pastProjects
    [string] $preferredName
    [string[]] $responsibilities
    [string[]] $schools
    [string[]] $skills
    [Nullable[int]] $deviceEnrollmentLimit
    [object]Get_ownedDevices(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/ownedDevices")
    }
    [object]Get_registeredDevices(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/registeredDevices")
    }
    [object]Get_manager(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/manager")
    }
    [object]Get_directReports(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/directReports")
    }
    [object]Get_memberOf(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/memberOf")
    }
    [object]Get_createdObjects(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/createdObjects")
    }
    [object]Get_ownedObjects(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/ownedObjects")
    }
    [object]Get_licenseDetails(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/licenseDetails")
    }
    [object]Get_extensions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/extensions")
    }
    [object]Get_messages(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/messages")
    }
    [object]Get_mailFolders(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/mailFolders")
    }
    [object]Get_calendar(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendar")
    }
    [object]Get_calendars(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendars")
    }
    [object]Get_calendarGroups(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendarGroups")
    }
    [object]Get_calendarView(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendarView")
    }
    [object]Get_events(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/events")
    }
    [object]Get_people(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/people")
    }
    [object]Get_contacts(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/contacts")
    }
    [object]Get_contactFolders(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/contactFolders")
    }
    [object]Get_inferenceClassification(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/inferenceClassification")
    }
    [object]Get_photo(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/photo")
    }
    [object]Get_photos(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/photos")
    }
    [object]Get_drive(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/drive")
    }
    [object]Get_drives(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/drives")
    }
    [object]Get_planner(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/planner")
    }
    [object]Get_onenote(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/onenote")
    }
    [object]Get_managedDevices(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedDevices")
    }
    [object]Get_managedAppRegistrations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedAppRegistrations")
    }
    [object]Get_deviceManagementTroubleshootingEvents(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceManagementTroubleshootingEvents")
    }
    [object]assignLicense([object]$addLicenses,[Nullable[Guid][]]$removeLicenses){
        $ParamHash = @{
            'addLicenses'=$addLicenses
            'removeLicenses'=$removeLicenses
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assignLicense' -ParamHash $ParamHash)
    }
    [object]changePassword([string]$currentPassword,[string]$newPassword){
        $ParamHash = @{
            'currentPassword'=$currentPassword
            'newPassword'=$newPassword
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'changePassword' -ParamHash $ParamHash)
    }
    [object]sendMail([object]$Message,[Nullable[bool]]$SaveToSentItems){
        $ParamHash = @{
            'Message'=$Message
            'SaveToSentItems'=$SaveToSentItems
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'sendMail' -ParamHash $ParamHash)
    }
    [object]findMeetingTimes([object]$Attendees,[object]$LocationConstraint,[object]$TimeConstraint,[object]$MeetingDuration,[Nullable[int]]$MaxCandidates,[Nullable[bool]]$IsOrganizerOptional,[Nullable[bool]]$ReturnSuggestionReasons,[Nullable[Double]]$MinimumAttendeePercentage){
        $ParamHash = @{
            'Attendees'=$Attendees
            'LocationConstraint'=$LocationConstraint
            'TimeConstraint'=$TimeConstraint
            'MeetingDuration'=$MeetingDuration
            'MaxCandidates'=$MaxCandidates
            'IsOrganizerOptional'=$IsOrganizerOptional
            'ReturnSuggestionReasons'=$ReturnSuggestionReasons
            'MinimumAttendeePercentage'=$MinimumAttendeePercentage
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'findMeetingTimes' -ParamHash $ParamHash)
    }
    [object]removeAllDevicesFromManagement(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'removeAllDevicesFromManagement')
    }
    [object]wipeManagedAppRegistrationsByDeviceTag([string]$deviceTag){
        $ParamHash = @{
            'deviceTag'=$deviceTag
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'wipeManagedAppRegistrationsByDeviceTag' -ParamHash $ParamHash)
    }
    [object]reminderView([string]$StartDateTime,[string]$EndDateTime){
        $ParamHash = @{
            'StartDateTime'=$StartDateTime
            'EndDateTime'=$EndDateTime
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'reminderView' -ParamHash $ParamHash)
    }
    [object]getManagedAppDiagnosticStatuses(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getManagedAppDiagnosticStatuses')
    }
    [object]getManagedAppPolicies(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getManagedAppPolicies')
    }
}
$null = $Script:MSGraphAPIClassHash.Add('assignedLicense', 'MSGraphAPI_v1_assignedLicense')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.assignedLicense', 'MSGraphAPI_v1_assignedLicense')


class MSGraphAPI_v1_assignedLicense : MSGraphAPI_Base {
    [Nullable[Guid][]] $disabledPlans
    [Nullable[Guid]] $skuId
}
$null = $Script:MSGraphAPIClassHash.Add('passwordProfile', 'MSGraphAPI_v1_passwordProfile')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.passwordProfile', 'MSGraphAPI_v1_passwordProfile')


class MSGraphAPI_v1_passwordProfile : MSGraphAPI_Base {
    [string] $password
    [Nullable[bool]] $forceChangePasswordNextSignIn
}
$null = $Script:MSGraphAPIClassHash.Add('mailboxSettings', 'MSGraphAPI_v1_mailboxSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mailboxSettings', 'MSGraphAPI_v1_mailboxSettings')


class MSGraphAPI_v1_mailboxSettings : MSGraphAPI_Base {
    [MSGraphAPI_v1_automaticRepliesSetting] $automaticRepliesSetting
    [string] $archiveFolder
    [string] $timeZone
    [MSGraphAPI_v1_localeInfo] $language
}
$null = $Script:MSGraphAPIClassHash.Add('automaticRepliesSetting', 'MSGraphAPI_v1_automaticRepliesSetting')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.automaticRepliesSetting', 'MSGraphAPI_v1_automaticRepliesSetting')


class MSGraphAPI_v1_automaticRepliesSetting : MSGraphAPI_Base {
    [MSGraphAPI_v1_automaticRepliesStatus] $status
    [MSGraphAPI_v1_externalAudienceScope] $externalAudience
    [MSGraphAPI_v1_dateTimeTimeZone] $scheduledStartDateTime
    [MSGraphAPI_v1_dateTimeTimeZone] $scheduledEndDateTime
    [string] $internalReplyMessage
    [string] $externalReplyMessage
}
$null = $Script:MSGraphAPIClassHash.Add('dateTimeTimeZone', 'MSGraphAPI_v1_dateTimeTimeZone')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.dateTimeTimeZone', 'MSGraphAPI_v1_dateTimeTimeZone')


class MSGraphAPI_v1_dateTimeTimeZone : MSGraphAPI_Base {
    [string] $dateTime
    [string] $timeZone
}
$null = $Script:MSGraphAPIClassHash.Add('localeInfo', 'MSGraphAPI_v1_localeInfo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.localeInfo', 'MSGraphAPI_v1_localeInfo')


class MSGraphAPI_v1_localeInfo : MSGraphAPI_Base {
    [string] $locale
    [string] $displayName
}
$null = $Script:MSGraphAPIClassHash.Add('message', 'MSGraphAPI_v1_message')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.message', 'MSGraphAPI_v1_message')


class MSGraphAPI_v1_message : MSGraphAPI_v1_outlookItem {
    [Nullable[DateTimeOffset]] $receivedDateTime
    [Nullable[DateTimeOffset]] $sentDateTime
    [Nullable[bool]] $hasAttachments
    [string] $internetMessageId
    [string] $subject
    [MSGraphAPI_v1_itemBody] $body
    [string] $bodyPreview
    [MSGraphAPI_v1_importance] $importance
    [string] $parentFolderId
    [MSGraphAPI_v1_recipient] $sender
    [MSGraphAPI_v1_recipient] $from
    [MSGraphAPI_v1_recipient[]] $toRecipients
    [MSGraphAPI_v1_recipient[]] $ccRecipients
    [MSGraphAPI_v1_recipient[]] $bccRecipients
    [MSGraphAPI_v1_recipient[]] $replyTo
    [string] $conversationId
    [MSGraphAPI_v1_itemBody] $uniqueBody
    [Nullable[bool]] $isDeliveryReceiptRequested
    [Nullable[bool]] $isReadReceiptRequested
    [Nullable[bool]] $isRead
    [Nullable[bool]] $isDraft
    [string] $webLink
    [MSGraphAPI_v1_inferenceClassificationType] $inferenceClassification
    [object]Get_attachments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/attachments")
    }
    [object]Get_extensions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/extensions")
    }
    [object]Get_singleValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/singleValueExtendedProperties")
    }
    [object]Get_multiValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/multiValueExtendedProperties")
    }
    [object]copy([string]$DestinationId){
        $ParamHash = @{
            'DestinationId'=$DestinationId
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'copy' -ParamHash $ParamHash)
    }
    [object]move([string]$DestinationId){
        $ParamHash = @{
            'DestinationId'=$DestinationId
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'move' -ParamHash $ParamHash)
    }
    [object]createReply(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'createReply')
    }
    [object]createReplyAll(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'createReplyAll')
    }
    [object]createForward(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'createForward')
    }
    [object]reply([string]$Comment){
        $ParamHash = @{
            'Comment'=$Comment
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'reply' -ParamHash $ParamHash)
    }
    [object]replyAll([string]$Comment){
        $ParamHash = @{
            'Comment'=$Comment
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'replyAll' -ParamHash $ParamHash)
    }
    [object]forward([string]$Comment,[object]$ToRecipients){
        $ParamHash = @{
            'Comment'=$Comment
            'ToRecipients'=$ToRecipients
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'forward' -ParamHash $ParamHash)
    }
    [object]send(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'send')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('mailFolder', 'MSGraphAPI_v1_mailFolder')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mailFolder', 'MSGraphAPI_v1_mailFolder')


class MSGraphAPI_v1_mailFolder : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $parentFolderId
    [Nullable[int]] $childFolderCount
    [Nullable[int]] $unreadItemCount
    [Nullable[int]] $totalItemCount
    [object]Get_messages(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/messages")
    }
    [object]Get_childFolders(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/childFolders")
    }
    [object]Get_singleValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/singleValueExtendedProperties")
    }
    [object]Get_multiValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/multiValueExtendedProperties")
    }
    [object]copy([string]$DestinationId){
        $ParamHash = @{
            'DestinationId'=$DestinationId
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'copy' -ParamHash $ParamHash)
    }
    [object]move([string]$DestinationId){
        $ParamHash = @{
            'DestinationId'=$DestinationId
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'move' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('calendarGroup', 'MSGraphAPI_v1_calendarGroup')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.calendarGroup', 'MSGraphAPI_v1_calendarGroup')


class MSGraphAPI_v1_calendarGroup : MSGraphAPI_v1_entity {
    [string] $name
    [Nullable[Guid]] $classId
    [string] $changeKey
    [object]Get_calendars(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/calendars")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('person', 'MSGraphAPI_v1_person')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.person', 'MSGraphAPI_v1_person')


class MSGraphAPI_v1_person : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $givenName
    [string] $surname
    [string] $birthday
    [string] $personNotes
    [Nullable[bool]] $isFavorite
    [MSGraphAPI_v1_scoredEmailAddress[]] $scoredEmailAddresses
    [MSGraphAPI_v1_phone[]] $phones
    [MSGraphAPI_v1_location[]] $postalAddresses
    [MSGraphAPI_v1_website[]] $websites
    [string] $jobTitle
    [string] $companyName
    [string] $yomiCompany
    [string] $department
    [string] $officeLocation
    [string] $profession
    [MSGraphAPI_v1_personType] $personType
    [string] $userPrincipalName
    [string] $imAddress



}
$null = $Script:MSGraphAPIClassHash.Add('contact', 'MSGraphAPI_v1_contact')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.contact', 'MSGraphAPI_v1_contact')


class MSGraphAPI_v1_contact : MSGraphAPI_v1_outlookItem {
    [string] $parentFolderId
    [Nullable[DateTimeOffset]] $birthday
    [string] $fileAs
    [string] $displayName
    [string] $givenName
    [string] $initials
    [string] $middleName
    [string] $nickName
    [string] $surname
    [string] $title
    [string] $yomiGivenName
    [string] $yomiSurname
    [string] $yomiCompanyName
    [string] $generation
    [MSGraphAPI_v1_emailAddress[]] $emailAddresses
    [string[]] $imAddresses
    [string] $jobTitle
    [string] $companyName
    [string] $department
    [string] $officeLocation
    [string] $profession
    [string] $businessHomePage
    [string] $assistantName
    [string] $manager
    [string[]] $homePhones
    [string] $mobilePhone
    [string[]] $businessPhones
    [MSGraphAPI_v1_physicalAddress] $homeAddress
    [MSGraphAPI_v1_physicalAddress] $businessAddress
    [MSGraphAPI_v1_physicalAddress] $otherAddress
    [string] $spouseName
    [string] $personalNotes
    [string[]] $children
    [object]Get_extensions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/extensions")
    }
    [object]Get_singleValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/singleValueExtendedProperties")
    }
    [object]Get_multiValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/multiValueExtendedProperties")
    }
    [object]Get_photo(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/photo")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('contactFolder', 'MSGraphAPI_v1_contactFolder')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.contactFolder', 'MSGraphAPI_v1_contactFolder')


class MSGraphAPI_v1_contactFolder : MSGraphAPI_v1_entity {
    [string] $parentFolderId
    [string] $displayName
    [object]Get_contacts(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/contacts")
    }
    [object]Get_childFolders(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/childFolders")
    }
    [object]Get_singleValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/singleValueExtendedProperties")
    }
    [object]Get_multiValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/multiValueExtendedProperties")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('inferenceClassification', 'MSGraphAPI_v1_inferenceClassification')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.inferenceClassification', 'MSGraphAPI_v1_inferenceClassification')


class MSGraphAPI_v1_inferenceClassification : MSGraphAPI_v1_entity {

    [object]Get_overrides(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/overrides")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('plannerUser', 'MSGraphAPI_v1_plannerUser')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerUser', 'MSGraphAPI_v1_plannerUser')


class MSGraphAPI_v1_plannerUser : MSGraphAPI_v1_entity {

    [object]Get_tasks(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/tasks")
    }
    [object]Get_plans(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/plans")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('managedDevice', 'MSGraphAPI_v1_managedDevice')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedDevice', 'MSGraphAPI_v1_managedDevice')


class MSGraphAPI_v1_managedDevice : MSGraphAPI_v1_entity {
    [string] $userId
    [string] $deviceName
    [MSGraphAPI_v1_deviceActionResult[]] $deviceActionResults
    [Nullable[DateTimeOffset]] $enrolledDateTime
    [Nullable[DateTimeOffset]] $lastSyncDateTime
    [string] $operatingSystem
    [MSGraphAPI_v1_complianceState] $complianceState
    [string] $jailBroken
    [MSGraphAPI_v1_managementAgentType] $managementAgent
    [string] $osVersion
    [Nullable[bool]] $easActivated
    [string] $easDeviceId
    [Nullable[DateTimeOffset]] $easActivationDateTime
    [Nullable[bool]] $azureADRegistered
    [MSGraphAPI_v1_deviceEnrollmentType] $deviceEnrollmentType
    [string] $activationLockBypassCode
    [string] $emailAddress
    [string] $azureADDeviceId
    [MSGraphAPI_v1_deviceRegistrationState] $deviceRegistrationState
    [string] $deviceCategoryDisplayName
    [Nullable[bool]] $isSupervised
    [Nullable[DateTimeOffset]] $exchangeLastSuccessfulSyncDateTime
    [MSGraphAPI_v1_deviceManagementExchangeAccessState] $exchangeAccessState
    [MSGraphAPI_v1_deviceManagementExchangeAccessStateReason] $exchangeAccessStateReason
    [string] $remoteAssistanceSessionUrl
    [string] $remoteAssistanceSessionErrorDetails
    [Nullable[bool]] $isEncrypted
    [string] $userPrincipalName
    [string] $model
    [string] $manufacturer
    [string] $imei
    [Nullable[DateTimeOffset]] $complianceGracePeriodExpirationDateTime
    [string] $serialNumber
    [string] $phoneNumber
    [string] $androidSecurityPatchLevel
    [string] $userDisplayName
    [MSGraphAPI_v1_configurationManagerClientEnabledFeatures] $configurationManagerClientEnabledFeatures
    [string] $wiFiMacAddress
    [MSGraphAPI_v1_deviceHealthAttestationState] $deviceHealthAttestationState
    [string] $subscriberCarrier
    [string] $meid
    [Nullable[int64]] $totalStorageSpaceInBytes
    [Nullable[int64]] $freeStorageSpaceInBytes
    [string] $managedDeviceName
    [MSGraphAPI_v1_managedDevicePartnerReportedHealthState] $partnerReportedThreatState
    [object]Get_deviceConfigurationStates(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceConfigurationStates")
    }
    [object]Get_deviceCategory(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceCategory")
    }
    [object]Get_deviceCompliancePolicyStates(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceCompliancePolicyStates")
    }
    [object]retire(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'retire')
    }
    [object]wipe([Nullable[bool]]$keepEnrollmentData,[Nullable[bool]]$keepUserData,[string]$macOsUnlockCode){
        $ParamHash = @{
            'keepEnrollmentData'=$keepEnrollmentData
            'keepUserData'=$keepUserData
            'macOsUnlockCode'=$macOsUnlockCode
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'wipe' -ParamHash $ParamHash)
    }
    [object]resetPasscode(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'resetPasscode')
    }
    [object]remoteLock(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'remoteLock')
    }
    [object]requestRemoteAssistance(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'requestRemoteAssistance')
    }
    [object]disableLostMode(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'disableLostMode')
    }
    [object]locateDevice(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'locateDevice')
    }
    [object]bypassActivationLock(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'bypassActivationLock')
    }
    [object]rebootNow(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'rebootNow')
    }
    [object]shutDown(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'shutDown')
    }
    [object]recoverPasscode(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'recoverPasscode')
    }
    [object]cleanWindowsDevice([Nullable[bool]]$keepUserData){
        $ParamHash = @{
            'keepUserData'=$keepUserData
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'cleanWindowsDevice' -ParamHash $ParamHash)
    }
    [object]logoutSharedAppleDeviceActiveUser(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'logoutSharedAppleDeviceActiveUser')
    }
    [object]deleteUserFromSharedAppleDevice([string]$userPrincipalName){
        $ParamHash = @{
            'userPrincipalName'=$userPrincipalName
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'deleteUserFromSharedAppleDevice' -ParamHash $ParamHash)
    }
    [object]syncDevice(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'syncDevice')
    }
    [object]windowsDefenderScan([Nullable[bool]]$quickScan){
        $ParamHash = @{
            'quickScan'=$quickScan
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'windowsDefenderScan' -ParamHash $ParamHash)
    }
    [object]windowsDefenderUpdateSignatures(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'windowsDefenderUpdateSignatures')
    }
    [object]updateWindowsDeviceAccount([object]$updateWindowsDeviceAccountActionParameter){
        $ParamHash = @{
            'updateWindowsDeviceAccountActionParameter'=$updateWindowsDeviceAccountActionParameter
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'updateWindowsDeviceAccount' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('managedAppRegistration', 'MSGraphAPI_v1_managedAppRegistration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppRegistration', 'MSGraphAPI_v1_managedAppRegistration')


class MSGraphAPI_v1_managedAppRegistration : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastSyncDateTime
    [string] $applicationVersion
    [string] $managementSdkVersion
    [string] $platformVersion
    [string] $deviceType
    [string] $deviceTag
    [string] $deviceName
    [MSGraphAPI_v1_managedAppFlaggedReason[]] $flaggedReasons
    [string] $userId
    [MSGraphAPI_v1_mobileAppIdentifier] $appIdentifier
    [string] $version
    [object]Get_appliedPolicies(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/appliedPolicies")
    }
    [object]Get_intendedPolicies(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/intendedPolicies")
    }
    [object]Get_operations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/operations")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('deviceManagementTroubleshootingEvent', 'MSGraphAPI_v1_deviceManagementTroubleshootingEvent')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceManagementTroubleshootingEvent', 'MSGraphAPI_v1_deviceManagementTroubleshootingEvent')


class MSGraphAPI_v1_deviceManagementTroubleshootingEvent : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $eventDateTime
    [string] $correlationId



}
$null = $Script:MSGraphAPIClassHash.Add('settingValue', 'MSGraphAPI_v1_settingValue')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.settingValue', 'MSGraphAPI_v1_settingValue')


class MSGraphAPI_v1_settingValue : MSGraphAPI_Base {
    [string] $name
    [string] $value
}
$null = $Script:MSGraphAPIClassHash.Add('groupSettingTemplate', 'MSGraphAPI_v1_groupSettingTemplate')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.groupSettingTemplate', 'MSGraphAPI_v1_groupSettingTemplate')


class MSGraphAPI_v1_groupSettingTemplate : MSGraphAPI_v1_directoryObject {
    [string] $displayName
    [string] $description
    [MSGraphAPI_v1_settingTemplateValue[]] $values



}
$null = $Script:MSGraphAPIClassHash.Add('settingTemplateValue', 'MSGraphAPI_v1_settingTemplateValue')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.settingTemplateValue', 'MSGraphAPI_v1_settingTemplateValue')


class MSGraphAPI_v1_settingTemplateValue : MSGraphAPI_Base {
    [string] $name
    [string] $type
    [string] $defaultValue
    [string] $description
}
$null = $Script:MSGraphAPIClassHash.Add('ComplexExtensionValue', 'MSGraphAPI_v1_ComplexExtensionValue')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.ComplexExtensionValue', 'MSGraphAPI_v1_ComplexExtensionValue')


class MSGraphAPI_v1_ComplexExtensionValue : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('schemaExtension', 'MSGraphAPI_v1_schemaExtension')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.schemaExtension', 'MSGraphAPI_v1_schemaExtension')


class MSGraphAPI_v1_schemaExtension : MSGraphAPI_v1_entity {
    [string] $description
    [string[]] $targetTypes
    [MSGraphAPI_v1_extensionSchemaProperty[]] $properties
    [string] $status
    [string] $owner



}
$null = $Script:MSGraphAPIClassHash.Add('extensionSchemaProperty', 'MSGraphAPI_v1_extensionSchemaProperty')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.extensionSchemaProperty', 'MSGraphAPI_v1_extensionSchemaProperty')


class MSGraphAPI_v1_extensionSchemaProperty : MSGraphAPI_Base {
    [string] $name
    [string] $type
}
$null = $Script:MSGraphAPIClassHash.Add('attachment', 'MSGraphAPI_v1_attachment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.attachment', 'MSGraphAPI_v1_attachment')


class MSGraphAPI_v1_attachment : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $name
    [string] $contentType
    [Nullable[int]] $size
    [Nullable[bool]] $isInline



}
$null = $Script:MSGraphAPIClassHash.Add('recipient', 'MSGraphAPI_v1_recipient')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.recipient', 'MSGraphAPI_v1_recipient')


class MSGraphAPI_v1_recipient : MSGraphAPI_Base {
    [MSGraphAPI_v1_emailAddress] $emailAddress
}
$null = $Script:MSGraphAPIClassHash.Add('emailAddress', 'MSGraphAPI_v1_emailAddress')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.emailAddress', 'MSGraphAPI_v1_emailAddress')


class MSGraphAPI_v1_emailAddress : MSGraphAPI_Base {
    [string] $name
    [string] $address
}
$null = $Script:MSGraphAPIClassHash.Add('attendeeBase', 'MSGraphAPI_v1_attendeeBase')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.attendeeBase', 'MSGraphAPI_v1_attendeeBase')


class MSGraphAPI_v1_attendeeBase : MSGraphAPI_v1_recipient {
    [MSGraphAPI_v1_attendeeType] $type
}
$null = $Script:MSGraphAPIClassHash.Add('meetingTimeSuggestionsResult', 'MSGraphAPI_v1_meetingTimeSuggestionsResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.meetingTimeSuggestionsResult', 'MSGraphAPI_v1_meetingTimeSuggestionsResult')


class MSGraphAPI_v1_meetingTimeSuggestionsResult : MSGraphAPI_Base {
    [MSGraphAPI_v1_meetingTimeSuggestion[]] $meetingTimeSuggestions
    [string] $emptySuggestionsReason
}
$null = $Script:MSGraphAPIClassHash.Add('meetingTimeSuggestion', 'MSGraphAPI_v1_meetingTimeSuggestion')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.meetingTimeSuggestion', 'MSGraphAPI_v1_meetingTimeSuggestion')


class MSGraphAPI_v1_meetingTimeSuggestion : MSGraphAPI_Base {
    [MSGraphAPI_v1_timeSlot] $meetingTimeSlot
    [Nullable[Double]] $confidence
    [MSGraphAPI_v1_freeBusyStatus] $organizerAvailability
    [MSGraphAPI_v1_attendeeAvailability[]] $attendeeAvailability
    [MSGraphAPI_v1_location[]] $locations
    [string] $suggestionReason
}
$null = $Script:MSGraphAPIClassHash.Add('timeSlot', 'MSGraphAPI_v1_timeSlot')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.timeSlot', 'MSGraphAPI_v1_timeSlot')


class MSGraphAPI_v1_timeSlot : MSGraphAPI_Base {
    [MSGraphAPI_v1_dateTimeTimeZone] $start
    [MSGraphAPI_v1_dateTimeTimeZone] $end
}
$null = $Script:MSGraphAPIClassHash.Add('attendeeAvailability', 'MSGraphAPI_v1_attendeeAvailability')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.attendeeAvailability', 'MSGraphAPI_v1_attendeeAvailability')


class MSGraphAPI_v1_attendeeAvailability : MSGraphAPI_Base {
    [MSGraphAPI_v1_attendeeBase] $attendee
    [MSGraphAPI_v1_freeBusyStatus] $availability
}
$null = $Script:MSGraphAPIClassHash.Add('location', 'MSGraphAPI_v1_location')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.location', 'MSGraphAPI_v1_location')


class MSGraphAPI_v1_location : MSGraphAPI_Base {
    [string] $displayName
    [string] $locationEmailAddress
    [MSGraphAPI_v1_physicalAddress] $address
}
$null = $Script:MSGraphAPIClassHash.Add('physicalAddress', 'MSGraphAPI_v1_physicalAddress')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.physicalAddress', 'MSGraphAPI_v1_physicalAddress')


class MSGraphAPI_v1_physicalAddress : MSGraphAPI_Base {
    [string] $street
    [string] $city
    [string] $state
    [string] $countryOrRegion
    [string] $postalCode
}
$null = $Script:MSGraphAPIClassHash.Add('locationConstraint', 'MSGraphAPI_v1_locationConstraint')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.locationConstraint', 'MSGraphAPI_v1_locationConstraint')


class MSGraphAPI_v1_locationConstraint : MSGraphAPI_Base {
    [Nullable[bool]] $isRequired
    [Nullable[bool]] $suggestLocation
    [MSGraphAPI_v1_locationConstraintItem[]] $locations
}
$null = $Script:MSGraphAPIClassHash.Add('locationConstraintItem', 'MSGraphAPI_v1_locationConstraintItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.locationConstraintItem', 'MSGraphAPI_v1_locationConstraintItem')


class MSGraphAPI_v1_locationConstraintItem : MSGraphAPI_v1_location {
    [Nullable[bool]] $resolveAvailability
}
$null = $Script:MSGraphAPIClassHash.Add('timeConstraint', 'MSGraphAPI_v1_timeConstraint')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.timeConstraint', 'MSGraphAPI_v1_timeConstraint')


class MSGraphAPI_v1_timeConstraint : MSGraphAPI_Base {
    [MSGraphAPI_v1_activityDomain] $activityDomain
    [MSGraphAPI_v1_timeSlot[]] $timeslots
}
$null = $Script:MSGraphAPIClassHash.Add('reminder', 'MSGraphAPI_v1_reminder')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.reminder', 'MSGraphAPI_v1_reminder')


class MSGraphAPI_v1_reminder : MSGraphAPI_Base {
    [string] $eventId
    [MSGraphAPI_v1_dateTimeTimeZone] $eventStartTime
    [MSGraphAPI_v1_dateTimeTimeZone] $eventEndTime
    [string] $changeKey
    [string] $eventSubject
    [MSGraphAPI_v1_location] $eventLocation
    [string] $eventWebLink
    [MSGraphAPI_v1_dateTimeTimeZone] $reminderFireTime
}
$null = $Script:MSGraphAPIClassHash.Add('singleValueLegacyExtendedProperty', 'MSGraphAPI_v1_singleValueLegacyExtendedProperty')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.singleValueLegacyExtendedProperty', 'MSGraphAPI_v1_singleValueLegacyExtendedProperty')


class MSGraphAPI_v1_singleValueLegacyExtendedProperty : MSGraphAPI_v1_entity {
    [string] $value



}
$null = $Script:MSGraphAPIClassHash.Add('multiValueLegacyExtendedProperty', 'MSGraphAPI_v1_multiValueLegacyExtendedProperty')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.multiValueLegacyExtendedProperty', 'MSGraphAPI_v1_multiValueLegacyExtendedProperty')


class MSGraphAPI_v1_multiValueLegacyExtendedProperty : MSGraphAPI_v1_entity {
    [string[]] $value



}
$null = $Script:MSGraphAPIClassHash.Add('itemBody', 'MSGraphAPI_v1_itemBody')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.itemBody', 'MSGraphAPI_v1_itemBody')


class MSGraphAPI_v1_itemBody : MSGraphAPI_Base {
    [MSGraphAPI_v1_bodyType] $contentType
    [string] $content
}
$null = $Script:MSGraphAPIClassHash.Add('fileAttachment', 'MSGraphAPI_v1_fileAttachment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.fileAttachment', 'MSGraphAPI_v1_fileAttachment')


class MSGraphAPI_v1_fileAttachment : MSGraphAPI_v1_attachment {
    [string] $contentId
    [string] $contentLocation
    [object] $contentBytes



}
$null = $Script:MSGraphAPIClassHash.Add('itemAttachment', 'MSGraphAPI_v1_itemAttachment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.itemAttachment', 'MSGraphAPI_v1_itemAttachment')


class MSGraphAPI_v1_itemAttachment : MSGraphAPI_v1_attachment {

    [object]Get_item(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/item")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('responseStatus', 'MSGraphAPI_v1_responseStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.responseStatus', 'MSGraphAPI_v1_responseStatus')


class MSGraphAPI_v1_responseStatus : MSGraphAPI_Base {
    [MSGraphAPI_v1_responseType] $response
    [Nullable[DateTimeOffset]] $time
}
$null = $Script:MSGraphAPIClassHash.Add('patternedRecurrence', 'MSGraphAPI_v1_patternedRecurrence')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.patternedRecurrence', 'MSGraphAPI_v1_patternedRecurrence')


class MSGraphAPI_v1_patternedRecurrence : MSGraphAPI_Base {
    [MSGraphAPI_v1_recurrencePattern] $pattern
    [MSGraphAPI_v1_recurrenceRange] $range
}
$null = $Script:MSGraphAPIClassHash.Add('recurrencePattern', 'MSGraphAPI_v1_recurrencePattern')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.recurrencePattern', 'MSGraphAPI_v1_recurrencePattern')


class MSGraphAPI_v1_recurrencePattern : MSGraphAPI_Base {
    [MSGraphAPI_v1_recurrencePatternType] $type
    [Nullable[int]] $interval
    [Nullable[int]] $month
    [Nullable[int]] $dayOfMonth
    [MSGraphAPI_v1_dayOfWeek[]] $daysOfWeek
    [MSGraphAPI_v1_dayOfWeek] $firstDayOfWeek
    [MSGraphAPI_v1_weekIndex] $index
}
$null = $Script:MSGraphAPIClassHash.Add('recurrenceRange', 'MSGraphAPI_v1_recurrenceRange')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.recurrenceRange', 'MSGraphAPI_v1_recurrenceRange')


class MSGraphAPI_v1_recurrenceRange : MSGraphAPI_Base {
    [MSGraphAPI_v1_recurrenceRangeType] $type
    [Nullable[DateTime]] $startDate
    [Nullable[DateTime]] $endDate
    [string] $recurrenceTimeZone
    [Nullable[int]] $numberOfOccurrences
}
$null = $Script:MSGraphAPIClassHash.Add('attendee', 'MSGraphAPI_v1_attendee')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.attendee', 'MSGraphAPI_v1_attendee')


class MSGraphAPI_v1_attendee : MSGraphAPI_v1_attendeeBase {
    [MSGraphAPI_v1_responseStatus] $status
}
$null = $Script:MSGraphAPIClassHash.Add('eventMessage', 'MSGraphAPI_v1_eventMessage')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.eventMessage', 'MSGraphAPI_v1_eventMessage')


class MSGraphAPI_v1_eventMessage : MSGraphAPI_v1_message {
    [MSGraphAPI_v1_meetingMessageType] $meetingMessageType
    [object]Get_event(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/event")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('referenceAttachment', 'MSGraphAPI_v1_referenceAttachment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.referenceAttachment', 'MSGraphAPI_v1_referenceAttachment')


class MSGraphAPI_v1_referenceAttachment : MSGraphAPI_v1_attachment {




}
$null = $Script:MSGraphAPIClassHash.Add('openTypeExtension', 'MSGraphAPI_v1_openTypeExtension')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.openTypeExtension', 'MSGraphAPI_v1_openTypeExtension')


class MSGraphAPI_v1_openTypeExtension : MSGraphAPI_v1_extension {
    [string] $extensionName



}
$null = $Script:MSGraphAPIClassHash.Add('post', 'MSGraphAPI_v1_post')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.post', 'MSGraphAPI_v1_post')


class MSGraphAPI_v1_post : MSGraphAPI_v1_outlookItem {
    [MSGraphAPI_v1_itemBody] $body
    [Nullable[DateTimeOffset]] $receivedDateTime
    [Nullable[bool]] $hasAttachments
    [MSGraphAPI_v1_recipient] $from
    [MSGraphAPI_v1_recipient] $sender
    [string] $conversationThreadId
    [MSGraphAPI_v1_recipient[]] $newParticipants
    [string] $conversationId
    [object]Get_extensions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/extensions")
    }
    [object]Get_inReplyTo(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/inReplyTo")
    }
    [object]Get_attachments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/attachments")
    }
    [object]Get_singleValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/singleValueExtendedProperties")
    }
    [object]Get_multiValueExtendedProperties(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/multiValueExtendedProperties")
    }
    [object]forward([string]$Comment,[object]$ToRecipients){
        $ParamHash = @{
            'Comment'=$Comment
            'ToRecipients'=$ToRecipients
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'forward' -ParamHash $ParamHash)
    }
    [object]reply([object]$Post){
        $ParamHash = @{
            'Post'=$Post
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'reply' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('inferenceClassificationOverride', 'MSGraphAPI_v1_inferenceClassificationOverride')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.inferenceClassificationOverride', 'MSGraphAPI_v1_inferenceClassificationOverride')


class MSGraphAPI_v1_inferenceClassificationOverride : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_inferenceClassificationType] $classifyAs
    [MSGraphAPI_v1_emailAddress] $senderEmailAddress



}
$null = $Script:MSGraphAPIClassHash.Add('scoredEmailAddress', 'MSGraphAPI_v1_scoredEmailAddress')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.scoredEmailAddress', 'MSGraphAPI_v1_scoredEmailAddress')


class MSGraphAPI_v1_scoredEmailAddress : MSGraphAPI_Base {
    [string] $address
    [Nullable[Double]] $relevanceScore
}
$null = $Script:MSGraphAPIClassHash.Add('phone', 'MSGraphAPI_v1_phone')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.phone', 'MSGraphAPI_v1_phone')


class MSGraphAPI_v1_phone : MSGraphAPI_Base {
    [MSGraphAPI_v1_phoneType] $type
    [string] $number
    [string] $region
    [string] $language
}
$null = $Script:MSGraphAPIClassHash.Add('website', 'MSGraphAPI_v1_website')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.website', 'MSGraphAPI_v1_website')


class MSGraphAPI_v1_website : MSGraphAPI_Base {
    [MSGraphAPI_v1_websiteType] $type
    [string] $address
    [string] $displayName
}
$null = $Script:MSGraphAPIClassHash.Add('personType', 'MSGraphAPI_v1_personType')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.personType', 'MSGraphAPI_v1_personType')


class MSGraphAPI_v1_personType : MSGraphAPI_Base {
    [string] $class
    [string] $subclass
}
$null = $Script:MSGraphAPIClassHash.Add('identitySet', 'MSGraphAPI_v1_identitySet')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.identitySet', 'MSGraphAPI_v1_identitySet')


class MSGraphAPI_v1_identitySet : MSGraphAPI_Base {
    [MSGraphAPI_v1_identity] $application
    [MSGraphAPI_v1_identity] $device
    [MSGraphAPI_v1_identity] $user
}
$null = $Script:MSGraphAPIClassHash.Add('identity', 'MSGraphAPI_v1_identity')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.identity', 'MSGraphAPI_v1_identity')


class MSGraphAPI_v1_identity : MSGraphAPI_Base {
    [string] $displayName
    [string] $id
}
$null = $Script:MSGraphAPIClassHash.Add('itemReference', 'MSGraphAPI_v1_itemReference')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.itemReference', 'MSGraphAPI_v1_itemReference')


class MSGraphAPI_v1_itemReference : MSGraphAPI_Base {
    [string] $driveId
    [string] $driveType
    [string] $id
    [string] $name
    [string] $path
    [string] $shareId
    [MSGraphAPI_v1_sharepointIds] $sharepointIds
}
$null = $Script:MSGraphAPIClassHash.Add('sharepointIds', 'MSGraphAPI_v1_sharepointIds')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.sharepointIds', 'MSGraphAPI_v1_sharepointIds')


class MSGraphAPI_v1_sharepointIds : MSGraphAPI_Base {
    [string] $listId
    [string] $listItemId
    [string] $listItemUniqueId
    [string] $siteId
    [string] $siteUrl
    [string] $webId
}
$null = $Script:MSGraphAPIClassHash.Add('columnDefinition', 'MSGraphAPI_v1_columnDefinition')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.columnDefinition', 'MSGraphAPI_v1_columnDefinition')


class MSGraphAPI_v1_columnDefinition : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_booleanColumn] $boolean
    [MSGraphAPI_v1_calculatedColumn] $calculated
    [MSGraphAPI_v1_choiceColumn] $choice
    [string] $columnGroup
    [MSGraphAPI_v1_currencyColumn] $currency
    [MSGraphAPI_v1_dateTimeColumn] $dateTime
    [MSGraphAPI_v1_defaultColumnValue] $defaultValue
    [string] $description
    [string] $displayName
    [Nullable[bool]] $enforceUniqueValues
    [Nullable[bool]] $hidden
    [Nullable[bool]] $indexed
    [MSGraphAPI_v1_lookupColumn] $lookup
    [string] $name
    [MSGraphAPI_v1_numberColumn] $number
    [MSGraphAPI_v1_personOrGroupColumn] $personOrGroup
    [Nullable[bool]] $readOnly
    [Nullable[bool]] $required
    [MSGraphAPI_v1_textColumn] $text



}
$null = $Script:MSGraphAPIClassHash.Add('booleanColumn', 'MSGraphAPI_v1_booleanColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.booleanColumn', 'MSGraphAPI_v1_booleanColumn')


class MSGraphAPI_v1_booleanColumn : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('calculatedColumn', 'MSGraphAPI_v1_calculatedColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.calculatedColumn', 'MSGraphAPI_v1_calculatedColumn')


class MSGraphAPI_v1_calculatedColumn : MSGraphAPI_Base {
    [string] $format
    [string] $formula
    [string] $outputType
}
$null = $Script:MSGraphAPIClassHash.Add('choiceColumn', 'MSGraphAPI_v1_choiceColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.choiceColumn', 'MSGraphAPI_v1_choiceColumn')


class MSGraphAPI_v1_choiceColumn : MSGraphAPI_Base {
    [Nullable[bool]] $allowTextEntry
    [string[]] $choices
    [string] $displayAs
}
$null = $Script:MSGraphAPIClassHash.Add('currencyColumn', 'MSGraphAPI_v1_currencyColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.currencyColumn', 'MSGraphAPI_v1_currencyColumn')


class MSGraphAPI_v1_currencyColumn : MSGraphAPI_Base {
    [string] $locale
}
$null = $Script:MSGraphAPIClassHash.Add('dateTimeColumn', 'MSGraphAPI_v1_dateTimeColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.dateTimeColumn', 'MSGraphAPI_v1_dateTimeColumn')


class MSGraphAPI_v1_dateTimeColumn : MSGraphAPI_Base {
    [string] $displayAs
    [string] $format
}
$null = $Script:MSGraphAPIClassHash.Add('defaultColumnValue', 'MSGraphAPI_v1_defaultColumnValue')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.defaultColumnValue', 'MSGraphAPI_v1_defaultColumnValue')


class MSGraphAPI_v1_defaultColumnValue : MSGraphAPI_Base {
    [string] $formula
    [string] $value
}
$null = $Script:MSGraphAPIClassHash.Add('lookupColumn', 'MSGraphAPI_v1_lookupColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.lookupColumn', 'MSGraphAPI_v1_lookupColumn')


class MSGraphAPI_v1_lookupColumn : MSGraphAPI_Base {
    [Nullable[bool]] $allowMultipleValues
    [Nullable[bool]] $allowUnlimitedLength
    [string] $columnName
    [string] $listId
    [string] $primaryLookupColumnId
}
$null = $Script:MSGraphAPIClassHash.Add('numberColumn', 'MSGraphAPI_v1_numberColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.numberColumn', 'MSGraphAPI_v1_numberColumn')


class MSGraphAPI_v1_numberColumn : MSGraphAPI_Base {
    [string] $decimalPlaces
    [string] $displayAs
    [Nullable[Double]] $maximum
    [Nullable[Double]] $minimum
}
$null = $Script:MSGraphAPIClassHash.Add('personOrGroupColumn', 'MSGraphAPI_v1_personOrGroupColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.personOrGroupColumn', 'MSGraphAPI_v1_personOrGroupColumn')


class MSGraphAPI_v1_personOrGroupColumn : MSGraphAPI_Base {
    [Nullable[bool]] $allowMultipleSelection
    [string] $displayAs
    [string] $chooseFromType
}
$null = $Script:MSGraphAPIClassHash.Add('textColumn', 'MSGraphAPI_v1_textColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.textColumn', 'MSGraphAPI_v1_textColumn')


class MSGraphAPI_v1_textColumn : MSGraphAPI_Base {
    [Nullable[bool]] $allowMultipleLines
    [Nullable[bool]] $appendChangesToExistingText
    [Nullable[int]] $linesForEditing
    [Nullable[int]] $maxLength
    [string] $textType
}
$null = $Script:MSGraphAPIClassHash.Add('columnLink', 'MSGraphAPI_v1_columnLink')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.columnLink', 'MSGraphAPI_v1_columnLink')


class MSGraphAPI_v1_columnLink : MSGraphAPI_v1_entity {
    [string] $name



}
$null = $Script:MSGraphAPIClassHash.Add('contentType', 'MSGraphAPI_v1_contentType')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.contentType', 'MSGraphAPI_v1_contentType')


class MSGraphAPI_v1_contentType : MSGraphAPI_v1_entity {
    [string] $description
    [string] $group
    [Nullable[bool]] $hidden
    [MSGraphAPI_v1_itemReference] $inheritedFrom
    [string] $name
    [MSGraphAPI_v1_contentTypeOrder] $order
    [string] $parentId
    [Nullable[bool]] $readOnly
    [Nullable[bool]] $sealed
    [object]Get_columnLinks(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/columnLinks")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('contentTypeOrder', 'MSGraphAPI_v1_contentTypeOrder')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.contentTypeOrder', 'MSGraphAPI_v1_contentTypeOrder')


class MSGraphAPI_v1_contentTypeOrder : MSGraphAPI_Base {
    [Nullable[bool]] $default
    [Nullable[int]] $position
}
$null = $Script:MSGraphAPIClassHash.Add('quota', 'MSGraphAPI_v1_quota')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.quota', 'MSGraphAPI_v1_quota')


class MSGraphAPI_v1_quota : MSGraphAPI_Base {
    [Nullable[int64]] $deleted
    [Nullable[int64]] $remaining
    [string] $state
    [Nullable[int64]] $total
    [Nullable[int64]] $used
}
$null = $Script:MSGraphAPIClassHash.Add('systemFacet', 'MSGraphAPI_v1_systemFacet')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.systemFacet', 'MSGraphAPI_v1_systemFacet')


class MSGraphAPI_v1_systemFacet : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('driveItem', 'MSGraphAPI_v1_driveItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.driveItem', 'MSGraphAPI_v1_driveItem')


class MSGraphAPI_v1_driveItem : MSGraphAPI_v1_baseItem {
    [MSGraphAPI_v1_audio] $audio
    [object] $content
    [string] $cTag
    [MSGraphAPI_v1_deleted] $deleted
    [MSGraphAPI_v1_file] $file
    [MSGraphAPI_v1_fileSystemInfo] $fileSystemInfo
    [MSGraphAPI_v1_folder] $folder
    [MSGraphAPI_v1_image] $image
    [MSGraphAPI_v1_geoCoordinates] $location
    [MSGraphAPI_v1_package] $package
    [MSGraphAPI_v1_photo] $photo
    [MSGraphAPI_v1_remoteItem] $remoteItem
    [MSGraphAPI_v1_root] $root
    [MSGraphAPI_v1_searchResult] $searchResult
    [MSGraphAPI_v1_shared] $shared
    [MSGraphAPI_v1_sharepointIds] $sharepointIds
    [Nullable[int64]] $size
    [MSGraphAPI_v1_specialFolder] $specialFolder
    [MSGraphAPI_v1_video] $video
    [string] $webDavUrl
    [object]Get_children(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/children")
    }
    [object]Get_listItem(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/listItem")
    }
    [object]Get_permissions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/permissions")
    }
    [object]Get_thumbnails(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/thumbnails")
    }
    [object]Get_workbook(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/workbook")
    }
    [object]copy([string]$name,[object]$parentReference){
        $ParamHash = @{
            'name'=$name
            'parentReference'=$parentReference
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'copy' -ParamHash $ParamHash)
    }
    [object]createLink([string]$type,[string]$scope){
        $ParamHash = @{
            'type'=$type
            'scope'=$scope
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'createLink' -ParamHash $ParamHash)
    }
    [object]createUploadSession([object]$item){
        $ParamHash = @{
            'item'=$item
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'createUploadSession' -ParamHash $ParamHash)
    }
    [object]invite([Nullable[bool]]$requireSignIn,[string[]]$roles,[Nullable[bool]]$sendInvitation,[string]$message,[object]$recipients){
        $ParamHash = @{
            'requireSignIn'=$requireSignIn
            'roles'=$roles
            'sendInvitation'=$sendInvitation
            'message'=$message
            'recipients'=$recipients
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'invite' -ParamHash $ParamHash)
    }
    [object]delta([string]$token){
        $ParamHash = @{
            'token'=$token
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'delta' -ParamHash $ParamHash)
    }
    [object]delta(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'delta')
    }
    [object]search([string]$q){
        $ParamHash = @{
            'q'=$q
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'search' -ParamHash $ParamHash)
    }
}
$null = $Script:MSGraphAPIClassHash.Add('list', 'MSGraphAPI_v1_list')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.list', 'MSGraphAPI_v1_list')


class MSGraphAPI_v1_list : MSGraphAPI_v1_baseItem {
    [string] $displayName
    [MSGraphAPI_v1_listInfo] $list
    [MSGraphAPI_v1_sharepointIds] $sharepointIds
    [MSGraphAPI_v1_systemFacet] $system
    [object]Get_columns(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/columns")
    }
    [object]Get_contentTypes(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/contentTypes")
    }
    [object]Get_drive(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/drive")
    }
    [object]Get_items(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/items")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('audio', 'MSGraphAPI_v1_audio')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.audio', 'MSGraphAPI_v1_audio')


class MSGraphAPI_v1_audio : MSGraphAPI_Base {
    [string] $album
    [string] $albumArtist
    [string] $artist
    [Nullable[int64]] $bitrate
    [string] $composers
    [string] $copyright
    [Nullable[int16]] $disc
    [Nullable[int16]] $discCount
    [Nullable[int64]] $duration
    [string] $genre
    [Nullable[bool]] $hasDrm
    [Nullable[bool]] $isVariableBitrate
    [string] $title
    [Nullable[int]] $track
    [Nullable[int]] $trackCount
    [Nullable[int]] $year
}
$null = $Script:MSGraphAPIClassHash.Add('deleted', 'MSGraphAPI_v1_deleted')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deleted', 'MSGraphAPI_v1_deleted')


class MSGraphAPI_v1_deleted : MSGraphAPI_Base {
    [string] $state
}
$null = $Script:MSGraphAPIClassHash.Add('file', 'MSGraphAPI_v1_file')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.file', 'MSGraphAPI_v1_file')


class MSGraphAPI_v1_file : MSGraphAPI_Base {
    [MSGraphAPI_v1_hashes] $hashes
    [string] $mimeType
    [Nullable[bool]] $processingMetadata
}
$null = $Script:MSGraphAPIClassHash.Add('hashes', 'MSGraphAPI_v1_hashes')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.hashes', 'MSGraphAPI_v1_hashes')


class MSGraphAPI_v1_hashes : MSGraphAPI_Base {
    [string] $crc32Hash
    [string] $quickXorHash
    [string] $sha1Hash
}
$null = $Script:MSGraphAPIClassHash.Add('fileSystemInfo', 'MSGraphAPI_v1_fileSystemInfo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.fileSystemInfo', 'MSGraphAPI_v1_fileSystemInfo')


class MSGraphAPI_v1_fileSystemInfo : MSGraphAPI_Base {
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastAccessedDateTime
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
}
$null = $Script:MSGraphAPIClassHash.Add('folder', 'MSGraphAPI_v1_folder')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.folder', 'MSGraphAPI_v1_folder')


class MSGraphAPI_v1_folder : MSGraphAPI_Base {
    [Nullable[int]] $childCount
    [MSGraphAPI_v1_folderView] $view
}
$null = $Script:MSGraphAPIClassHash.Add('folderView', 'MSGraphAPI_v1_folderView')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.folderView', 'MSGraphAPI_v1_folderView')


class MSGraphAPI_v1_folderView : MSGraphAPI_Base {
    [string] $sortBy
    [string] $sortOrder
    [string] $viewType
}
$null = $Script:MSGraphAPIClassHash.Add('image', 'MSGraphAPI_v1_image')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.image', 'MSGraphAPI_v1_image')


class MSGraphAPI_v1_image : MSGraphAPI_Base {
    [Nullable[int]] $height
    [Nullable[int]] $width
}
$null = $Script:MSGraphAPIClassHash.Add('geoCoordinates', 'MSGraphAPI_v1_geoCoordinates')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.geoCoordinates', 'MSGraphAPI_v1_geoCoordinates')


class MSGraphAPI_v1_geoCoordinates : MSGraphAPI_Base {
    [Nullable[Double]] $altitude
    [Nullable[Double]] $latitude
    [Nullable[Double]] $longitude
}
$null = $Script:MSGraphAPIClassHash.Add('package', 'MSGraphAPI_v1_package')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.package', 'MSGraphAPI_v1_package')


class MSGraphAPI_v1_package : MSGraphAPI_Base {
    [string] $type
}
$null = $Script:MSGraphAPIClassHash.Add('photo', 'MSGraphAPI_v1_photo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.photo', 'MSGraphAPI_v1_photo')


class MSGraphAPI_v1_photo : MSGraphAPI_Base {
    [string] $cameraMake
    [string] $cameraModel
    [Nullable[Double]] $exposureDenominator
    [Nullable[Double]] $exposureNumerator
    [Nullable[Double]] $fNumber
    [Nullable[Double]] $focalLength
    [Nullable[int]] $iso
    [Nullable[DateTimeOffset]] $takenDateTime
}
$null = $Script:MSGraphAPIClassHash.Add('remoteItem', 'MSGraphAPI_v1_remoteItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.remoteItem', 'MSGraphAPI_v1_remoteItem')


class MSGraphAPI_v1_remoteItem : MSGraphAPI_Base {
    [MSGraphAPI_v1_identitySet] $createdBy
    [Nullable[DateTimeOffset]] $createdDateTime
    [MSGraphAPI_v1_file] $file
    [MSGraphAPI_v1_fileSystemInfo] $fileSystemInfo
    [MSGraphAPI_v1_folder] $folder
    [string] $id
    [MSGraphAPI_v1_identitySet] $lastModifiedBy
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $name
    [MSGraphAPI_v1_package] $package
    [MSGraphAPI_v1_itemReference] $parentReference
    [MSGraphAPI_v1_shared] $shared
    [MSGraphAPI_v1_sharepointIds] $sharepointIds
    [Nullable[int64]] $size
    [MSGraphAPI_v1_specialFolder] $specialFolder
    [string] $webDavUrl
    [string] $webUrl
}
$null = $Script:MSGraphAPIClassHash.Add('shared', 'MSGraphAPI_v1_shared')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.shared', 'MSGraphAPI_v1_shared')


class MSGraphAPI_v1_shared : MSGraphAPI_Base {
    [MSGraphAPI_v1_identitySet] $owner
    [string] $scope
    [MSGraphAPI_v1_identitySet] $sharedBy
    [Nullable[DateTimeOffset]] $sharedDateTime
}
$null = $Script:MSGraphAPIClassHash.Add('specialFolder', 'MSGraphAPI_v1_specialFolder')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.specialFolder', 'MSGraphAPI_v1_specialFolder')


class MSGraphAPI_v1_specialFolder : MSGraphAPI_Base {
    [string] $name
}
$null = $Script:MSGraphAPIClassHash.Add('root', 'MSGraphAPI_v1_root')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.root', 'MSGraphAPI_v1_root')


class MSGraphAPI_v1_root : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('searchResult', 'MSGraphAPI_v1_searchResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.searchResult', 'MSGraphAPI_v1_searchResult')


class MSGraphAPI_v1_searchResult : MSGraphAPI_Base {
    [string] $onClickTelemetryUrl
}
$null = $Script:MSGraphAPIClassHash.Add('video', 'MSGraphAPI_v1_video')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.video', 'MSGraphAPI_v1_video')


class MSGraphAPI_v1_video : MSGraphAPI_Base {
    [Nullable[int]] $audioBitsPerSample
    [Nullable[int]] $audioChannels
    [string] $audioFormat
    [Nullable[int]] $audioSamplesPerSecond
    [Nullable[int]] $bitrate
    [Nullable[int64]] $duration
    [string] $fourCC
    [Nullable[Double]] $frameRate
    [Nullable[int]] $height
    [Nullable[int]] $width
}
$null = $Script:MSGraphAPIClassHash.Add('listItem', 'MSGraphAPI_v1_listItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.listItem', 'MSGraphAPI_v1_listItem')


class MSGraphAPI_v1_listItem : MSGraphAPI_v1_baseItem {
    [MSGraphAPI_v1_contentTypeInfo] $contentType
    [MSGraphAPI_v1_sharepointIds] $sharepointIds
    [object]Get_driveItem(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/driveItem")
    }
    [object]Get_fields(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/fields")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('permission', 'MSGraphAPI_v1_permission')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.permission', 'MSGraphAPI_v1_permission')


class MSGraphAPI_v1_permission : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_identitySet] $grantedTo
    [MSGraphAPI_v1_itemReference] $inheritedFrom
    [MSGraphAPI_v1_sharingInvitation] $invitation
    [MSGraphAPI_v1_sharingLink] $link
    [string[]] $roles
    [string] $shareId



}
$null = $Script:MSGraphAPIClassHash.Add('thumbnailSet', 'MSGraphAPI_v1_thumbnailSet')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.thumbnailSet', 'MSGraphAPI_v1_thumbnailSet')


class MSGraphAPI_v1_thumbnailSet : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_thumbnail] $large
    [MSGraphAPI_v1_thumbnail] $medium
    [MSGraphAPI_v1_thumbnail] $small
    [MSGraphAPI_v1_thumbnail] $source



}
$null = $Script:MSGraphAPIClassHash.Add('workbook', 'MSGraphAPI_v1_workbook')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbook', 'MSGraphAPI_v1_workbook')


class MSGraphAPI_v1_workbook : MSGraphAPI_v1_entity {

    [object]Get_application(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/application")
    }
    [object]Get_names(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/names")
    }
    [object]Get_tables(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/tables")
    }
    [object]Get_worksheets(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/worksheets")
    }
    [object]Get_functions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/functions")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('fieldValueSet', 'MSGraphAPI_v1_fieldValueSet')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.fieldValueSet', 'MSGraphAPI_v1_fieldValueSet')


class MSGraphAPI_v1_fieldValueSet : MSGraphAPI_v1_entity {




}
$null = $Script:MSGraphAPIClassHash.Add('listInfo', 'MSGraphAPI_v1_listInfo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.listInfo', 'MSGraphAPI_v1_listInfo')


class MSGraphAPI_v1_listInfo : MSGraphAPI_Base {
    [Nullable[bool]] $contentTypesEnabled
    [Nullable[bool]] $hidden
    [string] $template
}
$null = $Script:MSGraphAPIClassHash.Add('contentTypeInfo', 'MSGraphAPI_v1_contentTypeInfo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.contentTypeInfo', 'MSGraphAPI_v1_contentTypeInfo')


class MSGraphAPI_v1_contentTypeInfo : MSGraphAPI_Base {
    [string] $id
}
$null = $Script:MSGraphAPIClassHash.Add('sharingInvitation', 'MSGraphAPI_v1_sharingInvitation')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.sharingInvitation', 'MSGraphAPI_v1_sharingInvitation')


class MSGraphAPI_v1_sharingInvitation : MSGraphAPI_Base {
    [string] $email
    [MSGraphAPI_v1_identitySet] $invitedBy
    [string] $redeemedBy
    [Nullable[bool]] $signInRequired
}
$null = $Script:MSGraphAPIClassHash.Add('sharingLink', 'MSGraphAPI_v1_sharingLink')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.sharingLink', 'MSGraphAPI_v1_sharingLink')


class MSGraphAPI_v1_sharingLink : MSGraphAPI_Base {
    [MSGraphAPI_v1_identity] $application
    [string] $scope
    [string] $type
    [string] $webUrl
}
$null = $Script:MSGraphAPIClassHash.Add('sharedDriveItem', 'MSGraphAPI_v1_sharedDriveItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.sharedDriveItem', 'MSGraphAPI_v1_sharedDriveItem')


class MSGraphAPI_v1_sharedDriveItem : MSGraphAPI_v1_baseItem {
    [MSGraphAPI_v1_identitySet] $owner
    [object]Get_driveItem(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/driveItem")
    }
    [object]Get_items(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/items")
    }
    [object]Get_list(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/list")
    }
    [object]Get_listItem(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/listItem")
    }
    [object]Get_root(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/root")
    }
    [object]Get_site(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/site")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('siteCollection', 'MSGraphAPI_v1_siteCollection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.siteCollection', 'MSGraphAPI_v1_siteCollection')


class MSGraphAPI_v1_siteCollection : MSGraphAPI_Base {
    [string] $hostname
}
$null = $Script:MSGraphAPIClassHash.Add('thumbnail', 'MSGraphAPI_v1_thumbnail')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.thumbnail', 'MSGraphAPI_v1_thumbnail')


class MSGraphAPI_v1_thumbnail : MSGraphAPI_Base {
    [object] $content
    [Nullable[int]] $height
    [string] $sourceItemId
    [string] $url
    [Nullable[int]] $width
}
$null = $Script:MSGraphAPIClassHash.Add('driveItemUploadableProperties', 'MSGraphAPI_v1_driveItemUploadableProperties')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.driveItemUploadableProperties', 'MSGraphAPI_v1_driveItemUploadableProperties')


class MSGraphAPI_v1_driveItemUploadableProperties : MSGraphAPI_Base {
    [string] $description
    [MSGraphAPI_v1_fileSystemInfo] $fileSystemInfo
    [string] $name
}
$null = $Script:MSGraphAPIClassHash.Add('driveRecipient', 'MSGraphAPI_v1_driveRecipient')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.driveRecipient', 'MSGraphAPI_v1_driveRecipient')


class MSGraphAPI_v1_driveRecipient : MSGraphAPI_Base {
    [string] $alias
    [string] $email
    [string] $objectId
}
$null = $Script:MSGraphAPIClassHash.Add('uploadSession', 'MSGraphAPI_v1_uploadSession')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.uploadSession', 'MSGraphAPI_v1_uploadSession')


class MSGraphAPI_v1_uploadSession : MSGraphAPI_Base {
    [Nullable[DateTimeOffset]] $expirationDateTime
    [string[]] $nextExpectedRanges
    [string] $uploadUrl
}
$null = $Script:MSGraphAPIClassHash.Add('workbookApplication', 'MSGraphAPI_v1_workbookApplication')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookApplication', 'MSGraphAPI_v1_workbookApplication')


class MSGraphAPI_v1_workbookApplication : MSGraphAPI_v1_entity {
    [string] $calculationMode



}
$null = $Script:MSGraphAPIClassHash.Add('workbookNamedItem', 'MSGraphAPI_v1_workbookNamedItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookNamedItem', 'MSGraphAPI_v1_workbookNamedItem')


class MSGraphAPI_v1_workbookNamedItem : MSGraphAPI_v1_entity {
    [string] $comment
    [string] $name
    [string] $scope
    [string] $type
    [MSGraphAPI_v1_Json] $value
    [Nullable[bool]] $visible
    [object]Get_worksheet(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/worksheet")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookTable', 'MSGraphAPI_v1_workbookTable')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookTable', 'MSGraphAPI_v1_workbookTable')


class MSGraphAPI_v1_workbookTable : MSGraphAPI_v1_entity {
    [Nullable[bool]] $highlightFirstColumn
    [Nullable[bool]] $highlightLastColumn
    [string] $name
    [Nullable[bool]] $showBandedColumns
    [Nullable[bool]] $showBandedRows
    [Nullable[bool]] $showFilterButton
    [Nullable[bool]] $showHeaders
    [Nullable[bool]] $showTotals
    [string] $style
    [object]Get_columns(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/columns")
    }
    [object]Get_rows(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/rows")
    }
    [object]Get_sort(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sort")
    }
    [object]Get_worksheet(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/worksheet")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookWorksheet', 'MSGraphAPI_v1_workbookWorksheet')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookWorksheet', 'MSGraphAPI_v1_workbookWorksheet')


class MSGraphAPI_v1_workbookWorksheet : MSGraphAPI_v1_entity {
    [string] $name
    [Nullable[int]] $position
    [string] $visibility
    [object]Get_charts(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/charts")
    }
    [object]Get_names(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/names")
    }
    [object]Get_pivotTables(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/pivotTables")
    }
    [object]Get_protection(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/protection")
    }
    [object]Get_tables(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/tables")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookFunctions', 'MSGraphAPI_v1_workbookFunctions')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookFunctions', 'MSGraphAPI_v1_workbookFunctions')


class MSGraphAPI_v1_workbookFunctions : MSGraphAPI_v1_entity {




}
$null = $Script:MSGraphAPIClassHash.Add('workbookSessionInfo', 'MSGraphAPI_v1_workbookSessionInfo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookSessionInfo', 'MSGraphAPI_v1_workbookSessionInfo')


class MSGraphAPI_v1_workbookSessionInfo : MSGraphAPI_Base {
    [string] $id
    [Nullable[bool]] $persistChanges
}
$null = $Script:MSGraphAPIClassHash.Add('Json', 'MSGraphAPI_v1_Json')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.Json', 'MSGraphAPI_v1_Json')


class MSGraphAPI_v1_Json : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('workbookChart', 'MSGraphAPI_v1_workbookChart')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChart', 'MSGraphAPI_v1_workbookChart')


class MSGraphAPI_v1_workbookChart : MSGraphAPI_v1_entity {
    [Nullable[Double]] $height
    [Nullable[Double]] $left
    [string] $name
    [Nullable[Double]] $top
    [Nullable[Double]] $width
    [object]Get_axes(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/axes")
    }
    [object]Get_dataLabels(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/dataLabels")
    }
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }
    [object]Get_legend(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/legend")
    }
    [object]Get_series(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/series")
    }
    [object]Get_title(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/title")
    }
    [object]Get_worksheet(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/worksheet")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartAxes', 'MSGraphAPI_v1_workbookChartAxes')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartAxes', 'MSGraphAPI_v1_workbookChartAxes')


class MSGraphAPI_v1_workbookChartAxes : MSGraphAPI_v1_entity {

    [object]Get_categoryAxis(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/categoryAxis")
    }
    [object]Get_seriesAxis(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/seriesAxis")
    }
    [object]Get_valueAxis(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/valueAxis")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartDataLabels', 'MSGraphAPI_v1_workbookChartDataLabels')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartDataLabels', 'MSGraphAPI_v1_workbookChartDataLabels')


class MSGraphAPI_v1_workbookChartDataLabels : MSGraphAPI_v1_entity {
    [string] $position
    [string] $separator
    [Nullable[bool]] $showBubbleSize
    [Nullable[bool]] $showCategoryName
    [Nullable[bool]] $showLegendKey
    [Nullable[bool]] $showPercentage
    [Nullable[bool]] $showSeriesName
    [Nullable[bool]] $showValue
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartAreaFormat', 'MSGraphAPI_v1_workbookChartAreaFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartAreaFormat', 'MSGraphAPI_v1_workbookChartAreaFormat')


class MSGraphAPI_v1_workbookChartAreaFormat : MSGraphAPI_v1_entity {

    [object]Get_fill(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/fill")
    }
    [object]Get_font(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/font")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartLegend', 'MSGraphAPI_v1_workbookChartLegend')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartLegend', 'MSGraphAPI_v1_workbookChartLegend')


class MSGraphAPI_v1_workbookChartLegend : MSGraphAPI_v1_entity {
    [Nullable[bool]] $overlay
    [string] $position
    [Nullable[bool]] $visible
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartSeries', 'MSGraphAPI_v1_workbookChartSeries')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartSeries', 'MSGraphAPI_v1_workbookChartSeries')


class MSGraphAPI_v1_workbookChartSeries : MSGraphAPI_v1_entity {
    [string] $name
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }
    [object]Get_points(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/points")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartTitle', 'MSGraphAPI_v1_workbookChartTitle')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartTitle', 'MSGraphAPI_v1_workbookChartTitle')


class MSGraphAPI_v1_workbookChartTitle : MSGraphAPI_v1_entity {
    [Nullable[bool]] $overlay
    [string] $text
    [Nullable[bool]] $visible
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartFill', 'MSGraphAPI_v1_workbookChartFill')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartFill', 'MSGraphAPI_v1_workbookChartFill')


class MSGraphAPI_v1_workbookChartFill : MSGraphAPI_v1_entity {




}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartFont', 'MSGraphAPI_v1_workbookChartFont')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartFont', 'MSGraphAPI_v1_workbookChartFont')


class MSGraphAPI_v1_workbookChartFont : MSGraphAPI_v1_entity {
    [Nullable[bool]] $bold
    [string] $color
    [Nullable[bool]] $italic
    [string] $name
    [Nullable[Double]] $size
    [string] $underline



}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartAxis', 'MSGraphAPI_v1_workbookChartAxis')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartAxis', 'MSGraphAPI_v1_workbookChartAxis')


class MSGraphAPI_v1_workbookChartAxis : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_Json] $majorUnit
    [MSGraphAPI_v1_Json] $maximum
    [MSGraphAPI_v1_Json] $minimum
    [MSGraphAPI_v1_Json] $minorUnit
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }
    [object]Get_majorGridlines(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/majorGridlines")
    }
    [object]Get_minorGridlines(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/minorGridlines")
    }
    [object]Get_title(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/title")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartAxisFormat', 'MSGraphAPI_v1_workbookChartAxisFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartAxisFormat', 'MSGraphAPI_v1_workbookChartAxisFormat')


class MSGraphAPI_v1_workbookChartAxisFormat : MSGraphAPI_v1_entity {

    [object]Get_font(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/font")
    }
    [object]Get_line(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/line")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartGridlines', 'MSGraphAPI_v1_workbookChartGridlines')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartGridlines', 'MSGraphAPI_v1_workbookChartGridlines')


class MSGraphAPI_v1_workbookChartGridlines : MSGraphAPI_v1_entity {
    [Nullable[bool]] $visible
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartAxisTitle', 'MSGraphAPI_v1_workbookChartAxisTitle')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartAxisTitle', 'MSGraphAPI_v1_workbookChartAxisTitle')


class MSGraphAPI_v1_workbookChartAxisTitle : MSGraphAPI_v1_entity {
    [string] $text
    [Nullable[bool]] $visible
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartLineFormat', 'MSGraphAPI_v1_workbookChartLineFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartLineFormat', 'MSGraphAPI_v1_workbookChartLineFormat')


class MSGraphAPI_v1_workbookChartLineFormat : MSGraphAPI_v1_entity {
    [string] $color



}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartAxisTitleFormat', 'MSGraphAPI_v1_workbookChartAxisTitleFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartAxisTitleFormat', 'MSGraphAPI_v1_workbookChartAxisTitleFormat')


class MSGraphAPI_v1_workbookChartAxisTitleFormat : MSGraphAPI_v1_entity {

    [object]Get_font(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/font")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartDataLabelFormat', 'MSGraphAPI_v1_workbookChartDataLabelFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartDataLabelFormat', 'MSGraphAPI_v1_workbookChartDataLabelFormat')


class MSGraphAPI_v1_workbookChartDataLabelFormat : MSGraphAPI_v1_entity {

    [object]Get_fill(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/fill")
    }
    [object]Get_font(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/font")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartGridlinesFormat', 'MSGraphAPI_v1_workbookChartGridlinesFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartGridlinesFormat', 'MSGraphAPI_v1_workbookChartGridlinesFormat')


class MSGraphAPI_v1_workbookChartGridlinesFormat : MSGraphAPI_v1_entity {

    [object]Get_line(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/line")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartLegendFormat', 'MSGraphAPI_v1_workbookChartLegendFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartLegendFormat', 'MSGraphAPI_v1_workbookChartLegendFormat')


class MSGraphAPI_v1_workbookChartLegendFormat : MSGraphAPI_v1_entity {

    [object]Get_fill(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/fill")
    }
    [object]Get_font(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/font")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartPoint', 'MSGraphAPI_v1_workbookChartPoint')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartPoint', 'MSGraphAPI_v1_workbookChartPoint')


class MSGraphAPI_v1_workbookChartPoint : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_Json] $value
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartPointFormat', 'MSGraphAPI_v1_workbookChartPointFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartPointFormat', 'MSGraphAPI_v1_workbookChartPointFormat')


class MSGraphAPI_v1_workbookChartPointFormat : MSGraphAPI_v1_entity {

    [object]Get_fill(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/fill")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartSeriesFormat', 'MSGraphAPI_v1_workbookChartSeriesFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartSeriesFormat', 'MSGraphAPI_v1_workbookChartSeriesFormat')


class MSGraphAPI_v1_workbookChartSeriesFormat : MSGraphAPI_v1_entity {

    [object]Get_fill(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/fill")
    }
    [object]Get_line(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/line")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookChartTitleFormat', 'MSGraphAPI_v1_workbookChartTitleFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookChartTitleFormat', 'MSGraphAPI_v1_workbookChartTitleFormat')


class MSGraphAPI_v1_workbookChartTitleFormat : MSGraphAPI_v1_entity {

    [object]Get_fill(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/fill")
    }
    [object]Get_font(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/font")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookFilter', 'MSGraphAPI_v1_workbookFilter')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookFilter', 'MSGraphAPI_v1_workbookFilter')


class MSGraphAPI_v1_workbookFilter : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_workbookFilterCriteria] $criteria



}
$null = $Script:MSGraphAPIClassHash.Add('workbookFilterCriteria', 'MSGraphAPI_v1_workbookFilterCriteria')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookFilterCriteria', 'MSGraphAPI_v1_workbookFilterCriteria')


class MSGraphAPI_v1_workbookFilterCriteria : MSGraphAPI_Base {
    [string] $color
    [string] $criterion1
    [string] $criterion2
    [string] $dynamicCriteria
    [string] $filterOn
    [MSGraphAPI_v1_workbookIcon] $icon
    [string] $operator
    [MSGraphAPI_v1_Json] $values
}
$null = $Script:MSGraphAPIClassHash.Add('workbookIcon', 'MSGraphAPI_v1_workbookIcon')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookIcon', 'MSGraphAPI_v1_workbookIcon')


class MSGraphAPI_v1_workbookIcon : MSGraphAPI_Base {
    [Nullable[int]] $index
    [string] $set
}
$null = $Script:MSGraphAPIClassHash.Add('workbookFormatProtection', 'MSGraphAPI_v1_workbookFormatProtection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookFormatProtection', 'MSGraphAPI_v1_workbookFormatProtection')


class MSGraphAPI_v1_workbookFormatProtection : MSGraphAPI_v1_entity {
    [Nullable[bool]] $formulaHidden
    [Nullable[bool]] $locked



}
$null = $Script:MSGraphAPIClassHash.Add('workbookFunctionResult', 'MSGraphAPI_v1_workbookFunctionResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookFunctionResult', 'MSGraphAPI_v1_workbookFunctionResult')


class MSGraphAPI_v1_workbookFunctionResult : MSGraphAPI_v1_entity {
    [string] $error
    [MSGraphAPI_v1_Json] $value



}
$null = $Script:MSGraphAPIClassHash.Add('workbookPivotTable', 'MSGraphAPI_v1_workbookPivotTable')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookPivotTable', 'MSGraphAPI_v1_workbookPivotTable')


class MSGraphAPI_v1_workbookPivotTable : MSGraphAPI_v1_entity {
    [string] $name
    [object]Get_worksheet(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/worksheet")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookRange', 'MSGraphAPI_v1_workbookRange')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookRange', 'MSGraphAPI_v1_workbookRange')


class MSGraphAPI_v1_workbookRange : MSGraphAPI_v1_entity {
    [string] $address
    [string] $addressLocal
    [Nullable[int]] $cellCount
    [Nullable[int]] $columnCount
    [Nullable[bool]] $columnHidden
    [Nullable[int]] $columnIndex
    [MSGraphAPI_v1_Json] $formulas
    [MSGraphAPI_v1_Json] $formulasLocal
    [MSGraphAPI_v1_Json] $formulasR1C1
    [Nullable[bool]] $hidden
    [MSGraphAPI_v1_Json] $numberFormat
    [Nullable[int]] $rowCount
    [Nullable[bool]] $rowHidden
    [Nullable[int]] $rowIndex
    [MSGraphAPI_v1_Json] $text
    [MSGraphAPI_v1_Json] $valueTypes
    [MSGraphAPI_v1_Json] $values
    [object]Get_format(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/format")
    }
    [object]Get_sort(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sort")
    }
    [object]Get_worksheet(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/worksheet")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookRangeFormat', 'MSGraphAPI_v1_workbookRangeFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookRangeFormat', 'MSGraphAPI_v1_workbookRangeFormat')


class MSGraphAPI_v1_workbookRangeFormat : MSGraphAPI_v1_entity {
    [Nullable[Double]] $columnWidth
    [string] $horizontalAlignment
    [Nullable[Double]] $rowHeight
    [string] $verticalAlignment
    [Nullable[bool]] $wrapText
    [object]Get_borders(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/borders")
    }
    [object]Get_fill(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/fill")
    }
    [object]Get_font(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/font")
    }
    [object]Get_protection(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/protection")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookRangeSort', 'MSGraphAPI_v1_workbookRangeSort')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookRangeSort', 'MSGraphAPI_v1_workbookRangeSort')


class MSGraphAPI_v1_workbookRangeSort : MSGraphAPI_v1_entity {




}
$null = $Script:MSGraphAPIClassHash.Add('workbookRangeBorder', 'MSGraphAPI_v1_workbookRangeBorder')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookRangeBorder', 'MSGraphAPI_v1_workbookRangeBorder')


class MSGraphAPI_v1_workbookRangeBorder : MSGraphAPI_v1_entity {
    [string] $color
    [string] $sideIndex
    [string] $style
    [string] $weight



}
$null = $Script:MSGraphAPIClassHash.Add('workbookRangeFill', 'MSGraphAPI_v1_workbookRangeFill')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookRangeFill', 'MSGraphAPI_v1_workbookRangeFill')


class MSGraphAPI_v1_workbookRangeFill : MSGraphAPI_v1_entity {
    [string] $color



}
$null = $Script:MSGraphAPIClassHash.Add('workbookRangeFont', 'MSGraphAPI_v1_workbookRangeFont')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookRangeFont', 'MSGraphAPI_v1_workbookRangeFont')


class MSGraphAPI_v1_workbookRangeFont : MSGraphAPI_v1_entity {
    [Nullable[bool]] $bold
    [string] $color
    [Nullable[bool]] $italic
    [string] $name
    [Nullable[Double]] $size
    [string] $underline



}
$null = $Script:MSGraphAPIClassHash.Add('workbookRangeView', 'MSGraphAPI_v1_workbookRangeView')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookRangeView', 'MSGraphAPI_v1_workbookRangeView')


class MSGraphAPI_v1_workbookRangeView : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_Json] $cellAddresses
    [Nullable[int]] $columnCount
    [MSGraphAPI_v1_Json] $formulas
    [MSGraphAPI_v1_Json] $formulasLocal
    [MSGraphAPI_v1_Json] $formulasR1C1
    [Nullable[int]] $index
    [MSGraphAPI_v1_Json] $numberFormat
    [Nullable[int]] $rowCount
    [MSGraphAPI_v1_Json] $text
    [MSGraphAPI_v1_Json] $valueTypes
    [MSGraphAPI_v1_Json] $values
    [object]Get_rows(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/rows")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookTableColumn', 'MSGraphAPI_v1_workbookTableColumn')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookTableColumn', 'MSGraphAPI_v1_workbookTableColumn')


class MSGraphAPI_v1_workbookTableColumn : MSGraphAPI_v1_entity {
    [Nullable[int]] $index
    [string] $name
    [MSGraphAPI_v1_Json] $values
    [object]Get_filter(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/filter")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('workbookTableRow', 'MSGraphAPI_v1_workbookTableRow')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookTableRow', 'MSGraphAPI_v1_workbookTableRow')


class MSGraphAPI_v1_workbookTableRow : MSGraphAPI_v1_entity {
    [Nullable[int]] $index
    [MSGraphAPI_v1_Json] $values



}
$null = $Script:MSGraphAPIClassHash.Add('workbookTableSort', 'MSGraphAPI_v1_workbookTableSort')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookTableSort', 'MSGraphAPI_v1_workbookTableSort')


class MSGraphAPI_v1_workbookTableSort : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_workbookSortField[]] $fields
    [Nullable[bool]] $matchCase
    [string] $method



}
$null = $Script:MSGraphAPIClassHash.Add('workbookSortField', 'MSGraphAPI_v1_workbookSortField')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookSortField', 'MSGraphAPI_v1_workbookSortField')


class MSGraphAPI_v1_workbookSortField : MSGraphAPI_Base {
    [Nullable[bool]] $ascending
    [string] $color
    [string] $dataOption
    [MSGraphAPI_v1_workbookIcon] $icon
    [Nullable[int]] $key
    [string] $sortOn
}
$null = $Script:MSGraphAPIClassHash.Add('workbookWorksheetProtection', 'MSGraphAPI_v1_workbookWorksheetProtection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookWorksheetProtection', 'MSGraphAPI_v1_workbookWorksheetProtection')


class MSGraphAPI_v1_workbookWorksheetProtection : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_workbookWorksheetProtectionOptions] $options
    [Nullable[bool]] $protected



}
$null = $Script:MSGraphAPIClassHash.Add('workbookWorksheetProtectionOptions', 'MSGraphAPI_v1_workbookWorksheetProtectionOptions')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookWorksheetProtectionOptions', 'MSGraphAPI_v1_workbookWorksheetProtectionOptions')


class MSGraphAPI_v1_workbookWorksheetProtectionOptions : MSGraphAPI_Base {
    [Nullable[bool]] $allowAutoFilter
    [Nullable[bool]] $allowDeleteColumns
    [Nullable[bool]] $allowDeleteRows
    [Nullable[bool]] $allowFormatCells
    [Nullable[bool]] $allowFormatColumns
    [Nullable[bool]] $allowFormatRows
    [Nullable[bool]] $allowInsertColumns
    [Nullable[bool]] $allowInsertHyperlinks
    [Nullable[bool]] $allowInsertRows
    [Nullable[bool]] $allowPivotTables
    [Nullable[bool]] $allowSort
}
$null = $Script:MSGraphAPIClassHash.Add('workbookFilterDatetime', 'MSGraphAPI_v1_workbookFilterDatetime')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookFilterDatetime', 'MSGraphAPI_v1_workbookFilterDatetime')


class MSGraphAPI_v1_workbookFilterDatetime : MSGraphAPI_Base {
    [string] $date
    [string] $specificity
}
$null = $Script:MSGraphAPIClassHash.Add('workbookRangeReference', 'MSGraphAPI_v1_workbookRangeReference')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.workbookRangeReference', 'MSGraphAPI_v1_workbookRangeReference')


class MSGraphAPI_v1_workbookRangeReference : MSGraphAPI_Base {
    [string] $address
}
$null = $Script:MSGraphAPIClassHash.Add('subscription', 'MSGraphAPI_v1_subscription')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.subscription', 'MSGraphAPI_v1_subscription')


class MSGraphAPI_v1_subscription : MSGraphAPI_v1_entity {
    [string] $resource
    [string] $changeType
    [string] $clientState
    [string] $notificationUrl
    [Nullable[DateTimeOffset]] $expirationDateTime



}
$null = $Script:MSGraphAPIClassHash.Add('invitation', 'MSGraphAPI_v1_invitation')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.invitation', 'MSGraphAPI_v1_invitation')


class MSGraphAPI_v1_invitation : MSGraphAPI_v1_entity {
    [string] $invitedUserDisplayName
    [string] $invitedUserType
    [string] $invitedUserEmailAddress
    [MSGraphAPI_v1_invitedUserMessageInfo] $invitedUserMessageInfo
    [Nullable[bool]] $sendInvitationMessage
    [string] $inviteRedirectUrl
    [string] $inviteRedeemUrl
    [string] $status
    [object]Get_invitedUser(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/invitedUser")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('invitedUserMessageInfo', 'MSGraphAPI_v1_invitedUserMessageInfo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.invitedUserMessageInfo', 'MSGraphAPI_v1_invitedUserMessageInfo')


class MSGraphAPI_v1_invitedUserMessageInfo : MSGraphAPI_Base {
    [MSGraphAPI_v1_recipient[]] $ccRecipients
    [string] $messageLanguage
    [string] $customizedMessageBody
}
$null = $Script:MSGraphAPIClassHash.Add('plannerTask', 'MSGraphAPI_v1_plannerTask')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerTask', 'MSGraphAPI_v1_plannerTask')


class MSGraphAPI_v1_plannerTask : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_identitySet] $createdBy
    [string] $planId
    [string] $bucketId
    [string] $title
    [string] $orderHint
    [string] $assigneePriority
    [Nullable[int]] $percentComplete
    [Nullable[DateTimeOffset]] $startDateTime
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $dueDateTime
    [Nullable[bool]] $hasDescription
    [MSGraphAPI_v1_plannerPreviewType] $previewType
    [Nullable[DateTimeOffset]] $completedDateTime
    [MSGraphAPI_v1_identitySet] $completedBy
    [Nullable[int]] $referenceCount
    [Nullable[int]] $checklistItemCount
    [Nullable[int]] $activeChecklistItemCount
    [MSGraphAPI_v1_plannerAppliedCategories] $appliedCategories
    [MSGraphAPI_v1_plannerAssignments] $assignments
    [string] $conversationThreadId
    [object]Get_details(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/details")
    }
    [object]Get_assignedToTaskBoardFormat(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignedToTaskBoardFormat")
    }
    [object]Get_progressTaskBoardFormat(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/progressTaskBoardFormat")
    }
    [object]Get_bucketTaskBoardFormat(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/bucketTaskBoardFormat")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('plannerPlan', 'MSGraphAPI_v1_plannerPlan')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerPlan', 'MSGraphAPI_v1_plannerPlan')


class MSGraphAPI_v1_plannerPlan : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_identitySet] $createdBy
    [Nullable[DateTimeOffset]] $createdDateTime
    [string] $owner
    [string] $title
    [object]Get_tasks(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/tasks")
    }
    [object]Get_buckets(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/buckets")
    }
    [object]Get_details(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/details")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('planner', 'MSGraphAPI_v1_planner')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.planner', 'MSGraphAPI_v1_planner')


class MSGraphAPI_v1_planner : MSGraphAPI_v1_entity {

    [object]Get_tasks(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/tasks")
    }
    [object]Get_plans(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/plans")
    }
    [object]Get_buckets(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/buckets")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('plannerBucket', 'MSGraphAPI_v1_plannerBucket')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerBucket', 'MSGraphAPI_v1_plannerBucket')


class MSGraphAPI_v1_plannerBucket : MSGraphAPI_v1_entity {
    [string] $name
    [string] $planId
    [string] $orderHint
    [object]Get_tasks(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/tasks")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('plannerAppliedCategories', 'MSGraphAPI_v1_plannerAppliedCategories')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerAppliedCategories', 'MSGraphAPI_v1_plannerAppliedCategories')


class MSGraphAPI_v1_plannerAppliedCategories : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('plannerAssignments', 'MSGraphAPI_v1_plannerAssignments')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerAssignments', 'MSGraphAPI_v1_plannerAssignments')


class MSGraphAPI_v1_plannerAssignments : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('plannerTaskDetails', 'MSGraphAPI_v1_plannerTaskDetails')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerTaskDetails', 'MSGraphAPI_v1_plannerTaskDetails')


class MSGraphAPI_v1_plannerTaskDetails : MSGraphAPI_v1_entity {
    [string] $description
    [MSGraphAPI_v1_plannerPreviewType] $previewType
    [MSGraphAPI_v1_plannerExternalReferences] $references
    [MSGraphAPI_v1_plannerChecklistItems] $checklist



}
$null = $Script:MSGraphAPIClassHash.Add('plannerAssignedToTaskBoardTaskFormat', 'MSGraphAPI_v1_plannerAssignedToTaskBoardTaskFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerAssignedToTaskBoardTaskFormat', 'MSGraphAPI_v1_plannerAssignedToTaskBoardTaskFormat')


class MSGraphAPI_v1_plannerAssignedToTaskBoardTaskFormat : MSGraphAPI_v1_entity {
    [string] $unassignedOrderHint
    [MSGraphAPI_v1_plannerOrderHintsByAssignee] $orderHintsByAssignee



}
$null = $Script:MSGraphAPIClassHash.Add('plannerProgressTaskBoardTaskFormat', 'MSGraphAPI_v1_plannerProgressTaskBoardTaskFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerProgressTaskBoardTaskFormat', 'MSGraphAPI_v1_plannerProgressTaskBoardTaskFormat')


class MSGraphAPI_v1_plannerProgressTaskBoardTaskFormat : MSGraphAPI_v1_entity {
    [string] $orderHint



}
$null = $Script:MSGraphAPIClassHash.Add('plannerBucketTaskBoardTaskFormat', 'MSGraphAPI_v1_plannerBucketTaskBoardTaskFormat')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerBucketTaskBoardTaskFormat', 'MSGraphAPI_v1_plannerBucketTaskBoardTaskFormat')


class MSGraphAPI_v1_plannerBucketTaskBoardTaskFormat : MSGraphAPI_v1_entity {
    [string] $orderHint



}
$null = $Script:MSGraphAPIClassHash.Add('plannerPlanDetails', 'MSGraphAPI_v1_plannerPlanDetails')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerPlanDetails', 'MSGraphAPI_v1_plannerPlanDetails')


class MSGraphAPI_v1_plannerPlanDetails : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_plannerUserIds] $sharedWith
    [MSGraphAPI_v1_plannerCategoryDescriptions] $categoryDescriptions



}
$null = $Script:MSGraphAPIClassHash.Add('plannerExternalReference', 'MSGraphAPI_v1_plannerExternalReference')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerExternalReference', 'MSGraphAPI_v1_plannerExternalReference')


class MSGraphAPI_v1_plannerExternalReference : MSGraphAPI_Base {
    [string] $alias
    [string] $type
    [string] $previewPriority
    [MSGraphAPI_v1_identitySet] $lastModifiedBy
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
}
$null = $Script:MSGraphAPIClassHash.Add('plannerChecklistItem', 'MSGraphAPI_v1_plannerChecklistItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerChecklistItem', 'MSGraphAPI_v1_plannerChecklistItem')


class MSGraphAPI_v1_plannerChecklistItem : MSGraphAPI_Base {
    [Nullable[bool]] $isChecked
    [string] $title
    [string] $orderHint
    [MSGraphAPI_v1_identitySet] $lastModifiedBy
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
}
$null = $Script:MSGraphAPIClassHash.Add('plannerAssignment', 'MSGraphAPI_v1_plannerAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerAssignment', 'MSGraphAPI_v1_plannerAssignment')


class MSGraphAPI_v1_plannerAssignment : MSGraphAPI_Base {
    [MSGraphAPI_v1_identitySet] $assignedBy
    [Nullable[DateTimeOffset]] $assignedDateTime
    [string] $orderHint
}
$null = $Script:MSGraphAPIClassHash.Add('plannerExternalReferences', 'MSGraphAPI_v1_plannerExternalReferences')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerExternalReferences', 'MSGraphAPI_v1_plannerExternalReferences')


class MSGraphAPI_v1_plannerExternalReferences : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('plannerChecklistItems', 'MSGraphAPI_v1_plannerChecklistItems')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerChecklistItems', 'MSGraphAPI_v1_plannerChecklistItems')


class MSGraphAPI_v1_plannerChecklistItems : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('plannerOrderHintsByAssignee', 'MSGraphAPI_v1_plannerOrderHintsByAssignee')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerOrderHintsByAssignee', 'MSGraphAPI_v1_plannerOrderHintsByAssignee')


class MSGraphAPI_v1_plannerOrderHintsByAssignee : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('plannerUserIds', 'MSGraphAPI_v1_plannerUserIds')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerUserIds', 'MSGraphAPI_v1_plannerUserIds')


class MSGraphAPI_v1_plannerUserIds : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('plannerCategoryDescriptions', 'MSGraphAPI_v1_plannerCategoryDescriptions')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.plannerCategoryDescriptions', 'MSGraphAPI_v1_plannerCategoryDescriptions')


class MSGraphAPI_v1_plannerCategoryDescriptions : MSGraphAPI_Base {
    [string] $category1
    [string] $category2
    [string] $category3
    [string] $category4
    [string] $category5
    [string] $category6
}
$null = $Script:MSGraphAPIClassHash.Add('onenoteEntityBaseModel', 'MSGraphAPI_v1_onenoteEntityBaseModel')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenoteEntityBaseModel', 'MSGraphAPI_v1_onenoteEntityBaseModel')


class MSGraphAPI_v1_onenoteEntityBaseModel : MSGraphAPI_v1_entity {
    [string] $self



}
$null = $Script:MSGraphAPIClassHash.Add('onenoteEntitySchemaObjectModel', 'MSGraphAPI_v1_onenoteEntitySchemaObjectModel')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenoteEntitySchemaObjectModel', 'MSGraphAPI_v1_onenoteEntitySchemaObjectModel')


class MSGraphAPI_v1_onenoteEntitySchemaObjectModel : MSGraphAPI_v1_onenoteEntityBaseModel {
    [Nullable[DateTimeOffset]] $createdDateTime



}
$null = $Script:MSGraphAPIClassHash.Add('onenoteEntityHierarchyModel', 'MSGraphAPI_v1_onenoteEntityHierarchyModel')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenoteEntityHierarchyModel', 'MSGraphAPI_v1_onenoteEntityHierarchyModel')


class MSGraphAPI_v1_onenoteEntityHierarchyModel : MSGraphAPI_v1_onenoteEntitySchemaObjectModel {
    [string] $displayName
    [MSGraphAPI_v1_identitySet] $createdBy
    [MSGraphAPI_v1_identitySet] $lastModifiedBy
    [Nullable[DateTimeOffset]] $lastModifiedDateTime



}
$null = $Script:MSGraphAPIClassHash.Add('notebook', 'MSGraphAPI_v1_notebook')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.notebook', 'MSGraphAPI_v1_notebook')


class MSGraphAPI_v1_notebook : MSGraphAPI_v1_onenoteEntityHierarchyModel {
    [Nullable[bool]] $isDefault
    [MSGraphAPI_v1_onenoteUserRole] $userRole
    [Nullable[bool]] $isShared
    [string] $sectionsUrl
    [string] $sectionGroupsUrl
    [MSGraphAPI_v1_notebookLinks] $links
    [object]Get_sections(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sections")
    }
    [object]Get_sectionGroups(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sectionGroups")
    }
    [object]copyNotebook([string]$siteCollectionId,[string]$siteId,[string]$groupId,[string]$renameAs,[string]$notebookFolder){
        $ParamHash = @{
            'siteCollectionId'=$siteCollectionId
            'siteId'=$siteId
            'groupId'=$groupId
            'renameAs'=$renameAs
            'notebookFolder'=$notebookFolder
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'copyNotebook' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('onenoteSection', 'MSGraphAPI_v1_onenoteSection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenoteSection', 'MSGraphAPI_v1_onenoteSection')


class MSGraphAPI_v1_onenoteSection : MSGraphAPI_v1_onenoteEntityHierarchyModel {
    [Nullable[bool]] $isDefault
    [MSGraphAPI_v1_sectionLinks] $links
    [string] $pagesUrl
    [object]Get_parentNotebook(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/parentNotebook")
    }
    [object]Get_parentSectionGroup(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/parentSectionGroup")
    }
    [object]Get_pages(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/pages")
    }
    [object]copyToNotebook([string]$id,[string]$siteCollectionId,[string]$siteId,[string]$groupId,[string]$renameAs){
        $ParamHash = @{
            'id'=$id
            'siteCollectionId'=$siteCollectionId
            'siteId'=$siteId
            'groupId'=$groupId
            'renameAs'=$renameAs
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'copyToNotebook' -ParamHash $ParamHash)
    }
    [object]copyToSectionGroup([string]$id,[string]$siteCollectionId,[string]$siteId,[string]$groupId,[string]$renameAs){
        $ParamHash = @{
            'id'=$id
            'siteCollectionId'=$siteCollectionId
            'siteId'=$siteId
            'groupId'=$groupId
            'renameAs'=$renameAs
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'copyToSectionGroup' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('sectionGroup', 'MSGraphAPI_v1_sectionGroup')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.sectionGroup', 'MSGraphAPI_v1_sectionGroup')


class MSGraphAPI_v1_sectionGroup : MSGraphAPI_v1_onenoteEntityHierarchyModel {
    [string] $sectionsUrl
    [string] $sectionGroupsUrl
    [object]Get_parentNotebook(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/parentNotebook")
    }
    [object]Get_parentSectionGroup(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/parentSectionGroup")
    }
    [object]Get_sections(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sections")
    }
    [object]Get_sectionGroups(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/sectionGroups")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('onenotePage', 'MSGraphAPI_v1_onenotePage')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenotePage', 'MSGraphAPI_v1_onenotePage')


class MSGraphAPI_v1_onenotePage : MSGraphAPI_v1_onenoteEntitySchemaObjectModel {
    [string] $title
    [string] $createdByAppId
    [MSGraphAPI_v1_pageLinks] $links
    [string] $contentUrl
    [object] $content
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [Nullable[int]] $level
    [Nullable[int]] $order
    [string[]] $userTags
    [object]Get_parentSection(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/parentSection")
    }
    [object]Get_parentNotebook(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/parentNotebook")
    }
    [object]onenotePatchContent([object]$commands){
        $ParamHash = @{
            'commands'=$commands
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'onenotePatchContent' -ParamHash $ParamHash)
    }
    [object]copyToSection([string]$id,[string]$siteCollectionId,[string]$siteId,[string]$groupId){
        $ParamHash = @{
            'id'=$id
            'siteCollectionId'=$siteCollectionId
            'siteId'=$siteId
            'groupId'=$groupId
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'copyToSection' -ParamHash $ParamHash)
    }
    [object]preview(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'preview')
    }
}
$null = $Script:MSGraphAPIClassHash.Add('onenoteResource', 'MSGraphAPI_v1_onenoteResource')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenoteResource', 'MSGraphAPI_v1_onenoteResource')


class MSGraphAPI_v1_onenoteResource : MSGraphAPI_v1_onenoteEntityBaseModel {
    [object] $content
    [string] $contentUrl



}
$null = $Script:MSGraphAPIClassHash.Add('operation', 'MSGraphAPI_v1_operation')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.operation', 'MSGraphAPI_v1_operation')


class MSGraphAPI_v1_operation : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_operationStatus] $status
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastActionDateTime



}
$null = $Script:MSGraphAPIClassHash.Add('onenoteOperation', 'MSGraphAPI_v1_onenoteOperation')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenoteOperation', 'MSGraphAPI_v1_onenoteOperation')


class MSGraphAPI_v1_onenoteOperation : MSGraphAPI_v1_operation {
    [string] $resourceLocation
    [string] $resourceId
    [MSGraphAPI_v1_onenoteOperationError] $error
    [string] $percentComplete



}
$null = $Script:MSGraphAPIClassHash.Add('notebookLinks', 'MSGraphAPI_v1_notebookLinks')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.notebookLinks', 'MSGraphAPI_v1_notebookLinks')


class MSGraphAPI_v1_notebookLinks : MSGraphAPI_Base {
    [MSGraphAPI_v1_externalLink] $oneNoteClientUrl
    [MSGraphAPI_v1_externalLink] $oneNoteWebUrl
}
$null = $Script:MSGraphAPIClassHash.Add('externalLink', 'MSGraphAPI_v1_externalLink')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.externalLink', 'MSGraphAPI_v1_externalLink')


class MSGraphAPI_v1_externalLink : MSGraphAPI_Base {
    [string] $href
}
$null = $Script:MSGraphAPIClassHash.Add('sectionLinks', 'MSGraphAPI_v1_sectionLinks')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.sectionLinks', 'MSGraphAPI_v1_sectionLinks')


class MSGraphAPI_v1_sectionLinks : MSGraphAPI_Base {
    [MSGraphAPI_v1_externalLink] $oneNoteClientUrl
    [MSGraphAPI_v1_externalLink] $oneNoteWebUrl
}
$null = $Script:MSGraphAPIClassHash.Add('pageLinks', 'MSGraphAPI_v1_pageLinks')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.pageLinks', 'MSGraphAPI_v1_pageLinks')


class MSGraphAPI_v1_pageLinks : MSGraphAPI_Base {
    [MSGraphAPI_v1_externalLink] $oneNoteClientUrl
    [MSGraphAPI_v1_externalLink] $oneNoteWebUrl
}
$null = $Script:MSGraphAPIClassHash.Add('onenoteOperationError', 'MSGraphAPI_v1_onenoteOperationError')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenoteOperationError', 'MSGraphAPI_v1_onenoteOperationError')


class MSGraphAPI_v1_onenoteOperationError : MSGraphAPI_Base {
    [string] $code
    [string] $message
}
$null = $Script:MSGraphAPIClassHash.Add('diagnostic', 'MSGraphAPI_v1_diagnostic')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.diagnostic', 'MSGraphAPI_v1_diagnostic')


class MSGraphAPI_v1_diagnostic : MSGraphAPI_Base {
    [string] $message
    [string] $url
}
$null = $Script:MSGraphAPIClassHash.Add('onenotePatchContentCommand', 'MSGraphAPI_v1_onenotePatchContentCommand')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenotePatchContentCommand', 'MSGraphAPI_v1_onenotePatchContentCommand')


class MSGraphAPI_v1_onenotePatchContentCommand : MSGraphAPI_Base {
    [MSGraphAPI_v1_onenotePatchActionType] $action
    [string] $target
    [string] $content
    [MSGraphAPI_v1_onenotePatchInsertPosition] $position
}
$null = $Script:MSGraphAPIClassHash.Add('onenotePagePreview', 'MSGraphAPI_v1_onenotePagePreview')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenotePagePreview', 'MSGraphAPI_v1_onenotePagePreview')


class MSGraphAPI_v1_onenotePagePreview : MSGraphAPI_Base {
    [string] $previewText
    [MSGraphAPI_v1_onenotePagePreviewLinks] $links
}
$null = $Script:MSGraphAPIClassHash.Add('onenotePagePreviewLinks', 'MSGraphAPI_v1_onenotePagePreviewLinks')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onenotePagePreviewLinks', 'MSGraphAPI_v1_onenotePagePreviewLinks')


class MSGraphAPI_v1_onenotePagePreviewLinks : MSGraphAPI_Base {
    [MSGraphAPI_v1_externalLink] $previewImageUrl
}
$null = $Script:MSGraphAPIClassHash.Add('recentNotebook', 'MSGraphAPI_v1_recentNotebook')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.recentNotebook', 'MSGraphAPI_v1_recentNotebook')


class MSGraphAPI_v1_recentNotebook : MSGraphAPI_Base {
    [string] $displayName
    [Nullable[DateTimeOffset]] $lastAccessedTime
    [MSGraphAPI_v1_recentNotebookLinks] $links
    [MSGraphAPI_v1_onenoteSourceService] $sourceService
}
$null = $Script:MSGraphAPIClassHash.Add('recentNotebookLinks', 'MSGraphAPI_v1_recentNotebookLinks')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.recentNotebookLinks', 'MSGraphAPI_v1_recentNotebookLinks')


class MSGraphAPI_v1_recentNotebookLinks : MSGraphAPI_Base {
    [MSGraphAPI_v1_externalLink] $oneNoteClientUrl
    [MSGraphAPI_v1_externalLink] $oneNoteWebUrl
}
$null = $Script:MSGraphAPIClassHash.Add('reportRoot', 'MSGraphAPI_v1_reportRoot')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.reportRoot', 'MSGraphAPI_v1_reportRoot')


class MSGraphAPI_v1_reportRoot : MSGraphAPI_v1_entity {



    [object]getOffice365ActivationsUserDetail(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365ActivationsUserDetail')
    }
    [object]getOffice365ActivationCounts(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365ActivationCounts')
    }
    [object]getOffice365ActivationsUserCounts(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365ActivationsUserCounts')
    }
    [object]getOffice365ActiveUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365ActiveUserDetail' -ParamHash $ParamHash)
    }
    [object]getOffice365ActiveUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365ActiveUserDetail' -ParamHash $ParamHash)
    }
    [object]getOffice365ServicesUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365ServicesUserCounts' -ParamHash $ParamHash)
    }
    [object]getOffice365ActiveUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365ActiveUserCounts' -ParamHash $ParamHash)
    }
    [object]getOffice365GroupsActivityDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365GroupsActivityDetail' -ParamHash $ParamHash)
    }
    [object]getOffice365GroupsActivityDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365GroupsActivityDetail' -ParamHash $ParamHash)
    }
    [object]getOffice365GroupsActivityCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365GroupsActivityCounts' -ParamHash $ParamHash)
    }
    [object]getOffice365GroupsActivityGroupCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365GroupsActivityGroupCounts' -ParamHash $ParamHash)
    }
    [object]getOffice365GroupsActivityStorage([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365GroupsActivityStorage' -ParamHash $ParamHash)
    }
    [object]getOffice365GroupsActivityFileCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOffice365GroupsActivityFileCounts' -ParamHash $ParamHash)
    }
    [object]getEmailActivityUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getEmailActivityUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getEmailActivityCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailActivityCounts' -ParamHash $ParamHash)
    }
    [object]getEmailActivityUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailActivityUserCounts' -ParamHash $ParamHash)
    }
    [object]getEmailAppUsageUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailAppUsageUserDetail' -ParamHash $ParamHash)
    }
    [object]getEmailAppUsageUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailAppUsageUserDetail' -ParamHash $ParamHash)
    }
    [object]getEmailAppUsageAppsUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailAppUsageAppsUserCounts' -ParamHash $ParamHash)
    }
    [object]getEmailAppUsageUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailAppUsageUserCounts' -ParamHash $ParamHash)
    }
    [object]getEmailAppUsageVersionsUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEmailAppUsageVersionsUserCounts' -ParamHash $ParamHash)
    }
    [object]getMailboxUsageDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getMailboxUsageDetail' -ParamHash $ParamHash)
    }
    [object]getMailboxUsageMailboxCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getMailboxUsageMailboxCounts' -ParamHash $ParamHash)
    }
    [object]getMailboxUsageQuotaStatusMailboxCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getMailboxUsageQuotaStatusMailboxCounts' -ParamHash $ParamHash)
    }
    [object]getMailboxUsageStorage([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getMailboxUsageStorage' -ParamHash $ParamHash)
    }
    [object]getOneDriveActivityUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getOneDriveActivityUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getOneDriveActivityUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveActivityUserCounts' -ParamHash $ParamHash)
    }
    [object]getOneDriveActivityFileCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveActivityFileCounts' -ParamHash $ParamHash)
    }
    [object]getOneDriveUsageAccountDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveUsageAccountDetail' -ParamHash $ParamHash)
    }
    [object]getOneDriveUsageAccountDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveUsageAccountDetail' -ParamHash $ParamHash)
    }
    [object]getOneDriveUsageAccountCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveUsageAccountCounts' -ParamHash $ParamHash)
    }
    [object]getOneDriveUsageFileCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveUsageFileCounts' -ParamHash $ParamHash)
    }
    [object]getOneDriveUsageStorage([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getOneDriveUsageStorage' -ParamHash $ParamHash)
    }
    [object]getSharePointActivityUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getSharePointActivityUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getSharePointActivityFileCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointActivityFileCounts' -ParamHash $ParamHash)
    }
    [object]getSharePointActivityUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointActivityUserCounts' -ParamHash $ParamHash)
    }
    [object]getSharePointActivityPages([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointActivityPages' -ParamHash $ParamHash)
    }
    [object]getSharePointSiteUsageDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointSiteUsageDetail' -ParamHash $ParamHash)
    }
    [object]getSharePointSiteUsageDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointSiteUsageDetail' -ParamHash $ParamHash)
    }
    [object]getSharePointSiteUsageFileCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointSiteUsageFileCounts' -ParamHash $ParamHash)
    }
    [object]getSharePointSiteUsageSiteCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointSiteUsageSiteCounts' -ParamHash $ParamHash)
    }
    [object]getSharePointSiteUsageStorage([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointSiteUsageStorage' -ParamHash $ParamHash)
    }
    [object]getSharePointSiteUsagePages([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSharePointSiteUsagePages' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessActivityUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessActivityUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessActivityCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessActivityCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessActivityUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessActivityUserCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessPeerToPeerActivityCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessPeerToPeerActivityCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessPeerToPeerActivityUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessPeerToPeerActivityUserCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessPeerToPeerActivityMinuteCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessPeerToPeerActivityMinuteCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessOrganizerActivityCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessOrganizerActivityCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessOrganizerActivityUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessOrganizerActivityUserCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessOrganizerActivityMinuteCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessOrganizerActivityMinuteCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessParticipantActivityCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessParticipantActivityCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessParticipantActivityUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessParticipantActivityUserCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessParticipantActivityMinuteCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessParticipantActivityMinuteCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessDeviceUsageUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessDeviceUsageUserDetail' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessDeviceUsageUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessDeviceUsageUserDetail' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessDeviceUsageDistributionUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessDeviceUsageDistributionUserCounts' -ParamHash $ParamHash)
    }
    [object]getSkypeForBusinessDeviceUsageUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getSkypeForBusinessDeviceUsageUserCounts' -ParamHash $ParamHash)
    }
    [object]getYammerActivityUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getYammerActivityUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerActivityUserDetail' -ParamHash $ParamHash)
    }
    [object]getYammerActivityCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerActivityCounts' -ParamHash $ParamHash)
    }
    [object]getYammerActivityUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerActivityUserCounts' -ParamHash $ParamHash)
    }
    [object]getYammerDeviceUsageUserDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerDeviceUsageUserDetail' -ParamHash $ParamHash)
    }
    [object]getYammerDeviceUsageUserDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerDeviceUsageUserDetail' -ParamHash $ParamHash)
    }
    [object]getYammerDeviceUsageDistributionUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerDeviceUsageDistributionUserCounts' -ParamHash $ParamHash)
    }
    [object]getYammerDeviceUsageUserCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerDeviceUsageUserCounts' -ParamHash $ParamHash)
    }
    [object]getYammerGroupsActivityDetail([Nullable[DateTime]]$date){
        $ParamHash = @{
            'date'=$date
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerGroupsActivityDetail' -ParamHash $ParamHash)
    }
    [object]getYammerGroupsActivityDetail([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerGroupsActivityDetail' -ParamHash $ParamHash)
    }
    [object]getYammerGroupsActivityGroupCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerGroupsActivityGroupCounts' -ParamHash $ParamHash)
    }
    [object]getYammerGroupsActivityCounts([string]$period){
        $ParamHash = @{
            'period'=$period
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getYammerGroupsActivityCounts' -ParamHash $ParamHash)
    }
    [object]deviceConfigurationUserActivity(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'deviceConfigurationUserActivity')
    }
    [object]deviceConfigurationDeviceActivity(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'deviceConfigurationDeviceActivity')
    }
}
$null = $Script:MSGraphAPIClassHash.Add('report', 'MSGraphAPI_v1_report')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.report', 'MSGraphAPI_v1_report')


class MSGraphAPI_v1_report : MSGraphAPI_Base {
    [object] $content
}
$null = $Script:MSGraphAPIClassHash.Add('administrativeUnit', 'MSGraphAPI_v1_administrativeUnit')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.administrativeUnit', 'MSGraphAPI_v1_administrativeUnit')


class MSGraphAPI_v1_administrativeUnit : MSGraphAPI_v1_directoryObject {




}
$null = $Script:MSGraphAPIClassHash.Add('educationRoot', 'MSGraphAPI_v1_educationRoot')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationRoot', 'MSGraphAPI_v1_educationRoot')


class MSGraphAPI_v1_educationRoot : MSGraphAPI_v1_entity {

    [object]Get_classes(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/classes")
    }
    [object]Get_schools(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/schools")
    }
    [object]Get_users(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/users")
    }
    [object]Get_me(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/me")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('educationClass', 'MSGraphAPI_v1_educationClass')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationClass', 'MSGraphAPI_v1_educationClass')


class MSGraphAPI_v1_educationClass : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $mailNickname
    [string] $description
    [MSGraphAPI_v1_identitySet] $createdBy
    [string] $classCode
    [string] $externalName
    [string] $externalId
    [MSGraphAPI_v1_educationExternalSource] $externalSource
    [MSGraphAPI_v1_educationTerm] $term
    [object]Get_schools(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/schools")
    }
    [object]Get_members(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/members")
    }
    [object]Get_teachers(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/teachers")
    }
    [object]Get_group(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/group")
    }
    [object]renew(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'renew')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('educationOrganization', 'MSGraphAPI_v1_educationOrganization')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationOrganization', 'MSGraphAPI_v1_educationOrganization')


class MSGraphAPI_v1_educationOrganization : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $description
    [MSGraphAPI_v1_educationExternalSource] $externalSource



}
$null = $Script:MSGraphAPIClassHash.Add('educationSchool', 'MSGraphAPI_v1_educationSchool')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationSchool', 'MSGraphAPI_v1_educationSchool')


class MSGraphAPI_v1_educationSchool : MSGraphAPI_v1_educationOrganization {
    [string] $principalEmail
    [string] $principalName
    [string] $externalPrincipalId
    [string] $lowestGrade
    [string] $highestGrade
    [string] $schoolNumber
    [string] $externalId
    [string] $phone
    [string] $fax
    [MSGraphAPI_v1_identitySet] $createdBy
    [MSGraphAPI_v1_physicalAddress] $address
    [object]Get_classes(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/classes")
    }
    [object]Get_users(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/users")
    }
    [object]Get_administrativeUnit(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/administrativeUnit")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('educationUser', 'MSGraphAPI_v1_educationUser')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationUser', 'MSGraphAPI_v1_educationUser')


class MSGraphAPI_v1_educationUser : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_educationUserRole] $primaryRole
    [string] $middleName
    [MSGraphAPI_v1_educationExternalSource] $externalSource
    [MSGraphAPI_v1_physicalAddress] $residenceAddress
    [MSGraphAPI_v1_physicalAddress] $mailingAddress
    [MSGraphAPI_v1_educationStudent] $student
    [MSGraphAPI_v1_educationTeacher] $teacher
    [MSGraphAPI_v1_identitySet] $createdBy
    [MSGraphAPI_v1_educationRelatedContact[]] $relatedContacts
    [Nullable[bool]] $accountEnabled
    [MSGraphAPI_v1_assignedLicense[]] $assignedLicenses
    [MSGraphAPI_v1_assignedPlan[]] $assignedPlans
    [string[]] $businessPhones
    [string] $department
    [string] $displayName
    [string] $givenName
    [string] $mail
    [string] $mailNickname
    [string] $mobilePhone
    [string] $passwordPolicies
    [MSGraphAPI_v1_passwordProfile] $passwordProfile
    [string] $officeLocation
    [string] $preferredLanguage
    [MSGraphAPI_v1_provisionedPlan[]] $provisionedPlans
    [Nullable[DateTimeOffset]] $refreshTokensValidFromDateTime
    [Nullable[bool]] $showInAddressList
    [string] $surname
    [string] $usageLocation
    [string] $userPrincipalName
    [string] $userType
    [object]Get_schools(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/schools")
    }
    [object]Get_classes(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/classes")
    }
    [object]Get_user(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/user")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('educationStudent', 'MSGraphAPI_v1_educationStudent')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationStudent', 'MSGraphAPI_v1_educationStudent')


class MSGraphAPI_v1_educationStudent : MSGraphAPI_Base {
    [string] $graduationYear
    [string] $grade
    [Nullable[DateTime]] $birthDate
    [MSGraphAPI_v1_educationGender] $gender
    [string] $studentNumber
    [string] $externalId
}
$null = $Script:MSGraphAPIClassHash.Add('educationRelatedContact', 'MSGraphAPI_v1_educationRelatedContact')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationRelatedContact', 'MSGraphAPI_v1_educationRelatedContact')


class MSGraphAPI_v1_educationRelatedContact : MSGraphAPI_Base {
    [string] $id
    [string] $displayName
    [string] $emailAddress
    [string] $mobilePhone
    [MSGraphAPI_v1_educationContactRelationship] $relationship
    [Nullable[bool]] $accessConsent
}
$null = $Script:MSGraphAPIClassHash.Add('educationTeacher', 'MSGraphAPI_v1_educationTeacher')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationTeacher', 'MSGraphAPI_v1_educationTeacher')


class MSGraphAPI_v1_educationTeacher : MSGraphAPI_Base {
    [string] $teacherNumber
    [string] $externalId
}
$null = $Script:MSGraphAPIClassHash.Add('educationTerm', 'MSGraphAPI_v1_educationTerm')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.educationTerm', 'MSGraphAPI_v1_educationTerm')


class MSGraphAPI_v1_educationTerm : MSGraphAPI_Base {
    [string] $externalId
    [Nullable[DateTime]] $startDate
    [Nullable[DateTime]] $endDate
    [string] $displayName
}
$null = $Script:MSGraphAPIClassHash.Add('deviceAppManagement', 'MSGraphAPI_v1_deviceAppManagement')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceAppManagement', 'MSGraphAPI_v1_deviceAppManagement')


class MSGraphAPI_v1_deviceAppManagement : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $microsoftStoreForBusinessLastSuccessfulSyncDateTime
    [Nullable[bool]] $isEnabledForMicrosoftStoreForBusiness
    [string] $microsoftStoreForBusinessLanguage
    [Nullable[DateTimeOffset]] $microsoftStoreForBusinessLastCompletedApplicationSyncTime
    [object]Get_mobileApps(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/mobileApps")
    }
    [object]Get_mobileAppCategories(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/mobileAppCategories")
    }
    [object]Get_mobileAppConfigurations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/mobileAppConfigurations")
    }
    [object]Get_managedAppPolicies(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedAppPolicies")
    }
    [object]Get_iosManagedAppProtections(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/iosManagedAppProtections")
    }
    [object]Get_androidManagedAppProtections(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/androidManagedAppProtections")
    }
    [object]Get_defaultManagedAppProtections(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/defaultManagedAppProtections")
    }
    [object]Get_targetedManagedAppConfigurations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/targetedManagedAppConfigurations")
    }
    [object]Get_mdmWindowsInformationProtectionPolicies(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/mdmWindowsInformationProtectionPolicies")
    }
    [object]Get_windowsInformationProtectionPolicies(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/windowsInformationProtectionPolicies")
    }
    [object]Get_managedAppRegistrations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedAppRegistrations")
    }
    [object]Get_managedAppStatuses(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedAppStatuses")
    }
    [object]Get_managedEBooks(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedEBooks")
    }
    [object]syncMicrosoftStoreForBusinessApps(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'syncMicrosoftStoreForBusinessApps')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('mobileApp', 'MSGraphAPI_v1_mobileApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileApp', 'MSGraphAPI_v1_mobileApp')


class MSGraphAPI_v1_mobileApp : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $description
    [string] $publisher
    [MSGraphAPI_v1_mimeContent] $largeIcon
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [Nullable[bool]] $isFeatured
    [string] $privacyInformationUrl
    [string] $informationUrl
    [string] $owner
    [string] $developer
    [string] $notes
    [MSGraphAPI_v1_mobileAppPublishingState] $publishingState
    [object]Get_categories(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/categories")
    }
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]assign([object]$mobileAppAssignments){
        $ParamHash = @{
            'mobileAppAssignments'=$mobileAppAssignments
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assign' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('mobileAppCategory', 'MSGraphAPI_v1_mobileAppCategory')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileAppCategory', 'MSGraphAPI_v1_mobileAppCategory')


class MSGraphAPI_v1_mobileAppCategory : MSGraphAPI_v1_entity {
    [string] $displayName
    [Nullable[DateTimeOffset]] $lastModifiedDateTime



}
$null = $Script:MSGraphAPIClassHash.Add('managedDeviceMobileAppConfiguration', 'MSGraphAPI_v1_managedDeviceMobileAppConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedDeviceMobileAppConfiguration', 'MSGraphAPI_v1_managedDeviceMobileAppConfiguration')


class MSGraphAPI_v1_managedDeviceMobileAppConfiguration : MSGraphAPI_v1_entity {
    [string[]] $targetedMobileApps
    [Nullable[DateTimeOffset]] $createdDateTime
    [string] $description
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $displayName
    [Nullable[int]] $version
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]Get_userStatuses(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/userStatuses")
    }
    [object]Get_deviceStatusSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceStatusSummary")
    }
    [object]Get_userStatusSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/userStatusSummary")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('managedAppPolicy', 'MSGraphAPI_v1_managedAppPolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppPolicy', 'MSGraphAPI_v1_managedAppPolicy')


class MSGraphAPI_v1_managedAppPolicy : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $description
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $version

    [object]targetApps([object]$apps){
        $ParamHash = @{
            'apps'=$apps
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'targetApps' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('managedAppProtection', 'MSGraphAPI_v1_managedAppProtection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppProtection', 'MSGraphAPI_v1_managedAppProtection')


class MSGraphAPI_v1_managedAppProtection : MSGraphAPI_v1_managedAppPolicy {
    [object] $periodOfflineBeforeAccessCheck
    [object] $periodOnlineBeforeAccessCheck
    [MSGraphAPI_v1_managedAppDataTransferLevel] $allowedInboundDataTransferSources
    [MSGraphAPI_v1_managedAppDataTransferLevel] $allowedOutboundDataTransferDestinations
    [Nullable[bool]] $organizationalCredentialsRequired
    [MSGraphAPI_v1_managedAppClipboardSharingLevel] $allowedOutboundClipboardSharingLevel
    [Nullable[bool]] $dataBackupBlocked
    [Nullable[bool]] $deviceComplianceRequired
    [Nullable[bool]] $managedBrowserToOpenLinksRequired
    [Nullable[bool]] $saveAsBlocked
    [object] $periodOfflineBeforeWipeIsEnforced
    [Nullable[bool]] $pinRequired
    [Nullable[int]] $maximumPinRetries
    [Nullable[bool]] $simplePinBlocked
    [Nullable[int]] $minimumPinLength
    [MSGraphAPI_v1_managedAppPinCharacterSet] $pinCharacterSet
    [object] $periodBeforePinReset
    [MSGraphAPI_v1_managedAppDataStorageLocation[]] $allowedDataStorageLocations
    [Nullable[bool]] $contactSyncBlocked
    [Nullable[bool]] $printBlocked
    [Nullable[bool]] $fingerprintBlocked
    [Nullable[bool]] $disableAppPinIfDevicePinIsSet
    [string] $minimumRequiredOsVersion
    [string] $minimumWarningOsVersion
    [string] $minimumRequiredAppVersion
    [string] $minimumWarningAppVersion

    [object]targetApps([object]$apps){
        $ParamHash = @{
            'apps'=$apps
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'targetApps' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('targetedManagedAppProtection', 'MSGraphAPI_v1_targetedManagedAppProtection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.targetedManagedAppProtection', 'MSGraphAPI_v1_targetedManagedAppProtection')


class MSGraphAPI_v1_targetedManagedAppProtection : MSGraphAPI_v1_managedAppProtection {
    [Nullable[bool]] $isAssigned
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]assign([object]$assignments){
        $ParamHash = @{
            'assignments'=$assignments
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assign' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('iosManagedAppProtection', 'MSGraphAPI_v1_iosManagedAppProtection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosManagedAppProtection', 'MSGraphAPI_v1_iosManagedAppProtection')


class MSGraphAPI_v1_iosManagedAppProtection : MSGraphAPI_v1_targetedManagedAppProtection {
    [MSGraphAPI_v1_managedAppDataEncryptionType] $appDataEncryptionType
    [string] $minimumRequiredSdkVersion
    [Nullable[int]] $deployedAppCount
    [Nullable[bool]] $faceIdBlocked
    [object]Get_apps(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/apps")
    }
    [object]Get_deploymentSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deploymentSummary")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('androidManagedAppProtection', 'MSGraphAPI_v1_androidManagedAppProtection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidManagedAppProtection', 'MSGraphAPI_v1_androidManagedAppProtection')


class MSGraphAPI_v1_androidManagedAppProtection : MSGraphAPI_v1_targetedManagedAppProtection {
    [Nullable[bool]] $screenCaptureBlocked
    [Nullable[bool]] $disableAppEncryptionIfDeviceEncryptionIsEnabled
    [Nullable[bool]] $encryptAppData
    [Nullable[int]] $deployedAppCount
    [string] $minimumRequiredPatchVersion
    [string] $minimumWarningPatchVersion
    [object]Get_apps(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/apps")
    }
    [object]Get_deploymentSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deploymentSummary")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('defaultManagedAppProtection', 'MSGraphAPI_v1_defaultManagedAppProtection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.defaultManagedAppProtection', 'MSGraphAPI_v1_defaultManagedAppProtection')


class MSGraphAPI_v1_defaultManagedAppProtection : MSGraphAPI_v1_managedAppProtection {
    [MSGraphAPI_v1_managedAppDataEncryptionType] $appDataEncryptionType
    [Nullable[bool]] $screenCaptureBlocked
    [Nullable[bool]] $encryptAppData
    [Nullable[bool]] $disableAppEncryptionIfDeviceEncryptionIsEnabled
    [string] $minimumRequiredSdkVersion
    [MSGraphAPI_v1_keyValuePair[]] $customSettings
    [Nullable[int]] $deployedAppCount
    [string] $minimumRequiredPatchVersion
    [string] $minimumWarningPatchVersion
    [Nullable[bool]] $faceIdBlocked
    [object]Get_apps(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/apps")
    }
    [object]Get_deploymentSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deploymentSummary")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('managedAppConfiguration', 'MSGraphAPI_v1_managedAppConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppConfiguration', 'MSGraphAPI_v1_managedAppConfiguration')


class MSGraphAPI_v1_managedAppConfiguration : MSGraphAPI_v1_managedAppPolicy {
    [MSGraphAPI_v1_keyValuePair[]] $customSettings



}
$null = $Script:MSGraphAPIClassHash.Add('targetedManagedAppConfiguration', 'MSGraphAPI_v1_targetedManagedAppConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.targetedManagedAppConfiguration', 'MSGraphAPI_v1_targetedManagedAppConfiguration')


class MSGraphAPI_v1_targetedManagedAppConfiguration : MSGraphAPI_v1_managedAppConfiguration {
    [Nullable[int]] $deployedAppCount
    [Nullable[bool]] $isAssigned
    [object]Get_apps(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/apps")
    }
    [object]Get_deploymentSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deploymentSummary")
    }
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]assign([object]$assignments){
        $ParamHash = @{
            'assignments'=$assignments
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assign' -ParamHash $ParamHash)
    }
    [object]targetApps([object]$apps){
        $ParamHash = @{
            'apps'=$apps
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'targetApps' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtection', 'MSGraphAPI_v1_windowsInformationProtection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtection', 'MSGraphAPI_v1_windowsInformationProtection')


class MSGraphAPI_v1_windowsInformationProtection : MSGraphAPI_v1_managedAppPolicy {
    [MSGraphAPI_v1_windowsInformationProtectionEnforcementLevel] $enforcementLevel
    [string] $enterpriseDomain
    [MSGraphAPI_v1_windowsInformationProtectionResourceCollection[]] $enterpriseProtectedDomainNames
    [Nullable[bool]] $protectionUnderLockConfigRequired
    [MSGraphAPI_v1_windowsInformationProtectionDataRecoveryCertificate] $dataRecoveryCertificate
    [Nullable[bool]] $revokeOnUnenrollDisabled
    [Nullable[Guid]] $rightsManagementServicesTemplateId
    [Nullable[bool]] $azureRightsManagementServicesAllowed
    [Nullable[bool]] $iconsVisible
    [MSGraphAPI_v1_windowsInformationProtectionApp[]] $protectedApps
    [MSGraphAPI_v1_windowsInformationProtectionApp[]] $exemptApps
    [MSGraphAPI_v1_windowsInformationProtectionResourceCollection[]] $enterpriseNetworkDomainNames
    [MSGraphAPI_v1_windowsInformationProtectionProxiedDomainCollection[]] $enterpriseProxiedDomains
    [MSGraphAPI_v1_windowsInformationProtectionIPRangeCollection[]] $enterpriseIPRanges
    [Nullable[bool]] $enterpriseIPRangesAreAuthoritative
    [MSGraphAPI_v1_windowsInformationProtectionResourceCollection[]] $enterpriseProxyServers
    [MSGraphAPI_v1_windowsInformationProtectionResourceCollection[]] $enterpriseInternalProxyServers
    [Nullable[bool]] $enterpriseProxyServersAreAuthoritative
    [MSGraphAPI_v1_windowsInformationProtectionResourceCollection[]] $neutralDomainResources
    [Nullable[bool]] $indexingEncryptedStoresOrItemsBlocked
    [MSGraphAPI_v1_windowsInformationProtectionResourceCollection[]] $smbAutoEncryptedFileExtensions
    [Nullable[bool]] $isAssigned
    [object]Get_protectedAppLockerFiles(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/protectedAppLockerFiles")
    }
    [object]Get_exemptAppLockerFiles(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/exemptAppLockerFiles")
    }
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]assign([object]$assignments){
        $ParamHash = @{
            'assignments'=$assignments
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assign' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('mdmWindowsInformationProtectionPolicy', 'MSGraphAPI_v1_mdmWindowsInformationProtectionPolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mdmWindowsInformationProtectionPolicy', 'MSGraphAPI_v1_mdmWindowsInformationProtectionPolicy')


class MSGraphAPI_v1_mdmWindowsInformationProtectionPolicy : MSGraphAPI_v1_windowsInformationProtection {




}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionPolicy', 'MSGraphAPI_v1_windowsInformationProtectionPolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionPolicy', 'MSGraphAPI_v1_windowsInformationProtectionPolicy')


class MSGraphAPI_v1_windowsInformationProtectionPolicy : MSGraphAPI_v1_windowsInformationProtection {
    [Nullable[bool]] $revokeOnMdmHandoffDisabled
    [string] $mdmEnrollmentUrl
    [Nullable[bool]] $windowsHelloForBusinessBlocked
    [Nullable[int]] $pinMinimumLength
    [MSGraphAPI_v1_windowsInformationProtectionPinCharacterRequirements] $pinUppercaseLetters
    [MSGraphAPI_v1_windowsInformationProtectionPinCharacterRequirements] $pinLowercaseLetters
    [MSGraphAPI_v1_windowsInformationProtectionPinCharacterRequirements] $pinSpecialCharacters
    [Nullable[int]] $pinExpirationDays
    [Nullable[int]] $numberOfPastPinsRemembered
    [Nullable[int]] $passwordMaximumAttemptCount
    [Nullable[int]] $minutesOfInactivityBeforeDeviceLock
    [Nullable[int]] $daysWithoutContactBeforeUnenroll



}
$null = $Script:MSGraphAPIClassHash.Add('managedAppStatus', 'MSGraphAPI_v1_managedAppStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppStatus', 'MSGraphAPI_v1_managedAppStatus')


class MSGraphAPI_v1_managedAppStatus : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $version



}
$null = $Script:MSGraphAPIClassHash.Add('managedEBook', 'MSGraphAPI_v1_managedEBook')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedEBook', 'MSGraphAPI_v1_managedEBook')


class MSGraphAPI_v1_managedEBook : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $description
    [string] $publisher
    [Nullable[DateTimeOffset]] $publishedDateTime
    [MSGraphAPI_v1_mimeContent] $largeCover
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $informationUrl
    [string] $privacyInformationUrl
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]Get_installSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/installSummary")
    }
    [object]Get_deviceStates(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceStates")
    }
    [object]Get_userStateSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/userStateSummary")
    }
    [object]assign([object]$managedEBookAssignments){
        $ParamHash = @{
            'managedEBookAssignments'=$managedEBookAssignments
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assign' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('mobileAppAssignment', 'MSGraphAPI_v1_mobileAppAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileAppAssignment', 'MSGraphAPI_v1_mobileAppAssignment')


class MSGraphAPI_v1_mobileAppAssignment : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_installIntent] $intent
    [MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget] $target
    [MSGraphAPI_v1_mobileAppAssignmentSettings] $settings



}
$null = $Script:MSGraphAPIClassHash.Add('deviceAndAppManagementAssignmentTarget', 'MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceAndAppManagementAssignmentTarget', 'MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget')


class MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('mobileAppAssignmentSettings', 'MSGraphAPI_v1_mobileAppAssignmentSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileAppAssignmentSettings', 'MSGraphAPI_v1_mobileAppAssignmentSettings')


class MSGraphAPI_v1_mobileAppAssignmentSettings : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('mimeContent', 'MSGraphAPI_v1_mimeContent')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mimeContent', 'MSGraphAPI_v1_mimeContent')


class MSGraphAPI_v1_mimeContent : MSGraphAPI_Base {
    [string] $type
    [object] $value
}
$null = $Script:MSGraphAPIClassHash.Add('mobileAppContentFile', 'MSGraphAPI_v1_mobileAppContentFile')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileAppContentFile', 'MSGraphAPI_v1_mobileAppContentFile')


class MSGraphAPI_v1_mobileAppContentFile : MSGraphAPI_v1_entity {
    [string] $azureStorageUri
    [Nullable[bool]] $isCommitted
    [Nullable[DateTimeOffset]] $createdDateTime
    [string] $name
    [Nullable[int64]] $size
    [Nullable[int64]] $sizeEncrypted
    [Nullable[DateTimeOffset]] $azureStorageUriExpirationDateTime
    [object] $manifest
    [MSGraphAPI_v1_mobileAppContentFileUploadState] $uploadState

    [object]commit([object]$fileEncryptionInfo){
        $ParamHash = @{
            'fileEncryptionInfo'=$fileEncryptionInfo
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'commit' -ParamHash $ParamHash)
    }
    [object]renewUpload(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'renewUpload')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('fileEncryptionInfo', 'MSGraphAPI_v1_fileEncryptionInfo')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.fileEncryptionInfo', 'MSGraphAPI_v1_fileEncryptionInfo')


class MSGraphAPI_v1_fileEncryptionInfo : MSGraphAPI_Base {
    [object] $encryptionKey
    [object] $initializationVector
    [object] $mac
    [object] $macKey
    [string] $profileIdentifier
    [object] $fileDigest
    [string] $fileDigestAlgorithm
}
$null = $Script:MSGraphAPIClassHash.Add('allLicensedUsersAssignmentTarget', 'MSGraphAPI_v1_allLicensedUsersAssignmentTarget')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.allLicensedUsersAssignmentTarget', 'MSGraphAPI_v1_allLicensedUsersAssignmentTarget')


class MSGraphAPI_v1_allLicensedUsersAssignmentTarget : MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget {

}
$null = $Script:MSGraphAPIClassHash.Add('groupAssignmentTarget', 'MSGraphAPI_v1_groupAssignmentTarget')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.groupAssignmentTarget', 'MSGraphAPI_v1_groupAssignmentTarget')


class MSGraphAPI_v1_groupAssignmentTarget : MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget {
    [string] $groupId
}
$null = $Script:MSGraphAPIClassHash.Add('exclusionGroupAssignmentTarget', 'MSGraphAPI_v1_exclusionGroupAssignmentTarget')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.exclusionGroupAssignmentTarget', 'MSGraphAPI_v1_exclusionGroupAssignmentTarget')


class MSGraphAPI_v1_exclusionGroupAssignmentTarget : MSGraphAPI_v1_groupAssignmentTarget {

}
$null = $Script:MSGraphAPIClassHash.Add('allDevicesAssignmentTarget', 'MSGraphAPI_v1_allDevicesAssignmentTarget')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.allDevicesAssignmentTarget', 'MSGraphAPI_v1_allDevicesAssignmentTarget')


class MSGraphAPI_v1_allDevicesAssignmentTarget : MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget {

}
$null = $Script:MSGraphAPIClassHash.Add('iosLobAppAssignmentSettings', 'MSGraphAPI_v1_iosLobAppAssignmentSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosLobAppAssignmentSettings', 'MSGraphAPI_v1_iosLobAppAssignmentSettings')


class MSGraphAPI_v1_iosLobAppAssignmentSettings : MSGraphAPI_v1_mobileAppAssignmentSettings {
    [string] $vpnConfigurationId
}
$null = $Script:MSGraphAPIClassHash.Add('iosStoreAppAssignmentSettings', 'MSGraphAPI_v1_iosStoreAppAssignmentSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosStoreAppAssignmentSettings', 'MSGraphAPI_v1_iosStoreAppAssignmentSettings')


class MSGraphAPI_v1_iosStoreAppAssignmentSettings : MSGraphAPI_v1_mobileAppAssignmentSettings {
    [string] $vpnConfigurationId
}
$null = $Script:MSGraphAPIClassHash.Add('iosVppAppAssignmentSettings', 'MSGraphAPI_v1_iosVppAppAssignmentSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosVppAppAssignmentSettings', 'MSGraphAPI_v1_iosVppAppAssignmentSettings')


class MSGraphAPI_v1_iosVppAppAssignmentSettings : MSGraphAPI_v1_mobileAppAssignmentSettings {
    [Nullable[bool]] $useDeviceLicensing
    [string] $vpnConfigurationId
}
$null = $Script:MSGraphAPIClassHash.Add('microsoftStoreForBusinessAppAssignmentSettings', 'MSGraphAPI_v1_microsoftStoreForBusinessAppAssignmentSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.microsoftStoreForBusinessAppAssignmentSettings', 'MSGraphAPI_v1_microsoftStoreForBusinessAppAssignmentSettings')


class MSGraphAPI_v1_microsoftStoreForBusinessAppAssignmentSettings : MSGraphAPI_v1_mobileAppAssignmentSettings {
    [Nullable[bool]] $useDeviceContext
}
$null = $Script:MSGraphAPIClassHash.Add('macOSOfficeSuiteApp', 'MSGraphAPI_v1_macOSOfficeSuiteApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.macOSOfficeSuiteApp', 'MSGraphAPI_v1_macOSOfficeSuiteApp')


class MSGraphAPI_v1_macOSOfficeSuiteApp : MSGraphAPI_v1_mobileApp {




}
$null = $Script:MSGraphAPIClassHash.Add('managedApp', 'MSGraphAPI_v1_managedApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedApp', 'MSGraphAPI_v1_managedApp')


class MSGraphAPI_v1_managedApp : MSGraphAPI_v1_mobileApp {
    [MSGraphAPI_v1_managedAppAvailability] $appAvailability
    [string] $version



}
$null = $Script:MSGraphAPIClassHash.Add('managedAndroidStoreApp', 'MSGraphAPI_v1_managedAndroidStoreApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAndroidStoreApp', 'MSGraphAPI_v1_managedAndroidStoreApp')


class MSGraphAPI_v1_managedAndroidStoreApp : MSGraphAPI_v1_managedApp {
    [string] $packageId
    [string] $appStoreUrl
    [MSGraphAPI_v1_androidMinimumOperatingSystem] $minimumSupportedOperatingSystem



}
$null = $Script:MSGraphAPIClassHash.Add('androidMinimumOperatingSystem', 'MSGraphAPI_v1_androidMinimumOperatingSystem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidMinimumOperatingSystem', 'MSGraphAPI_v1_androidMinimumOperatingSystem')


class MSGraphAPI_v1_androidMinimumOperatingSystem : MSGraphAPI_Base {
    [Nullable[bool]] $v4_0
    [Nullable[bool]] $v4_0_3
    [Nullable[bool]] $v4_1
    [Nullable[bool]] $v4_2
    [Nullable[bool]] $v4_3
    [Nullable[bool]] $v4_4
    [Nullable[bool]] $v5_0
    [Nullable[bool]] $v5_1
}
$null = $Script:MSGraphAPIClassHash.Add('managedIOSStoreApp', 'MSGraphAPI_v1_managedIOSStoreApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedIOSStoreApp', 'MSGraphAPI_v1_managedIOSStoreApp')


class MSGraphAPI_v1_managedIOSStoreApp : MSGraphAPI_v1_managedApp {
    [string] $bundleId
    [string] $appStoreUrl
    [MSGraphAPI_v1_iosDeviceType] $applicableDeviceType
    [MSGraphAPI_v1_iosMinimumOperatingSystem] $minimumSupportedOperatingSystem



}
$null = $Script:MSGraphAPIClassHash.Add('iosDeviceType', 'MSGraphAPI_v1_iosDeviceType')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosDeviceType', 'MSGraphAPI_v1_iosDeviceType')


class MSGraphAPI_v1_iosDeviceType : MSGraphAPI_Base {
    [Nullable[bool]] $iPad
    [Nullable[bool]] $iPhoneAndIPod
}
$null = $Script:MSGraphAPIClassHash.Add('iosMinimumOperatingSystem', 'MSGraphAPI_v1_iosMinimumOperatingSystem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosMinimumOperatingSystem', 'MSGraphAPI_v1_iosMinimumOperatingSystem')


class MSGraphAPI_v1_iosMinimumOperatingSystem : MSGraphAPI_Base {
    [Nullable[bool]] $v8_0
    [Nullable[bool]] $v9_0
    [Nullable[bool]] $v10_0
    [Nullable[bool]] $v11_0
}
$null = $Script:MSGraphAPIClassHash.Add('managedMobileLobApp', 'MSGraphAPI_v1_managedMobileLobApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedMobileLobApp', 'MSGraphAPI_v1_managedMobileLobApp')


class MSGraphAPI_v1_managedMobileLobApp : MSGraphAPI_v1_managedApp {
    [string] $committedContentVersion
    [string] $fileName
    [Nullable[int64]] $size
    [object]Get_contentVersions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/contentVersions")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('mobileAppContent', 'MSGraphAPI_v1_mobileAppContent')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileAppContent', 'MSGraphAPI_v1_mobileAppContent')


class MSGraphAPI_v1_mobileAppContent : MSGraphAPI_v1_entity {

    [object]Get_files(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/files")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('managedAndroidLobApp', 'MSGraphAPI_v1_managedAndroidLobApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAndroidLobApp', 'MSGraphAPI_v1_managedAndroidLobApp')


class MSGraphAPI_v1_managedAndroidLobApp : MSGraphAPI_v1_managedMobileLobApp {
    [string] $packageId
    [MSGraphAPI_v1_androidMinimumOperatingSystem] $minimumSupportedOperatingSystem
    [string] $versionName
    [string] $versionCode



}
$null = $Script:MSGraphAPIClassHash.Add('managedIOSLobApp', 'MSGraphAPI_v1_managedIOSLobApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedIOSLobApp', 'MSGraphAPI_v1_managedIOSLobApp')


class MSGraphAPI_v1_managedIOSLobApp : MSGraphAPI_v1_managedMobileLobApp {
    [string] $bundleId
    [MSGraphAPI_v1_iosDeviceType] $applicableDeviceType
    [MSGraphAPI_v1_iosMinimumOperatingSystem] $minimumSupportedOperatingSystem
    [Nullable[DateTimeOffset]] $expirationDateTime
    [string] $versionNumber
    [string] $buildNumber



}
$null = $Script:MSGraphAPIClassHash.Add('mobileLobApp', 'MSGraphAPI_v1_mobileLobApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileLobApp', 'MSGraphAPI_v1_mobileLobApp')


class MSGraphAPI_v1_mobileLobApp : MSGraphAPI_v1_mobileApp {
    [string] $committedContentVersion
    [string] $fileName
    [Nullable[int64]] $size
    [object]Get_contentVersions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/contentVersions")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('windowsMobileMSI', 'MSGraphAPI_v1_windowsMobileMSI')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsMobileMSI', 'MSGraphAPI_v1_windowsMobileMSI')


class MSGraphAPI_v1_windowsMobileMSI : MSGraphAPI_v1_mobileLobApp {
    [string] $commandLine
    [string] $productCode
    [string] $productVersion
    [Nullable[bool]] $ignoreVersionDetection



}
$null = $Script:MSGraphAPIClassHash.Add('windowsMinimumOperatingSystem', 'MSGraphAPI_v1_windowsMinimumOperatingSystem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsMinimumOperatingSystem', 'MSGraphAPI_v1_windowsMinimumOperatingSystem')


class MSGraphAPI_v1_windowsMinimumOperatingSystem : MSGraphAPI_Base {
    [Nullable[bool]] $v8_0
    [Nullable[bool]] $v8_1
    [Nullable[bool]] $v10_0
}
$null = $Script:MSGraphAPIClassHash.Add('windowsUniversalAppX', 'MSGraphAPI_v1_windowsUniversalAppX')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsUniversalAppX', 'MSGraphAPI_v1_windowsUniversalAppX')


class MSGraphAPI_v1_windowsUniversalAppX : MSGraphAPI_v1_mobileLobApp {
    [MSGraphAPI_v1_windowsArchitecture] $applicableArchitectures
    [MSGraphAPI_v1_windowsDeviceType] $applicableDeviceTypes
    [string] $identityName
    [string] $identityPublisherHash
    [string] $identityResourceIdentifier
    [Nullable[bool]] $isBundle
    [MSGraphAPI_v1_windowsMinimumOperatingSystem] $minimumSupportedOperatingSystem
    [string] $identityVersion



}
$null = $Script:MSGraphAPIClassHash.Add('androidLobApp', 'MSGraphAPI_v1_androidLobApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidLobApp', 'MSGraphAPI_v1_androidLobApp')


class MSGraphAPI_v1_androidLobApp : MSGraphAPI_v1_mobileLobApp {
    [string] $packageId
    [MSGraphAPI_v1_androidMinimumOperatingSystem] $minimumSupportedOperatingSystem
    [string] $versionName
    [string] $versionCode



}
$null = $Script:MSGraphAPIClassHash.Add('iosLobApp', 'MSGraphAPI_v1_iosLobApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosLobApp', 'MSGraphAPI_v1_iosLobApp')


class MSGraphAPI_v1_iosLobApp : MSGraphAPI_v1_mobileLobApp {
    [string] $bundleId
    [MSGraphAPI_v1_iosDeviceType] $applicableDeviceType
    [MSGraphAPI_v1_iosMinimumOperatingSystem] $minimumSupportedOperatingSystem
    [Nullable[DateTimeOffset]] $expirationDateTime
    [string] $versionNumber
    [string] $buildNumber



}
$null = $Script:MSGraphAPIClassHash.Add('microsoftStoreForBusinessApp', 'MSGraphAPI_v1_microsoftStoreForBusinessApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.microsoftStoreForBusinessApp', 'MSGraphAPI_v1_microsoftStoreForBusinessApp')


class MSGraphAPI_v1_microsoftStoreForBusinessApp : MSGraphAPI_v1_mobileApp {
    [Nullable[int]] $usedLicenseCount
    [Nullable[int]] $totalLicenseCount
    [string] $productKey
    [MSGraphAPI_v1_microsoftStoreForBusinessLicenseType] $licenseType
    [string] $packageIdentityName



}
$null = $Script:MSGraphAPIClassHash.Add('webApp', 'MSGraphAPI_v1_webApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.webApp', 'MSGraphAPI_v1_webApp')


class MSGraphAPI_v1_webApp : MSGraphAPI_v1_mobileApp {
    [string] $appUrl
    [Nullable[bool]] $useManagedBrowser



}
$null = $Script:MSGraphAPIClassHash.Add('androidStoreApp', 'MSGraphAPI_v1_androidStoreApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidStoreApp', 'MSGraphAPI_v1_androidStoreApp')


class MSGraphAPI_v1_androidStoreApp : MSGraphAPI_v1_mobileApp {
    [string] $packageId
    [string] $appStoreUrl
    [MSGraphAPI_v1_androidMinimumOperatingSystem] $minimumSupportedOperatingSystem



}
$null = $Script:MSGraphAPIClassHash.Add('iosVppApp', 'MSGraphAPI_v1_iosVppApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosVppApp', 'MSGraphAPI_v1_iosVppApp')


class MSGraphAPI_v1_iosVppApp : MSGraphAPI_v1_mobileApp {
    [Nullable[int]] $usedLicenseCount
    [Nullable[int]] $totalLicenseCount
    [Nullable[DateTimeOffset]] $releaseDateTime
    [string] $appStoreUrl
    [MSGraphAPI_v1_vppLicensingType] $licensingType
    [MSGraphAPI_v1_iosDeviceType] $applicableDeviceType
    [string] $vppTokenOrganizationName
    [MSGraphAPI_v1_vppTokenAccountType] $vppTokenAccountType
    [string] $vppTokenAppleId
    [string] $bundleId



}
$null = $Script:MSGraphAPIClassHash.Add('vppLicensingType', 'MSGraphAPI_v1_vppLicensingType')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.vppLicensingType', 'MSGraphAPI_v1_vppLicensingType')


class MSGraphAPI_v1_vppLicensingType : MSGraphAPI_Base {
    [Nullable[bool]] $supportsUserLicensing
    [Nullable[bool]] $supportsDeviceLicensing
}
$null = $Script:MSGraphAPIClassHash.Add('iosStoreApp', 'MSGraphAPI_v1_iosStoreApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosStoreApp', 'MSGraphAPI_v1_iosStoreApp')


class MSGraphAPI_v1_iosStoreApp : MSGraphAPI_v1_mobileApp {
    [string] $bundleId
    [string] $appStoreUrl
    [MSGraphAPI_v1_iosDeviceType] $applicableDeviceType
    [MSGraphAPI_v1_iosMinimumOperatingSystem] $minimumSupportedOperatingSystem



}
$null = $Script:MSGraphAPIClassHash.Add('managedDeviceMobileAppConfigurationUserStatus', 'MSGraphAPI_v1_managedDeviceMobileAppConfigurationUserStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedDeviceMobileAppConfigurationUserStatus', 'MSGraphAPI_v1_managedDeviceMobileAppConfigurationUserStatus')


class MSGraphAPI_v1_managedDeviceMobileAppConfigurationUserStatus : MSGraphAPI_v1_entity {
    [string] $userDisplayName
    [Nullable[int]] $devicesCount
    [MSGraphAPI_v1_complianceStatus] $status
    [Nullable[DateTimeOffset]] $lastReportedDateTime
    [string] $userPrincipalName



}
$null = $Script:MSGraphAPIClassHash.Add('managedDeviceMobileAppConfigurationAssignment', 'MSGraphAPI_v1_managedDeviceMobileAppConfigurationAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedDeviceMobileAppConfigurationAssignment', 'MSGraphAPI_v1_managedDeviceMobileAppConfigurationAssignment')


class MSGraphAPI_v1_managedDeviceMobileAppConfigurationAssignment : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget] $target



}
$null = $Script:MSGraphAPIClassHash.Add('managedDeviceMobileAppConfigurationDeviceSummary', 'MSGraphAPI_v1_managedDeviceMobileAppConfigurationDeviceSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedDeviceMobileAppConfigurationDeviceSummary', 'MSGraphAPI_v1_managedDeviceMobileAppConfigurationDeviceSummary')


class MSGraphAPI_v1_managedDeviceMobileAppConfigurationDeviceSummary : MSGraphAPI_v1_entity {
    [Nullable[int]] $pendingCount
    [Nullable[int]] $notApplicableCount
    [Nullable[int]] $successCount
    [Nullable[int]] $errorCount
    [Nullable[int]] $failedCount
    [Nullable[DateTimeOffset]] $lastUpdateDateTime
    [Nullable[int]] $configurationVersion



}
$null = $Script:MSGraphAPIClassHash.Add('managedDeviceMobileAppConfigurationUserSummary', 'MSGraphAPI_v1_managedDeviceMobileAppConfigurationUserSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedDeviceMobileAppConfigurationUserSummary', 'MSGraphAPI_v1_managedDeviceMobileAppConfigurationUserSummary')


class MSGraphAPI_v1_managedDeviceMobileAppConfigurationUserSummary : MSGraphAPI_v1_entity {
    [Nullable[int]] $pendingCount
    [Nullable[int]] $notApplicableCount
    [Nullable[int]] $successCount
    [Nullable[int]] $errorCount
    [Nullable[int]] $failedCount
    [Nullable[DateTimeOffset]] $lastUpdateDateTime
    [Nullable[int]] $configurationVersion



}
$null = $Script:MSGraphAPIClassHash.Add('deviceManagement', 'MSGraphAPI_v1_deviceManagement')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceManagement', 'MSGraphAPI_v1_deviceManagement')


class MSGraphAPI_v1_deviceManagement : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceManagementSubscriptionState] $subscriptionState
    [MSGraphAPI_v1_deviceManagementSettings] $settings
    [MSGraphAPI_v1_intuneBrand] $intuneBrand
    [object]Get_termsAndConditions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/termsAndConditions")
    }
    [object]Get_applePushNotificationCertificate(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/applePushNotificationCertificate")
    }
    [object]Get_managedDeviceOverview(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedDeviceOverview")
    }
    [object]Get_detectedApps(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/detectedApps")
    }
    [object]Get_managedDevices(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedDevices")
    }
    [object]Get_deviceConfigurations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceConfigurations")
    }
    [object]Get_deviceCompliancePolicies(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceCompliancePolicies")
    }
    [object]Get_softwareUpdateStatusSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/softwareUpdateStatusSummary")
    }
    [object]Get_deviceCompliancePolicyDeviceStateSummary(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceCompliancePolicyDeviceStateSummary")
    }
    [object]Get_deviceCompliancePolicySettingStateSummaries(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceCompliancePolicySettingStateSummaries")
    }
    [object]Get_deviceConfigurationDeviceStateSummaries(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceConfigurationDeviceStateSummaries")
    }
    [object]Get_iosUpdateStatuses(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/iosUpdateStatuses")
    }
    [object]Get_deviceCategories(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceCategories")
    }
    [object]Get_exchangeConnectors(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/exchangeConnectors")
    }
    [object]Get_deviceEnrollmentConfigurations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceEnrollmentConfigurations")
    }
    [object]Get_conditionalAccessSettings(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/conditionalAccessSettings")
    }
    [object]Get_mobileThreatDefenseConnectors(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/mobileThreatDefenseConnectors")
    }
    [object]Get_deviceManagementPartners(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceManagementPartners")
    }
    [object]Get_notificationMessageTemplates(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/notificationMessageTemplates")
    }
    [object]Get_roleDefinitions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/roleDefinitions")
    }
    [object]Get_roleAssignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/roleAssignments")
    }
    [object]Get_resourceOperations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/resourceOperations")
    }
    [object]Get_telecomExpenseManagementPartners(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/telecomExpenseManagementPartners")
    }
    [object]Get_remoteAssistancePartners(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/remoteAssistancePartners")
    }
    [object]Get_windowsInformationProtectionAppLearningSummaries(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/windowsInformationProtectionAppLearningSummaries")
    }
    [object]Get_windowsInformationProtectionNetworkLearningSummaries(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/windowsInformationProtectionNetworkLearningSummaries")
    }
    [object]Get_troubleshootingEvents(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/troubleshootingEvents")
    }

    [object]verifyWindowsEnrollmentAutoDiscovery([string]$domainName){
        $ParamHash = @{
            'domainName'=$domainName
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'verifyWindowsEnrollmentAutoDiscovery' -ParamHash $ParamHash)
    }
    [object]getEffectivePermissions([string]$scope){
        $ParamHash = @{
            'scope'=$scope
        }
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'getEffectivePermissions' -ParamHash $ParamHash)
    }
}
$null = $Script:MSGraphAPIClassHash.Add('termsAndConditions', 'MSGraphAPI_v1_termsAndConditions')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.termsAndConditions', 'MSGraphAPI_v1_termsAndConditions')


class MSGraphAPI_v1_termsAndConditions : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $displayName
    [string] $description
    [string] $title
    [string] $bodyText
    [string] $acceptanceStatement
    [Nullable[int]] $version
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]Get_acceptanceStatuses(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/acceptanceStatuses")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('applePushNotificationCertificate', 'MSGraphAPI_v1_applePushNotificationCertificate')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.applePushNotificationCertificate', 'MSGraphAPI_v1_applePushNotificationCertificate')


class MSGraphAPI_v1_applePushNotificationCertificate : MSGraphAPI_v1_entity {
    [string] $appleIdentifier
    [string] $topicIdentifier
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [Nullable[DateTimeOffset]] $expirationDateTime
    [string] $certificate


    [object]downloadApplePushNotificationCertificateSigningRequest(){
        return (Start-MSGraphAPIFunction -BaseURI $this.GraphURL -Function 'downloadApplePushNotificationCertificateSigningRequest')
    }
}
$null = $Script:MSGraphAPIClassHash.Add('managedDeviceOverview', 'MSGraphAPI_v1_managedDeviceOverview')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedDeviceOverview', 'MSGraphAPI_v1_managedDeviceOverview')


class MSGraphAPI_v1_managedDeviceOverview : MSGraphAPI_v1_entity {
    [Nullable[int]] $enrolledDeviceCount
    [Nullable[int]] $mdmEnrolledCount
    [Nullable[int]] $dualEnrolledDeviceCount
    [MSGraphAPI_v1_deviceOperatingSystemSummary] $deviceOperatingSystemSummary
    [MSGraphAPI_v1_deviceExchangeAccessStateSummary] $deviceExchangeAccessStateSummary



}
$null = $Script:MSGraphAPIClassHash.Add('detectedApp', 'MSGraphAPI_v1_detectedApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.detectedApp', 'MSGraphAPI_v1_detectedApp')


class MSGraphAPI_v1_detectedApp : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $version
    [Nullable[int64]] $sizeInByte
    [Nullable[int]] $deviceCount
    [object]Get_managedDevices(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/managedDevices")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('deviceManagementSettings', 'MSGraphAPI_v1_deviceManagementSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceManagementSettings', 'MSGraphAPI_v1_deviceManagementSettings')


class MSGraphAPI_v1_deviceManagementSettings : MSGraphAPI_Base {
    [Nullable[int]] $deviceComplianceCheckinThresholdDays
    [Nullable[bool]] $isScheduledActionEnabled
    [Nullable[bool]] $secureByDefault
}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfiguration', 'MSGraphAPI_v1_deviceConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfiguration', 'MSGraphAPI_v1_deviceConfiguration')


class MSGraphAPI_v1_deviceConfiguration : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [Nullable[DateTimeOffset]] $createdDateTime
    [string] $description
    [string] $displayName
    [Nullable[int]] $version
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]Get_deviceStatuses(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceStatuses")
    }
    [object]Get_userStatuses(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/userStatuses")
    }
    [object]Get_deviceStatusOverview(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceStatusOverview")
    }
    [object]Get_userStatusOverview(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/userStatusOverview")
    }
    [object]Get_deviceSettingStateSummaries(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceSettingStateSummaries")
    }
    [object]assign([object]$assignments){
        $ParamHash = @{
            'assignments'=$assignments
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assign' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('deviceCompliancePolicy', 'MSGraphAPI_v1_deviceCompliancePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceCompliancePolicy', 'MSGraphAPI_v1_deviceCompliancePolicy')


class MSGraphAPI_v1_deviceCompliancePolicy : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $createdDateTime
    [string] $description
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $displayName
    [Nullable[int]] $version
    [object]Get_scheduledActionsForRule(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/scheduledActionsForRule")
    }
    [object]Get_deviceStatuses(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceStatuses")
    }
    [object]Get_userStatuses(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/userStatuses")
    }
    [object]Get_deviceStatusOverview(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceStatusOverview")
    }
    [object]Get_userStatusOverview(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/userStatusOverview")
    }
    [object]Get_deviceSettingStateSummaries(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceSettingStateSummaries")
    }
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]assign([object]$assignments){
        $ParamHash = @{
            'assignments'=$assignments
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assign' -ParamHash $ParamHash)
    }
    [object]scheduleActionsForRules([object]$deviceComplianceScheduledActionForRules){
        $ParamHash = @{
            'deviceComplianceScheduledActionForRules'=$deviceComplianceScheduledActionForRules
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'scheduleActionsForRules' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('softwareUpdateStatusSummary', 'MSGraphAPI_v1_softwareUpdateStatusSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.softwareUpdateStatusSummary', 'MSGraphAPI_v1_softwareUpdateStatusSummary')


class MSGraphAPI_v1_softwareUpdateStatusSummary : MSGraphAPI_v1_entity {
    [string] $displayName
    [Nullable[int]] $compliantDeviceCount
    [Nullable[int]] $nonCompliantDeviceCount
    [Nullable[int]] $remediatedDeviceCount
    [Nullable[int]] $errorDeviceCount
    [Nullable[int]] $unknownDeviceCount
    [Nullable[int]] $conflictDeviceCount
    [Nullable[int]] $notApplicableDeviceCount
    [Nullable[int]] $compliantUserCount
    [Nullable[int]] $nonCompliantUserCount
    [Nullable[int]] $remediatedUserCount
    [Nullable[int]] $errorUserCount
    [Nullable[int]] $unknownUserCount
    [Nullable[int]] $conflictUserCount
    [Nullable[int]] $notApplicableUserCount



}
$null = $Script:MSGraphAPIClassHash.Add('deviceCompliancePolicyDeviceStateSummary', 'MSGraphAPI_v1_deviceCompliancePolicyDeviceStateSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceCompliancePolicyDeviceStateSummary', 'MSGraphAPI_v1_deviceCompliancePolicyDeviceStateSummary')


class MSGraphAPI_v1_deviceCompliancePolicyDeviceStateSummary : MSGraphAPI_v1_entity {
    [Nullable[int]] $inGracePeriodCount
    [Nullable[int]] $configManagerCount
    [Nullable[int]] $unknownDeviceCount
    [Nullable[int]] $notApplicableDeviceCount
    [Nullable[int]] $compliantDeviceCount
    [Nullable[int]] $remediatedDeviceCount
    [Nullable[int]] $nonCompliantDeviceCount
    [Nullable[int]] $errorDeviceCount
    [Nullable[int]] $conflictDeviceCount



}
$null = $Script:MSGraphAPIClassHash.Add('deviceCompliancePolicySettingStateSummary', 'MSGraphAPI_v1_deviceCompliancePolicySettingStateSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceCompliancePolicySettingStateSummary', 'MSGraphAPI_v1_deviceCompliancePolicySettingStateSummary')


class MSGraphAPI_v1_deviceCompliancePolicySettingStateSummary : MSGraphAPI_v1_entity {
    [string] $setting
    [string] $settingName
    [MSGraphAPI_v1_policyPlatformType] $platformType
    [Nullable[int]] $unknownDeviceCount
    [Nullable[int]] $notApplicableDeviceCount
    [Nullable[int]] $compliantDeviceCount
    [Nullable[int]] $remediatedDeviceCount
    [Nullable[int]] $nonCompliantDeviceCount
    [Nullable[int]] $errorDeviceCount
    [Nullable[int]] $conflictDeviceCount
    [object]Get_deviceComplianceSettingStates(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceComplianceSettingStates")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfigurationDeviceStateSummary', 'MSGraphAPI_v1_deviceConfigurationDeviceStateSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfigurationDeviceStateSummary', 'MSGraphAPI_v1_deviceConfigurationDeviceStateSummary')


class MSGraphAPI_v1_deviceConfigurationDeviceStateSummary : MSGraphAPI_v1_entity {
    [Nullable[int]] $unknownDeviceCount
    [Nullable[int]] $notApplicableDeviceCount
    [Nullable[int]] $compliantDeviceCount
    [Nullable[int]] $remediatedDeviceCount
    [Nullable[int]] $nonCompliantDeviceCount
    [Nullable[int]] $errorDeviceCount
    [Nullable[int]] $conflictDeviceCount



}
$null = $Script:MSGraphAPIClassHash.Add('iosUpdateDeviceStatus', 'MSGraphAPI_v1_iosUpdateDeviceStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosUpdateDeviceStatus', 'MSGraphAPI_v1_iosUpdateDeviceStatus')


class MSGraphAPI_v1_iosUpdateDeviceStatus : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_iosUpdatesInstallStatus] $installStatus
    [string] $osVersion
    [string] $deviceId
    [string] $userId
    [string] $deviceDisplayName
    [string] $userName
    [string] $deviceModel
    [Nullable[DateTimeOffset]] $complianceGracePeriodExpirationDateTime
    [MSGraphAPI_v1_complianceStatus] $status
    [Nullable[DateTimeOffset]] $lastReportedDateTime
    [string] $userPrincipalName



}
$null = $Script:MSGraphAPIClassHash.Add('intuneBrand', 'MSGraphAPI_v1_intuneBrand')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.intuneBrand', 'MSGraphAPI_v1_intuneBrand')


class MSGraphAPI_v1_intuneBrand : MSGraphAPI_Base {
    [string] $displayName
    [string] $contactITName
    [string] $contactITPhoneNumber
    [string] $contactITEmailAddress
    [string] $contactITNotes
    [string] $privacyUrl
    [string] $onlineSupportSiteUrl
    [string] $onlineSupportSiteName
    [MSGraphAPI_v1_rgbColor] $themeColor
    [Nullable[bool]] $showLogo
    [MSGraphAPI_v1_mimeContent] $lightBackgroundLogo
    [MSGraphAPI_v1_mimeContent] $darkBackgroundLogo
    [Nullable[bool]] $showNameNextToLogo
    [Nullable[bool]] $showDisplayNameNextToLogo
}
$null = $Script:MSGraphAPIClassHash.Add('rgbColor', 'MSGraphAPI_v1_rgbColor')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.rgbColor', 'MSGraphAPI_v1_rgbColor')


class MSGraphAPI_v1_rgbColor : MSGraphAPI_Base {
    [object] $r
    [object] $g
    [object] $b
}
$null = $Script:MSGraphAPIClassHash.Add('deviceCategory', 'MSGraphAPI_v1_deviceCategory')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceCategory', 'MSGraphAPI_v1_deviceCategory')


class MSGraphAPI_v1_deviceCategory : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $description



}
$null = $Script:MSGraphAPIClassHash.Add('deviceManagementExchangeConnector', 'MSGraphAPI_v1_deviceManagementExchangeConnector')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceManagementExchangeConnector', 'MSGraphAPI_v1_deviceManagementExchangeConnector')


class MSGraphAPI_v1_deviceManagementExchangeConnector : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $lastSyncDateTime
    [MSGraphAPI_v1_deviceManagementExchangeConnectorStatus] $status
    [string] $primarySmtpAddress
    [string] $serverName
    [MSGraphAPI_v1_deviceManagementExchangeConnectorType] $exchangeConnectorType
    [string] $version
    [string] $exchangeAlias
    [string] $exchangeOrganization

    [object]sync([object]$syncType){
        $ParamHash = @{
            'syncType'=$syncType
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'sync' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('deviceEnrollmentConfiguration', 'MSGraphAPI_v1_deviceEnrollmentConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceEnrollmentConfiguration', 'MSGraphAPI_v1_deviceEnrollmentConfiguration')


class MSGraphAPI_v1_deviceEnrollmentConfiguration : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $description
    [Nullable[int]] $priority
    [Nullable[DateTimeOffset]] $createdDateTime
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [Nullable[int]] $version
    [object]Get_assignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/assignments")
    }
    [object]setPriority([Nullable[int]]$priority){
        $ParamHash = @{
            'priority'=$priority
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'setPriority' -ParamHash $ParamHash)
    }
    [object]assign([object]$enrollmentConfigurationAssignments){
        $ParamHash = @{
            'enrollmentConfigurationAssignments'=$enrollmentConfigurationAssignments
        }
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'assign' -ParamHash $ParamHash)
    }

}
$null = $Script:MSGraphAPIClassHash.Add('onPremisesConditionalAccessSettings', 'MSGraphAPI_v1_onPremisesConditionalAccessSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.onPremisesConditionalAccessSettings', 'MSGraphAPI_v1_onPremisesConditionalAccessSettings')


class MSGraphAPI_v1_onPremisesConditionalAccessSettings : MSGraphAPI_v1_entity {
    [Nullable[bool]] $enabled
    [Nullable[Guid][]] $includedGroups
    [Nullable[Guid][]] $excludedGroups
    [Nullable[bool]] $overrideDefaultRule



}
$null = $Script:MSGraphAPIClassHash.Add('mobileThreatDefenseConnector', 'MSGraphAPI_v1_mobileThreatDefenseConnector')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileThreatDefenseConnector', 'MSGraphAPI_v1_mobileThreatDefenseConnector')


class MSGraphAPI_v1_mobileThreatDefenseConnector : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $lastHeartbeatDateTime
    [MSGraphAPI_v1_mobileThreatPartnerTenantState] $partnerState
    [Nullable[bool]] $androidEnabled
    [Nullable[bool]] $androidDeviceBlockedOnMissingPartnerData
    [Nullable[bool]] $iosDeviceBlockedOnMissingPartnerData
    [Nullable[bool]] $partnerUnsupportedOsVersionBlocked
    [Nullable[bool]] $iosEnabled
    [Nullable[int]] $partnerUnresponsivenessThresholdInDays



}
$null = $Script:MSGraphAPIClassHash.Add('deviceManagementPartner', 'MSGraphAPI_v1_deviceManagementPartner')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceManagementPartner', 'MSGraphAPI_v1_deviceManagementPartner')


class MSGraphAPI_v1_deviceManagementPartner : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $lastHeartbeatDateTime
    [MSGraphAPI_v1_deviceManagementPartnerTenantState] $partnerState
    [MSGraphAPI_v1_deviceManagementPartnerAppType] $partnerAppType
    [string] $singleTenantAppId
    [string] $displayName
    [Nullable[bool]] $isConfigured
    [Nullable[DateTimeOffset]] $whenPartnerDevicesWillBeRemovedDateTime
    [Nullable[DateTimeOffset]] $whenPartnerDevicesWillBeMarkedAsNonCompliantDateTime



}
$null = $Script:MSGraphAPIClassHash.Add('notificationMessageTemplate', 'MSGraphAPI_v1_notificationMessageTemplate')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.notificationMessageTemplate', 'MSGraphAPI_v1_notificationMessageTemplate')


class MSGraphAPI_v1_notificationMessageTemplate : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $displayName
    [string] $defaultLocale
    [MSGraphAPI_v1_notificationTemplateBrandingOptions] $brandingOptions
    [object]Get_localizedNotificationMessages(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/localizedNotificationMessages")
    }
    [object]sendTestMessage(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'sendTestMessage')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('roleDefinition', 'MSGraphAPI_v1_roleDefinition')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.roleDefinition', 'MSGraphAPI_v1_roleDefinition')


class MSGraphAPI_v1_roleDefinition : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $description
    [MSGraphAPI_v1_rolePermission[]] $rolePermissions
    [Nullable[bool]] $isBuiltIn
    [object]Get_roleAssignments(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/roleAssignments")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('roleAssignment', 'MSGraphAPI_v1_roleAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.roleAssignment', 'MSGraphAPI_v1_roleAssignment')


class MSGraphAPI_v1_roleAssignment : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $description
    [string[]] $resourceScopes
    [object]Get_roleDefinition(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/roleDefinition")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('deviceAndAppManagementRoleAssignment', 'MSGraphAPI_v1_deviceAndAppManagementRoleAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceAndAppManagementRoleAssignment', 'MSGraphAPI_v1_deviceAndAppManagementRoleAssignment')


class MSGraphAPI_v1_deviceAndAppManagementRoleAssignment : MSGraphAPI_v1_roleAssignment {
    [string[]] $members



}
$null = $Script:MSGraphAPIClassHash.Add('resourceOperation', 'MSGraphAPI_v1_resourceOperation')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.resourceOperation', 'MSGraphAPI_v1_resourceOperation')


class MSGraphAPI_v1_resourceOperation : MSGraphAPI_v1_entity {
    [string] $resourceName
    [string] $actionName
    [string] $description



}
$null = $Script:MSGraphAPIClassHash.Add('telecomExpenseManagementPartner', 'MSGraphAPI_v1_telecomExpenseManagementPartner')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.telecomExpenseManagementPartner', 'MSGraphAPI_v1_telecomExpenseManagementPartner')


class MSGraphAPI_v1_telecomExpenseManagementPartner : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $url
    [Nullable[bool]] $appAuthorized
    [Nullable[bool]] $enabled
    [Nullable[DateTimeOffset]] $lastConnectionDateTime



}
$null = $Script:MSGraphAPIClassHash.Add('remoteAssistancePartner', 'MSGraphAPI_v1_remoteAssistancePartner')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.remoteAssistancePartner', 'MSGraphAPI_v1_remoteAssistancePartner')


class MSGraphAPI_v1_remoteAssistancePartner : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $onboardingUrl
    [MSGraphAPI_v1_remoteAssistanceOnboardingStatus] $onboardingStatus
    [Nullable[DateTimeOffset]] $lastConnectionDateTime

    [object]beginOnboarding(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'beginOnboarding')
    }
    [object]disconnect(){
        return (Start-MSGraphAPIAction -BaseURI $this.GraphURL -Action 'disconnect')
    }

}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionAppLearningSummary', 'MSGraphAPI_v1_windowsInformationProtectionAppLearningSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionAppLearningSummary', 'MSGraphAPI_v1_windowsInformationProtectionAppLearningSummary')


class MSGraphAPI_v1_windowsInformationProtectionAppLearningSummary : MSGraphAPI_v1_entity {
    [string] $applicationName
    [MSGraphAPI_v1_applicationType] $applicationType
    [Nullable[int]] $deviceCount



}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionNetworkLearningSummary', 'MSGraphAPI_v1_windowsInformationProtectionNetworkLearningSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionNetworkLearningSummary', 'MSGraphAPI_v1_windowsInformationProtectionNetworkLearningSummary')


class MSGraphAPI_v1_windowsInformationProtectionNetworkLearningSummary : MSGraphAPI_v1_entity {
    [string] $url
    [Nullable[int]] $deviceCount



}
$null = $Script:MSGraphAPIClassHash.Add('termsAndConditionsAssignment', 'MSGraphAPI_v1_termsAndConditionsAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.termsAndConditionsAssignment', 'MSGraphAPI_v1_termsAndConditionsAssignment')


class MSGraphAPI_v1_termsAndConditionsAssignment : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget] $target



}
$null = $Script:MSGraphAPIClassHash.Add('termsAndConditionsAcceptanceStatus', 'MSGraphAPI_v1_termsAndConditionsAcceptanceStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.termsAndConditionsAcceptanceStatus', 'MSGraphAPI_v1_termsAndConditionsAcceptanceStatus')


class MSGraphAPI_v1_termsAndConditionsAcceptanceStatus : MSGraphAPI_v1_entity {
    [string] $userDisplayName
    [Nullable[int]] $acceptedVersion
    [Nullable[DateTimeOffset]] $acceptedDateTime
    [object]Get_termsAndConditions(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/termsAndConditions")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfigurationState', 'MSGraphAPI_v1_deviceConfigurationState')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfigurationState', 'MSGraphAPI_v1_deviceConfigurationState')


class MSGraphAPI_v1_deviceConfigurationState : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceConfigurationSettingState[]] $settingStates
    [string] $displayName
    [Nullable[int]] $version
    [MSGraphAPI_v1_policyPlatformType] $platformType
    [MSGraphAPI_v1_complianceStatus] $state
    [Nullable[int]] $settingCount



}
$null = $Script:MSGraphAPIClassHash.Add('deviceActionResult', 'MSGraphAPI_v1_deviceActionResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceActionResult', 'MSGraphAPI_v1_deviceActionResult')


class MSGraphAPI_v1_deviceActionResult : MSGraphAPI_Base {
    [string] $actionName
    [MSGraphAPI_v1_actionState] $actionState
    [Nullable[DateTimeOffset]] $startDateTime
    [Nullable[DateTimeOffset]] $lastUpdatedDateTime
}
$null = $Script:MSGraphAPIClassHash.Add('configurationManagerClientEnabledFeatures', 'MSGraphAPI_v1_configurationManagerClientEnabledFeatures')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.configurationManagerClientEnabledFeatures', 'MSGraphAPI_v1_configurationManagerClientEnabledFeatures')


class MSGraphAPI_v1_configurationManagerClientEnabledFeatures : MSGraphAPI_Base {
    [Nullable[bool]] $inventory
    [Nullable[bool]] $modernApps
    [Nullable[bool]] $resourceAccess
    [Nullable[bool]] $deviceConfiguration
    [Nullable[bool]] $compliancePolicy
    [Nullable[bool]] $windowsUpdateForBusiness
}
$null = $Script:MSGraphAPIClassHash.Add('deviceHealthAttestationState', 'MSGraphAPI_v1_deviceHealthAttestationState')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceHealthAttestationState', 'MSGraphAPI_v1_deviceHealthAttestationState')


class MSGraphAPI_v1_deviceHealthAttestationState : MSGraphAPI_Base {
    [string] $lastUpdateDateTime
    [string] $contentNamespaceUrl
    [string] $deviceHealthAttestationStatus
    [string] $contentVersion
    [Nullable[DateTimeOffset]] $issuedDateTime
    [string] $attestationIdentityKey
    [Nullable[int64]] $resetCount
    [Nullable[int64]] $restartCount
    [string] $dataExcutionPolicy
    [string] $bitLockerStatus
    [string] $bootManagerVersion
    [string] $codeIntegrityCheckVersion
    [string] $secureBoot
    [string] $bootDebugging
    [string] $operatingSystemKernelDebugging
    [string] $codeIntegrity
    [string] $testSigning
    [string] $safeMode
    [string] $windowsPE
    [string] $earlyLaunchAntiMalwareDriverProtection
    [string] $virtualSecureMode
    [string] $pcrHashAlgorithm
    [string] $bootAppSecurityVersion
    [string] $bootManagerSecurityVersion
    [string] $tpmVersion
    [string] $pcr0
    [string] $secureBootConfigurationPolicyFingerPrint
    [string] $codeIntegrityPolicy
    [string] $bootRevisionListInfo
    [string] $operatingSystemRevListInfo
    [string] $healthStatusMismatchInfo
    [string] $healthAttestationSupportedStatus
}
$null = $Script:MSGraphAPIClassHash.Add('deviceCompliancePolicyState', 'MSGraphAPI_v1_deviceCompliancePolicyState')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceCompliancePolicyState', 'MSGraphAPI_v1_deviceCompliancePolicyState')


class MSGraphAPI_v1_deviceCompliancePolicyState : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceCompliancePolicySettingState[]] $settingStates
    [string] $displayName
    [Nullable[int]] $version
    [MSGraphAPI_v1_policyPlatformType] $platformType
    [MSGraphAPI_v1_complianceStatus] $state
    [Nullable[int]] $settingCount



}
$null = $Script:MSGraphAPIClassHash.Add('updateWindowsDeviceAccountActionParameter', 'MSGraphAPI_v1_updateWindowsDeviceAccountActionParameter')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.updateWindowsDeviceAccountActionParameter', 'MSGraphAPI_v1_updateWindowsDeviceAccountActionParameter')


class MSGraphAPI_v1_updateWindowsDeviceAccountActionParameter : MSGraphAPI_Base {
    [MSGraphAPI_v1_windowsDeviceAccount] $deviceAccount
    [Nullable[bool]] $passwordRotationEnabled
    [Nullable[bool]] $calendarSyncEnabled
    [string] $deviceAccountEmail
    [string] $exchangeServer
    [string] $sessionInitiationProtocalAddress
}
$null = $Script:MSGraphAPIClassHash.Add('windowsDeviceAccount', 'MSGraphAPI_v1_windowsDeviceAccount')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsDeviceAccount', 'MSGraphAPI_v1_windowsDeviceAccount')


class MSGraphAPI_v1_windowsDeviceAccount : MSGraphAPI_Base {
    [string] $password
}
$null = $Script:MSGraphAPIClassHash.Add('windowsDefenderScanActionResult', 'MSGraphAPI_v1_windowsDefenderScanActionResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsDefenderScanActionResult', 'MSGraphAPI_v1_windowsDefenderScanActionResult')


class MSGraphAPI_v1_windowsDefenderScanActionResult : MSGraphAPI_v1_deviceActionResult {
    [string] $scanType
}
$null = $Script:MSGraphAPIClassHash.Add('deleteUserFromSharedAppleDeviceActionResult', 'MSGraphAPI_v1_deleteUserFromSharedAppleDeviceActionResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deleteUserFromSharedAppleDeviceActionResult', 'MSGraphAPI_v1_deleteUserFromSharedAppleDeviceActionResult')


class MSGraphAPI_v1_deleteUserFromSharedAppleDeviceActionResult : MSGraphAPI_v1_deviceActionResult {
    [string] $userPrincipalName
}
$null = $Script:MSGraphAPIClassHash.Add('deviceGeoLocation', 'MSGraphAPI_v1_deviceGeoLocation')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceGeoLocation', 'MSGraphAPI_v1_deviceGeoLocation')


class MSGraphAPI_v1_deviceGeoLocation : MSGraphAPI_Base {
    [Nullable[DateTimeOffset]] $lastCollectedDateTime
    [Nullable[Double]] $longitude
    [Nullable[Double]] $latitude
    [Nullable[Double]] $altitude
    [Nullable[Double]] $horizontalAccuracy
    [Nullable[Double]] $verticalAccuracy
    [Nullable[Double]] $heading
    [Nullable[Double]] $speed
}
$null = $Script:MSGraphAPIClassHash.Add('locateDeviceActionResult', 'MSGraphAPI_v1_locateDeviceActionResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.locateDeviceActionResult', 'MSGraphAPI_v1_locateDeviceActionResult')


class MSGraphAPI_v1_locateDeviceActionResult : MSGraphAPI_v1_deviceActionResult {
    [MSGraphAPI_v1_deviceGeoLocation] $deviceLocation
}
$null = $Script:MSGraphAPIClassHash.Add('remoteLockActionResult', 'MSGraphAPI_v1_remoteLockActionResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.remoteLockActionResult', 'MSGraphAPI_v1_remoteLockActionResult')


class MSGraphAPI_v1_remoteLockActionResult : MSGraphAPI_v1_deviceActionResult {
    [string] $unlockPin
}
$null = $Script:MSGraphAPIClassHash.Add('resetPasscodeActionResult', 'MSGraphAPI_v1_resetPasscodeActionResult')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.resetPasscodeActionResult', 'MSGraphAPI_v1_resetPasscodeActionResult')


class MSGraphAPI_v1_resetPasscodeActionResult : MSGraphAPI_v1_deviceActionResult {
    [string] $passcode
}
$null = $Script:MSGraphAPIClassHash.Add('deviceOperatingSystemSummary', 'MSGraphAPI_v1_deviceOperatingSystemSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceOperatingSystemSummary', 'MSGraphAPI_v1_deviceOperatingSystemSummary')


class MSGraphAPI_v1_deviceOperatingSystemSummary : MSGraphAPI_Base {
    [Nullable[int]] $androidCount
    [Nullable[int]] $iosCount
    [Nullable[int]] $macOSCount
    [Nullable[int]] $windowsMobileCount
    [Nullable[int]] $windowsCount
    [Nullable[int]] $unknownCount
}
$null = $Script:MSGraphAPIClassHash.Add('deviceExchangeAccessStateSummary', 'MSGraphAPI_v1_deviceExchangeAccessStateSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceExchangeAccessStateSummary', 'MSGraphAPI_v1_deviceExchangeAccessStateSummary')


class MSGraphAPI_v1_deviceExchangeAccessStateSummary : MSGraphAPI_Base {
    [Nullable[int]] $allowedDeviceCount
    [Nullable[int]] $blockedDeviceCount
    [Nullable[int]] $quarantinedDeviceCount
    [Nullable[int]] $unknownDeviceCount
    [Nullable[int]] $unavailableDeviceCount
}
$null = $Script:MSGraphAPIClassHash.Add('windowsDeviceADAccount', 'MSGraphAPI_v1_windowsDeviceADAccount')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsDeviceADAccount', 'MSGraphAPI_v1_windowsDeviceADAccount')


class MSGraphAPI_v1_windowsDeviceADAccount : MSGraphAPI_v1_windowsDeviceAccount {
    [string] $domainName
    [string] $userName
}
$null = $Script:MSGraphAPIClassHash.Add('windowsDeviceAzureADAccount', 'MSGraphAPI_v1_windowsDeviceAzureADAccount')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsDeviceAzureADAccount', 'MSGraphAPI_v1_windowsDeviceAzureADAccount')


class MSGraphAPI_v1_windowsDeviceAzureADAccount : MSGraphAPI_v1_windowsDeviceAccount {
    [string] $userPrincipalName
}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfigurationAssignment', 'MSGraphAPI_v1_deviceConfigurationAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfigurationAssignment', 'MSGraphAPI_v1_deviceConfigurationAssignment')


class MSGraphAPI_v1_deviceConfigurationAssignment : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget] $target



}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfigurationDeviceStatus', 'MSGraphAPI_v1_deviceConfigurationDeviceStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfigurationDeviceStatus', 'MSGraphAPI_v1_deviceConfigurationDeviceStatus')


class MSGraphAPI_v1_deviceConfigurationDeviceStatus : MSGraphAPI_v1_entity {
    [string] $deviceDisplayName
    [string] $userName
    [string] $deviceModel
    [Nullable[DateTimeOffset]] $complianceGracePeriodExpirationDateTime
    [MSGraphAPI_v1_complianceStatus] $status
    [Nullable[DateTimeOffset]] $lastReportedDateTime
    [string] $userPrincipalName



}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfigurationUserStatus', 'MSGraphAPI_v1_deviceConfigurationUserStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfigurationUserStatus', 'MSGraphAPI_v1_deviceConfigurationUserStatus')


class MSGraphAPI_v1_deviceConfigurationUserStatus : MSGraphAPI_v1_entity {
    [string] $userDisplayName
    [Nullable[int]] $devicesCount
    [MSGraphAPI_v1_complianceStatus] $status
    [Nullable[DateTimeOffset]] $lastReportedDateTime
    [string] $userPrincipalName



}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfigurationDeviceOverview', 'MSGraphAPI_v1_deviceConfigurationDeviceOverview')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfigurationDeviceOverview', 'MSGraphAPI_v1_deviceConfigurationDeviceOverview')


class MSGraphAPI_v1_deviceConfigurationDeviceOverview : MSGraphAPI_v1_entity {
    [Nullable[int]] $pendingCount
    [Nullable[int]] $notApplicableCount
    [Nullable[int]] $successCount
    [Nullable[int]] $errorCount
    [Nullable[int]] $failedCount
    [Nullable[DateTimeOffset]] $lastUpdateDateTime
    [Nullable[int]] $configurationVersion



}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfigurationUserOverview', 'MSGraphAPI_v1_deviceConfigurationUserOverview')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfigurationUserOverview', 'MSGraphAPI_v1_deviceConfigurationUserOverview')


class MSGraphAPI_v1_deviceConfigurationUserOverview : MSGraphAPI_v1_entity {
    [Nullable[int]] $pendingCount
    [Nullable[int]] $notApplicableCount
    [Nullable[int]] $successCount
    [Nullable[int]] $errorCount
    [Nullable[int]] $failedCount
    [Nullable[DateTimeOffset]] $lastUpdateDateTime
    [Nullable[int]] $configurationVersion



}
$null = $Script:MSGraphAPIClassHash.Add('settingStateDeviceSummary', 'MSGraphAPI_v1_settingStateDeviceSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.settingStateDeviceSummary', 'MSGraphAPI_v1_settingStateDeviceSummary')


class MSGraphAPI_v1_settingStateDeviceSummary : MSGraphAPI_v1_entity {
    [string] $settingName
    [string] $instancePath
    [Nullable[int]] $unknownDeviceCount
    [Nullable[int]] $notApplicableDeviceCount
    [Nullable[int]] $compliantDeviceCount
    [Nullable[int]] $remediatedDeviceCount
    [Nullable[int]] $nonCompliantDeviceCount
    [Nullable[int]] $errorDeviceCount
    [Nullable[int]] $conflictDeviceCount



}
$null = $Script:MSGraphAPIClassHash.Add('deviceCompliancePolicyAssignment', 'MSGraphAPI_v1_deviceCompliancePolicyAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceCompliancePolicyAssignment', 'MSGraphAPI_v1_deviceCompliancePolicyAssignment')


class MSGraphAPI_v1_deviceCompliancePolicyAssignment : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget] $target



}
$null = $Script:MSGraphAPIClassHash.Add('deviceComplianceScheduledActionForRule', 'MSGraphAPI_v1_deviceComplianceScheduledActionForRule')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceComplianceScheduledActionForRule', 'MSGraphAPI_v1_deviceComplianceScheduledActionForRule')


class MSGraphAPI_v1_deviceComplianceScheduledActionForRule : MSGraphAPI_v1_entity {
    [string] $ruleName
    [object]Get_scheduledActionConfigurations(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/scheduledActionConfigurations")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('deviceComplianceDeviceStatus', 'MSGraphAPI_v1_deviceComplianceDeviceStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceComplianceDeviceStatus', 'MSGraphAPI_v1_deviceComplianceDeviceStatus')


class MSGraphAPI_v1_deviceComplianceDeviceStatus : MSGraphAPI_v1_entity {
    [string] $deviceDisplayName
    [string] $userName
    [string] $deviceModel
    [Nullable[DateTimeOffset]] $complianceGracePeriodExpirationDateTime
    [MSGraphAPI_v1_complianceStatus] $status
    [Nullable[DateTimeOffset]] $lastReportedDateTime
    [string] $userPrincipalName



}
$null = $Script:MSGraphAPIClassHash.Add('deviceComplianceUserStatus', 'MSGraphAPI_v1_deviceComplianceUserStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceComplianceUserStatus', 'MSGraphAPI_v1_deviceComplianceUserStatus')


class MSGraphAPI_v1_deviceComplianceUserStatus : MSGraphAPI_v1_entity {
    [string] $userDisplayName
    [Nullable[int]] $devicesCount
    [MSGraphAPI_v1_complianceStatus] $status
    [Nullable[DateTimeOffset]] $lastReportedDateTime
    [string] $userPrincipalName



}
$null = $Script:MSGraphAPIClassHash.Add('deviceComplianceDeviceOverview', 'MSGraphAPI_v1_deviceComplianceDeviceOverview')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceComplianceDeviceOverview', 'MSGraphAPI_v1_deviceComplianceDeviceOverview')


class MSGraphAPI_v1_deviceComplianceDeviceOverview : MSGraphAPI_v1_entity {
    [Nullable[int]] $pendingCount
    [Nullable[int]] $notApplicableCount
    [Nullable[int]] $successCount
    [Nullable[int]] $errorCount
    [Nullable[int]] $failedCount
    [Nullable[DateTimeOffset]] $lastUpdateDateTime
    [Nullable[int]] $configurationVersion



}
$null = $Script:MSGraphAPIClassHash.Add('deviceComplianceUserOverview', 'MSGraphAPI_v1_deviceComplianceUserOverview')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceComplianceUserOverview', 'MSGraphAPI_v1_deviceComplianceUserOverview')


class MSGraphAPI_v1_deviceComplianceUserOverview : MSGraphAPI_v1_entity {
    [Nullable[int]] $pendingCount
    [Nullable[int]] $notApplicableCount
    [Nullable[int]] $successCount
    [Nullable[int]] $errorCount
    [Nullable[int]] $failedCount
    [Nullable[DateTimeOffset]] $lastUpdateDateTime
    [Nullable[int]] $configurationVersion



}
$null = $Script:MSGraphAPIClassHash.Add('deviceComplianceActionItem', 'MSGraphAPI_v1_deviceComplianceActionItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceComplianceActionItem', 'MSGraphAPI_v1_deviceComplianceActionItem')


class MSGraphAPI_v1_deviceComplianceActionItem : MSGraphAPI_v1_entity {
    [Nullable[int]] $gracePeriodHours
    [MSGraphAPI_v1_deviceComplianceActionType] $actionType
    [string] $notificationTemplateId
    [string[]] $notificationMessageCCList



}
$null = $Script:MSGraphAPIClassHash.Add('androidCustomConfiguration', 'MSGraphAPI_v1_androidCustomConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidCustomConfiguration', 'MSGraphAPI_v1_androidCustomConfiguration')


class MSGraphAPI_v1_androidCustomConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [MSGraphAPI_v1_omaSetting[]] $omaSettings



}
$null = $Script:MSGraphAPIClassHash.Add('omaSetting', 'MSGraphAPI_v1_omaSetting')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.omaSetting', 'MSGraphAPI_v1_omaSetting')


class MSGraphAPI_v1_omaSetting : MSGraphAPI_Base {
    [string] $displayName
    [string] $description
    [string] $omaUri
}
$null = $Script:MSGraphAPIClassHash.Add('omaSettingInteger', 'MSGraphAPI_v1_omaSettingInteger')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.omaSettingInteger', 'MSGraphAPI_v1_omaSettingInteger')


class MSGraphAPI_v1_omaSettingInteger : MSGraphAPI_v1_omaSetting {
    [Nullable[int]] $value
}
$null = $Script:MSGraphAPIClassHash.Add('omaSettingFloatingPoint', 'MSGraphAPI_v1_omaSettingFloatingPoint')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.omaSettingFloatingPoint', 'MSGraphAPI_v1_omaSettingFloatingPoint')


class MSGraphAPI_v1_omaSettingFloatingPoint : MSGraphAPI_v1_omaSetting {
    [object] $value
}
$null = $Script:MSGraphAPIClassHash.Add('omaSettingString', 'MSGraphAPI_v1_omaSettingString')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.omaSettingString', 'MSGraphAPI_v1_omaSettingString')


class MSGraphAPI_v1_omaSettingString : MSGraphAPI_v1_omaSetting {
    [string] $value
}
$null = $Script:MSGraphAPIClassHash.Add('omaSettingDateTime', 'MSGraphAPI_v1_omaSettingDateTime')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.omaSettingDateTime', 'MSGraphAPI_v1_omaSettingDateTime')


class MSGraphAPI_v1_omaSettingDateTime : MSGraphAPI_v1_omaSetting {
    [Nullable[DateTimeOffset]] $value
}
$null = $Script:MSGraphAPIClassHash.Add('omaSettingStringXml', 'MSGraphAPI_v1_omaSettingStringXml')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.omaSettingStringXml', 'MSGraphAPI_v1_omaSettingStringXml')


class MSGraphAPI_v1_omaSettingStringXml : MSGraphAPI_v1_omaSetting {
    [string] $fileName
    [object] $value
}
$null = $Script:MSGraphAPIClassHash.Add('omaSettingBoolean', 'MSGraphAPI_v1_omaSettingBoolean')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.omaSettingBoolean', 'MSGraphAPI_v1_omaSettingBoolean')


class MSGraphAPI_v1_omaSettingBoolean : MSGraphAPI_v1_omaSetting {
    [Nullable[bool]] $value
}
$null = $Script:MSGraphAPIClassHash.Add('omaSettingBase64', 'MSGraphAPI_v1_omaSettingBase64')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.omaSettingBase64', 'MSGraphAPI_v1_omaSettingBase64')


class MSGraphAPI_v1_omaSettingBase64 : MSGraphAPI_v1_omaSetting {
    [string] $fileName
    [string] $value
}
$null = $Script:MSGraphAPIClassHash.Add('androidGeneralDeviceConfiguration', 'MSGraphAPI_v1_androidGeneralDeviceConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidGeneralDeviceConfiguration', 'MSGraphAPI_v1_androidGeneralDeviceConfiguration')


class MSGraphAPI_v1_androidGeneralDeviceConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [Nullable[bool]] $appsBlockClipboardSharing
    [Nullable[bool]] $appsBlockCopyPaste
    [Nullable[bool]] $appsBlockYouTube
    [Nullable[bool]] $bluetoothBlocked
    [Nullable[bool]] $cameraBlocked
    [Nullable[bool]] $cellularBlockDataRoaming
    [Nullable[bool]] $cellularBlockMessaging
    [Nullable[bool]] $cellularBlockVoiceRoaming
    [Nullable[bool]] $cellularBlockWiFiTethering
    [MSGraphAPI_v1_appListItem[]] $compliantAppsList
    [MSGraphAPI_v1_appListType] $compliantAppListType
    [Nullable[bool]] $diagnosticDataBlockSubmission
    [Nullable[bool]] $locationServicesBlocked
    [Nullable[bool]] $googleAccountBlockAutoSync
    [Nullable[bool]] $googlePlayStoreBlocked
    [Nullable[bool]] $kioskModeBlockSleepButton
    [Nullable[bool]] $kioskModeBlockVolumeButtons
    [MSGraphAPI_v1_appListItem[]] $kioskModeApps
    [Nullable[bool]] $nfcBlocked
    [Nullable[bool]] $passwordBlockFingerprintUnlock
    [Nullable[bool]] $passwordBlockTrustAgents
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinutesOfInactivityBeforeScreenTimeout
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [Nullable[int]] $passwordSignInFailureCountBeforeFactoryReset
    [MSGraphAPI_v1_androidRequiredPasswordType] $passwordRequiredType
    [Nullable[bool]] $passwordRequired
    [Nullable[bool]] $powerOffBlocked
    [Nullable[bool]] $factoryResetBlocked
    [Nullable[bool]] $screenCaptureBlocked
    [Nullable[bool]] $deviceSharingAllowed
    [Nullable[bool]] $storageBlockGoogleBackup
    [Nullable[bool]] $storageBlockRemovableStorage
    [Nullable[bool]] $storageRequireDeviceEncryption
    [Nullable[bool]] $storageRequireRemovableStorageEncryption
    [Nullable[bool]] $voiceAssistantBlocked
    [Nullable[bool]] $voiceDialingBlocked
    [Nullable[bool]] $webBrowserBlockPopups
    [Nullable[bool]] $webBrowserBlockAutofill
    [Nullable[bool]] $webBrowserBlockJavaScript
    [Nullable[bool]] $webBrowserBlocked
    [MSGraphAPI_v1_webBrowserCookieSettings] $webBrowserCookieSettings
    [Nullable[bool]] $wiFiBlocked
    [MSGraphAPI_v1_appListItem[]] $appsInstallAllowList
    [MSGraphAPI_v1_appListItem[]] $appsLaunchBlockList
    [MSGraphAPI_v1_appListItem[]] $appsHideList
    [Nullable[bool]] $securityRequireVerifyApps



}
$null = $Script:MSGraphAPIClassHash.Add('appListItem', 'MSGraphAPI_v1_appListItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.appListItem', 'MSGraphAPI_v1_appListItem')


class MSGraphAPI_v1_appListItem : MSGraphAPI_Base {
    [string] $name
    [string] $publisher
    [string] $appStoreUrl
    [string] $appId
}
$null = $Script:MSGraphAPIClassHash.Add('iosCertificateProfile', 'MSGraphAPI_v1_iosCertificateProfile')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosCertificateProfile', 'MSGraphAPI_v1_iosCertificateProfile')


class MSGraphAPI_v1_iosCertificateProfile : MSGraphAPI_v1_deviceConfiguration {




}
$null = $Script:MSGraphAPIClassHash.Add('iosCustomConfiguration', 'MSGraphAPI_v1_iosCustomConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosCustomConfiguration', 'MSGraphAPI_v1_iosCustomConfiguration')


class MSGraphAPI_v1_iosCustomConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [string] $payloadName
    [string] $payloadFileName
    [object] $payload



}
$null = $Script:MSGraphAPIClassHash.Add('iosGeneralDeviceConfiguration', 'MSGraphAPI_v1_iosGeneralDeviceConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosGeneralDeviceConfiguration', 'MSGraphAPI_v1_iosGeneralDeviceConfiguration')


class MSGraphAPI_v1_iosGeneralDeviceConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [Nullable[bool]] $accountBlockModification
    [Nullable[bool]] $activationLockAllowWhenSupervised
    [Nullable[bool]] $airDropBlocked
    [Nullable[bool]] $airDropForceUnmanagedDropTarget
    [Nullable[bool]] $airPlayForcePairingPasswordForOutgoingRequests
    [Nullable[bool]] $appleWatchBlockPairing
    [Nullable[bool]] $appleWatchForceWristDetection
    [Nullable[bool]] $appleNewsBlocked
    [MSGraphAPI_v1_appListItem[]] $appsSingleAppModeList
    [MSGraphAPI_v1_appListItem[]] $appsVisibilityList
    [MSGraphAPI_v1_appListType] $appsVisibilityListType
    [Nullable[bool]] $appStoreBlockAutomaticDownloads
    [Nullable[bool]] $appStoreBlocked
    [Nullable[bool]] $appStoreBlockInAppPurchases
    [Nullable[bool]] $appStoreBlockUIAppInstallation
    [Nullable[bool]] $appStoreRequirePassword
    [Nullable[bool]] $bluetoothBlockModification
    [Nullable[bool]] $cameraBlocked
    [Nullable[bool]] $cellularBlockDataRoaming
    [Nullable[bool]] $cellularBlockGlobalBackgroundFetchWhileRoaming
    [Nullable[bool]] $cellularBlockPerAppDataModification
    [Nullable[bool]] $cellularBlockPersonalHotspot
    [Nullable[bool]] $cellularBlockVoiceRoaming
    [Nullable[bool]] $certificatesBlockUntrustedTlsCertificates
    [Nullable[bool]] $classroomAppBlockRemoteScreenObservation
    [Nullable[bool]] $classroomAppForceUnpromptedScreenObservation
    [MSGraphAPI_v1_appListItem[]] $compliantAppsList
    [MSGraphAPI_v1_appListType] $compliantAppListType
    [Nullable[bool]] $configurationProfileBlockChanges
    [Nullable[bool]] $definitionLookupBlocked
    [Nullable[bool]] $deviceBlockEnableRestrictions
    [Nullable[bool]] $deviceBlockEraseContentAndSettings
    [Nullable[bool]] $deviceBlockNameModification
    [Nullable[bool]] $diagnosticDataBlockSubmission
    [Nullable[bool]] $diagnosticDataBlockSubmissionModification
    [Nullable[bool]] $documentsBlockManagedDocumentsInUnmanagedApps
    [Nullable[bool]] $documentsBlockUnmanagedDocumentsInManagedApps
    [string[]] $emailInDomainSuffixes
    [Nullable[bool]] $enterpriseAppBlockTrust
    [Nullable[bool]] $enterpriseAppBlockTrustModification
    [Nullable[bool]] $faceTimeBlocked
    [Nullable[bool]] $findMyFriendsBlocked
    [Nullable[bool]] $gamingBlockGameCenterFriends
    [Nullable[bool]] $gamingBlockMultiplayer
    [Nullable[bool]] $gameCenterBlocked
    [Nullable[bool]] $hostPairingBlocked
    [Nullable[bool]] $iBooksStoreBlocked
    [Nullable[bool]] $iBooksStoreBlockErotica
    [Nullable[bool]] $iCloudBlockActivityContinuation
    [Nullable[bool]] $iCloudBlockBackup
    [Nullable[bool]] $iCloudBlockDocumentSync
    [Nullable[bool]] $iCloudBlockManagedAppsSync
    [Nullable[bool]] $iCloudBlockPhotoLibrary
    [Nullable[bool]] $iCloudBlockPhotoStreamSync
    [Nullable[bool]] $iCloudBlockSharedPhotoStream
    [Nullable[bool]] $iCloudRequireEncryptedBackup
    [Nullable[bool]] $iTunesBlockExplicitContent
    [Nullable[bool]] $iTunesBlockMusicService
    [Nullable[bool]] $iTunesBlockRadio
    [Nullable[bool]] $keyboardBlockAutoCorrect
    [Nullable[bool]] $keyboardBlockDictation
    [Nullable[bool]] $keyboardBlockPredictive
    [Nullable[bool]] $keyboardBlockShortcuts
    [Nullable[bool]] $keyboardBlockSpellCheck
    [Nullable[bool]] $kioskModeAllowAssistiveSpeak
    [Nullable[bool]] $kioskModeAllowAssistiveTouchSettings
    [Nullable[bool]] $kioskModeAllowAutoLock
    [Nullable[bool]] $kioskModeAllowColorInversionSettings
    [Nullable[bool]] $kioskModeAllowRingerSwitch
    [Nullable[bool]] $kioskModeAllowScreenRotation
    [Nullable[bool]] $kioskModeAllowSleepButton
    [Nullable[bool]] $kioskModeAllowTouchscreen
    [Nullable[bool]] $kioskModeAllowVoiceOverSettings
    [Nullable[bool]] $kioskModeAllowVolumeButtons
    [Nullable[bool]] $kioskModeAllowZoomSettings
    [string] $kioskModeAppStoreUrl
    [Nullable[bool]] $kioskModeRequireAssistiveTouch
    [Nullable[bool]] $kioskModeRequireColorInversion
    [Nullable[bool]] $kioskModeRequireMonoAudio
    [Nullable[bool]] $kioskModeRequireVoiceOver
    [Nullable[bool]] $kioskModeRequireZoom
    [string] $kioskModeManagedAppId
    [Nullable[bool]] $lockScreenBlockControlCenter
    [Nullable[bool]] $lockScreenBlockNotificationView
    [Nullable[bool]] $lockScreenBlockPassbook
    [Nullable[bool]] $lockScreenBlockTodayView
    [MSGraphAPI_v1_mediaContentRatingAustralia] $mediaContentRatingAustralia
    [MSGraphAPI_v1_mediaContentRatingCanada] $mediaContentRatingCanada
    [MSGraphAPI_v1_mediaContentRatingFrance] $mediaContentRatingFrance
    [MSGraphAPI_v1_mediaContentRatingGermany] $mediaContentRatingGermany
    [MSGraphAPI_v1_mediaContentRatingIreland] $mediaContentRatingIreland
    [MSGraphAPI_v1_mediaContentRatingJapan] $mediaContentRatingJapan
    [MSGraphAPI_v1_mediaContentRatingNewZealand] $mediaContentRatingNewZealand
    [MSGraphAPI_v1_mediaContentRatingUnitedKingdom] $mediaContentRatingUnitedKingdom
    [MSGraphAPI_v1_mediaContentRatingUnitedStates] $mediaContentRatingUnitedStates
    [MSGraphAPI_v1_iosNetworkUsageRule[]] $networkUsageRules
    [MSGraphAPI_v1_ratingAppsType] $mediaContentRatingApps
    [Nullable[bool]] $messagesBlocked
    [Nullable[bool]] $notificationsBlockSettingsModification
    [Nullable[bool]] $passcodeBlockFingerprintUnlock
    [Nullable[bool]] $passcodeBlockFingerprintModification
    [Nullable[bool]] $passcodeBlockModification
    [Nullable[bool]] $passcodeBlockSimple
    [Nullable[int]] $passcodeExpirationDays
    [Nullable[int]] $passcodeMinimumLength
    [Nullable[int]] $passcodeMinutesOfInactivityBeforeLock
    [Nullable[int]] $passcodeMinutesOfInactivityBeforeScreenTimeout
    [Nullable[int]] $passcodeMinimumCharacterSetCount
    [Nullable[int]] $passcodePreviousPasscodeBlockCount
    [Nullable[int]] $passcodeSignInFailureCountBeforeWipe
    [MSGraphAPI_v1_requiredPasswordType] $passcodeRequiredType
    [Nullable[bool]] $passcodeRequired
    [Nullable[bool]] $podcastsBlocked
    [Nullable[bool]] $safariBlockAutofill
    [Nullable[bool]] $safariBlockJavaScript
    [Nullable[bool]] $safariBlockPopups
    [Nullable[bool]] $safariBlocked
    [MSGraphAPI_v1_webBrowserCookieSettings] $safariCookieSettings
    [string[]] $safariManagedDomains
    [string[]] $safariPasswordAutoFillDomains
    [Nullable[bool]] $safariRequireFraudWarning
    [Nullable[bool]] $screenCaptureBlocked
    [Nullable[bool]] $siriBlocked
    [Nullable[bool]] $siriBlockedWhenLocked
    [Nullable[bool]] $siriBlockUserGeneratedContent
    [Nullable[bool]] $siriRequireProfanityFilter
    [Nullable[bool]] $spotlightBlockInternetResults
    [Nullable[bool]] $voiceDialingBlocked
    [Nullable[bool]] $wallpaperBlockModification
    [Nullable[bool]] $wiFiConnectOnlyToConfiguredNetworks



}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingAustralia', 'MSGraphAPI_v1_mediaContentRatingAustralia')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingAustralia', 'MSGraphAPI_v1_mediaContentRatingAustralia')


class MSGraphAPI_v1_mediaContentRatingAustralia : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingAustraliaMoviesType] $movieRating
    [MSGraphAPI_v1_ratingAustraliaTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingCanada', 'MSGraphAPI_v1_mediaContentRatingCanada')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingCanada', 'MSGraphAPI_v1_mediaContentRatingCanada')


class MSGraphAPI_v1_mediaContentRatingCanada : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingCanadaMoviesType] $movieRating
    [MSGraphAPI_v1_ratingCanadaTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingFrance', 'MSGraphAPI_v1_mediaContentRatingFrance')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingFrance', 'MSGraphAPI_v1_mediaContentRatingFrance')


class MSGraphAPI_v1_mediaContentRatingFrance : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingFranceMoviesType] $movieRating
    [MSGraphAPI_v1_ratingFranceTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingGermany', 'MSGraphAPI_v1_mediaContentRatingGermany')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingGermany', 'MSGraphAPI_v1_mediaContentRatingGermany')


class MSGraphAPI_v1_mediaContentRatingGermany : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingGermanyMoviesType] $movieRating
    [MSGraphAPI_v1_ratingGermanyTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingIreland', 'MSGraphAPI_v1_mediaContentRatingIreland')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingIreland', 'MSGraphAPI_v1_mediaContentRatingIreland')


class MSGraphAPI_v1_mediaContentRatingIreland : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingIrelandMoviesType] $movieRating
    [MSGraphAPI_v1_ratingIrelandTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingJapan', 'MSGraphAPI_v1_mediaContentRatingJapan')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingJapan', 'MSGraphAPI_v1_mediaContentRatingJapan')


class MSGraphAPI_v1_mediaContentRatingJapan : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingJapanMoviesType] $movieRating
    [MSGraphAPI_v1_ratingJapanTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingNewZealand', 'MSGraphAPI_v1_mediaContentRatingNewZealand')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingNewZealand', 'MSGraphAPI_v1_mediaContentRatingNewZealand')


class MSGraphAPI_v1_mediaContentRatingNewZealand : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingNewZealandMoviesType] $movieRating
    [MSGraphAPI_v1_ratingNewZealandTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingUnitedKingdom', 'MSGraphAPI_v1_mediaContentRatingUnitedKingdom')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingUnitedKingdom', 'MSGraphAPI_v1_mediaContentRatingUnitedKingdom')


class MSGraphAPI_v1_mediaContentRatingUnitedKingdom : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingUnitedKingdomMoviesType] $movieRating
    [MSGraphAPI_v1_ratingUnitedKingdomTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('mediaContentRatingUnitedStates', 'MSGraphAPI_v1_mediaContentRatingUnitedStates')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mediaContentRatingUnitedStates', 'MSGraphAPI_v1_mediaContentRatingUnitedStates')


class MSGraphAPI_v1_mediaContentRatingUnitedStates : MSGraphAPI_Base {
    [MSGraphAPI_v1_ratingUnitedStatesMoviesType] $movieRating
    [MSGraphAPI_v1_ratingUnitedStatesTelevisionType] $tvRating
}
$null = $Script:MSGraphAPIClassHash.Add('iosNetworkUsageRule', 'MSGraphAPI_v1_iosNetworkUsageRule')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosNetworkUsageRule', 'MSGraphAPI_v1_iosNetworkUsageRule')


class MSGraphAPI_v1_iosNetworkUsageRule : MSGraphAPI_Base {
    [MSGraphAPI_v1_appListItem[]] $managedApps
    [Nullable[bool]] $cellularDataBlockWhenRoaming
    [Nullable[bool]] $cellularDataBlocked
}
$null = $Script:MSGraphAPIClassHash.Add('iosUpdateConfiguration', 'MSGraphAPI_v1_iosUpdateConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosUpdateConfiguration', 'MSGraphAPI_v1_iosUpdateConfiguration')


class MSGraphAPI_v1_iosUpdateConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [object] $activeHoursStart
    [object] $activeHoursEnd
    [MSGraphAPI_v1_dayOfWeek[]] $scheduledInstallDays
    [Nullable[int]] $utcTimeOffsetInMinutes



}
$null = $Script:MSGraphAPIClassHash.Add('macOSCustomConfiguration', 'MSGraphAPI_v1_macOSCustomConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.macOSCustomConfiguration', 'MSGraphAPI_v1_macOSCustomConfiguration')


class MSGraphAPI_v1_macOSCustomConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [string] $payloadName
    [string] $payloadFileName
    [object] $payload



}
$null = $Script:MSGraphAPIClassHash.Add('macOSGeneralDeviceConfiguration', 'MSGraphAPI_v1_macOSGeneralDeviceConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.macOSGeneralDeviceConfiguration', 'MSGraphAPI_v1_macOSGeneralDeviceConfiguration')


class MSGraphAPI_v1_macOSGeneralDeviceConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [MSGraphAPI_v1_appListItem[]] $compliantAppsList
    [MSGraphAPI_v1_appListType] $compliantAppListType
    [string[]] $emailInDomainSuffixes
    [Nullable[bool]] $passwordBlockSimple
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinutesOfInactivityBeforeLock
    [Nullable[int]] $passwordMinutesOfInactivityBeforeScreenTimeout
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [Nullable[bool]] $passwordRequired



}
$null = $Script:MSGraphAPIClassHash.Add('appleDeviceFeaturesConfigurationBase', 'MSGraphAPI_v1_appleDeviceFeaturesConfigurationBase')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.appleDeviceFeaturesConfigurationBase', 'MSGraphAPI_v1_appleDeviceFeaturesConfigurationBase')


class MSGraphAPI_v1_appleDeviceFeaturesConfigurationBase : MSGraphAPI_v1_deviceConfiguration {




}
$null = $Script:MSGraphAPIClassHash.Add('iosDeviceFeaturesConfiguration', 'MSGraphAPI_v1_iosDeviceFeaturesConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosDeviceFeaturesConfiguration', 'MSGraphAPI_v1_iosDeviceFeaturesConfiguration')


class MSGraphAPI_v1_iosDeviceFeaturesConfiguration : MSGraphAPI_v1_appleDeviceFeaturesConfigurationBase {
    [string] $assetTagTemplate
    [string] $lockScreenFootnote
    [MSGraphAPI_v1_iosHomeScreenItem[]] $homeScreenDockIcons
    [MSGraphAPI_v1_iosHomeScreenPage[]] $homeScreenPages
    [MSGraphAPI_v1_iosNotificationSettings[]] $notificationSettings



}
$null = $Script:MSGraphAPIClassHash.Add('iosHomeScreenItem', 'MSGraphAPI_v1_iosHomeScreenItem')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosHomeScreenItem', 'MSGraphAPI_v1_iosHomeScreenItem')


class MSGraphAPI_v1_iosHomeScreenItem : MSGraphAPI_Base {
    [string] $displayName
}
$null = $Script:MSGraphAPIClassHash.Add('iosHomeScreenPage', 'MSGraphAPI_v1_iosHomeScreenPage')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosHomeScreenPage', 'MSGraphAPI_v1_iosHomeScreenPage')


class MSGraphAPI_v1_iosHomeScreenPage : MSGraphAPI_Base {
    [string] $displayName
    [MSGraphAPI_v1_iosHomeScreenItem[]] $icons
}
$null = $Script:MSGraphAPIClassHash.Add('iosNotificationSettings', 'MSGraphAPI_v1_iosNotificationSettings')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosNotificationSettings', 'MSGraphAPI_v1_iosNotificationSettings')


class MSGraphAPI_v1_iosNotificationSettings : MSGraphAPI_Base {
    [string] $bundleID
    [string] $appName
    [string] $publisher
    [Nullable[bool]] $enabled
    [Nullable[bool]] $showInNotificationCenter
    [Nullable[bool]] $showOnLockScreen
    [MSGraphAPI_v1_iosNotificationAlertType] $alertType
    [Nullable[bool]] $badgesEnabled
    [Nullable[bool]] $soundsEnabled
}
$null = $Script:MSGraphAPIClassHash.Add('iosHomeScreenFolder', 'MSGraphAPI_v1_iosHomeScreenFolder')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosHomeScreenFolder', 'MSGraphAPI_v1_iosHomeScreenFolder')


class MSGraphAPI_v1_iosHomeScreenFolder : MSGraphAPI_v1_iosHomeScreenItem {
    [MSGraphAPI_v1_iosHomeScreenFolderPage[]] $pages
}
$null = $Script:MSGraphAPIClassHash.Add('iosHomeScreenFolderPage', 'MSGraphAPI_v1_iosHomeScreenFolderPage')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosHomeScreenFolderPage', 'MSGraphAPI_v1_iosHomeScreenFolderPage')


class MSGraphAPI_v1_iosHomeScreenFolderPage : MSGraphAPI_Base {
    [string] $displayName
    [MSGraphAPI_v1_iosHomeScreenApp[]] $apps
}
$null = $Script:MSGraphAPIClassHash.Add('iosHomeScreenApp', 'MSGraphAPI_v1_iosHomeScreenApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosHomeScreenApp', 'MSGraphAPI_v1_iosHomeScreenApp')


class MSGraphAPI_v1_iosHomeScreenApp : MSGraphAPI_v1_iosHomeScreenItem {
    [string] $bundleID
}
$null = $Script:MSGraphAPIClassHash.Add('macOSDeviceFeaturesConfiguration', 'MSGraphAPI_v1_macOSDeviceFeaturesConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.macOSDeviceFeaturesConfiguration', 'MSGraphAPI_v1_macOSDeviceFeaturesConfiguration')


class MSGraphAPI_v1_macOSDeviceFeaturesConfiguration : MSGraphAPI_v1_appleDeviceFeaturesConfigurationBase {




}
$null = $Script:MSGraphAPIClassHash.Add('windowsDefenderAdvancedThreatProtectionConfiguration', 'MSGraphAPI_v1_windowsDefenderAdvancedThreatProtectionConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsDefenderAdvancedThreatProtectionConfiguration', 'MSGraphAPI_v1_windowsDefenderAdvancedThreatProtectionConfiguration')


class MSGraphAPI_v1_windowsDefenderAdvancedThreatProtectionConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [Nullable[bool]] $allowSampleSharing
    [Nullable[bool]] $enableExpeditedTelemetryReporting



}
$null = $Script:MSGraphAPIClassHash.Add('windows10EndpointProtectionConfiguration', 'MSGraphAPI_v1_windows10EndpointProtectionConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10EndpointProtectionConfiguration', 'MSGraphAPI_v1_windows10EndpointProtectionConfiguration')


class MSGraphAPI_v1_windows10EndpointProtectionConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [Nullable[bool]] $firewallBlockStatefulFTP
    [Nullable[int]] $firewallIdleTimeoutForSecurityAssociationInSeconds
    [MSGraphAPI_v1_firewallPreSharedKeyEncodingMethodType] $firewallPreSharedKeyEncodingMethod
    [Nullable[bool]] $firewallIPSecExemptionsAllowNeighborDiscovery
    [Nullable[bool]] $firewallIPSecExemptionsAllowICMP
    [Nullable[bool]] $firewallIPSecExemptionsAllowRouterDiscovery
    [Nullable[bool]] $firewallIPSecExemptionsAllowDHCP
    [MSGraphAPI_v1_firewallCertificateRevocationListCheckMethodType] $firewallCertificateRevocationListCheckMethod
    [Nullable[bool]] $firewallMergeKeyingModuleSettings
    [MSGraphAPI_v1_firewallPacketQueueingMethodType] $firewallPacketQueueingMethod
    [MSGraphAPI_v1_windowsFirewallNetworkProfile] $firewallProfileDomain
    [MSGraphAPI_v1_windowsFirewallNetworkProfile] $firewallProfilePublic
    [MSGraphAPI_v1_windowsFirewallNetworkProfile] $firewallProfilePrivate
    [string[]] $defenderAttackSurfaceReductionExcludedPaths
    [string[]] $defenderGuardedFoldersAllowedAppPaths
    [string[]] $defenderAdditionalGuardedFolders
    [object] $defenderExploitProtectionXml
    [string] $defenderExploitProtectionXmlFileName
    [Nullable[bool]] $defenderSecurityCenterBlockExploitProtectionOverride
    [MSGraphAPI_v1_appLockerApplicationControlType] $appLockerApplicationControl
    [Nullable[bool]] $smartScreenEnableInShell
    [Nullable[bool]] $smartScreenBlockOverrideForFiles
    [Nullable[bool]] $applicationGuardEnabled
    [MSGraphAPI_v1_applicationGuardBlockFileTransferType] $applicationGuardBlockFileTransfer
    [Nullable[bool]] $applicationGuardBlockNonEnterpriseContent
    [Nullable[bool]] $applicationGuardAllowPersistence
    [Nullable[bool]] $applicationGuardForceAuditing
    [MSGraphAPI_v1_applicationGuardBlockClipboardSharingType] $applicationGuardBlockClipboardSharing
    [Nullable[bool]] $applicationGuardAllowPrintToPDF
    [Nullable[bool]] $applicationGuardAllowPrintToXPS
    [Nullable[bool]] $applicationGuardAllowPrintToLocalPrinters
    [Nullable[bool]] $applicationGuardAllowPrintToNetworkPrinters
    [Nullable[bool]] $bitLockerDisableWarningForOtherDiskEncryption
    [Nullable[bool]] $bitLockerEnableStorageCardEncryptionOnMobile
    [Nullable[bool]] $bitLockerEncryptDevice
    [MSGraphAPI_v1_bitLockerRemovableDrivePolicy] $bitLockerRemovableDrivePolicy



}
$null = $Script:MSGraphAPIClassHash.Add('windowsFirewallNetworkProfile', 'MSGraphAPI_v1_windowsFirewallNetworkProfile')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsFirewallNetworkProfile', 'MSGraphAPI_v1_windowsFirewallNetworkProfile')


class MSGraphAPI_v1_windowsFirewallNetworkProfile : MSGraphAPI_Base {
    [MSGraphAPI_v1_stateManagementSetting] $firewallEnabled
    [Nullable[bool]] $stealthModeBlocked
    [Nullable[bool]] $incomingTrafficBlocked
    [Nullable[bool]] $unicastResponsesToMulticastBroadcastsBlocked
    [Nullable[bool]] $inboundNotificationsBlocked
    [Nullable[bool]] $authorizedApplicationRulesFromGroupPolicyMerged
    [Nullable[bool]] $globalPortRulesFromGroupPolicyMerged
    [Nullable[bool]] $connectionSecurityRulesFromGroupPolicyMerged
    [Nullable[bool]] $outboundConnectionsBlocked
    [Nullable[bool]] $inboundConnectionsBlocked
    [Nullable[bool]] $securedPacketExemptionAllowed
    [Nullable[bool]] $policyRulesFromGroupPolicyMerged
}
$null = $Script:MSGraphAPIClassHash.Add('bitLockerRemovableDrivePolicy', 'MSGraphAPI_v1_bitLockerRemovableDrivePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.bitLockerRemovableDrivePolicy', 'MSGraphAPI_v1_bitLockerRemovableDrivePolicy')


class MSGraphAPI_v1_bitLockerRemovableDrivePolicy : MSGraphAPI_Base {
    [MSGraphAPI_v1_bitLockerEncryptionMethod] $encryptionMethod
    [Nullable[bool]] $requireEncryptionForWriteAccess
    [Nullable[bool]] $blockCrossOrganizationWriteAccess
}
$null = $Script:MSGraphAPIClassHash.Add('windows10GeneralConfiguration', 'MSGraphAPI_v1_windows10GeneralConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10GeneralConfiguration', 'MSGraphAPI_v1_windows10GeneralConfiguration')


class MSGraphAPI_v1_windows10GeneralConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [string] $enterpriseCloudPrintDiscoveryEndPoint
    [string] $enterpriseCloudPrintOAuthAuthority
    [string] $enterpriseCloudPrintOAuthClientIdentifier
    [string] $enterpriseCloudPrintResourceIdentifier
    [Nullable[int]] $enterpriseCloudPrintDiscoveryMaxLimit
    [string] $enterpriseCloudPrintMopriaDiscoveryResourceIdentifier
    [Nullable[bool]] $searchBlockDiacritics
    [Nullable[bool]] $searchDisableAutoLanguageDetection
    [Nullable[bool]] $searchDisableIndexingEncryptedItems
    [Nullable[bool]] $searchEnableRemoteQueries
    [Nullable[bool]] $searchDisableIndexerBackoff
    [Nullable[bool]] $searchDisableIndexingRemovableDrive
    [Nullable[bool]] $searchEnableAutomaticIndexSizeManangement
    [MSGraphAPI_v1_diagnosticDataSubmissionMode] $diagnosticsDataSubmissionMode
    [Nullable[bool]] $oneDriveDisableFileSync
    [Nullable[bool]] $smartScreenEnableAppInstallControl
    [string] $personalizationDesktopImageUrl
    [string] $personalizationLockScreenImageUrl
    [string[]] $bluetoothAllowedServices
    [Nullable[bool]] $bluetoothBlockAdvertising
    [Nullable[bool]] $bluetoothBlockDiscoverableMode
    [Nullable[bool]] $bluetoothBlockPrePairing
    [Nullable[bool]] $edgeBlockAutofill
    [Nullable[bool]] $edgeBlocked
    [MSGraphAPI_v1_edgeCookiePolicy] $edgeCookiePolicy
    [Nullable[bool]] $edgeBlockDeveloperTools
    [Nullable[bool]] $edgeBlockSendingDoNotTrackHeader
    [Nullable[bool]] $edgeBlockExtensions
    [Nullable[bool]] $edgeBlockInPrivateBrowsing
    [Nullable[bool]] $edgeBlockJavaScript
    [Nullable[bool]] $edgeBlockPasswordManager
    [Nullable[bool]] $edgeBlockAddressBarDropdown
    [Nullable[bool]] $edgeBlockCompatibilityList
    [Nullable[bool]] $edgeClearBrowsingDataOnExit
    [Nullable[bool]] $edgeAllowStartPagesModification
    [Nullable[bool]] $edgeDisableFirstRunPage
    [Nullable[bool]] $edgeBlockLiveTileDataCollection
    [Nullable[bool]] $edgeSyncFavoritesWithInternetExplorer
    [Nullable[bool]] $cellularBlockDataWhenRoaming
    [Nullable[bool]] $cellularBlockVpn
    [Nullable[bool]] $cellularBlockVpnWhenRoaming
    [Nullable[bool]] $defenderBlockEndUserAccess
    [Nullable[int]] $defenderDaysBeforeDeletingQuarantinedMalware
    [MSGraphAPI_v1_defenderDetectedMalwareActions] $defenderDetectedMalwareActions
    [MSGraphAPI_v1_weeklySchedule] $defenderSystemScanSchedule
    [string[]] $defenderFilesAndFoldersToExclude
    [string[]] $defenderFileExtensionsToExclude
    [Nullable[int]] $defenderScanMaxCpu
    [MSGraphAPI_v1_defenderMonitorFileActivity] $defenderMonitorFileActivity
    [string[]] $defenderProcessesToExclude
    [MSGraphAPI_v1_defenderPromptForSampleSubmission] $defenderPromptForSampleSubmission
    [Nullable[bool]] $defenderRequireBehaviorMonitoring
    [Nullable[bool]] $defenderRequireCloudProtection
    [Nullable[bool]] $defenderRequireNetworkInspectionSystem
    [Nullable[bool]] $defenderRequireRealTimeMonitoring
    [Nullable[bool]] $defenderScanArchiveFiles
    [Nullable[bool]] $defenderScanDownloads
    [Nullable[bool]] $defenderScanNetworkFiles
    [Nullable[bool]] $defenderScanIncomingMail
    [Nullable[bool]] $defenderScanMappedNetworkDrivesDuringFullScan
    [Nullable[bool]] $defenderScanRemovableDrivesDuringFullScan
    [Nullable[bool]] $defenderScanScriptsLoadedInInternetExplorer
    [Nullable[int]] $defenderSignatureUpdateIntervalInHours
    [MSGraphAPI_v1_defenderScanType] $defenderScanType
    [object] $defenderScheduledScanTime
    [object] $defenderScheduledQuickScanTime
    [MSGraphAPI_v1_defenderCloudBlockLevelType] $defenderCloudBlockLevel
    [Nullable[bool]] $lockScreenAllowTimeoutConfiguration
    [Nullable[bool]] $lockScreenBlockActionCenterNotifications
    [Nullable[bool]] $lockScreenBlockCortana
    [Nullable[bool]] $lockScreenBlockToastNotifications
    [Nullable[int]] $lockScreenTimeoutInSeconds
    [Nullable[bool]] $passwordBlockSimple
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinutesOfInactivityBeforeScreenTimeout
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [Nullable[bool]] $passwordRequired
    [Nullable[bool]] $passwordRequireWhenResumeFromIdleState
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [Nullable[int]] $passwordSignInFailureCountBeforeFactoryReset
    [MSGraphAPI_v1_stateManagementSetting] $privacyAdvertisingId
    [Nullable[bool]] $privacyAutoAcceptPairingAndConsentPrompts
    [Nullable[bool]] $privacyBlockInputPersonalization
    [Nullable[bool]] $startBlockUnpinningAppsFromTaskbar
    [MSGraphAPI_v1_windowsStartMenuAppListVisibilityType] $startMenuAppListVisibility
    [Nullable[bool]] $startMenuHideChangeAccountSettings
    [Nullable[bool]] $startMenuHideFrequentlyUsedApps
    [Nullable[bool]] $startMenuHideHibernate
    [Nullable[bool]] $startMenuHideLock
    [Nullable[bool]] $startMenuHidePowerButton
    [Nullable[bool]] $startMenuHideRecentJumpLists
    [Nullable[bool]] $startMenuHideRecentlyAddedApps
    [Nullable[bool]] $startMenuHideRestartOptions
    [Nullable[bool]] $startMenuHideShutDown
    [Nullable[bool]] $startMenuHideSignOut
    [Nullable[bool]] $startMenuHideSleep
    [Nullable[bool]] $startMenuHideSwitchAccount
    [Nullable[bool]] $startMenuHideUserTile
    [object] $startMenuLayoutEdgeAssetsXml
    [object] $startMenuLayoutXml
    [MSGraphAPI_v1_windowsStartMenuModeType] $startMenuMode
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderDocuments
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderDownloads
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderFileExplorer
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderHomeGroup
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderMusic
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderNetwork
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderPersonalFolder
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderPictures
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderSettings
    [MSGraphAPI_v1_visibilitySetting] $startMenuPinnedFolderVideos
    [Nullable[bool]] $settingsBlockSettingsApp
    [Nullable[bool]] $settingsBlockSystemPage
    [Nullable[bool]] $settingsBlockDevicesPage
    [Nullable[bool]] $settingsBlockNetworkInternetPage
    [Nullable[bool]] $settingsBlockPersonalizationPage
    [Nullable[bool]] $settingsBlockAccountsPage
    [Nullable[bool]] $settingsBlockTimeLanguagePage
    [Nullable[bool]] $settingsBlockEaseOfAccessPage
    [Nullable[bool]] $settingsBlockPrivacyPage
    [Nullable[bool]] $settingsBlockUpdateSecurityPage
    [Nullable[bool]] $settingsBlockAppsPage
    [Nullable[bool]] $settingsBlockGamingPage
    [Nullable[bool]] $windowsSpotlightBlockConsumerSpecificFeatures
    [Nullable[bool]] $windowsSpotlightBlocked
    [Nullable[bool]] $windowsSpotlightBlockOnActionCenter
    [Nullable[bool]] $windowsSpotlightBlockTailoredExperiences
    [Nullable[bool]] $windowsSpotlightBlockThirdPartyNotifications
    [Nullable[bool]] $windowsSpotlightBlockWelcomeExperience
    [Nullable[bool]] $windowsSpotlightBlockWindowsTips
    [MSGraphAPI_v1_windowsSpotlightEnablementSettings] $windowsSpotlightConfigureOnLockScreen
    [Nullable[bool]] $networkProxyApplySettingsDeviceWide
    [Nullable[bool]] $networkProxyDisableAutoDetect
    [string] $networkProxyAutomaticConfigurationUrl
    [MSGraphAPI_v1_windows10NetworkProxyServer] $networkProxyServer
    [Nullable[bool]] $accountsBlockAddingNonMicrosoftAccountEmail
    [Nullable[bool]] $antiTheftModeBlocked
    [Nullable[bool]] $bluetoothBlocked
    [Nullable[bool]] $cameraBlocked
    [Nullable[bool]] $connectedDevicesServiceBlocked
    [Nullable[bool]] $certificatesBlockManualRootCertificateInstallation
    [Nullable[bool]] $copyPasteBlocked
    [Nullable[bool]] $cortanaBlocked
    [Nullable[bool]] $deviceManagementBlockFactoryResetOnMobile
    [Nullable[bool]] $deviceManagementBlockManualUnenroll
    [MSGraphAPI_v1_safeSearchFilterType] $safeSearchFilter
    [Nullable[bool]] $edgeBlockPopups
    [Nullable[bool]] $edgeBlockSearchSuggestions
    [Nullable[bool]] $edgeBlockSendingIntranetTrafficToInternetExplorer
    [Nullable[bool]] $edgeRequireSmartScreen
    [string] $edgeEnterpriseModeSiteListLocation
    [string] $edgeFirstRunUrl
    [MSGraphAPI_v1_edgeSearchEngineBase] $edgeSearchEngine
    [string[]] $edgeHomepageUrls
    [Nullable[bool]] $edgeBlockAccessToAboutFlags
    [Nullable[bool]] $smartScreenBlockPromptOverride
    [Nullable[bool]] $smartScreenBlockPromptOverrideForFiles
    [Nullable[bool]] $webRtcBlockLocalhostIpAddress
    [Nullable[bool]] $internetSharingBlocked
    [Nullable[bool]] $settingsBlockAddProvisioningPackage
    [Nullable[bool]] $settingsBlockRemoveProvisioningPackage
    [Nullable[bool]] $settingsBlockChangeSystemTime
    [Nullable[bool]] $settingsBlockEditDeviceName
    [Nullable[bool]] $settingsBlockChangeRegion
    [Nullable[bool]] $settingsBlockChangeLanguage
    [Nullable[bool]] $settingsBlockChangePowerSleep
    [Nullable[bool]] $locationServicesBlocked
    [Nullable[bool]] $microsoftAccountBlocked
    [Nullable[bool]] $microsoftAccountBlockSettingsSync
    [Nullable[bool]] $nfcBlocked
    [Nullable[bool]] $resetProtectionModeBlocked
    [Nullable[bool]] $screenCaptureBlocked
    [Nullable[bool]] $storageBlockRemovableStorage
    [Nullable[bool]] $storageRequireMobileDeviceEncryption
    [Nullable[bool]] $usbBlocked
    [Nullable[bool]] $voiceRecordingBlocked
    [Nullable[bool]] $wiFiBlockAutomaticConnectHotspots
    [Nullable[bool]] $wiFiBlocked
    [Nullable[bool]] $wiFiBlockManualConfiguration
    [Nullable[int]] $wiFiScanInterval
    [Nullable[bool]] $wirelessDisplayBlockProjectionToThisDevice
    [Nullable[bool]] $wirelessDisplayBlockUserInputFromReceiver
    [Nullable[bool]] $wirelessDisplayRequirePinForPairing
    [Nullable[bool]] $windowsStoreBlocked
    [MSGraphAPI_v1_stateManagementSetting] $appsAllowTrustedAppsSideloading
    [Nullable[bool]] $windowsStoreBlockAutoUpdate
    [MSGraphAPI_v1_stateManagementSetting] $developerUnlockSetting
    [Nullable[bool]] $sharedUserAppDataAllowed
    [Nullable[bool]] $appsBlockWindowsStoreOriginatedApps
    [Nullable[bool]] $windowsStoreEnablePrivateStoreOnly
    [Nullable[bool]] $storageRestrictAppDataToSystemVolume
    [Nullable[bool]] $storageRestrictAppInstallToSystemVolume
    [Nullable[bool]] $gameDvrBlocked
    [Nullable[bool]] $experienceBlockDeviceDiscovery
    [Nullable[bool]] $experienceBlockErrorDialogWhenNoSIM
    [Nullable[bool]] $experienceBlockTaskSwitcher
    [Nullable[bool]] $logonBlockFastUserSwitching



}
$null = $Script:MSGraphAPIClassHash.Add('defenderDetectedMalwareActions', 'MSGraphAPI_v1_defenderDetectedMalwareActions')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.defenderDetectedMalwareActions', 'MSGraphAPI_v1_defenderDetectedMalwareActions')


class MSGraphAPI_v1_defenderDetectedMalwareActions : MSGraphAPI_Base {
    [MSGraphAPI_v1_defenderThreatAction] $lowSeverity
    [MSGraphAPI_v1_defenderThreatAction] $moderateSeverity
    [MSGraphAPI_v1_defenderThreatAction] $highSeverity
    [MSGraphAPI_v1_defenderThreatAction] $severeSeverity
}
$null = $Script:MSGraphAPIClassHash.Add('windows10NetworkProxyServer', 'MSGraphAPI_v1_windows10NetworkProxyServer')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10NetworkProxyServer', 'MSGraphAPI_v1_windows10NetworkProxyServer')


class MSGraphAPI_v1_windows10NetworkProxyServer : MSGraphAPI_Base {
    [string] $address
    [string[]] $exceptions
    [Nullable[bool]] $useForLocalAddresses
}
$null = $Script:MSGraphAPIClassHash.Add('edgeSearchEngineBase', 'MSGraphAPI_v1_edgeSearchEngineBase')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.edgeSearchEngineBase', 'MSGraphAPI_v1_edgeSearchEngineBase')


class MSGraphAPI_v1_edgeSearchEngineBase : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('edgeSearchEngineCustom', 'MSGraphAPI_v1_edgeSearchEngineCustom')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.edgeSearchEngineCustom', 'MSGraphAPI_v1_edgeSearchEngineCustom')


class MSGraphAPI_v1_edgeSearchEngineCustom : MSGraphAPI_v1_edgeSearchEngineBase {
    [string] $edgeSearchEngineOpenSearchXmlUrl
}
$null = $Script:MSGraphAPIClassHash.Add('edgeSearchEngine', 'MSGraphAPI_v1_edgeSearchEngine')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.edgeSearchEngine', 'MSGraphAPI_v1_edgeSearchEngine')


class MSGraphAPI_v1_edgeSearchEngine : MSGraphAPI_v1_edgeSearchEngineBase {
    [MSGraphAPI_v1_edgeSearchEngineType] $edgeSearchEngineType
}
$null = $Script:MSGraphAPIClassHash.Add('windows10CustomConfiguration', 'MSGraphAPI_v1_windows10CustomConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10CustomConfiguration', 'MSGraphAPI_v1_windows10CustomConfiguration')


class MSGraphAPI_v1_windows10CustomConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [MSGraphAPI_v1_omaSetting[]] $omaSettings



}
$null = $Script:MSGraphAPIClassHash.Add('windows10EnterpriseModernAppManagementConfiguration', 'MSGraphAPI_v1_windows10EnterpriseModernAppManagementConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10EnterpriseModernAppManagementConfiguration', 'MSGraphAPI_v1_windows10EnterpriseModernAppManagementConfiguration')


class MSGraphAPI_v1_windows10EnterpriseModernAppManagementConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [Nullable[bool]] $uninstallBuiltInApps



}
$null = $Script:MSGraphAPIClassHash.Add('sharedPCConfiguration', 'MSGraphAPI_v1_sharedPCConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.sharedPCConfiguration', 'MSGraphAPI_v1_sharedPCConfiguration')


class MSGraphAPI_v1_sharedPCConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [MSGraphAPI_v1_sharedPCAccountManagerPolicy] $accountManagerPolicy
    [MSGraphAPI_v1_sharedPCAllowedAccountType] $allowedAccounts
    [Nullable[bool]] $allowLocalStorage
    [Nullable[bool]] $disableAccountManager
    [Nullable[bool]] $disableEduPolicies
    [Nullable[bool]] $disablePowerPolicies
    [Nullable[bool]] $disableSignInOnResume
    [Nullable[bool]] $enabled
    [Nullable[int]] $idleTimeBeforeSleepInSeconds
    [string] $kioskAppDisplayName
    [string] $kioskAppUserModelId
    [object] $maintenanceStartTime



}
$null = $Script:MSGraphAPIClassHash.Add('sharedPCAccountManagerPolicy', 'MSGraphAPI_v1_sharedPCAccountManagerPolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.sharedPCAccountManagerPolicy', 'MSGraphAPI_v1_sharedPCAccountManagerPolicy')


class MSGraphAPI_v1_sharedPCAccountManagerPolicy : MSGraphAPI_Base {
    [MSGraphAPI_v1_sharedPCAccountDeletionPolicyType] $accountDeletionPolicy
    [Nullable[int]] $cacheAccountsAboveDiskFreePercentage
    [Nullable[int]] $inactiveThresholdDays
    [Nullable[int]] $removeAccountsBelowDiskFreePercentage
}
$null = $Script:MSGraphAPIClassHash.Add('windows10SecureAssessmentConfiguration', 'MSGraphAPI_v1_windows10SecureAssessmentConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10SecureAssessmentConfiguration', 'MSGraphAPI_v1_windows10SecureAssessmentConfiguration')


class MSGraphAPI_v1_windows10SecureAssessmentConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [string] $launchUri
    [string] $configurationAccount
    [Nullable[bool]] $allowPrinting
    [Nullable[bool]] $allowScreenCapture
    [Nullable[bool]] $allowTextSuggestion



}
$null = $Script:MSGraphAPIClassHash.Add('windowsPhone81CustomConfiguration', 'MSGraphAPI_v1_windowsPhone81CustomConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsPhone81CustomConfiguration', 'MSGraphAPI_v1_windowsPhone81CustomConfiguration')


class MSGraphAPI_v1_windowsPhone81CustomConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [MSGraphAPI_v1_omaSetting[]] $omaSettings



}
$null = $Script:MSGraphAPIClassHash.Add('windowsUpdateForBusinessConfiguration', 'MSGraphAPI_v1_windowsUpdateForBusinessConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsUpdateForBusinessConfiguration', 'MSGraphAPI_v1_windowsUpdateForBusinessConfiguration')


class MSGraphAPI_v1_windowsUpdateForBusinessConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [MSGraphAPI_v1_windowsDeliveryOptimizationMode] $deliveryOptimizationMode
    [MSGraphAPI_v1_prereleaseFeatures] $prereleaseFeatures
    [MSGraphAPI_v1_automaticUpdateMode] $automaticUpdateMode
    [Nullable[bool]] $microsoftUpdateServiceAllowed
    [Nullable[bool]] $driversExcluded
    [MSGraphAPI_v1_windowsUpdateInstallScheduleType] $installationSchedule
    [Nullable[int]] $qualityUpdatesDeferralPeriodInDays
    [Nullable[int]] $featureUpdatesDeferralPeriodInDays
    [Nullable[bool]] $qualityUpdatesPaused
    [Nullable[bool]] $featureUpdatesPaused
    [Nullable[DateTimeOffset]] $qualityUpdatesPauseExpiryDateTime
    [Nullable[DateTimeOffset]] $featureUpdatesPauseExpiryDateTime
    [MSGraphAPI_v1_windowsUpdateType] $businessReadyUpdatesOnly



}
$null = $Script:MSGraphAPIClassHash.Add('windowsUpdateInstallScheduleType', 'MSGraphAPI_v1_windowsUpdateInstallScheduleType')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsUpdateInstallScheduleType', 'MSGraphAPI_v1_windowsUpdateInstallScheduleType')


class MSGraphAPI_v1_windowsUpdateInstallScheduleType : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('windowsUpdateScheduledInstall', 'MSGraphAPI_v1_windowsUpdateScheduledInstall')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsUpdateScheduledInstall', 'MSGraphAPI_v1_windowsUpdateScheduledInstall')


class MSGraphAPI_v1_windowsUpdateScheduledInstall : MSGraphAPI_v1_windowsUpdateInstallScheduleType {
    [MSGraphAPI_v1_weeklySchedule] $scheduledInstallDay
    [object] $scheduledInstallTime
}
$null = $Script:MSGraphAPIClassHash.Add('windowsUpdateActiveHoursInstall', 'MSGraphAPI_v1_windowsUpdateActiveHoursInstall')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsUpdateActiveHoursInstall', 'MSGraphAPI_v1_windowsUpdateActiveHoursInstall')


class MSGraphAPI_v1_windowsUpdateActiveHoursInstall : MSGraphAPI_v1_windowsUpdateInstallScheduleType {
    [object] $activeHoursStart
    [object] $activeHoursEnd
}
$null = $Script:MSGraphAPIClassHash.Add('windows81GeneralConfiguration', 'MSGraphAPI_v1_windows81GeneralConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows81GeneralConfiguration', 'MSGraphAPI_v1_windows81GeneralConfiguration')


class MSGraphAPI_v1_windows81GeneralConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [Nullable[bool]] $accountsBlockAddingNonMicrosoftAccountEmail
    [Nullable[bool]] $applyOnlyToWindows81
    [Nullable[bool]] $browserBlockAutofill
    [Nullable[bool]] $browserBlockAutomaticDetectionOfIntranetSites
    [Nullable[bool]] $browserBlockEnterpriseModeAccess
    [Nullable[bool]] $browserBlockJavaScript
    [Nullable[bool]] $browserBlockPlugins
    [Nullable[bool]] $browserBlockPopups
    [Nullable[bool]] $browserBlockSendingDoNotTrackHeader
    [Nullable[bool]] $browserBlockSingleWordEntryOnIntranetSites
    [Nullable[bool]] $browserRequireSmartScreen
    [string] $browserEnterpriseModeSiteListLocation
    [MSGraphAPI_v1_internetSiteSecurityLevel] $browserInternetSecurityLevel
    [MSGraphAPI_v1_siteSecurityLevel] $browserIntranetSecurityLevel
    [string] $browserLoggingReportLocation
    [Nullable[bool]] $browserRequireHighSecurityForRestrictedSites
    [Nullable[bool]] $browserRequireFirewall
    [Nullable[bool]] $browserRequireFraudWarning
    [MSGraphAPI_v1_siteSecurityLevel] $browserTrustedSitesSecurityLevel
    [Nullable[bool]] $cellularBlockDataRoaming
    [Nullable[bool]] $diagnosticsBlockDataSubmission
    [Nullable[bool]] $passwordBlockPicturePasswordAndPin
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinutesOfInactivityBeforeScreenTimeout
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [Nullable[int]] $passwordSignInFailureCountBeforeFactoryReset
    [Nullable[bool]] $storageRequireDeviceEncryption
    [Nullable[bool]] $updatesRequireAutomaticUpdates
    [MSGraphAPI_v1_windowsUserAccountControlSettings] $userAccountControlSettings
    [string] $workFoldersUrl



}
$null = $Script:MSGraphAPIClassHash.Add('windowsPhone81GeneralConfiguration', 'MSGraphAPI_v1_windowsPhone81GeneralConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsPhone81GeneralConfiguration', 'MSGraphAPI_v1_windowsPhone81GeneralConfiguration')


class MSGraphAPI_v1_windowsPhone81GeneralConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [Nullable[bool]] $applyOnlyToWindowsPhone81
    [Nullable[bool]] $appsBlockCopyPaste
    [Nullable[bool]] $bluetoothBlocked
    [Nullable[bool]] $cameraBlocked
    [Nullable[bool]] $cellularBlockWifiTethering
    [MSGraphAPI_v1_appListItem[]] $compliantAppsList
    [MSGraphAPI_v1_appListType] $compliantAppListType
    [Nullable[bool]] $diagnosticDataBlockSubmission
    [Nullable[bool]] $emailBlockAddingAccounts
    [Nullable[bool]] $locationServicesBlocked
    [Nullable[bool]] $microsoftAccountBlocked
    [Nullable[bool]] $nfcBlocked
    [Nullable[bool]] $passwordBlockSimple
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinutesOfInactivityBeforeScreenTimeout
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [Nullable[int]] $passwordSignInFailureCountBeforeFactoryReset
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [Nullable[bool]] $passwordRequired
    [Nullable[bool]] $screenCaptureBlocked
    [Nullable[bool]] $storageBlockRemovableStorage
    [Nullable[bool]] $storageRequireEncryption
    [Nullable[bool]] $webBrowserBlocked
    [Nullable[bool]] $wifiBlocked
    [Nullable[bool]] $wifiBlockAutomaticConnectHotspots
    [Nullable[bool]] $wifiBlockHotspotReporting
    [Nullable[bool]] $windowsStoreBlocked



}
$null = $Script:MSGraphAPIClassHash.Add('windows10TeamGeneralConfiguration', 'MSGraphAPI_v1_windows10TeamGeneralConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10TeamGeneralConfiguration', 'MSGraphAPI_v1_windows10TeamGeneralConfiguration')


class MSGraphAPI_v1_windows10TeamGeneralConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [Nullable[bool]] $azureOperationalInsightsBlockTelemetry
    [string] $azureOperationalInsightsWorkspaceId
    [string] $azureOperationalInsightsWorkspaceKey
    [Nullable[bool]] $connectAppBlockAutoLaunch
    [Nullable[bool]] $maintenanceWindowBlocked
    [Nullable[int]] $maintenanceWindowDurationInHours
    [object] $maintenanceWindowStartTime
    [MSGraphAPI_v1_miracastChannel] $miracastChannel
    [Nullable[bool]] $miracastBlocked
    [Nullable[bool]] $miracastRequirePin
    [Nullable[bool]] $settingsBlockMyMeetingsAndFiles
    [Nullable[bool]] $settingsBlockSessionResume
    [Nullable[bool]] $settingsBlockSigninSuggestions
    [Nullable[int]] $settingsDefaultVolume
    [Nullable[int]] $settingsScreenTimeoutInMinutes
    [Nullable[int]] $settingsSessionTimeoutInMinutes
    [Nullable[int]] $settingsSleepTimeoutInMinutes
    [Nullable[bool]] $welcomeScreenBlockAutomaticWakeUp
    [string] $welcomeScreenBackgroundImageUrl
    [MSGraphAPI_v1_welcomeScreenMeetingInformation] $welcomeScreenMeetingInformation



}
$null = $Script:MSGraphAPIClassHash.Add('editionUpgradeConfiguration', 'MSGraphAPI_v1_editionUpgradeConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.editionUpgradeConfiguration', 'MSGraphAPI_v1_editionUpgradeConfiguration')


class MSGraphAPI_v1_editionUpgradeConfiguration : MSGraphAPI_v1_deviceConfiguration {
    [MSGraphAPI_v1_editionUpgradeLicenseType] $licenseType
    [MSGraphAPI_v1_windows10EditionType] $targetEdition
    [string] $license
    [string] $productKey



}
$null = $Script:MSGraphAPIClassHash.Add('androidCompliancePolicy', 'MSGraphAPI_v1_androidCompliancePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidCompliancePolicy', 'MSGraphAPI_v1_androidCompliancePolicy')


class MSGraphAPI_v1_androidCompliancePolicy : MSGraphAPI_v1_deviceCompliancePolicy {
    [Nullable[bool]] $passwordRequired
    [Nullable[int]] $passwordMinimumLength
    [MSGraphAPI_v1_androidRequiredPasswordType] $passwordRequiredType
    [Nullable[int]] $passwordMinutesOfInactivityBeforeLock
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [Nullable[bool]] $securityPreventInstallAppsFromUnknownSources
    [Nullable[bool]] $securityDisableUsbDebugging
    [Nullable[bool]] $securityRequireVerifyApps
    [Nullable[bool]] $deviceThreatProtectionEnabled
    [MSGraphAPI_v1_deviceThreatProtectionLevel] $deviceThreatProtectionRequiredSecurityLevel
    [Nullable[bool]] $securityBlockJailbrokenDevices
    [string] $osMinimumVersion
    [string] $osMaximumVersion
    [string] $minAndroidSecurityPatchLevel
    [Nullable[bool]] $storageRequireEncryption
    [Nullable[bool]] $securityRequireSafetyNetAttestationBasicIntegrity
    [Nullable[bool]] $securityRequireSafetyNetAttestationCertifiedDevice
    [Nullable[bool]] $securityRequireGooglePlayServices
    [Nullable[bool]] $securityRequireUpToDateSecurityProviders
    [Nullable[bool]] $securityRequireCompanyPortalAppIntegrity



}
$null = $Script:MSGraphAPIClassHash.Add('iosCompliancePolicy', 'MSGraphAPI_v1_iosCompliancePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosCompliancePolicy', 'MSGraphAPI_v1_iosCompliancePolicy')


class MSGraphAPI_v1_iosCompliancePolicy : MSGraphAPI_v1_deviceCompliancePolicy {
    [Nullable[bool]] $passcodeBlockSimple
    [Nullable[int]] $passcodeExpirationDays
    [Nullable[int]] $passcodeMinimumLength
    [Nullable[int]] $passcodeMinutesOfInactivityBeforeLock
    [Nullable[int]] $passcodePreviousPasscodeBlockCount
    [Nullable[int]] $passcodeMinimumCharacterSetCount
    [MSGraphAPI_v1_requiredPasswordType] $passcodeRequiredType
    [Nullable[bool]] $passcodeRequired
    [string] $osMinimumVersion
    [string] $osMaximumVersion
    [Nullable[bool]] $securityBlockJailbrokenDevices
    [Nullable[bool]] $deviceThreatProtectionEnabled
    [MSGraphAPI_v1_deviceThreatProtectionLevel] $deviceThreatProtectionRequiredSecurityLevel
    [Nullable[bool]] $managedEmailProfileRequired



}
$null = $Script:MSGraphAPIClassHash.Add('macOSCompliancePolicy', 'MSGraphAPI_v1_macOSCompliancePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.macOSCompliancePolicy', 'MSGraphAPI_v1_macOSCompliancePolicy')


class MSGraphAPI_v1_macOSCompliancePolicy : MSGraphAPI_v1_deviceCompliancePolicy {
    [Nullable[bool]] $passwordRequired
    [Nullable[bool]] $passwordBlockSimple
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinutesOfInactivityBeforeLock
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [string] $osMinimumVersion
    [string] $osMaximumVersion
    [Nullable[bool]] $systemIntegrityProtectionEnabled
    [Nullable[bool]] $deviceThreatProtectionEnabled
    [MSGraphAPI_v1_deviceThreatProtectionLevel] $deviceThreatProtectionRequiredSecurityLevel
    [Nullable[bool]] $storageRequireEncryption



}
$null = $Script:MSGraphAPIClassHash.Add('windows10CompliancePolicy', 'MSGraphAPI_v1_windows10CompliancePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10CompliancePolicy', 'MSGraphAPI_v1_windows10CompliancePolicy')


class MSGraphAPI_v1_windows10CompliancePolicy : MSGraphAPI_v1_deviceCompliancePolicy {
    [Nullable[bool]] $passwordRequired
    [Nullable[bool]] $passwordBlockSimple
    [Nullable[bool]] $passwordRequiredToUnlockFromIdle
    [Nullable[int]] $passwordMinutesOfInactivityBeforeLock
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [Nullable[bool]] $requireHealthyDeviceReport
    [string] $osMinimumVersion
    [string] $osMaximumVersion
    [string] $mobileOsMinimumVersion
    [string] $mobileOsMaximumVersion
    [Nullable[bool]] $earlyLaunchAntiMalwareDriverEnabled
    [Nullable[bool]] $bitLockerEnabled
    [Nullable[bool]] $secureBootEnabled
    [Nullable[bool]] $codeIntegrityEnabled
    [Nullable[bool]] $storageRequireEncryption



}
$null = $Script:MSGraphAPIClassHash.Add('windows10MobileCompliancePolicy', 'MSGraphAPI_v1_windows10MobileCompliancePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows10MobileCompliancePolicy', 'MSGraphAPI_v1_windows10MobileCompliancePolicy')


class MSGraphAPI_v1_windows10MobileCompliancePolicy : MSGraphAPI_v1_deviceCompliancePolicy {
    [Nullable[bool]] $passwordRequired
    [Nullable[bool]] $passwordBlockSimple
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinutesOfInactivityBeforeLock
    [Nullable[bool]] $passwordRequireToUnlockFromIdle
    [string] $osMinimumVersion
    [string] $osMaximumVersion
    [Nullable[bool]] $earlyLaunchAntiMalwareDriverEnabled
    [Nullable[bool]] $bitLockerEnabled
    [Nullable[bool]] $secureBootEnabled
    [Nullable[bool]] $codeIntegrityEnabled
    [Nullable[bool]] $storageRequireEncryption



}
$null = $Script:MSGraphAPIClassHash.Add('windows81CompliancePolicy', 'MSGraphAPI_v1_windows81CompliancePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windows81CompliancePolicy', 'MSGraphAPI_v1_windows81CompliancePolicy')


class MSGraphAPI_v1_windows81CompliancePolicy : MSGraphAPI_v1_deviceCompliancePolicy {
    [Nullable[bool]] $passwordRequired
    [Nullable[bool]] $passwordBlockSimple
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinutesOfInactivityBeforeLock
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [string] $osMinimumVersion
    [string] $osMaximumVersion
    [Nullable[bool]] $storageRequireEncryption



}
$null = $Script:MSGraphAPIClassHash.Add('windowsPhone81CompliancePolicy', 'MSGraphAPI_v1_windowsPhone81CompliancePolicy')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsPhone81CompliancePolicy', 'MSGraphAPI_v1_windowsPhone81CompliancePolicy')


class MSGraphAPI_v1_windowsPhone81CompliancePolicy : MSGraphAPI_v1_deviceCompliancePolicy {
    [Nullable[bool]] $passwordBlockSimple
    [Nullable[int]] $passwordExpirationDays
    [Nullable[int]] $passwordMinimumLength
    [Nullable[int]] $passwordMinutesOfInactivityBeforeLock
    [Nullable[int]] $passwordMinimumCharacterSetCount
    [MSGraphAPI_v1_requiredPasswordType] $passwordRequiredType
    [Nullable[int]] $passwordPreviousPasswordBlockCount
    [Nullable[bool]] $passwordRequired
    [string] $osMinimumVersion
    [string] $osMaximumVersion
    [Nullable[bool]] $storageRequireEncryption



}
$null = $Script:MSGraphAPIClassHash.Add('deviceComplianceSettingState', 'MSGraphAPI_v1_deviceComplianceSettingState')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceComplianceSettingState', 'MSGraphAPI_v1_deviceComplianceSettingState')


class MSGraphAPI_v1_deviceComplianceSettingState : MSGraphAPI_v1_entity {
    [string] $setting
    [string] $settingName
    [string] $deviceId
    [string] $deviceName
    [string] $userId
    [string] $userEmail
    [string] $userName
    [string] $userPrincipalName
    [string] $deviceModel
    [MSGraphAPI_v1_complianceStatus] $state
    [Nullable[DateTimeOffset]] $complianceGracePeriodExpirationDateTime



}
$null = $Script:MSGraphAPIClassHash.Add('deviceConfigurationSettingState', 'MSGraphAPI_v1_deviceConfigurationSettingState')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceConfigurationSettingState', 'MSGraphAPI_v1_deviceConfigurationSettingState')


class MSGraphAPI_v1_deviceConfigurationSettingState : MSGraphAPI_Base {
    [string] $setting
    [string] $settingName
    [string] $instanceDisplayName
    [MSGraphAPI_v1_complianceStatus] $state
    [Nullable[int64]] $errorCode
    [string] $errorDescription
    [string] $userId
    [string] $userName
    [string] $userEmail
    [string] $userPrincipalName
    [MSGraphAPI_v1_settingSource[]] $sources
    [string] $currentValue
}
$null = $Script:MSGraphAPIClassHash.Add('settingSource', 'MSGraphAPI_v1_settingSource')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.settingSource', 'MSGraphAPI_v1_settingSource')


class MSGraphAPI_v1_settingSource : MSGraphAPI_Base {
    [string] $id
    [string] $displayName
}
$null = $Script:MSGraphAPIClassHash.Add('deviceCompliancePolicySettingState', 'MSGraphAPI_v1_deviceCompliancePolicySettingState')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceCompliancePolicySettingState', 'MSGraphAPI_v1_deviceCompliancePolicySettingState')


class MSGraphAPI_v1_deviceCompliancePolicySettingState : MSGraphAPI_Base {
    [string] $setting
    [string] $settingName
    [string] $instanceDisplayName
    [MSGraphAPI_v1_complianceStatus] $state
    [Nullable[int64]] $errorCode
    [string] $errorDescription
    [string] $userId
    [string] $userName
    [string] $userEmail
    [string] $userPrincipalName
    [MSGraphAPI_v1_settingSource[]] $sources
    [string] $currentValue
}
$null = $Script:MSGraphAPIClassHash.Add('enrollmentConfigurationAssignment', 'MSGraphAPI_v1_enrollmentConfigurationAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.enrollmentConfigurationAssignment', 'MSGraphAPI_v1_enrollmentConfigurationAssignment')


class MSGraphAPI_v1_enrollmentConfigurationAssignment : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget] $target



}
$null = $Script:MSGraphAPIClassHash.Add('deviceEnrollmentLimitConfiguration', 'MSGraphAPI_v1_deviceEnrollmentLimitConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceEnrollmentLimitConfiguration', 'MSGraphAPI_v1_deviceEnrollmentLimitConfiguration')


class MSGraphAPI_v1_deviceEnrollmentLimitConfiguration : MSGraphAPI_v1_deviceEnrollmentConfiguration {
    [Nullable[int]] $limit



}
$null = $Script:MSGraphAPIClassHash.Add('deviceEnrollmentPlatformRestrictionsConfiguration', 'MSGraphAPI_v1_deviceEnrollmentPlatformRestrictionsConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceEnrollmentPlatformRestrictionsConfiguration', 'MSGraphAPI_v1_deviceEnrollmentPlatformRestrictionsConfiguration')


class MSGraphAPI_v1_deviceEnrollmentPlatformRestrictionsConfiguration : MSGraphAPI_v1_deviceEnrollmentConfiguration {
    [MSGraphAPI_v1_deviceEnrollmentPlatformRestriction] $iosRestriction
    [MSGraphAPI_v1_deviceEnrollmentPlatformRestriction] $windowsRestriction
    [MSGraphAPI_v1_deviceEnrollmentPlatformRestriction] $windowsMobileRestriction
    [MSGraphAPI_v1_deviceEnrollmentPlatformRestriction] $androidRestriction
    [MSGraphAPI_v1_deviceEnrollmentPlatformRestriction] $macOSRestriction



}
$null = $Script:MSGraphAPIClassHash.Add('deviceEnrollmentPlatformRestriction', 'MSGraphAPI_v1_deviceEnrollmentPlatformRestriction')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceEnrollmentPlatformRestriction', 'MSGraphAPI_v1_deviceEnrollmentPlatformRestriction')


class MSGraphAPI_v1_deviceEnrollmentPlatformRestriction : MSGraphAPI_Base {
    [Nullable[bool]] $platformBlocked
    [Nullable[bool]] $personalDeviceEnrollmentBlocked
    [string] $osMinimumVersion
    [string] $osMaximumVersion
}
$null = $Script:MSGraphAPIClassHash.Add('deviceEnrollmentWindowsHelloForBusinessConfiguration', 'MSGraphAPI_v1_deviceEnrollmentWindowsHelloForBusinessConfiguration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceEnrollmentWindowsHelloForBusinessConfiguration', 'MSGraphAPI_v1_deviceEnrollmentWindowsHelloForBusinessConfiguration')


class MSGraphAPI_v1_deviceEnrollmentWindowsHelloForBusinessConfiguration : MSGraphAPI_v1_deviceEnrollmentConfiguration {
    [Nullable[int]] $pinMinimumLength
    [Nullable[int]] $pinMaximumLength
    [MSGraphAPI_v1_windowsHelloForBusinessPinUsage] $pinUppercaseCharactersUsage
    [MSGraphAPI_v1_windowsHelloForBusinessPinUsage] $pinLowercaseCharactersUsage
    [MSGraphAPI_v1_windowsHelloForBusinessPinUsage] $pinSpecialCharactersUsage
    [MSGraphAPI_v1_enablement] $state
    [Nullable[bool]] $securityDeviceRequired
    [Nullable[bool]] $unlockWithBiometricsEnabled
    [Nullable[bool]] $remotePassportEnabled
    [Nullable[int]] $pinPreviousBlockCount
    [Nullable[int]] $pinExpirationInDays
    [MSGraphAPI_v1_enablement] $enhancedBiometricsState



}
$null = $Script:MSGraphAPIClassHash.Add('managedMobileApp', 'MSGraphAPI_v1_managedMobileApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedMobileApp', 'MSGraphAPI_v1_managedMobileApp')


class MSGraphAPI_v1_managedMobileApp : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_mobileAppIdentifier] $mobileAppIdentifier
    [string] $version



}
$null = $Script:MSGraphAPIClassHash.Add('mobileAppIdentifier', 'MSGraphAPI_v1_mobileAppIdentifier')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.mobileAppIdentifier', 'MSGraphAPI_v1_mobileAppIdentifier')


class MSGraphAPI_v1_mobileAppIdentifier : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('targetedManagedAppPolicyAssignment', 'MSGraphAPI_v1_targetedManagedAppPolicyAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.targetedManagedAppPolicyAssignment', 'MSGraphAPI_v1_targetedManagedAppPolicyAssignment')


class MSGraphAPI_v1_targetedManagedAppPolicyAssignment : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget] $target



}
$null = $Script:MSGraphAPIClassHash.Add('managedAppDiagnosticStatus', 'MSGraphAPI_v1_managedAppDiagnosticStatus')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppDiagnosticStatus', 'MSGraphAPI_v1_managedAppDiagnosticStatus')


class MSGraphAPI_v1_managedAppDiagnosticStatus : MSGraphAPI_Base {
    [string] $validationName
    [string] $state
    [string] $mitigationInstruction
}
$null = $Script:MSGraphAPIClassHash.Add('managedAppOperation', 'MSGraphAPI_v1_managedAppOperation')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppOperation', 'MSGraphAPI_v1_managedAppOperation')


class MSGraphAPI_v1_managedAppOperation : MSGraphAPI_v1_entity {
    [string] $displayName
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $state
    [string] $version



}
$null = $Script:MSGraphAPIClassHash.Add('keyValuePair', 'MSGraphAPI_v1_keyValuePair')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.keyValuePair', 'MSGraphAPI_v1_keyValuePair')


class MSGraphAPI_v1_keyValuePair : MSGraphAPI_Base {
    [string] $name
    [string] $value
}
$null = $Script:MSGraphAPIClassHash.Add('managedAppPolicyDeploymentSummary', 'MSGraphAPI_v1_managedAppPolicyDeploymentSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppPolicyDeploymentSummary', 'MSGraphAPI_v1_managedAppPolicyDeploymentSummary')


class MSGraphAPI_v1_managedAppPolicyDeploymentSummary : MSGraphAPI_v1_entity {
    [string] $displayName
    [Nullable[int]] $configurationDeployedUserCount
    [Nullable[DateTimeOffset]] $lastRefreshTime
    [MSGraphAPI_v1_managedAppPolicyDeploymentSummaryPerApp[]] $configurationDeploymentSummaryPerApp
    [string] $version



}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionResourceCollection', 'MSGraphAPI_v1_windowsInformationProtectionResourceCollection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionResourceCollection', 'MSGraphAPI_v1_windowsInformationProtectionResourceCollection')


class MSGraphAPI_v1_windowsInformationProtectionResourceCollection : MSGraphAPI_Base {
    [string] $displayName
    [string[]] $resources
}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionDataRecoveryCertificate', 'MSGraphAPI_v1_windowsInformationProtectionDataRecoveryCertificate')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionDataRecoveryCertificate', 'MSGraphAPI_v1_windowsInformationProtectionDataRecoveryCertificate')


class MSGraphAPI_v1_windowsInformationProtectionDataRecoveryCertificate : MSGraphAPI_Base {
    [string] $subjectName
    [string] $description
    [Nullable[DateTimeOffset]] $expirationDateTime
    [object] $certificate
}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionApp', 'MSGraphAPI_v1_windowsInformationProtectionApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionApp', 'MSGraphAPI_v1_windowsInformationProtectionApp')


class MSGraphAPI_v1_windowsInformationProtectionApp : MSGraphAPI_Base {
    [string] $displayName
    [string] $description
    [string] $publisherName
    [string] $productName
    [Nullable[bool]] $denied
}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionProxiedDomainCollection', 'MSGraphAPI_v1_windowsInformationProtectionProxiedDomainCollection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionProxiedDomainCollection', 'MSGraphAPI_v1_windowsInformationProtectionProxiedDomainCollection')


class MSGraphAPI_v1_windowsInformationProtectionProxiedDomainCollection : MSGraphAPI_Base {
    [string] $displayName
    [MSGraphAPI_v1_proxiedDomain[]] $proxiedDomains
}
$null = $Script:MSGraphAPIClassHash.Add('proxiedDomain', 'MSGraphAPI_v1_proxiedDomain')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.proxiedDomain', 'MSGraphAPI_v1_proxiedDomain')


class MSGraphAPI_v1_proxiedDomain : MSGraphAPI_Base {
    [string] $ipAddressOrFQDN
    [string] $proxy
}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionIPRangeCollection', 'MSGraphAPI_v1_windowsInformationProtectionIPRangeCollection')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionIPRangeCollection', 'MSGraphAPI_v1_windowsInformationProtectionIPRangeCollection')


class MSGraphAPI_v1_windowsInformationProtectionIPRangeCollection : MSGraphAPI_Base {
    [string] $displayName
    [MSGraphAPI_v1_ipRange[]] $ranges
}
$null = $Script:MSGraphAPIClassHash.Add('ipRange', 'MSGraphAPI_v1_ipRange')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.ipRange', 'MSGraphAPI_v1_ipRange')


class MSGraphAPI_v1_ipRange : MSGraphAPI_Base {

}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionAppLockerFile', 'MSGraphAPI_v1_windowsInformationProtectionAppLockerFile')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionAppLockerFile', 'MSGraphAPI_v1_windowsInformationProtectionAppLockerFile')


class MSGraphAPI_v1_windowsInformationProtectionAppLockerFile : MSGraphAPI_v1_entity {
    [string] $displayName
    [string] $fileHash
    [object] $file
    [string] $version



}
$null = $Script:MSGraphAPIClassHash.Add('androidMobileAppIdentifier', 'MSGraphAPI_v1_androidMobileAppIdentifier')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidMobileAppIdentifier', 'MSGraphAPI_v1_androidMobileAppIdentifier')


class MSGraphAPI_v1_androidMobileAppIdentifier : MSGraphAPI_v1_mobileAppIdentifier {
    [string] $packageId
}
$null = $Script:MSGraphAPIClassHash.Add('iosMobileAppIdentifier', 'MSGraphAPI_v1_iosMobileAppIdentifier')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosMobileAppIdentifier', 'MSGraphAPI_v1_iosMobileAppIdentifier')


class MSGraphAPI_v1_iosMobileAppIdentifier : MSGraphAPI_v1_mobileAppIdentifier {
    [string] $bundleId
}
$null = $Script:MSGraphAPIClassHash.Add('managedAppPolicyDeploymentSummaryPerApp', 'MSGraphAPI_v1_managedAppPolicyDeploymentSummaryPerApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppPolicyDeploymentSummaryPerApp', 'MSGraphAPI_v1_managedAppPolicyDeploymentSummaryPerApp')


class MSGraphAPI_v1_managedAppPolicyDeploymentSummaryPerApp : MSGraphAPI_Base {
    [MSGraphAPI_v1_mobileAppIdentifier] $mobileAppIdentifier
    [Nullable[int]] $configurationAppliedUserCount
}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionStoreApp', 'MSGraphAPI_v1_windowsInformationProtectionStoreApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionStoreApp', 'MSGraphAPI_v1_windowsInformationProtectionStoreApp')


class MSGraphAPI_v1_windowsInformationProtectionStoreApp : MSGraphAPI_v1_windowsInformationProtectionApp {

}
$null = $Script:MSGraphAPIClassHash.Add('windowsInformationProtectionDesktopApp', 'MSGraphAPI_v1_windowsInformationProtectionDesktopApp')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.windowsInformationProtectionDesktopApp', 'MSGraphAPI_v1_windowsInformationProtectionDesktopApp')


class MSGraphAPI_v1_windowsInformationProtectionDesktopApp : MSGraphAPI_v1_windowsInformationProtectionApp {
    [string] $binaryName
    [string] $binaryVersionLow
    [string] $binaryVersionHigh
}
$null = $Script:MSGraphAPIClassHash.Add('iPv6Range', 'MSGraphAPI_v1_iPv6Range')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iPv6Range', 'MSGraphAPI_v1_iPv6Range')


class MSGraphAPI_v1_iPv6Range : MSGraphAPI_v1_ipRange {
    [string] $lowerAddress
    [string] $upperAddress
}
$null = $Script:MSGraphAPIClassHash.Add('iPv4Range', 'MSGraphAPI_v1_iPv4Range')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iPv4Range', 'MSGraphAPI_v1_iPv4Range')


class MSGraphAPI_v1_iPv4Range : MSGraphAPI_v1_ipRange {
    [string] $lowerAddress
    [string] $upperAddress
}
$null = $Script:MSGraphAPIClassHash.Add('iosManagedAppRegistration', 'MSGraphAPI_v1_iosManagedAppRegistration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosManagedAppRegistration', 'MSGraphAPI_v1_iosManagedAppRegistration')


class MSGraphAPI_v1_iosManagedAppRegistration : MSGraphAPI_v1_managedAppRegistration {




}
$null = $Script:MSGraphAPIClassHash.Add('androidManagedAppRegistration', 'MSGraphAPI_v1_androidManagedAppRegistration')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.androidManagedAppRegistration', 'MSGraphAPI_v1_androidManagedAppRegistration')


class MSGraphAPI_v1_androidManagedAppRegistration : MSGraphAPI_v1_managedAppRegistration {




}
$null = $Script:MSGraphAPIClassHash.Add('managedAppStatusRaw', 'MSGraphAPI_v1_managedAppStatusRaw')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedAppStatusRaw', 'MSGraphAPI_v1_managedAppStatusRaw')


class MSGraphAPI_v1_managedAppStatusRaw : MSGraphAPI_v1_managedAppStatus {
    [MSGraphAPI_v1_Json] $content



}
$null = $Script:MSGraphAPIClassHash.Add('localizedNotificationMessage', 'MSGraphAPI_v1_localizedNotificationMessage')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.localizedNotificationMessage', 'MSGraphAPI_v1_localizedNotificationMessage')


class MSGraphAPI_v1_localizedNotificationMessage : MSGraphAPI_v1_entity {
    [Nullable[DateTimeOffset]] $lastModifiedDateTime
    [string] $locale
    [string] $subject
    [string] $messageTemplate
    [Nullable[bool]] $isDefault



}
$null = $Script:MSGraphAPIClassHash.Add('rolePermission', 'MSGraphAPI_v1_rolePermission')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.rolePermission', 'MSGraphAPI_v1_rolePermission')


class MSGraphAPI_v1_rolePermission : MSGraphAPI_Base {
    [MSGraphAPI_v1_resourceAction[]] $resourceActions
}
$null = $Script:MSGraphAPIClassHash.Add('resourceAction', 'MSGraphAPI_v1_resourceAction')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.resourceAction', 'MSGraphAPI_v1_resourceAction')


class MSGraphAPI_v1_resourceAction : MSGraphAPI_Base {
    [string[]] $allowedResourceActions
    [string[]] $notAllowedResourceActions
}
$null = $Script:MSGraphAPIClassHash.Add('deviceAndAppManagementRoleDefinition', 'MSGraphAPI_v1_deviceAndAppManagementRoleDefinition')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceAndAppManagementRoleDefinition', 'MSGraphAPI_v1_deviceAndAppManagementRoleDefinition')


class MSGraphAPI_v1_deviceAndAppManagementRoleDefinition : MSGraphAPI_v1_roleDefinition {




}
$null = $Script:MSGraphAPIClassHash.Add('managedEBookAssignment', 'MSGraphAPI_v1_managedEBookAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.managedEBookAssignment', 'MSGraphAPI_v1_managedEBookAssignment')


class MSGraphAPI_v1_managedEBookAssignment : MSGraphAPI_v1_entity {
    [MSGraphAPI_v1_deviceAndAppManagementAssignmentTarget] $target
    [MSGraphAPI_v1_installIntent] $installIntent



}
$null = $Script:MSGraphAPIClassHash.Add('eBookInstallSummary', 'MSGraphAPI_v1_eBookInstallSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.eBookInstallSummary', 'MSGraphAPI_v1_eBookInstallSummary')


class MSGraphAPI_v1_eBookInstallSummary : MSGraphAPI_v1_entity {
    [Nullable[int]] $installedDeviceCount
    [Nullable[int]] $failedDeviceCount
    [Nullable[int]] $notInstalledDeviceCount
    [Nullable[int]] $installedUserCount
    [Nullable[int]] $failedUserCount
    [Nullable[int]] $notInstalledUserCount



}
$null = $Script:MSGraphAPIClassHash.Add('deviceInstallState', 'MSGraphAPI_v1_deviceInstallState')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.deviceInstallState', 'MSGraphAPI_v1_deviceInstallState')


class MSGraphAPI_v1_deviceInstallState : MSGraphAPI_v1_entity {
    [string] $deviceName
    [string] $deviceId
    [Nullable[DateTimeOffset]] $lastSyncDateTime
    [MSGraphAPI_v1_installState] $installState
    [string] $errorCode
    [string] $osVersion
    [string] $osDescription
    [string] $userName



}
$null = $Script:MSGraphAPIClassHash.Add('userInstallStateSummary', 'MSGraphAPI_v1_userInstallStateSummary')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.userInstallStateSummary', 'MSGraphAPI_v1_userInstallStateSummary')


class MSGraphAPI_v1_userInstallStateSummary : MSGraphAPI_v1_entity {
    [string] $userName
    [Nullable[int]] $installedDeviceCount
    [Nullable[int]] $failedDeviceCount
    [Nullable[int]] $notInstalledDeviceCount
    [object]Get_deviceStates(){
        return (Invoke-MSGraphMethod -query "$($this.GraphPath)/deviceStates")
    }


}
$null = $Script:MSGraphAPIClassHash.Add('iosVppEBookAssignment', 'MSGraphAPI_v1_iosVppEBookAssignment')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosVppEBookAssignment', 'MSGraphAPI_v1_iosVppEBookAssignment')


class MSGraphAPI_v1_iosVppEBookAssignment : MSGraphAPI_v1_managedEBookAssignment {




}
$null = $Script:MSGraphAPIClassHash.Add('iosVppEBook', 'MSGraphAPI_v1_iosVppEBook')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.iosVppEBook', 'MSGraphAPI_v1_iosVppEBook')


class MSGraphAPI_v1_iosVppEBook : MSGraphAPI_v1_managedEBook {
    [Nullable[Guid]] $vppTokenId
    [string] $appleId
    [string] $vppOrganizationName
    [string[]] $genres
    [string] $language
    [string] $seller
    [Nullable[int]] $totalLicenseCount
    [Nullable[int]] $usedLicenseCount



}
$null = $Script:MSGraphAPIClassHash.Add('enrollmentTroubleshootingEvent', 'MSGraphAPI_v1_enrollmentTroubleshootingEvent')
$null = $Script:MSGraphAPIClassHash.Add('microsoft.graph.enrollmentTroubleshootingEvent', 'MSGraphAPI_v1_enrollmentTroubleshootingEvent')


class MSGraphAPI_v1_enrollmentTroubleshootingEvent : MSGraphAPI_v1_deviceManagementTroubleshootingEvent {
    [string] $managedDeviceIdentifier
    [string] $operatingSystem
    [string] $osVersion
    [string] $userId
    [string] $deviceId
    [MSGraphAPI_v1_deviceEnrollmentType] $enrollmentType
    [MSGraphAPI_v1_deviceEnrollmentFailureReason] $failureCategory
    [string] $failureReason



}
