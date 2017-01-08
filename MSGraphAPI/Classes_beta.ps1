
Enum GraphAutomaticRepliesStatus_Beta {
        Disabled = 0
        AlwaysEnabled = 1
        Scheduled = 2
}
Enum GraphExternalAudienceScope_Beta {
        None = 0
        ContactsOnly = 1
        All = 2
}
Enum GraphAttendeeType_Beta {
        Required = 0
        Optional = 1
        Resource = 2
}
Enum GraphFreeBusyStatus_Beta {
        Free = 0
        Tentative = 1
        Busy = 2
        Oof = 3
        WorkingElsewhere = 4
        Unknown = -1
}
Enum GraphPhysicalAddressType_Beta {
        Unknown = 0
        Home = 1
        Business = 2
        Other = 3
}
Enum GraphActivityDomain_Beta {
        Unknown = 0
        Work = 1
        Personal = 2
}
Enum GraphRecipientScopeType_Beta {
        None = 0
        Internal = 1
        External = 2
        ExternalPartner = 4
        ExternalNonPartner = 8
}
Enum GraphMailTipsType_Beta {
        AutomaticReplies = 1
        MailboxFullStatus = 2
        CustomMailTip = 4
        ExternalMemberCount = 8
        TotalMemberCount = 16
        MaxMessageSize = 32
        DeliveryRestriction = 64
        ModerationStatus = 128
        RecipientScope = 256
        RecipientSuggestions = 512
}
Enum GraphBodyType_Beta {
        Text = 0
        Html = 1
}
Enum GraphImportance_Beta {
        Low = 0
        Normal = 1
        High = 2
}
Enum GraphInferenceClassificationType_Beta {
        Focused = 0
        Other = 1
}
Enum GraphFollowupFlagStatus_Beta {
        NotFlagged = 0
        Complete = 1
        Flagged = 2
}
Enum GraphCalendarColor_Beta {
        LightBlue = 0
        LightGreen = 1
        LightOrange = 2
        LightGray = 3
        LightYellow = 4
        LightTeal = 5
        LightPink = 6
        LightBrown = 7
        LightRed = 8
        MaxColor = 9
        Auto = -1
}
Enum GraphResponseType_Beta {
        None = 0
        Organizer = 1
        TentativelyAccepted = 2
        Accepted = 3
        Declined = 4
        NotResponded = 5
}
Enum GraphSensitivity_Beta {
        Normal = 0
        Personal = 1
        Private = 2
        Confidential = 3
}
Enum GraphRecurrencePatternType_Beta {
        Daily = 0
        Weekly = 1
        AbsoluteMonthly = 2
        RelativeMonthly = 3
        AbsoluteYearly = 4
        RelativeYearly = 5
}
Enum GraphDayOfWeek_Beta {
        Sunday = 0
        Monday = 1
        Tuesday = 2
        Wednesday = 3
        Thursday = 4
        Friday = 5
        Saturday = 6
}
Enum GraphWeekIndex_Beta {
        First = 0
        Second = 1
        Third = 2
        Fourth = 3
        Last = 4
}
Enum GraphRecurrenceRangeType_Beta {
        EndDate = 0
        NoEnd = 1
        Numbered = 2
}
Enum GraphEventType_Beta {
        SingleInstance = 0
        Occurrence = 1
        Exception = 2
        SeriesMaster = 3
}
Enum GraphWebsiteType_Beta {
        Other = 0
        Home = 1
        Work = 2
        Blog = 3
        Profile = 4
}
Enum GraphPhoneType_Beta {
        Home = 0
        Business = 1
        Mobile = 2
        Other = 3
        Assistant = 4
        HomeFax = 5
        BusinessFax = 6
        OtherFax = 7
        Pager = 8
        Radio = 9
}
Enum GraphMeetingMessageType_Beta {
        None = 0
        MeetingRequest = 1
        MeetingCancelled = 2
        MeetingAccepted = 3
        MeetingTentativelyAccepted = 4
        MeetingDeclined = 5
}
Enum GraphReferenceAttachmentProvider_Beta {
        Other = 0
        OneDriveBusiness = 1
        OneDriveConsumer = 2
        Dropbox = 3
}
Enum GraphReferenceAttachmentPermission_Beta {
        Other = 0
        View = 1
        Edit = 2
        AnonymousView = 3
        AnonymousEdit = 4
        OrganizationView = 5
        OrganizationEdit = 6
}
Enum GraphGroupAccessType_Beta {
        None = 0
        Private = 1
        Secret = 2
        Public = 3
}
Enum GraphContainerType_Beta {
        None = 0
        OneDrive = 1
        Group = 2
        Site = 3
}
Enum GraphTaskBoardType_Beta {
        Progress = 0
        AssignedTo = 1
        Bucket = 2
}
Enum GraphPreviewType_Beta {
        Automatic = 0
        NoPreview = 1
        Checklist = 2
        Description = 3
        Reference = 4
}
Enum GraphPatchInsertPosition_Beta {
        After = 0
        Before = 1
}
Enum GraphPatchActionType_Beta {
        Replace = 0
        Append = 1
        Delete = 2
        Insert = 3
        Prepend = 4
}
Enum GraphUserRole_Beta {
        Owner = 0
        Contributor = 1
        Reader = 2
        None = -1
}
Enum GraphRiskEventStatus_Beta {
        Active = 0
        Remediated = 1
        DismissedAsFixed = 2
        DismissedAsFalsePositive = 3
        DismissedAsIgnore = 4
        LoginBlocked = 5
        ClosedMfaAuto = 6
        ClosedMultipleReasons = 7
}
Enum GraphRiskLevel_Beta {
        Low = 0
        Medium = 1
        High = 2
}
Enum GraphUserRiskLevel_Beta {
        Unknown = 0
        None = 1
        Low = 2
        Medium = 3
        High = 4
}
Enum GraphRoleSummaryStatus_Beta {
        Ok = 0
        Bad = 1
}
Enum GraphSetupStatus_Beta {
        Unknown = 0
        NotRegisteredYet = 1
        RegisteredSetupNotStarted = 2
        RegisteredSetupInProgress = 3
        RegistrationAndSetupCompleted = 4
        RegistrationFailed = 5
        RegistrationTimedOut = 6
        Disabled = 7
}
Enum GraphConnectorGroupType_Beta {
        ApplicationProxy = 0
}
Enum GraphExternalAuthenticationType_Beta {
        Passthru = 0
        AadPreAuthentication = 1
}
Enum GraphConnectorStatus_Beta {
        Active = 0
        Inactive = 1
}
Enum GraphAppInstallIntent_Beta {
        Available = 0
        NotApplicable = 1
        Required = 2
        Uninstall = 3
        AvailableWithoutEnrollment = 4
}
Enum GraphManagedAppAvailability_Beta {
        Global = 0
        LineOfBusiness = 1
}
Enum GraphMdmAppConfigKeyType_Beta {
        StringType = 0
        IntegerType = 1
        RealType = 2
        BooleanType = 3
        TokenType = 4
}
Enum GraphAppConfigComplianceStatus_Beta {
        Unknown = 0
        NotApplicable = 1
        Compliant = 2
        Remediated = 3
        NonCompliant = 4
        Error = 5
        Conflict = 6
}
Enum GraphITunesPairingMode_Beta {
        Disallow = 0
        Allow = 1
        RequiresCertificate = 2
}
Enum GraphImportedDeviceIdentityType_Beta {
        Unknown = 0
        Imei = 1
        SerialNumber = 2
}
Enum GraphEnrollmentState_Beta {
        Unknown = 0
        Enrolled = 1
        PendingReset = 2
        Failed = 3
        NotContacted = 4
}
Enum GraphPlatform_Beta {
        Unknown = 0
        Ios = 1
        Android = 2
        Windows = 3
        WindowsMobile = 4
        MacOS = 5
}
Enum GraphDiscoverySource_Beta {
        Unknown = 0
        AdminImport = 2
        DeviceEnrollmentProgram = 4
}
Enum GraphComplianceStatus_Beta {
        Unknown = 0
        NotApplicable = 1
        Compliant = 2
        Remediated = 3
        NonCompliant = 4
        Error = 5
        Conflict = 6
}
Enum GraphSubjectNameFormat_Beta {
        CommonName = 0
        CommonNameIncludingEmail = 1
        CommonNameAsEmail = 2
}
Enum GraphSubjectAlternativeNameType_Beta {
        EmailAddress = 1
        UserPrincipalName = 2
}
Enum GraphCertificateValidityPeriodScale_Beta {
        Days = 0
        Months = 1
        Years = 2
}
Enum GraphKeyUsages_Beta {
        KeyEncipherment = 1
        DigitalSignature = 2
}
Enum GraphKeySize_Beta {
        Size1024 = 0
        Size2048 = 1
}
Enum GraphHashAlgorithms_Beta {
        Sha1 = 1
        Sha2 = 2
}
Enum GraphEasAuthenticationMethod_Beta {
        UsernameAndPassword = 0
        Certificate = 1
}
Enum GraphEmailSyncDuration_Beta {
        UserDefined = 0
        OneDay = 1
        ThreeDays = 2
        OneWeek = 3
        TwoWeeks = 4
        OneMonth = 5
        Unlimited = 6
}
Enum GraphUserEmailSource_Beta {
        UserPrincipalName = 0
        PrimarySmtpAddress = 1
}
Enum GraphEmailSyncSchedule_Beta {
        UserDefined = 0
        AsMessagesArrive = 1
        Manual = 2
        FifteenMinutes = 3
        ThirtyMinutes = 4
        SixtyMinutes = 5
        BasedOnMyUsage = 6
}
Enum GraphAndroidUsernameSource_Beta {
        Username = 0
        UserPrincipalName = 1
}
Enum GraphAndroidForWorkRequiredPasswordType_Beta {
        DeviceDefault = 0
        LowSecurityBiometric = 1
        Required = 2
        AtLeastNumeric = 3
        NumericComplex = 4
        AtLeastAlphabetic = 5
        AtLeastAlphanumeric = 6
        AlphanumericWithSymbols = 7
}
Enum GraphAndroidForWorkCrossProfileDataSharingType_Beta {
        DeviceDefault = 0
        PreventAny = 1
        AllowPersonalToWork = 2
        NoRestrictions = 3
}
Enum GraphAndroidForWorkDefaultAppPermissionPolicyType_Beta {
        DeviceDefault = 0
        Prompt = 1
        AutoGrant = 2
        AutoDeny = 3
}
Enum GraphAppsComplianceListType_Beta {
        None = 0
        AppsInListCompliant = 1
        AppsNotInListCompliant = 2
}
Enum GraphAppListType_Beta {
        None = 0
        AppsInListCompliant = 1
        AppsNotInListCompliant = 2
}
Enum GraphAndroidRequiredPasswordType_Beta {
        DeviceDefault = 0
        Alphabetic = 1
        Alphanumeric = 2
        AlphanumericWithSymbols = 3
        LowSecurityBiometric = 4
        Numeric = 5
}
Enum GraphWebBrowserCookieSettings_Beta {
        BrowserDefault = 0
        BlockAlways = 1
        AllowCurrentWebSite = 2
        AllowFromWebsitesVisited = 3
        AllowAlways = 4
}
Enum GraphAndroidVpnConnectionType_Beta {
        CiscoAnyConnect = 0
        PulseSecure = 1
        F5EdgeClient = 2
        DellSonicWallMobileConnect = 3
        CheckPointCapsuleVpn = 4
        Citrix = 5
}
Enum GraphVpnAuthenticationMethod_Beta {
        Certificate = 0
        UsernameAndPassword = 1
}
Enum GraphAndroidWiFiSecurityType_Beta {
        Open = 0
        WpaEnterprise = 1
}
Enum GraphWiFiAuthenticationMethod_Beta {
        Certificate = 0
        UsernameAndPassword = 1
}
Enum GraphAndroidEapType_Beta {
        EapTls = 13
        EapTtls = 21
        Peap = 25
}
Enum GraphNonEapAuthenticationMethodForEapTtlsType_Beta {
        UnencryptedPassword = 0
        ChallengeHandshakeAuthenticationProtocol = 1
        MicrosoftChap = 2
        MicrosoftChapVersionTwo = 3
}
Enum GraphNonEapAuthenticationMethodForPeap_Beta {
        None = 0
        MicrosoftChapVersionTwo = 1
}
Enum GraphAppleSubjectNameFormat_Beta {
        CommonName = 0
        CommonNameAsEmail = 1
        Custom = 2
}
Enum GraphRatingAustraliaMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        ParentalGuidance = 3
        Mature = 4
        AgesAbove15 = 5
        AgesAbove18 = 6
}
Enum GraphRatingAustraliaTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        Preschoolers = 2
        Children = 3
        General = 4
        ParentalGuidance = 5
        Mature = 6
        AgesAbove15 = 7
        AgesAbove15AdultViolence = 8
}
Enum GraphRatingCanadaMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        ParentalGuidance = 3
        AgesAbove14 = 4
        AgesAbove18 = 5
        Restricted = 6
}
Enum GraphRatingCanadaTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        Children = 2
        ChildrenAbove8 = 3
        General = 4
        ParentalGuidance = 5
        AgesAbove14 = 6
        AgesAbove18 = 7
}
Enum GraphRatingFranceMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        AgesAbove10 = 2
        AgesAbove12 = 3
        AgesAbove16 = 4
        AgesAbove18 = 5
}
Enum GraphRatingFranceTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        AgesAbove10 = 2
        AgesAbove12 = 3
        AgesAbove16 = 4
        AgesAbove18 = 5
}
Enum GraphRatingGermanyMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        AgesAbove6 = 3
        AgesAbove12 = 4
        AgesAbove16 = 5
        Adults = 6
}
Enum GraphRatingGermanyTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        AgesAbove6 = 3
        AgesAbove12 = 4
        AgesAbove16 = 5
        Adults = 6
}
Enum GraphRatingIrelandMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        ParentalGuidance = 3
        AgesAbove12 = 4
        AgesAbove15 = 5
        AgesAbove16 = 6
        Adults = 7
}
Enum GraphRatingIrelandTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        Children = 3
        YoungAdults = 4
        ParentalSupervision = 5
        Mature = 6
}
Enum GraphRatingJapanMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        ParentalGuidance = 3
        AgesAbove15 = 4
        AgesAbove18 = 5
}
Enum GraphRatingJapanTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        ExplicitAllowed = 2
}
Enum GraphRatingNewZealandMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        ParentalGuidance = 3
        Mature = 4
        AgesAbove13 = 5
        AgesAbove15 = 6
        AgesAbove16 = 7
        AgesAbove18 = 8
        Restricted = 9
        AgesAbove16Restricted = 10
}
Enum GraphRatingNewZealandTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        ParentalGuidance = 3
        Adults = 4
}
Enum GraphRatingUnitedKingdomMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        UniversalChildren = 3
        ParentalGuidance = 4
        AgesAbove12Video = 5
        AgesAbove12Cinema = 6
        AgesAbove15 = 7
        Adults = 8
}
Enum GraphRatingUnitedKingdomTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        Caution = 2
}
Enum GraphRatingUnitedStatesMoviesType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        General = 2
        ParentalGuidance = 3
        ParentalGuidance13 = 4
        Restricted = 5
        Adults = 6
}
Enum GraphRatingUnitedStatesTelevisionType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        ChildrenAll = 2
        ChildrenAbove7 = 3
        General = 4
        ParentalGuidance = 5
        ChildrenAbove14 = 6
        Adults = 7
}
Enum GraphRatingAppsType_Beta {
        AllAllowed = 0
        AllBlocked = 1
        AgesAbove4 = 2
        AgesAbove9 = 3
        AgesAbove12 = 4
        AgesAbove17 = 5
}
Enum GraphRequiredPasswordType_Beta {
        DeviceDefault = 0
        Alphanumeric = 1
        Numeric = 2
}
Enum GraphRatingRegionType_Beta {
        NoRegion = 0
        Australia = 1
        Canada = 2
        France = 3
        Germany = 4
        Ireland = 5
        Japan = 6
        NewZealand = 7
        UnitedKingdom = 8
        UnitedStates = 9
}
Enum GraphWiFiSecurityType_Beta {
        Open = 0
        WpaPersonal = 1
        WpaEnterprise = 2
        Wep = 3
}
Enum GraphWiFiProxySetting_Beta {
        None = 0
        Manual = 1
        Automatic = 2
}
Enum GraphEapType_Beta {
        EapTls = 13
        Leap = 17
        EapSim = 18
        EapTtls = 21
        Peap = 25
        EapFast = 43
}
Enum GraphEapFastConfiguration_Beta {
        NoProtectedAccessCredential = 0
        UseProtectedAccessCredential = 1
        UseProtectedAccessCredentialAndProvision = 2
        UseProtectedAccessCredentialAndProvisionAnonymously = 3
}
Enum GraphAppleVpnConnectionType_Beta {
        CiscoAnyConnect = 0
        PulseSecure = 1
        F5EdgeClient = 2
        DellSonicWallMobileConnect = 3
        CheckPointCapsuleVpn = 4
        CustomVpn = 5
        CiscoIPSec = 6
        Citrix = 7
}
Enum GraphVpnOnDemandRuleConnectionAction_Beta {
        Connect = 0
        EvaluateConnection = 1
        Ignore = 2
        Disconnect = 3
}
Enum GraphVpnOnDemandRuleConnectionDomainAction_Beta {
        ConnectIfNeeded = 0
        NeverConnect = 1
}
Enum GraphCertificateDestinationStore_Beta {
        ComputerCertStoreRoot = 0
        ComputerCertStoreIntermediate = 1
        UserCertStoreIntermediate = 2
}
Enum GraphWindowsDeliveryOptimizationMode_Beta {
        UserDefined = 0
        HttpOnly = 1
        HttpWithPeeringNat = 2
        HttpWithPeeringPrivateGroup = 3
        HttpWithInternetPeering = 4
        SimpleDownload = 99
        BypassMode = 100
}
Enum GraphPrereleaseFeatures_Beta {
        UserDefined = 0
        SettingsOnly = 1
        SettingsAndExperimentations = 2
        NotAllowed = 3
}
Enum GraphAutomaticUpdateMode_Beta {
        UserDefined = 0
        NotifyDownload = 1
        AutoInstallAtMaintenanceTime = 2
        AutoInstallAndRebootAtMaintenanceTime = 3
        AutoInstallAndRebootAtScheduledTime = 4
        AutoInstallAndRebootWithoutEndUserControl = 5
}
Enum GraphWeeklySchedule_Beta {
        UserDefined = 0
        Everyday = 1
        Sunday = 2
        Monday = 3
        Tuesday = 4
        Wednesday = 5
        Thursday = 6
        Friday = 7
        Saturday = 8
}
Enum GraphWindowsUpdateType_Beta {
        UserDefined = 0
        All = 1
        BusinessReadyOnly = 2
}
Enum GraphWindows10VpnConnectionType_Beta {
        PulseSecure = 0
        F5EdgeClient = 1
        DellSonicWallMobileConnect = 2
        CheckPointCapsuleVpn = 3
        Automatic = 4
        IkEv2 = 5
        L2tp = 6
        Pptp = 7
}
Enum GraphWindows10VpnAuthenticationMethod_Beta {
        Certificate = 0
        UsernameAndPassword = 1
        CustomEapXml = 2
}
Enum GraphKeyStorageProviderOption_Beta {
        UseTpmKspOtherwiseUseSoftwareKsp = 0
        UseTpmKspOtherwiseFail = 1
        UsePassportForWorkKspOtherwiseFail = 2
        UseSoftwareKsp = 3
}
Enum GraphWindows10AppType_Beta {
        Desktop = 0
        Universal = 1
}
Enum GraphVpnTrafficRuleAppType_Beta {
        None = 0
        Desktop = 1
        Universal = 2
}
Enum GraphVpnTrafficRuleRoutingPolicyType_Beta {
        None = 0
        SplitTunnel = 1
        ForceTunnel = 2
}
Enum GraphWindowsVpnConnectionType_Beta {
        PulseSecure = 0
        F5EdgeClient = 1
        DellSonicWallMobileConnect = 2
        CheckPointCapsuleVpn = 3
}
Enum GraphInternetSiteSecurityLevel_Beta {
        UserDefined = 0
        Medium = 1
        MediumHigh = 2
        High = 3
}
Enum GraphSiteSecurityLevel_Beta {
        UserDefined = 0
        Low = 1
        MediumLow = 2
        Medium = 3
        MediumHigh = 4
        High = 5
}
Enum GraphUpdateClassification_Beta {
        UserDefined = 0
        RecommendedAndImportant = 1
        Important = 2
        None = 3
}
Enum GraphWindowsUserAccountControlSettings_Beta {
        UserDefined = 0
        AlwaysNotify = 1
        NotifyOnAppChanges = 2
        NotifyOnAppChangesWithoutDimming = 3
        NeverNotify = 4
}
Enum GraphDefenderMonitorFileActivity_Beta {
        UserDefined = 0
        Disable = 1
        MonitorAllFiles = 2
        MonitorIncomingFilesOnly = 3
        MonitorOutgoingFilesOnly = 4
}
Enum GraphDefenderPromptForSampleSubmission_Beta {
        UserDefined = 0
        AlwaysPrompt = 1
        PromptBeforeSendingPersonalData = 2
        NeverSendData = 3
        SendAllDataWithoutPrompting = 4
}
Enum GraphDefenderScanType_Beta {
        UserDefined = 0
        Disabled = 1
        Quick = 2
        Full = 3
}
Enum GraphDiagnosticDataSubmissionMode_Beta {
        UserDefined = 0
        None = 1
        Basic = 2
        Enhanced = 3
        Full = 4
}
Enum GraphEdgeCookiePolicy_Beta {
        UserDefined = 0
        Allow = 1
        BlockThirdParty = 2
        BlockAll = 3
}
Enum GraphStateManagementSetting_Beta {
        NotConfigured = 0
        Blocked = 1
        Allowed = 2
}
Enum GraphMiracastChannel_Beta {
        UserDefined = 0
        One = 1
        Two = 2
        Three = 3
        Four = 4
        Five = 5
        Six = 6
        Seven = 7
        Eight = 8
        Nine = 9
        Ten = 10
        Eleven = 11
        ThirtySix = 36
        Forty = 40
        FortyFour = 44
        FortyEight = 48
        OneHundredFortyNine = 149
        OneHundredFiftyThree = 153
        OneHundredFiftySeven = 157
        OneHundredSixtyOne = 161
        OneHundredSixtyFive = 165
}
Enum GraphWelcomeScreenMeetingInformation_Beta {
        UserDefined = 0
        ShowOrganizerAndTimeOnly = 1
        ShowOrganizerAndTimeAndSubject = 2
}
Enum GraphEditionUpgradeLicenseType_Beta {
        ProductKey = 0
        LicenseFile = 1
}
Enum GraphWindows10EditionType_Beta {
        Windows10Enterprise = 0
        Windows10EnterpriseN = 1
        Windows10Education = 2
        Windows10EducationN = 3
        Windows10MobileEnterprise = 4
        Windows10HolographicEnterprise = 5
}
Enum GraphDeviceComplianceActionType_Beta {
        NoAction = 0
        Notification = 1
        Block = 2
        Retire = 3
        Wipe = 4
        RemoveResourceAccessProfiles = 5
}
Enum GraphDeviceThreatProtectionLevel_Beta {
        None = 0
        Low = 1
        Medium = 2
        High = 3
}
Enum GraphCloudPkiProvider_Beta {
        UnKnown = 0
        Symantec = 1
}
Enum GraphSyncStatus_Beta {
        UnKnown = 0
        Succeeded = 1
        Failed = 2
}
Enum GraphDeviceManagementExchangeConnectorSyncType_Beta {
        FullSync = 0
        DeltaSync = 1
}
Enum GraphMdmAuthority_Beta {
        Unknown = 0
        Intune = 1
        Sccm = 2
        Office365 = 3
}
Enum GraphVolumePurchaseProgramTokenAccountType_Beta {
        Business = 0
        Education = 1
}
Enum GraphVolumePurchaseProgramTokenState_Beta {
        Unknown = 0
        Valid = 1
        Expired = 2
        Invalid = 3
}
Enum GraphVolumePurchaseProgramTokenSyncStatus_Beta {
        None = 0
        InProgress = 1
        Completed = 2
        Failed = 3
}
Enum GraphWindowsHelloForBusinessPinUsage_Beta {
        Allowed = 0
        Required = 1
        Disallowed = 2
}
Enum GraphWindowsHelloForBusinessConfiguration_Beta {
        Disabled = 0
        Enabled = 1
        NotConfigured = 2
}
Enum GraphOwnerType_Beta {
        Unknown = 0
        Company = 1
        Personal = 2
}
Enum GraphDeviceActionState_Beta {
        None = 0
        Pending = 1
        Cancel = 2
        Active = 3
        Done = 4
        Failed = 5
        NotSupported = 6
}
Enum GraphManagementState_Beta {
        Managed = 0
        RetirePending = 1
        RetireFailed = 2
        WipePending = 3
        WipeFailed = 4
        Unhealthy = 5
        DeletePending = 6
        RetireIssued = 7
        WipeIssued = 8
        WipeCanceled = 9
        RetireCanceled = 10
        Discovered = 11
}
Enum GraphChassisType_Beta {
        Unknown = 0
        Desktop = 1
        Laptop = 2
        WorksWorkstation = 3
        EnterpriseServer = 4
        Phone = 100
        Tablet = 101
        MobileOther = 102
        MobileUnknown = 103
}
Enum GraphDeviceType_Beta {
        Desktop = 0
        WindowsRT = 1
        WinMO6 = 2
        Nokia = 3
        WindowsPhone = 4
        Mac = 5
        WinCE = 6
        WinEmbedded = 7
        IPhone = 8
        IPad = 9
        IPod = 10
        Android = 11
        ISocConsumer = 12
        Unix = 13
        MacMDM = 14
        HoloLens = 15
        SurfaceHub = 16
        AndroidForWork = 17
        WindowsBlue = 50
        WindowsPhoneBlue = 51
        Blackberry = 100
        Palm = 101
        FakeDevice = 254
        Unknown = 255
}
Enum GraphComplianceState_Beta {
        Unknown = 0
        Compliant = 1
        Noncompliant = 2
        Conflict = 3
        Error = 4
}
Enum GraphEnrollmentType_Beta {
        Unknown = 0
        UserEnrollment = 1
        DeviceEnrollment = 2
        DeviceEnrollmentWithUDA = 3
        AzureDomainJoined = 4
        UserEnrollmentWithServiceAccount = 5
        DepDeviceEnrollment = 6
        DepDeviceEnrollmentWithUDA = 7
        AutoEnrollment = 8
}
Enum GraphLostModeState_Beta {
        Disabled = 0
        Enabled = 1
}
Enum GraphRemoteAction_Beta {
        Unknown = 0
        FactoryReset = 1
        RemoveCompanyData = 2
        ResetPasscode = 3
        RemoteLock = 4
        EnableLostMode = 5
        DisableLostMode = 6
        LocateDevice = 7
        RebootNow = 8
}
Enum GraphDeviceManagementExchangeConnectorStatus_Beta {
        ConnectionPending = 0
        Connected = 1
        Disconnected = 2
        None = 3
}
Enum GraphDeviceManagementExchangeConnectorType_Beta {
        OnPremises = 0
        Hosted = 1
        ServiceToService = 2
        Dedicated = 3
}
Enum GraphDeviceManagementExchangeAccessLevel_Beta {
        None = 0
        Allow = 1
        Block = 2
        Quarantine = 3
}
Enum GraphExchangeAccessRuleType_Beta {
        Family = 0
        Model = 1
}
Enum GraphManagedAppDataTransferLevel_Beta {
        AllApps = 0
        ManagedApps = 1
        None = 2
}
Enum GraphManagedAppClipboardSharingLevel_Beta {
        AllApps = 0
        ManagedAppsWithPasteIn = 1
        ManagedApps = 2
        Blocked = 3
}
Enum GraphManagedAppPinCharacterSet_Beta {
        Any = 0
        Numeric = 1
        Alphanumeric = 2
        AlphanumericAndSymbol = 3
}
Enum GraphManagedAppDataStorageLocation_Beta {
        OneDriveForBusiness = 1
        SharePoint = 2
        Box = 3
        Dropbox = 4
        GoogleDrive = 5
        LocalStorage = 6
}
Enum GraphManagedAppDataEncryptionType_Beta {
        UseDeviceSettings = 0
        AfterDeviceRestart = 1
        WhenDeviceLockedExceptOpenFiles = 2
        WhenDeviceLocked = 3
}
Enum GraphManagedAppFlaggedReason_Beta {
        None = 0
        RootedDevice = 1
}
Class GraphAddIn_beta { 
    [System.Nullable[guid]]$Id
    [string]$Type
    [GraphKeyValue_beta[]]$Properties
}
Class GraphKeyValue_beta { 
    [string]$Key
    [string]$Value
}
Class GraphAppRole_beta { 
    [string[]]$AllowedMemberTypes
    [string]$Description
    [string]$DisplayName
    [System.Nullable[guid]]$Id
    [System.Nullable[bool]]$IsEnabled
    [string]$Origin
    [string]$Value
}
Class GraphKeyCredential_beta { 
    [object]$customKeyIdentifier		#Edm.Binary
    [System.Nullable[datetime]]$EndDate
    [System.Nullable[guid]]$KeyId
    [System.Nullable[datetime]]$StartDate
    [string]$Type
    [string]$Usage
    [object]$value		#Edm.Binary
}
Class GraphOAuth2Permission_beta { 
    [string]$AdminConsentDescription
    [string]$AdminConsentDisplayName
    [System.Nullable[guid]]$Id
    [System.Nullable[bool]]$IsEnabled
    [string]$Origin
    [string]$Type
    [string]$UserConsentDescription
    [string]$UserConsentDisplayName
    [string]$Value
}
Class GraphPasswordCredential_beta { 
    [object]$customKeyIdentifier		#Edm.Binary
    [System.Nullable[datetime]]$EndDate
    [System.Nullable[guid]]$KeyId
    [System.Nullable[datetime]]$StartDate
    [string]$Value
}
Class GraphRequiredResourceAccess_beta { 
    [string]$ResourceAppId
    [GraphResourceAccess_beta[]]$ResourceAccess
}
Class GraphResourceAccess_beta { 
    [System.Nullable[guid]]$Id
    [string]$Type
}
Class GraphOnPremisesPublishing_beta { 
    [string]$ExternalUrl
    [string]$InternalUrl
    [GraphexternalAuthenticationType_beta]$ExternalAuthenticationType
    [System.Nullable[bool]]$IsTranslateHostHeaderEnabled
    [System.Nullable[bool]]$IsOnPremPublishingEnabled
    [GraphkeyCredential_beta]$VerifiedCustomDomainKeyCredential
    [GraphpasswordCredential_beta]$VerifiedCustomDomainPasswordCredential
    [GraphverifiedCustomDomainCertificatesMetadata_beta]$VerifiedCustomDomainCertificatesMetadata
    OnPremisesPublishing_beta() {
        $this.ExternalAuthenticationType = New-Object GraphexternalAuthenticationType_beta
        $this.VerifiedCustomDomainKeyCredential = New-Object GraphkeyCredential_beta
        $this.VerifiedCustomDomainPasswordCredential = New-Object GraphpasswordCredential_beta
        $this.VerifiedCustomDomainCertificatesMetadata = New-Object GraphverifiedCustomDomainCertificatesMetadata_beta
    }
}
Class GraphVerifiedCustomDomainCertificatesMetadata_beta { 
    [string]$Thumbprint
    [string]$SubjectName
    [string]$IssuerName
    [System.Nullable[datetime]]$IssueDate
    [System.Nullable[datetime]]$ExpiryDate
}
Class GraphAlternativeSecurityId_beta { 
    [System.Nullable[int]]$Type
    [string]$IdentityProvider
    [object]$key		#Edm.Binary
}
Class GraphSettingValue_beta { 
    [string]$Name
    [string]$Value
}
Class GraphSettingTemplateValue_beta { 
    [string]$Name
    [string]$Type
    [string]$DefaultValue
    [string]$Description
}
Class GraphLicenseUnitsDetail_beta { 
    [System.Nullable[int]]$Enabled
    [System.Nullable[int]]$Suspended
    [System.Nullable[int]]$Warning
}
Class GraphServicePlanInfo_beta { 
    [System.Nullable[guid]]$ServicePlanId
    [string]$ServicePlanName
    [string]$ProvisioningStatus
    [string]$AppliesTo
}
Class GraphAssignedPlan_beta { 
    [System.Nullable[datetime]]$AssignedDateTime
    [string]$CapabilityStatus
    [string]$Service
    [System.Nullable[guid]]$ServicePlanId
}
Class GraphProvisionedPlan_beta { 
    [string]$CapabilityStatus
    [string]$ProvisioningStatus
    [string]$Service
}
Class GraphVerifiedDomain_beta { 
    [string]$Capabilities
    [System.Nullable[bool]]$IsDefault
    [System.Nullable[bool]]$IsInitial
    [string]$Name
    [string]$Type
}
Class GraphApplePushNotificationCertificateSetting_beta { 
    [string]$AppleIdentifier
    [string]$TopicIdentifier
    [System.Nullable[datetime]]$LastModifiedDateTime
    [System.Nullable[datetime]]$ExpirationDateTime
    [string]$CertificateUploadStatus
    [string]$CertificateUploadFailureReason
}
Class GraphDefaultDeviceEnrollmentRestrictions_beta { 
    [GraphdeviceEnrollmentPlatformRestrictions_beta]$IosRestrictions
    [GraphdeviceEnrollmentPlatformRestrictions_beta]$WindowsRestrictions
    [GraphdeviceEnrollmentPlatformRestrictions_beta]$WindowsMobileRestrictions
    [GraphdeviceEnrollmentPlatformRestrictions_beta]$AndroidRestrictions
    [GraphdeviceEnrollmentPlatformRestrictions_beta]$MacRestrictions
    DefaultDeviceEnrollmentRestrictions_beta() {
        $this.IosRestrictions = New-Object GraphdeviceEnrollmentPlatformRestrictions_beta
        $this.WindowsRestrictions = New-Object GraphdeviceEnrollmentPlatformRestrictions_beta
        $this.WindowsMobileRestrictions = New-Object GraphdeviceEnrollmentPlatformRestrictions_beta
        $this.AndroidRestrictions = New-Object GraphdeviceEnrollmentPlatformRestrictions_beta
        $this.MacRestrictions = New-Object GraphdeviceEnrollmentPlatformRestrictions_beta
    }
}
Class GraphDeviceEnrollmentPlatformRestrictions_beta { 
    [System.Nullable[bool]]$PlatformBlocked
    [System.Nullable[bool]]$PersonalDeviceEnrollmentBlocked
}
Class GraphDefaultDeviceEnrollmentWindowsHelloForBusinessSettings_beta { 
    [System.Nullable[int]]$PinMinimumLength
    [System.Nullable[int]]$PinMaximumLength
    [GraphwindowsHelloForBusinessPinUsage_beta]$PinUppercaseLettersUsage
    [GraphwindowsHelloForBusinessPinUsage_beta]$PinLowercaseLettersUsage
    [GraphwindowsHelloForBusinessPinUsage_beta]$PinSpecialCharactersUsage
    [GraphwindowsHelloForBusinessConfiguration_beta]$WindowsHelloForBusiness
    [System.Nullable[bool]]$SecurityDeviceRequired
    [System.Nullable[bool]]$UnlockWithBiometricsEnabled
    [System.Nullable[bool]]$MobilePinSignInEnabled
    [System.Nullable[int]]$PinPreviousBlockCount
    [System.Nullable[int]]$PinExpirationInDays
    [GraphwindowsHelloForBusinessConfiguration_beta]$EnhancedBiometrics
    DefaultDeviceEnrollmentWindowsHelloForBusinessSettings_beta() {
        $this.PinUppercaseLettersUsage = New-Object GraphwindowsHelloForBusinessPinUsage_beta
        $this.PinLowercaseLettersUsage = New-Object GraphwindowsHelloForBusinessPinUsage_beta
        $this.PinSpecialCharactersUsage = New-Object GraphwindowsHelloForBusinessPinUsage_beta
        $this.WindowsHelloForBusiness = New-Object GraphwindowsHelloForBusinessConfiguration_beta
        $this.EnhancedBiometrics = New-Object GraphwindowsHelloForBusinessConfiguration_beta
    }
}
Class GraphIntuneBrand_beta { 
    [string]$DisplayName
    [string]$ContactITName
    [string]$ContactITPhoneNumber
    [string]$ContactITEmailAddress
    [string]$ContactITNotes
    [string]$PrivacyUrl
    [string]$OnlineSupportSiteUrl
    [string]$OnlineSupportSiteName
    [GraphrgbColor_beta]$ThemeColor
    [System.Nullable[bool]]$ShowLogo
    [GraphmimeContent_beta]$LightBackgroundLogo
    [GraphmimeContent_beta]$DarkBackgroundLogo
    [System.Nullable[bool]]$ShowNameNextToLogo
    IntuneBrand_beta() {
        $this.ThemeColor = New-Object GraphrgbColor_beta
        $this.LightBackgroundLogo = New-Object GraphmimeContent_beta
        $this.DarkBackgroundLogo = New-Object GraphmimeContent_beta
    }
}
Class GraphRgbColor_beta { 
    [object]$r		#Edm.Byte
    [object]$g		#Edm.Byte
    [object]$b		#Edm.Byte
}
Class GraphMimeContent_beta { 
    [string]$Type
    [object]$value		#Edm.Binary
}
Class GraphCertificateConnectorSetting_beta { 
    [System.Nullable[int]]$Status
    [System.Nullable[datetime]]$CertExpiryTime
    [string]$EnrollmentError
    [System.Nullable[datetime]]$LastConnectorConnectionTime
    [string]$ConnectorVersion
    [System.Nullable[int64]]$LastUploadVersion
}
Class GraphAssignedLicense_beta { 
    [System.Nullable[guid][]]$DisabledPlans
    [System.Nullable[guid]]$SkuId
}
Class GraphPasswordProfile_beta { 
    [string]$Password
    [System.Nullable[bool]]$ForceChangePasswordNextSignIn
}
Class GraphMailboxSettings_beta { 
    [GraphautomaticRepliesSetting_beta]$AutomaticRepliesSetting
    [string]$TimeZone
    [GraphlocaleInfo_beta]$Language
    MailboxSettings_beta() {
        $this.AutomaticRepliesSetting = New-Object GraphautomaticRepliesSetting_beta
        $this.Language = New-Object GraphlocaleInfo_beta
    }
}
Class GraphAutomaticRepliesSetting_beta { 
    [GraphautomaticRepliesStatus_beta]$Status
    [GraphexternalAudienceScope_beta]$ExternalAudience
    [GraphdateTimeTimeZone_beta]$ScheduledStartDateTime
    [GraphdateTimeTimeZone_beta]$ScheduledEndDateTime
    [string]$InternalReplyMessage
    [string]$ExternalReplyMessage
    AutomaticRepliesSetting_beta() {
        $this.Status = New-Object GraphautomaticRepliesStatus_beta
        $this.ExternalAudience = New-Object GraphexternalAudienceScope_beta
        $this.ScheduledStartDateTime = New-Object GraphdateTimeTimeZone_beta
        $this.ScheduledEndDateTime = New-Object GraphdateTimeTimeZone_beta
    }
}
Class GraphDateTimeTimeZone_beta { 
    [string]$DateTime
    [string]$TimeZone
}
Class GraphLocaleInfo_beta { 
    [string]$Locale
    [string]$DisplayName
}
Class GraphIdentityInfo_beta { 
    [string]$Id
    [string]$DisplayName
    [string]$UserPrincipalName
}
Class GraphRoot_beta { 
}
Class GraphSiteCollection_beta { 
    [string]$Hostname
}
Class GraphFieldDefinition_beta { 
    [string]$DefaultValue
    [string]$Description
    [Graphformulas_beta]$Formulas
    [System.Nullable[bool]]$Hidden
    [System.Nullable[guid]]$Id
    [System.Nullable[bool]]$Indexed
    [string]$Name
    [System.Nullable[bool]]$Required
    [string]$Title
    [string]$Type
    FieldDefinition_beta() {
        $this.Formulas = New-Object Graphformulas_beta
    }
}
Class GraphFormulas_beta { 
    [string]$Default
    [string]$Validation
}
Class GraphListInfo_beta { 
    [System.Nullable[bool]]$Hidden
    [string]$Template
}
Class GraphIdentitySet_beta { 
    [Graphidentity_beta]$Application
    [Graphidentity_beta]$Device
    [Graphidentity_beta]$User
    IdentitySet_beta() {
        $this.Application = New-Object Graphidentity_beta
        $this.Device = New-Object Graphidentity_beta
        $this.User = New-Object Graphidentity_beta
    }
}
Class GraphIdentity_beta { 
    [string]$DisplayName
    [string]$Id
}
Class GraphQuota_beta { 
    [System.Nullable[int64]]$Deleted
    [System.Nullable[int64]]$Remaining
    [string]$State
    [System.Nullable[int64]]$Total
    [System.Nullable[int64]]$Used
}
Class GraphAudio_beta { 
    [string]$Album
    [string]$AlbumArtist
    [string]$Artist
    [System.Nullable[int64]]$Bitrate
    [string]$Composers
    [string]$Copyright
    [System.Nullable[int16]]$Disc
    [System.Nullable[int16]]$DiscCount
    [System.Nullable[int64]]$Duration
    [string]$Genre
    [System.Nullable[bool]]$HasDrm
    [System.Nullable[bool]]$IsVariableBitrate
    [string]$Title
    [System.Nullable[int]]$Track
    [System.Nullable[int]]$TrackCount
    [System.Nullable[int]]$Year
}
Class GraphDeleted_beta { 
    [string]$State
}
Class GraphFile_beta { 
    [Graphhashes_beta]$Hashes
    [string]$MimeType
    [System.Nullable[bool]]$ProcessingMetadata
    File_beta() {
        $this.Hashes = New-Object Graphhashes_beta
    }
}
Class GraphHashes_beta { 
    [string]$Crc32Hash
    [string]$Sha1Hash
    [string]$QuickXorHash
}
Class GraphFileSystemInfo_beta { 
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$LastModifiedDateTime
}
Class GraphFolder_beta { 
    [System.Nullable[int]]$ChildCount
}
Class GraphImage_beta { 
    [System.Nullable[int]]$Height
    [System.Nullable[int]]$Width
}
Class GraphGeoCoordinates_beta { 
    [System.Nullable[double]]$Altitude
    [System.Nullable[double]]$Latitude
    [System.Nullable[double]]$Longitude
}
Class GraphPackage_beta { 
    [string]$Type
}
Class GraphItemReference_beta { 
    [string]$DriveId
    [string]$Id
    [string]$Name
    [string]$Path
    [string]$ShareId
}
Class GraphPhoto_beta { 
    [string]$CameraMake
    [string]$CameraModel
    [System.Nullable[double]]$ExposureDenominator
    [System.Nullable[double]]$ExposureNumerator
    [System.Nullable[double]]$FocalLength
    [System.Nullable[double]]$FNumber
    [System.Nullable[datetime]]$TakenDateTime
    [System.Nullable[int]]$Iso
}
Class GraphRemoteItem_beta { 
    [GraphidentitySet_beta]$CreatedBy
    [System.Nullable[datetime]]$CreatedDateTime
    [Graphfile_beta]$File
    [GraphfileSystemInfo_beta]$FileSystemInfo
    [Graphfolder_beta]$Folder
    [string]$Id
    [GraphidentitySet_beta]$LastModifiedBy
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$Name
    [Graphpackage_beta]$Package
    [GraphitemReference_beta]$ParentReference
    [GraphsharepointIds_beta]$SharepointIds
    [System.Nullable[int64]]$Size
    [GraphspecialFolder_beta]$SpecialFolder
    [string]$WebDavUrl
    [string]$WebUrl
    RemoteItem_beta() {
        $this.CreatedBy = New-Object GraphidentitySet_beta
        $this.File = New-Object Graphfile_beta
        $this.FileSystemInfo = New-Object GraphfileSystemInfo_beta
        $this.Folder = New-Object Graphfolder_beta
        $this.LastModifiedBy = New-Object GraphidentitySet_beta
        $this.Package = New-Object Graphpackage_beta
        $this.ParentReference = New-Object GraphitemReference_beta
        $this.SharepointIds = New-Object GraphsharepointIds_beta
        $this.SpecialFolder = New-Object GraphspecialFolder_beta
    }
}
Class GraphSharepointIds_beta { 
    [string]$ListId
    [string]$ListItemId
    [string]$ListItemUniqueId
    [string]$SiteId
    [string]$WebId
}
Class GraphSpecialFolder_beta { 
    [string]$Name
}
Class GraphSearchResult_beta { 
    [string]$OnClickTelemetryUrl
}
Class GraphShared_beta { 
    [GraphidentitySet_beta]$Owner
    [string]$Scope
    Shared_beta() {
        $this.Owner = New-Object GraphidentitySet_beta
    }
}
Class GraphVideo_beta { 
    [System.Nullable[int]]$Bitrate
    [System.Nullable[int64]]$Duration
    [System.Nullable[int]]$Height
    [System.Nullable[int]]$Width
}
Class GraphWorkbookSessionInfo_beta { 
    [string]$Id
    [System.Nullable[bool]]$PersistChanges
}
Class GraphJson_beta { 
}
Class GraphWorkbookFilterCriteria_beta { 
    [string]$Color
    [string]$Criterion1
    [string]$Criterion2
    [string]$DynamicCriteria
    [string]$FilterOn
    [GraphworkbookIcon_beta]$Icon
    [string]$Operator
    [GraphJson_beta]$Values
    WorkbookFilterCriteria_beta() {
        $this.Icon = New-Object GraphworkbookIcon_beta
        $this.Values = New-Object GraphJson_beta
    }
}
Class GraphWorkbookIcon_beta { 
    [System.Nullable[int]]$Index
    [string]$Set
}
Class GraphWorkbookSortField_beta { 
    [System.Nullable[bool]]$Ascending
    [string]$Color
    [string]$DataOption
    [GraphworkbookIcon_beta]$Icon
    [System.Nullable[int]]$Key
    [string]$SortOn
    WorkbookSortField_beta() {
        $this.Icon = New-Object GraphworkbookIcon_beta
    }
}
Class GraphWorkbookWorksheetProtectionOptions_beta { 
    [System.Nullable[bool]]$AllowAutoFilter
    [System.Nullable[bool]]$AllowDeleteColumns
    [System.Nullable[bool]]$AllowDeleteRows
    [System.Nullable[bool]]$AllowFormatCells
    [System.Nullable[bool]]$AllowFormatColumns
    [System.Nullable[bool]]$AllowFormatRows
    [System.Nullable[bool]]$AllowInsertColumns
    [System.Nullable[bool]]$AllowInsertHyperlinks
    [System.Nullable[bool]]$AllowInsertRows
    [System.Nullable[bool]]$AllowPivotTables
    [System.Nullable[bool]]$AllowSort
}
Class GraphWorkbookFilterDatetime_beta { 
    [string]$Date
    [string]$Specificity
}
Class GraphWorkbookRangeReference_beta { 
    [string]$Address
}
Class GraphRecipient_beta { 
    [GraphemailAddress_beta]$EmailAddress
    Recipient_beta() {
        $this.EmailAddress = New-Object GraphemailAddress_beta
    }
}
Class GraphEmailAddress_beta { 
    [string]$Name
    [string]$Address
}
Class GraphAttendeeBase_beta { 
    [GraphattendeeType_beta]$Type
    AttendeeBase_beta() {
        $this.Type = New-Object GraphattendeeType_beta
    }
}
Class GraphMeetingTimeSuggestionsResult_beta { 
    [GraphMeetingTimeSuggestion_beta[]]$MeetingTimeSuggestions
    [string]$EmptySuggestionsReason
}
Class GraphMeetingTimeSuggestion_beta { 
    [GraphtimeSlot_beta]$MeetingTimeSlot
    [System.Nullable[double]]$Confidence
    [GraphfreeBusyStatus_beta]$OrganizerAvailability
    [GraphAttendeeAvailability_beta[]]$AttendeeAvailability
    [GraphLocation_beta[]]$Locations
    [string]$SuggestionReason
    MeetingTimeSuggestion_beta() {
        $this.MeetingTimeSlot = New-Object GraphtimeSlot_beta
        $this.OrganizerAvailability = New-Object GraphfreeBusyStatus_beta
    }
}
Class GraphTimeSlot_beta { 
    [GraphdateTimeTimeZone_beta]$Start
    [GraphdateTimeTimeZone_beta]$End
    TimeSlot_beta() {
        $this.Start = New-Object GraphdateTimeTimeZone_beta
        $this.End = New-Object GraphdateTimeTimeZone_beta
    }
}
Class GraphAttendeeAvailability_beta { 
    [GraphattendeeBase_beta]$Attendee
    [GraphfreeBusyStatus_beta]$Availability
    AttendeeAvailability_beta() {
        $this.Attendee = New-Object GraphattendeeBase_beta
        $this.Availability = New-Object GraphfreeBusyStatus_beta
    }
}
Class GraphLocation_beta { 
    [string]$DisplayName
    [string]$LocationEmailAddress
    [GraphphysicalAddress_beta]$Address
    [GraphoutlookGeoCoordinates_beta]$Coordinates
    [string]$LocationUri
    Location_beta() {
        $this.Address = New-Object GraphphysicalAddress_beta
        $this.Coordinates = New-Object GraphoutlookGeoCoordinates_beta
    }
}
Class GraphPhysicalAddress_beta { 
    [GraphphysicalAddressType_beta]$Type
    [string]$PostOfficeBox
    [string]$Street
    [string]$City
    [string]$State
    [string]$CountryOrRegion
    [string]$PostalCode
    PhysicalAddress_beta() {
        $this.Type = New-Object GraphphysicalAddressType_beta
    }
}
Class GraphOutlookGeoCoordinates_beta { 
    [System.Nullable[double]]$Altitude
    [System.Nullable[double]]$Latitude
    [System.Nullable[double]]$Longitude
    [System.Nullable[double]]$Accuracy
    [System.Nullable[double]]$AltitudeAccuracy
}
Class GraphLocationConstraint_beta { 
    [System.Nullable[bool]]$IsRequired
    [System.Nullable[bool]]$SuggestLocation
    [GraphLocationConstraintItem_beta[]]$Locations
}
Class GraphLocationConstraintItem_beta { 
    [System.Nullable[bool]]$ResolveAvailability
}
Class GraphTimeConstraint_beta { 
    [GraphactivityDomain_beta]$ActivityDomain
    [GraphTimeSlot_beta[]]$Timeslots
    TimeConstraint_beta() {
        $this.ActivityDomain = New-Object GraphactivityDomain_beta
    }
}
Class GraphMeetingTimeCandidatesResult_beta { 
    [GraphMeetingTimeCandidate_beta[]]$MeetingTimeSlots
    [string]$EmptySuggestionsHint
}
Class GraphMeetingTimeCandidate_beta { 
    [GraphtimeSlotOLD_beta]$MeetingTimeSlot
    [System.Nullable[double]]$Confidence
    [GraphfreeBusyStatus_beta]$OrganizerAvailability
    [GraphAttendeeAvailability_beta[]]$AttendeeAvailability
    [GraphLocation_beta[]]$Locations
    [string]$SuggestionHint
    MeetingTimeCandidate_beta() {
        $this.MeetingTimeSlot = New-Object GraphtimeSlotOLD_beta
        $this.OrganizerAvailability = New-Object GraphfreeBusyStatus_beta
    }
}
Class GraphTimeSlotOLD_beta { 
    [GraphtimeStamp_beta]$Start
    [GraphtimeStamp_beta]$End
    TimeSlotOLD_beta() {
        $this.Start = New-Object GraphtimeStamp_beta
        $this.End = New-Object GraphtimeStamp_beta
    }
}
Class GraphTimeStamp_beta { 
    [System.Nullable[datetime]]$Date
    [object]$time		#Edm.TimeOfDay
    [string]$TimeZone
}
Class GraphMailTips_beta { 
    [GraphemailAddress_beta]$EmailAddress
    [GraphautomaticRepliesMailTips_beta]$AutomaticReplies
    [System.Nullable[bool]]$MailboxFull
    [string]$CustomMailTip
    [System.Nullable[int]]$ExternalMemberCount
    [System.Nullable[int]]$TotalMemberCount
    [System.Nullable[bool]]$DeliveryRestricted
    [System.Nullable[bool]]$IsModerated
    [GraphrecipientScopeType_beta]$RecipientScope
    [GraphRecipient_beta[]]$RecipientSuggestions
    [System.Nullable[int]]$MaxMessageSize
    [GraphmailTipsError_beta]$Error
    MailTips_beta() {
        $this.EmailAddress = New-Object GraphemailAddress_beta
        $this.AutomaticReplies = New-Object GraphautomaticRepliesMailTips_beta
        $this.RecipientScope = New-Object GraphrecipientScopeType_beta
        $this.Error = New-Object GraphmailTipsError_beta
    }
}
Class GraphAutomaticRepliesMailTips_beta { 
    [string]$Message
    [GraphlocaleInfo_beta]$MessageLanguage
    [GraphdateTimeTimeZone_beta]$ScheduledStartTime
    [GraphdateTimeTimeZone_beta]$ScheduledEndTime
    AutomaticRepliesMailTips_beta() {
        $this.MessageLanguage = New-Object GraphlocaleInfo_beta
        $this.ScheduledStartTime = New-Object GraphdateTimeTimeZone_beta
        $this.ScheduledEndTime = New-Object GraphdateTimeTimeZone_beta
    }
}
Class GraphMailTipsError_beta { 
    [string]$Message
    [string]$Code
}
Class GraphReminder_beta { 
    [string]$EventId
    [GraphdateTimeTimeZone_beta]$EventStartTime
    [GraphdateTimeTimeZone_beta]$EventEndTime
    [string]$ChangeKey
    [string]$EventSubject
    [Graphlocation_beta]$EventLocation
    [string]$EventWebLink
    [GraphdateTimeTimeZone_beta]$ReminderFireTime
    Reminder_beta() {
        $this.EventStartTime = New-Object GraphdateTimeTimeZone_beta
        $this.EventEndTime = New-Object GraphdateTimeTimeZone_beta
        $this.EventLocation = New-Object Graphlocation_beta
        $this.ReminderFireTime = New-Object GraphdateTimeTimeZone_beta
    }
}
Class GraphItemBody_beta { 
    [GraphbodyType_beta]$ContentType
    [string]$Content
    ItemBody_beta() {
        $this.ContentType = New-Object GraphbodyType_beta
    }
}
Class GraphMentionsPreview_beta { 
    [System.Nullable[bool]]$IsMentioned
}
Class GraphFollowupFlag_beta { 
    [GraphdateTimeTimeZone_beta]$CompletedDateTime
    [GraphdateTimeTimeZone_beta]$DueDateTime
    [GraphdateTimeTimeZone_beta]$StartDateTime
    [GraphfollowupFlagStatus_beta]$FlagStatus
    FollowupFlag_beta() {
        $this.CompletedDateTime = New-Object GraphdateTimeTimeZone_beta
        $this.DueDateTime = New-Object GraphdateTimeTimeZone_beta
        $this.StartDateTime = New-Object GraphdateTimeTimeZone_beta
        $this.FlagStatus = New-Object GraphfollowupFlagStatus_beta
    }
}
Class GraphResponseStatus_beta { 
    [GraphresponseType_beta]$Response
    [System.Nullable[datetime]]$Time
    ResponseStatus_beta() {
        $this.Response = New-Object GraphresponseType_beta
    }
}
Class GraphPatternedRecurrence_beta { 
    [GraphrecurrencePattern_beta]$Pattern
    [GraphrecurrenceRange_beta]$Range
    PatternedRecurrence_beta() {
        $this.Pattern = New-Object GraphrecurrencePattern_beta
        $this.Range = New-Object GraphrecurrenceRange_beta
    }
}
Class GraphRecurrencePattern_beta { 
    [GraphrecurrencePatternType_beta]$Type
    [System.Nullable[int]]$Interval
    [System.Nullable[int]]$Month
    [System.Nullable[int]]$DayOfMonth
    [GraphDayOfWeek_beta[]]$DaysOfWeek
    [GraphdayOfWeek_beta]$FirstDayOfWeek
    [GraphweekIndex_beta]$Index
    RecurrencePattern_beta() {
        $this.Type = New-Object GraphrecurrencePatternType_beta
        $this.FirstDayOfWeek = New-Object GraphdayOfWeek_beta
        $this.Index = New-Object GraphweekIndex_beta
    }
}
Class GraphRecurrenceRange_beta { 
    [GraphrecurrenceRangeType_beta]$Type
    [System.Nullable[datetime]]$StartDate
    [System.Nullable[datetime]]$EndDate
    [string]$RecurrenceTimeZone
    [System.Nullable[int]]$NumberOfOccurrences
    RecurrenceRange_beta() {
        $this.Type = New-Object GraphrecurrenceRangeType_beta
    }
}
Class GraphAttendee_beta { 
    [GraphresponseStatus_beta]$Status
    Attendee_beta() {
        $this.Status = New-Object GraphresponseStatus_beta
    }
}
Class GraphWebsite_beta { 
    [GraphwebsiteType_beta]$Type
    [string]$Address
    [string]$DisplayName
    Website_beta() {
        $this.Type = New-Object GraphwebsiteType_beta
    }
}
Class GraphPhone_beta { 
    [GraphphoneType_beta]$Type
    [string]$Number
    Phone_beta() {
        $this.Type = New-Object GraphphoneType_beta
    }
}
Class GraphRankedEmailAddress_beta { 
    [string]$Address
    [System.Nullable[double]]$Rank
}
Class GraphPersonDataSource_beta { 
    [string]$Type
}
Class GraphSharingInvitation_beta { 
    [string]$Email
    [GraphidentitySet_beta]$InvitedBy
    [string]$RedeemedBy
    [System.Nullable[bool]]$SignInRequired
    SharingInvitation_beta() {
        $this.InvitedBy = New-Object GraphidentitySet_beta
    }
}
Class GraphSharingLink_beta { 
    [Graphidentity_beta]$Application
    [string]$Type
    [string]$Scope
    [string]$WebUrl
    SharingLink_beta() {
        $this.Application = New-Object Graphidentity_beta
    }
}
Class GraphThumbnail_beta { 
    [object]$content		#Edm.Stream
    [System.Nullable[int]]$Height
    [string]$Url
    [System.Nullable[int]]$Width
}
Class GraphDriveRecipient_beta { 
    [string]$Email
    [string]$Alias
    [string]$ObjectId
}
Class GraphDriveItemUploadableProperties_beta { 
    [string]$Name
    [string]$Description
    [GraphfileSystemInfo_beta]$FileSystemInfo
    DriveItemUploadableProperties_beta() {
        $this.FileSystemInfo = New-Object GraphfileSystemInfo_beta
    }
}
Class GraphUploadSession_beta { 
    [string]$UploadUrl
    [System.Nullable[datetime]]$ExpirationDateTime
    [string[]]$NextExpectedRanges
}
Class GraphResourceVisualization_beta { 
    [string]$Title
    [string]$MediaType
    [string]$PreviewImageUrl
    [string]$PreviewText
    [string]$ContainerWebUrl
    [string]$ContainerDisplayName
    [GraphcontainerType_beta]$ContainerType
    ResourceVisualization_beta() {
        $this.ContainerType = New-Object GraphcontainerType_beta
    }
}
Class GraphResourceReference_beta { 
    [string]$WebUrl
    [string]$Id
    [string]$Type
}
Class GraphAppliedCategoriesCollection_beta { 
}
Class GraphExternalReferenceCollection_beta { 
}
Class GraphChecklistItemCollection_beta { 
}
Class GraphUserIdCollection_beta { 
}
Class GraphExternalReference_beta { 
    [string]$Alias
    [string]$Type
    [string]$PreviewPriority
    [string]$LastModifiedBy
    [System.Nullable[datetime]]$LastModifiedDateTime
}
Class GraphChecklistItem_beta { 
    [System.Nullable[bool]]$IsChecked
    [string]$Title
    [string]$OrderHint
    [string]$LastModifiedBy
    [System.Nullable[datetime]]$LastModifiedDateTime
}
Class GraphNotebookLinks_beta { 
    [GraphexternalLink_beta]$OneNoteClientUrl
    [GraphexternalLink_beta]$OneNoteWebUrl
    NotebookLinks_beta() {
        $this.OneNoteClientUrl = New-Object GraphexternalLink_beta
        $this.OneNoteWebUrl = New-Object GraphexternalLink_beta
    }
}
Class GraphExternalLink_beta { 
    [string]$Href
}
Class GraphOneNoteIdentitySet_beta { 
    [GraphoneNoteIdentity_beta]$User
    OneNoteIdentitySet_beta() {
        $this.User = New-Object GraphoneNoteIdentity_beta
    }
}
Class GraphOneNoteIdentity_beta { 
    [string]$Id
    [string]$DisplayName
}
Class GraphPageLinks_beta { 
    [GraphexternalLink_beta]$OneNoteClientUrl
    [GraphexternalLink_beta]$OneNoteWebUrl
    PageLinks_beta() {
        $this.OneNoteClientUrl = New-Object GraphexternalLink_beta
        $this.OneNoteWebUrl = New-Object GraphexternalLink_beta
    }
}
Class GraphNotesOperationError_beta { 
    [string]$Code
    [string]$Message
}
Class GraphDiagnostic_beta { 
    [string]$Message
    [string]$Url
}
Class GraphPatchContentCommand_beta { 
    [GraphPatchActionType_beta]$Action
    [string]$Target
    [string]$Content
    [GraphPatchInsertPosition_beta]$Position
    PatchContentCommand_beta() {
        $this.Action = New-Object GraphPatchActionType_beta
        $this.Position = New-Object GraphPatchInsertPosition_beta
    }
}
Class GraphCopyStatusModel_beta { 
    [string]$Id
    [string]$Status
    [System.Nullable[datetime]]$CreatedDateTime
}
Class GraphImportStatusModel_beta { 
    [string]$Id
    [string]$Status
    [System.Nullable[datetime]]$CreatedDateTime
}
Class GraphIdentityUserRisk_beta { 
    [GraphuserRiskLevel_beta]$Level
    [System.Nullable[datetime]]$LastChangedDateTime
    IdentityUserRisk_beta() {
        $this.Level = New-Object GraphuserRiskLevel_beta
    }
}
Class GraphSignInLocation_beta { 
    [string]$City
    [string]$State
    [string]$CountryOrRegion
    [GraphgeoCoordinates_beta]$GeoCoordinates
    SignInLocation_beta() {
        $this.GeoCoordinates = New-Object GraphgeoCoordinates_beta
    }
}
Class GraphRoleSuccessStatistics_beta { 
    [string]$RoleId
    [string]$RoleName
    [System.Nullable[int64]]$TemporarySuccess
    [System.Nullable[int64]]$TemporaryFail
    [System.Nullable[int64]]$PermanentSuccess
    [System.Nullable[int64]]$PermanentFail
    [System.Nullable[int64]]$RemoveSuccess
    [System.Nullable[int64]]$RemoveFail
    [System.Nullable[int64]]$UnknownFail
}
Class GraphInvitedUserMessageInfo_beta { 
    [GraphRecipient_beta[]]$CcRecipients
    [string]$MessageLanguage
    [string]$CustomizedMessageBody
}
Class GraphAppConfigurationSettingItem_beta { 
    [string]$AppConfigKey
    [GraphmdmAppConfigKeyType_beta]$AppConfigKeyType
    [string]$AppConfigKeyValue
    AppConfigurationSettingItem_beta() {
        $this.AppConfigKeyType = New-Object GraphmdmAppConfigKeyType_beta
    }
}
Class GraphMobileAppInstallSummary_beta { 
    [System.Nullable[int]]$InstalledDeviceCount
    [System.Nullable[int]]$FailedDeviceCount
    [System.Nullable[int]]$NotInstalledDeviceCount
    [System.Nullable[int]]$InstalledUserCount
    [System.Nullable[int]]$FailedUserCount
    [System.Nullable[int]]$NotInstalledUserCount
}
Class GraphFileEncryptionInfo_beta { 
    [object]$encryptionKey		#Edm.Binary
    [object]$initializationVector		#Edm.Binary
    [object]$mac		#Edm.Binary
    [object]$macKey		#Edm.Binary
    [string]$ProfileIdentifier
    [object]$fileDigest		#Edm.Binary
    [string]$FileDigestAlgorithm
}
Class GraphAndroidMinimumOperatingSystem_beta { 
    [System.Nullable[bool]]$V4_0
    [System.Nullable[bool]]$V4_0_3
    [System.Nullable[bool]]$V4_1
    [System.Nullable[bool]]$V4_2
    [System.Nullable[bool]]$V4_3
    [System.Nullable[bool]]$V4_4
    [System.Nullable[bool]]$V5_0
    [System.Nullable[bool]]$V5_1
}
Class GraphIosDeviceType_beta { 
    [System.Nullable[bool]]$IPad
    [System.Nullable[bool]]$IPhoneAndIPod
}
Class GraphIosMinimumOperatingSystem_beta { 
    [System.Nullable[bool]]$V8_0
    [System.Nullable[bool]]$V9_0
    [System.Nullable[bool]]$V10_0
}
Class GraphVppLicensingType_beta { 
    [System.Nullable[bool]]$SupportUserLicensing
    [System.Nullable[bool]]$SupportDeviceLicensing
}
Class GraphDeviceManagementSettings_beta { 
    [string]$WindowsCommercialId
    [System.Nullable[datetime]]$WindowsCommercialIdLastModifiedTime
}
Class GraphManagementCertificateWithThumbprint_beta { 
    [string]$Thumbprint
    [string]$Certificate
}
Class GraphCloudPkiAdministratorCredentials_beta { 
    [string]$AdminUserName
    [string]$AdminPassword
    [object]$authenticationCertificate		#Edm.Binary
    [string]$AuthenticationCertificatePassword
}
Class GraphExtendedKeyUsage_beta { 
    [string]$Name
    [string]$ObjectIdentifier
}
Class GraphOmaSetting_beta { 
    [string]$DisplayName
    [string]$Description
    [string]$OmaUri
}
Class GraphOmaSettingInteger_beta { 
    [System.Nullable[int]]$Value
}
Class GraphOmaSettingFloatingPoint_beta { 
    [object]$value		#Edm.Single
}
Class GraphOmaSettingString_beta { 
    [string]$Value
}
Class GraphOmaSettingDateTime_beta { 
    [System.Nullable[datetime]]$Value
}
Class GraphOmaSettingStringXml_beta { 
    [string]$FileName
    [object]$value		#Edm.Binary
}
Class GraphOmaSettingBoolean_beta { 
    [System.Nullable[bool]]$Value
}
Class GraphOmaSettingBase64_beta { 
    [string]$FileName
    [string]$Value
}
Class GraphAppListItem_beta { 
    [string]$Name
    [string]$Publisher
    [string]$AppStoreUrl
    [string]$AppId
}
Class GraphAppsComplianceListItem_beta { 
    [string]$Name
    [string]$Publisher
    [string]$AppStoreUrl
    [string]$AppId
}
Class GraphVpnServer_beta { 
    [string]$Description
    [string]$IpAddressOrFqdn
    [System.Nullable[bool]]$IsDefaultServer
}
Class GraphMediaContentRatingAustralia_beta { 
    [GraphratingAustraliaMoviesType_beta]$MovieRating
    [GraphratingAustraliaTelevisionType_beta]$TvRating
    MediaContentRatingAustralia_beta() {
        $this.MovieRating = New-Object GraphratingAustraliaMoviesType_beta
        $this.TvRating = New-Object GraphratingAustraliaTelevisionType_beta
    }
}
Class GraphMediaContentRatingCanada_beta { 
    [GraphratingCanadaMoviesType_beta]$MovieRating
    [GraphratingCanadaTelevisionType_beta]$TvRating
    MediaContentRatingCanada_beta() {
        $this.MovieRating = New-Object GraphratingCanadaMoviesType_beta
        $this.TvRating = New-Object GraphratingCanadaTelevisionType_beta
    }
}
Class GraphMediaContentRatingFrance_beta { 
    [GraphratingFranceMoviesType_beta]$MovieRating
    [GraphratingFranceTelevisionType_beta]$TvRating
    MediaContentRatingFrance_beta() {
        $this.MovieRating = New-Object GraphratingFranceMoviesType_beta
        $this.TvRating = New-Object GraphratingFranceTelevisionType_beta
    }
}
Class GraphMediaContentRatingGermany_beta { 
    [GraphratingGermanyMoviesType_beta]$MovieRating
    [GraphratingGermanyTelevisionType_beta]$TvRating
    MediaContentRatingGermany_beta() {
        $this.MovieRating = New-Object GraphratingGermanyMoviesType_beta
        $this.TvRating = New-Object GraphratingGermanyTelevisionType_beta
    }
}
Class GraphMediaContentRatingIreland_beta { 
    [GraphratingIrelandMoviesType_beta]$MovieRating
    [GraphratingIrelandTelevisionType_beta]$TvRating
    MediaContentRatingIreland_beta() {
        $this.MovieRating = New-Object GraphratingIrelandMoviesType_beta
        $this.TvRating = New-Object GraphratingIrelandTelevisionType_beta
    }
}
Class GraphMediaContentRatingJapan_beta { 
    [GraphratingJapanMoviesType_beta]$MovieRating
    [GraphratingJapanTelevisionType_beta]$TvRating
    MediaContentRatingJapan_beta() {
        $this.MovieRating = New-Object GraphratingJapanMoviesType_beta
        $this.TvRating = New-Object GraphratingJapanTelevisionType_beta
    }
}
Class GraphMediaContentRatingNewZealand_beta { 
    [GraphratingNewZealandMoviesType_beta]$MovieRating
    [GraphratingNewZealandTelevisionType_beta]$TvRating
    MediaContentRatingNewZealand_beta() {
        $this.MovieRating = New-Object GraphratingNewZealandMoviesType_beta
        $this.TvRating = New-Object GraphratingNewZealandTelevisionType_beta
    }
}
Class GraphMediaContentRatingUnitedKingdom_beta { 
    [GraphratingUnitedKingdomMoviesType_beta]$MovieRating
    [GraphratingUnitedKingdomTelevisionType_beta]$TvRating
    MediaContentRatingUnitedKingdom_beta() {
        $this.MovieRating = New-Object GraphratingUnitedKingdomMoviesType_beta
        $this.TvRating = New-Object GraphratingUnitedKingdomTelevisionType_beta
    }
}
Class GraphMediaContentRatingUnitedStates_beta { 
    [GraphratingUnitedStatesMoviesType_beta]$MovieRating
    [GraphratingUnitedStatesTelevisionType_beta]$TvRating
    MediaContentRatingUnitedStates_beta() {
        $this.MovieRating = New-Object GraphratingUnitedStatesMoviesType_beta
        $this.TvRating = New-Object GraphratingUnitedStatesTelevisionType_beta
    }
}
Class GraphVpnOnDemandRule_beta { 
    [string[]]$Ssids
    [string[]]$DnsSearchDomains
    [string]$ProbeUrl
    [GraphvpnOnDemandRuleConnectionAction_beta]$Action
    [GraphvpnOnDemandRuleConnectionDomainAction_beta]$DomainAction
    [string[]]$Domains
    [string]$ProbeRequiredUrl
    VpnOnDemandRule_beta() {
        $this.Action = New-Object GraphvpnOnDemandRuleConnectionAction_beta
        $this.DomainAction = New-Object GraphvpnOnDemandRuleConnectionDomainAction_beta
    }
}
Class GraphVpnProxyServer_beta { 
    [string]$AutomaticConfigurationScriptUrl
    [string]$Address
    [System.Nullable[int]]$Port
}
Class GraphWindows81VpnProxyServer_beta { 
    [System.Nullable[bool]]$AutomaticallyDetectProxySettings
    [System.Nullable[bool]]$BypassProxyServerForLocalAddress
}
Class GraphWindows10VpnProxyServer_beta { 
    [System.Nullable[bool]]$BypassProxyServerForLocalAddress
}
Class GraphWindowsUpdateInstallScheduleType_beta { 
}
Class GraphWindowsUpdateScheduledInstall_beta { 
    [GraphweeklySchedule_beta]$ScheduledInstallDay
    [object]$scheduledInstallTime		#Edm.TimeOfDay
    WindowsUpdateScheduledInstall_beta() {
        $this.ScheduledInstallDay = New-Object GraphweeklySchedule_beta
    }
}
Class GraphWindowsUpdateActiveHoursInstall_beta { 
    [object]$activeHoursStart		#Edm.TimeOfDay
    [object]$activeHoursEnd		#Edm.TimeOfDay
}
Class GraphWindows10AssociatedApps_beta { 
    [Graphwindows10AppType_beta]$AppType
    [string]$Identifier
    Windows10AssociatedApps_beta() {
        $this.AppType = New-Object Graphwindows10AppType_beta
    }
}
Class GraphVpnTrafficRule_beta { 
    [string]$Name
    [System.Nullable[int]]$Protocols
    [GraphNumberRange_beta[]]$LocalPortRanges
    [GraphNumberRange_beta[]]$RemotePortRanges
    [GraphIPv4Range_beta[]]$LocalAddressRanges
    [GraphIPv4Range_beta[]]$RemoteAddressRanges
    [string]$AppId
    [GraphvpnTrafficRuleAppType_beta]$AppType
    [GraphvpnTrafficRuleRoutingPolicyType_beta]$RoutingPolicyType
    [string]$Claims
    VpnTrafficRule_beta() {
        $this.AppType = New-Object GraphvpnTrafficRuleAppType_beta
        $this.RoutingPolicyType = New-Object GraphvpnTrafficRuleRoutingPolicyType_beta
    }
}
Class GraphNumberRange_beta { 
    [System.Nullable[int]]$LowerNumber
    [System.Nullable[int]]$UpperNumber
}
Class GraphIPv4Range_beta { 
    [string]$LowerAddress
    [string]$UpperAddress
}
Class GraphVpnRoute_beta { 
    [string]$DestinationPrefix
    [System.Nullable[int]]$PrefixSize
}
Class GraphVpnDnsRule_beta { 
    [string]$Name
    [string[]]$Servers
    [string]$ProxyServerUri
}
Class GraphHardwareInformation_beta { 
    [string]$SerialNumber
    [System.Nullable[int64]]$TotalStorageSpace
    [System.Nullable[int64]]$FreeStorageSpace
    [string]$Imei
    [string]$Meid
    [string]$Manufacturer
    [string]$Model
    [string]$PhoneNumber
    [string]$SubscriberCarrier
    [string]$CellularTechnology
    [string]$WifiMac
    [string]$OperatingSystemLanguage
}
Class GraphDeviceActionResult_beta { 
    [string]$ActionName
    [GraphdeviceActionState_beta]$ActionState
    [System.Nullable[datetime]]$StartDateTime
    [System.Nullable[datetime]]$LastUpdatedDateTime
    DeviceActionResult_beta() {
        $this.ActionState = New-Object GraphdeviceActionState_beta
    }
}
Class GraphDeviceOperatingSystemSummary_beta { 
    [System.Nullable[int]]$AndroidCount
    [System.Nullable[int]]$IosCount
    [System.Nullable[int]]$MacOSCount
    [System.Nullable[int]]$WindowsMobileCount
    [System.Nullable[int]]$WindowsCount
}
Class GraphLocateDeviceActionResult_beta { 
    [GraphdeviceGeoLocation_beta]$DeviceLocation
    LocateDeviceActionResult_beta() {
        $this.DeviceLocation = New-Object GraphdeviceGeoLocation_beta
    }
}
Class GraphDeviceGeoLocation_beta { 
    [System.Nullable[datetime]]$LastCollectedDateTimeUtc
    [System.Nullable[double]]$Longitude
    [System.Nullable[double]]$Latitude
    [System.Nullable[double]]$Altitude
    [System.Nullable[double]]$HorizontalAccuracy
    [System.Nullable[double]]$VerticalAccuracy
    [System.Nullable[double]]$Heading
    [System.Nullable[double]]$Speed
}
Class GraphResetPasscodeActionResult_beta { 
    [string]$Passcode
}
Class GraphDeviceManagementExchangeAccessRule_beta { 
    [GraphdeviceManagementExchangeDeviceClass_beta]$DeviceClass
    [GraphdeviceManagementExchangeAccessLevel_beta]$AccessLevel
    DeviceManagementExchangeAccessRule_beta() {
        $this.DeviceClass = New-Object GraphdeviceManagementExchangeDeviceClass_beta
        $this.AccessLevel = New-Object GraphdeviceManagementExchangeAccessLevel_beta
    }
}
Class GraphDeviceManagementExchangeDeviceClass_beta { 
    [string]$Name
    [GraphexchangeAccessRuleType_beta]$Type
    DeviceManagementExchangeDeviceClass_beta() {
        $this.Type = New-Object GraphexchangeAccessRuleType_beta
    }
}
Class GraphMobileAppIdentifier_beta { 
}
Class GraphManagedAppDiagnosticStatus_beta { 
    [string]$ValidationName
    [string]$State
    [string]$MitigationInstruction
}
Class GraphAndroidMobileAppIdentifier_beta { 
    [string]$PackageId
}
Class GraphIosMobileAppIdentifier_beta { 
    [string]$BundleId
}
Class GraphManagedAppPolicyDeploymentSummaryPerApp_beta { 
    [GraphmobileAppIdentifier_beta]$MobileAppIdentifier
    [System.Nullable[int]]$ConfigurationAppliedUserCount
    ManagedAppPolicyDeploymentSummaryPerApp_beta() {
        $this.MobileAppIdentifier = New-Object GraphmobileAppIdentifier_beta
    }
}
Class GraphKeyValuePair_beta { 
    [string]$Name
    [string]$Value
}
Class GraphManagedAppSummary_beta { 
}
Class GraphManagedAppDeploymentSummary_beta { 
    [System.Nullable[int]]$NumberOfDeployedPolicies
    [System.Nullable[int]]$NumberOfFlaggedUsers
    [System.Nullable[int]]$NumberOfSyncedUsersWithPolicies
    [System.Nullable[int]]$NumberOfSyncedUsersWithoutPolicy
    [System.Nullable[int]]$NumberOfPendingAppWipes
    [System.Nullable[int]]$NumberOfFailedAppWipes
    [System.Nullable[int]]$NumberOfSucceededAppWipes
    [System.Nullable[datetime]]$LastModifiedDateTime
    [System.Nullable[int]]$NumberOfIosSyncedUsersWithoutPolicies
    [System.Nullable[int]]$NumberOfIosSyncedUsersWithPolicies
    [System.Nullable[int]]$NumberOfAndroidSyncedUsersWithoutPolicies
    [System.Nullable[int]]$NumberOfAndroidSyncedUsersWithPolicies
}
Class GraphRolePermission_beta { 
    [string[]]$Actions
}

Class GraphDirectoryObject_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphExtensionProperty_beta { 
    [string]$id
[string]$RawJSON
    [string]$AppDisplayName
    [string]$Name
    [string]$DataType
    [System.Nullable[bool]]$IsSyncedFromOnPremises
    [string[]]$TargetObjects
}
Class GraphApplication_beta { 
    [string]$id
[string]$RawJSON
    [GraphAddIn_beta[]]$AddIns
    [string]$AppId
    [GraphAppRole_beta[]]$AppRoles
    [System.Nullable[bool]]$AvailableToOtherOrganizations
    [string]$DisplayName
    [string]$ErrorUrl
    [string]$GroupMembershipClaims
    [string]$Homepage
    [string[]]$IdentifierUris
    [GraphKeyCredential_beta[]]$KeyCredentials
    [System.Nullable[guid][]]$KnownClientApplications
    [object]$mainLogo		#Edm.Stream
    [string]$LogoutUrl
    [System.Nullable[bool]]$Oauth2AllowImplicitFlow
    [System.Nullable[bool]]$Oauth2AllowUrlPathMatching
    [GraphOAuth2Permission_beta[]]$Oauth2Permissions
    [System.Nullable[bool]]$Oauth2RequirePostResponse
    [GraphPasswordCredential_beta[]]$PasswordCredentials
    [System.Nullable[bool]]$PublicClient
    [string]$RecordConsentConditions
    [string[]]$ReplyUrls
    [GraphRequiredResourceAccess_beta[]]$RequiredResourceAccess
    [string]$SamlMetadataUrl
    [GraphonPremisesPublishing_beta]$OnPremisesPublishing
    Application_beta() {
        $this.OnPremisesPublishing = New-Object GraphonPremisesPublishing_beta
    }
    [object]Get_extensionProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Applications/$($this.Id)/ExtensionProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_createdOnBehalfOf() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Applications/$($this.Id)/CreatedOnBehalfOf"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_owners() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Applications/$($this.Id)/Owners"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_policies() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Applications/$($this.Id)/Policies"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_connectorGroup() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Applications/$($this.Id)/ConnectorGroup"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphConnectorGroup_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [GraphconnectorGroupType_beta]$ConnectorGroupType
    [System.Nullable[bool]]$IsDefault
    ConnectorGroup_beta() {
        $this.ConnectorGroupType = New-Object GraphconnectorGroupType_beta
    }
    [object]Get_members() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ConnectorGroups/$($this.Id)/Members"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_applications() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ConnectorGroups/$($this.Id)/Applications"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphAppRoleAssignment_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$CreationTimestamp
    [string]$PrincipalDisplayName
    [System.Nullable[guid]]$PrincipalId
    [string]$PrincipalType
    [string]$ResourceDisplayName
    [System.Nullable[guid]]$ResourceId
}
Class GraphOrgContact_beta { 
    [string]$id
[string]$RawJSON
    [string[]]$BusinessPhones
    [string]$City
    [string]$CompanyName
    [string]$Country
    [string]$Department
    [string]$DisplayName
    [string]$GivenName
    [string]$JobTitle
    [string]$Mail
    [string]$MailNickname
    [string]$MobilePhone
    [System.Nullable[bool]]$OnPremisesSyncEnabled
    [System.Nullable[datetime]]$OnPremisesLastSyncDateTime
    [string]$OfficeLocation
    [string]$PostalCode
    [string[]]$ProxyAddresses
    [string]$State
    [string]$StreetAddress
    [string]$Surname
    [object]Get_manager() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "OrgContacts/$($this.Id)/Manager"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_directReports() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "OrgContacts/$($this.Id)/DirectReports"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_memberOf() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "OrgContacts/$($this.Id)/MemberOf"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDevice_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$AccountEnabled
    [GraphAlternativeSecurityId_beta[]]$AlternativeSecurityIds
    [System.Nullable[datetime]]$ApproximateLastSignInDateTime
    [string]$DeviceId
    [string]$DeviceMetadata
    [System.Nullable[int]]$DeviceVersion
    [string]$DisplayName
    [System.Nullable[bool]]$IsCompliant
    [System.Nullable[bool]]$IsManaged
    [System.Nullable[datetime]]$OnPremisesLastSyncDateTime
    [System.Nullable[bool]]$OnPremisesSyncEnabled
    [string]$OperatingSystem
    [string]$OperatingSystemVersion
    [string[]]$PhysicalIds
    [string]$TrustType
    [object]Get_registeredOwners() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Devices/$($this.Id)/RegisteredOwners"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_registeredUsers() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Devices/$($this.Id)/RegisteredUsers"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDirectoryRole_beta { 
    [string]$id
[string]$RawJSON
    [string]$Description
    [string]$DisplayName
    [string]$RoleTemplateId
    [object]Get_members() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DirectoryRoles/$($this.Id)/Members"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_scopedAdministrators() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DirectoryRoles/$($this.Id)/ScopedAdministrators"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphScopedRoleMembership_beta { 
    [string]$id
[string]$RawJSON
    [string]$RoleId
    [string]$AdministrativeUnitId
    [GraphidentityInfo_beta]$RoleMemberInfo
    ScopedRoleMembership_beta() {
        $this.RoleMemberInfo = New-Object GraphidentityInfo_beta
    }
}
Class GraphDirectoryRoleTemplate_beta { 
    [string]$id
[string]$RawJSON
    [string]$Description
    [string]$DisplayName
}
Class GraphDirectorySetting_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$TemplateId
    [GraphSettingValue_beta[]]$Values
}
Class GraphDirectorySettingTemplate_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Description
    [GraphSettingTemplateValue_beta[]]$Values
}
Class GraphGroup_beta { 
    [string]$id
[string]$RawJSON
    [string]$Classification
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Description
    [string]$DisplayName
    [string[]]$GroupTypes
    [string]$Mail
    [System.Nullable[bool]]$MailEnabled
    [string]$MailNickname
    [string]$MembershipRule
    [string]$MembershipRuleProcessingState
    [System.Nullable[datetime]]$OnPremisesLastSyncDateTime
    [string]$OnPremisesSecurityIdentifier
    [System.Nullable[bool]]$OnPremisesSyncEnabled
    [string]$PreferredLanguage
    [string[]]$ProxyAddresses
    [System.Nullable[datetime]]$RenewedDateTime
    [System.Nullable[bool]]$SecurityEnabled
    [string]$Theme
    [string]$Visibility
    [GraphgroupAccessType_beta]$AccessType
    [System.Nullable[bool]]$AllowExternalSenders
    [System.Nullable[bool]]$AutoSubscribeNewMembers
    [System.Nullable[bool]]$IsFavorite
    [System.Nullable[bool]]$IsSubscribedByMail
    [System.Nullable[int]]$UnseenCount
    Group_beta() {
        $this.AccessType = New-Object GraphgroupAccessType_beta
    }
    [object]Get_members() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Members"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_memberOf() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/MemberOf"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_createdOnBehalfOf() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/CreatedOnBehalfOf"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_owners() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Owners"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_settings() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Settings"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_threads() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Threads"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_calendar() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Calendar"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_calendarView() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/CalendarView"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_events() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Events"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_conversations() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Conversations"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_photo() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Photo"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_photos() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Photos"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_acceptedSenders() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/AcceptedSenders"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_rejectedSenders() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/RejectedSenders"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_drive() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Drive"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sharepoint() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Sharepoint"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_plans() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Plans"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_notes() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Groups/$($this.Id)/Notes"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphConversationThread_beta { 
    [string]$id
[string]$RawJSON
    [GraphRecipient_beta[]]$ToRecipients
    [string]$Topic
    [System.Nullable[bool]]$HasAttachments
    [System.Nullable[datetime]]$LastDeliveredDateTime
    [string[]]$UniqueSenders
    [GraphRecipient_beta[]]$CcRecipients
    [string]$Preview
    [System.Nullable[bool]]$IsLocked
    [object]Get_posts() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ConversationThreads/$($this.Id)/Posts"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphCalendar_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [GraphcalendarColor_beta]$Color
    [System.Nullable[bool]]$IsDefaultCalendar
    [string]$ChangeKey
    [System.Nullable[bool]]$CanShare
    [System.Nullable[bool]]$CanViewPrivateItems
    [System.Nullable[bool]]$IsShared
    [System.Nullable[bool]]$IsSharedWithMe
    [System.Nullable[bool]]$CanEdit
    [GraphemailAddress_beta]$Owner
    Calendar_beta() {
        $this.Color = New-Object GraphcalendarColor_beta
        $this.Owner = New-Object GraphemailAddress_beta
    }
    [object]Get_events() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Calendars/$($this.Id)/Events"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_calendarView() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Calendars/$($this.Id)/CalendarView"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_singleValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Calendars/$($this.Id)/SingleValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_multiValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Calendars/$($this.Id)/MultiValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphOutlookItem_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$ChangeKey
    [string[]]$Categories
}
Class GraphEvent_beta { 
    [string]$id
[string]$RawJSON
    [string]$OriginalStartTimeZone
    [string]$OriginalEndTimeZone
    [GraphresponseStatus_beta]$ResponseStatus
    [string]$ICalUId
    [System.Nullable[int]]$ReminderMinutesBeforeStart
    [System.Nullable[bool]]$IsReminderOn
    [System.Nullable[bool]]$HasAttachments
    [string]$Subject
    [GraphitemBody_beta]$Body
    [string]$BodyPreview
    [Graphimportance_beta]$Importance
    [Graphsensitivity_beta]$Sensitivity
    [GraphdateTimeTimeZone_beta]$Start
    [System.Nullable[datetime]]$OriginalStart
    [GraphdateTimeTimeZone_beta]$End
    [Graphlocation_beta]$Location
    [System.Nullable[bool]]$IsAllDay
    [System.Nullable[bool]]$IsCancelled
    [System.Nullable[bool]]$IsOrganizer
    [GraphpatternedRecurrence_beta]$Recurrence
    [System.Nullable[bool]]$ResponseRequested
    [string]$SeriesMasterId
    [GraphfreeBusyStatus_beta]$ShowAs
    [GrapheventType_beta]$Type
    [GraphAttendee_beta[]]$Attendees
    [Graphrecipient_beta]$Organizer
    [string]$WebLink
    [string]$OnlineMeetingUrl
    Event_beta() {
        $this.ResponseStatus = New-Object GraphresponseStatus_beta
        $this.Body = New-Object GraphitemBody_beta
        $this.Importance = New-Object Graphimportance_beta
        $this.Sensitivity = New-Object Graphsensitivity_beta
        $this.Start = New-Object GraphdateTimeTimeZone_beta
        $this.End = New-Object GraphdateTimeTimeZone_beta
        $this.Location = New-Object Graphlocation_beta
        $this.Recurrence = New-Object GraphpatternedRecurrence_beta
        $this.ShowAs = New-Object GraphfreeBusyStatus_beta
        $this.Type = New-Object GrapheventType_beta
        $this.Organizer = New-Object Graphrecipient_beta
    }
    [object]Get_calendar() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Events/$($this.Id)/Calendar"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_instances() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Events/$($this.Id)/Instances"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_extensions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Events/$($this.Id)/Extensions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_attachments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Events/$($this.Id)/Attachments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_singleValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Events/$($this.Id)/SingleValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_multiValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Events/$($this.Id)/MultiValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphConversation_beta { 
    [string]$id
[string]$RawJSON
    [string]$Topic
    [System.Nullable[bool]]$HasAttachments
    [System.Nullable[datetime]]$LastDeliveredDateTime
    [string[]]$UniqueSenders
    [string]$Preview
    [object]Get_threads() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Conversations/$($this.Id)/Threads"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphProfilePhoto_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$Height
    [System.Nullable[int]]$Width
}
Class GraphDrive_beta { 
    [string]$id
[string]$RawJSON
    [string]$DriveType
    [GraphidentitySet_beta]$Owner
    [Graphquota_beta]$Quota
    Drive_beta() {
        $this.Owner = New-Object GraphidentitySet_beta
        $this.Quota = New-Object Graphquota_beta
    }
    [object]Get_items() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Drives/$($this.Id)/Items"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_special() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Drives/$($this.Id)/Special"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_root() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Drives/$($this.Id)/Root"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphSharePoint_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_site() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "SharePoints/$($this.Id)/Site"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sites() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "SharePoints/$($this.Id)/Sites"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphPlan_beta { 
    [string]$id
[string]$RawJSON
    [string]$CreatedBy
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Owner
    [string]$Title
    [System.Nullable[bool]]$IsVisibleInPlannerWebClient
    [object]Get_tasks() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Plans/$($this.Id)/Tasks"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_buckets() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Plans/$($this.Id)/Buckets"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_details() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Plans/$($this.Id)/Details"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_assignedToTaskBoard() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Plans/$($this.Id)/AssignedToTaskBoard"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_progressTaskBoard() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Plans/$($this.Id)/ProgressTaskBoard"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_bucketTaskBoard() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Plans/$($this.Id)/BucketTaskBoard"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphNotes_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_notebooks() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Notess/$($this.Id)/Notebooks"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sections() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Notess/$($this.Id)/Sections"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sectionGroups() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Notess/$($this.Id)/SectionGroups"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_pages() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Notess/$($this.Id)/Pages"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_resources() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Notess/$($this.Id)/Resources"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_operations() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Notess/$($this.Id)/Operations"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphOAuth2PermissionGrant_beta { 
    [string]$id
[string]$RawJSON
    [string]$ClientId
    [string]$ConsentType
    [System.Nullable[datetime]]$ExpiryTime
    [string]$PrincipalId
    [string]$ResourceId
    [string]$Scope
    [System.Nullable[datetime]]$StartTime
}
Class GraphPolicy_beta { 
    [string]$id
[string]$RawJSON
    [string]$AlternativeIdentifier
    [string[]]$Definition
    [string]$DisplayName
    [System.Nullable[bool]]$IsOrganizationDefault
    [GraphKeyCredential_beta[]]$KeyCredentials
    [string]$Type
    [object]Get_appliesTo() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Policys/$($this.Id)/AppliesTo"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphServicePrincipal_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$AccountEnabled
    [GraphAddIn_beta[]]$AddIns
    [string]$AppDisplayName
    [string]$AppId
    [System.Nullable[guid]]$AppOwnerOrganizationId
    [System.Nullable[bool]]$AppRoleAssignmentRequired
    [GraphAppRole_beta[]]$AppRoles
    [string]$DisplayName
    [string]$ErrorUrl
    [string]$Homepage
    [GraphKeyCredential_beta[]]$KeyCredentials
    [string]$LogoutUrl
    [GraphOAuth2Permission_beta[]]$Oauth2Permissions
    [GraphPasswordCredential_beta[]]$PasswordCredentials
    [string]$PreferredTokenSigningKeyThumbprint
    [string]$PublisherName
    [string[]]$ReplyUrls
    [string]$SamlMetadataUrl
    [string[]]$ServicePrincipalNames
    [string[]]$Tags
    [object]Get_appRoleAssignedTo() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ServicePrincipals/$($this.Id)/AppRoleAssignedTo"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_appRoleAssignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ServicePrincipals/$($this.Id)/AppRoleAssignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_oauth2PermissionGrants() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ServicePrincipals/$($this.Id)/Oauth2PermissionGrants"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_memberOf() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ServicePrincipals/$($this.Id)/MemberOf"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_createdObjects() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ServicePrincipals/$($this.Id)/CreatedObjects"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_owners() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ServicePrincipals/$($this.Id)/Owners"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_ownedObjects() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ServicePrincipals/$($this.Id)/OwnedObjects"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_policies() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ServicePrincipals/$($this.Id)/Policies"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphSubscribedSku_beta { 
    [string]$id
[string]$RawJSON
    [string]$CapabilityStatus
    [System.Nullable[int]]$ConsumedUnits
    [GraphlicenseUnitsDetail_beta]$PrepaidUnits
    [GraphServicePlanInfo_beta[]]$ServicePlans
    [System.Nullable[guid]]$SkuId
    [string]$SkuPartNumber
    [string]$AppliesTo
    SubscribedSku_beta() {
        $this.PrepaidUnits = New-Object GraphlicenseUnitsDetail_beta
    }
}
Class GraphOrganization_beta { 
    [string]$id
[string]$RawJSON
    [GraphAssignedPlan_beta[]]$AssignedPlans
    [string[]]$BusinessPhones
    [string]$City
    [string]$Country
    [string]$CountryLetterCode
    [string]$DisplayName
    [string[]]$MarketingNotificationEmails
    [System.Nullable[datetime]]$OnPremisesLastSyncDateTime
    [System.Nullable[bool]]$OnPremisesSyncEnabled
    [string]$PostalCode
    [string]$PreferredLanguage
    [GraphProvisionedPlan_beta[]]$ProvisionedPlans
    [string[]]$SecurityComplianceNotificationMails
    [string[]]$SecurityComplianceNotificationPhones
    [string]$State
    [string]$Street
    [string[]]$TechnicalNotificationMails
    [GraphVerifiedDomain_beta[]]$VerifiedDomains
    [GraphapplePushNotificationCertificateSetting_beta]$ApplePushNotificationCertificateSetting
    [GraphmdmAuthority_beta]$MobileDeviceManagementAuthority
    [GraphdefaultDeviceEnrollmentRestrictions_beta]$DefaultDeviceEnrollmentRestrictions
    [GraphdefaultDeviceEnrollmentWindowsHelloForBusinessSettings_beta]$DefaultDeviceEnrollmentWindowsHelloForBusinessSettings
    [System.Nullable[int]]$DefaultDeviceEnrollmentLimit
    [GraphintuneBrand_beta]$IntuneBrand
    [GraphcertificateConnectorSetting_beta]$CertificateConnectorSetting
    Organization_beta() {
        $this.ApplePushNotificationCertificateSetting = New-Object GraphapplePushNotificationCertificateSetting_beta
        $this.MobileDeviceManagementAuthority = New-Object GraphmdmAuthority_beta
        $this.DefaultDeviceEnrollmentRestrictions = New-Object GraphdefaultDeviceEnrollmentRestrictions_beta
        $this.DefaultDeviceEnrollmentWindowsHelloForBusinessSettings = New-Object GraphdefaultDeviceEnrollmentWindowsHelloForBusinessSettings_beta
        $this.IntuneBrand = New-Object GraphintuneBrand_beta
        $this.CertificateConnectorSetting = New-Object GraphcertificateConnectorSetting_beta
    }
    [object]Get_depOnboardingSettings() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Organizations/$($this.Id)/DepOnboardingSettings"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_appleVolumePurchaseProgramTokens() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Organizations/$($this.Id)/AppleVolumePurchaseProgramTokens"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sideLoadingKeys() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Organizations/$($this.Id)/SideLoadingKeys"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDepOnboardingSetting_beta { 
    [string]$id
[string]$RawJSON
    [string]$AppleIdentifier
    [System.Nullable[datetime]]$TokenExpirationDateTime
    [System.Nullable[datetime]]$LastModifiedDateTime
    [System.Nullable[datetime]]$LastSuccessfulSyncDateTime
    [System.Nullable[datetime]]$LastSyncTriggeredDateTime
}
Class GraphAppleVolumePurchaseProgramToken_beta { 
    [string]$id
[string]$RawJSON
    [string]$OrganizationName
    [GraphvolumePurchaseProgramTokenAccountType_beta]$VolumePurchaseProgramTokenAccountType
    [string]$AppleId
    [System.Nullable[datetime]]$ExpirationDateTime
    [System.Nullable[datetime]]$LastSyncDateTime
    [string]$Token
    [System.Nullable[datetime]]$LastModifiedDateTime
    [GraphvolumePurchaseProgramTokenState_beta]$State
    [GraphvolumePurchaseProgramTokenSyncStatus_beta]$LastSyncStatus
    AppleVolumePurchaseProgramToken_beta() {
        $this.VolumePurchaseProgramTokenAccountType = New-Object GraphvolumePurchaseProgramTokenAccountType_beta
        $this.State = New-Object GraphvolumePurchaseProgramTokenState_beta
        $this.LastSyncStatus = New-Object GraphvolumePurchaseProgramTokenSyncStatus_beta
    }
}
Class GraphSideLoadingKey_beta { 
    [string]$id
[string]$RawJSON
    [string]$Value
    [string]$DisplayName
    [string]$Description
    [System.Nullable[int]]$TotalActivation
    [string]$LastUpdatedDateTime
}
Class GraphUser_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$AccountEnabled
    [GraphAssignedLicense_beta[]]$AssignedLicenses
    [GraphAssignedPlan_beta[]]$AssignedPlans
    [string[]]$BusinessPhones
    [string]$City
    [string]$CompanyName
    [string]$Country
    [string]$Department
    [string]$DisplayName
    [string]$GivenName
    [string]$JobTitle
    [string]$Mail
    [string]$MailNickname
    [string]$MobilePhone
    [string]$OnPremisesImmutableId
    [System.Nullable[datetime]]$OnPremisesLastSyncDateTime
    [string]$OnPremisesSecurityIdentifier
    [System.Nullable[bool]]$OnPremisesSyncEnabled
    [string]$PasswordPolicies
    [GraphpasswordProfile_beta]$PasswordProfile
    [string]$OfficeLocation
    [string]$PostalCode
    [string]$PreferredLanguage
    [GraphProvisionedPlan_beta[]]$ProvisionedPlans
    [string[]]$ProxyAddresses
    [System.Nullable[datetime]]$RefreshTokensValidFromDateTime
    [System.Nullable[bool]]$ShowInAddressList
    [string]$State
    [string]$StreetAddress
    [string]$Surname
    [string]$UsageLocation
    [string]$UserPrincipalName
    [string]$UserType
    [GraphmailboxSettings_beta]$MailboxSettings
    [string]$AboutMe
    [System.Nullable[datetime]]$Birthday
    [System.Nullable[datetime]]$HireDate
    [string[]]$Interests
    [string]$MySite
    [string[]]$PastProjects
    [string]$PreferredName
    [string[]]$Responsibilities
    [string[]]$Schools
    [string[]]$Skills
    [System.Nullable[int]]$DeviceEnrollmentLimit
    User_beta() {
        $this.PasswordProfile = New-Object GraphpasswordProfile_beta
        $this.MailboxSettings = New-Object GraphmailboxSettings_beta
    }
    [object]Get_ownedDevices() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/OwnedDevices"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_registeredDevices() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/RegisteredDevices"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_manager() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Manager"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_directReports() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/DirectReports"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_memberOf() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/MemberOf"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_createdObjects() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/CreatedObjects"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_ownedObjects() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/OwnedObjects"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_scopedAdministratorOf() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/ScopedAdministratorOf"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_messages() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Messages"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_joinedGroups() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/JoinedGroups"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_mailFolders() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/MailFolders"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_calendar() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Calendar"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_calendars() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Calendars"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_calendarGroups() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/CalendarGroups"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_calendarView() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/CalendarView"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_events() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Events"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_people() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/People"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_contacts() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Contacts"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_contactFolders() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/ContactFolders"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_inferenceClassification() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/InferenceClassification"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_photo() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Photo"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_photos() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Photos"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_drive() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Drive"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_drives() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Drives"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sharepoint() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Sharepoint"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_insights() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Insights"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_trendingAround() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/TrendingAround"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_workingWith() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/WorkingWith"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_tasks() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Tasks"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_plans() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Plans"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_notes() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/Notes"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_managedDevices() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/ManagedDevices"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_managedAppRegistrations() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Users/$($this.Id)/ManagedAppRegistrations"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMessage_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$ReceivedDateTime
    [System.Nullable[datetime]]$SentDateTime
    [System.Nullable[bool]]$HasAttachments
    [string]$InternetMessageId
    [string]$Subject
    [GraphitemBody_beta]$Body
    [string]$BodyPreview
    [Graphimportance_beta]$Importance
    [string]$ParentFolderId
    [Graphrecipient_beta]$Sender
    [Graphrecipient_beta]$From
    [GraphRecipient_beta[]]$ToRecipients
    [GraphRecipient_beta[]]$CcRecipients
    [GraphRecipient_beta[]]$BccRecipients
    [GraphRecipient_beta[]]$ReplyTo
    [string]$ConversationId
    [object]$conversationIndex		#Edm.Binary
    [GraphitemBody_beta]$UniqueBody
    [System.Nullable[bool]]$IsDeliveryReceiptRequested
    [System.Nullable[bool]]$IsReadReceiptRequested
    [System.Nullable[bool]]$IsRead
    [System.Nullable[bool]]$IsDraft
    [string]$WebLink
    [GraphmentionsPreview_beta]$MentionsPreview
    [GraphinferenceClassificationType_beta]$InferenceClassification
    [string[]]$UnsubscribeData
    [System.Nullable[bool]]$UnsubscribeEnabled
    [GraphfollowupFlag_beta]$Flag
    Message_beta() {
        $this.Body = New-Object GraphitemBody_beta
        $this.Importance = New-Object Graphimportance_beta
        $this.Sender = New-Object Graphrecipient_beta
        $this.From = New-Object Graphrecipient_beta
        $this.UniqueBody = New-Object GraphitemBody_beta
        $this.MentionsPreview = New-Object GraphmentionsPreview_beta
        $this.InferenceClassification = New-Object GraphinferenceClassificationType_beta
        $this.Flag = New-Object GraphfollowupFlag_beta
    }
    [object]Get_attachments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Messages/$($this.Id)/Attachments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_extensions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Messages/$($this.Id)/Extensions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_singleValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Messages/$($this.Id)/SingleValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_multiValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Messages/$($this.Id)/MultiValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_mentions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Messages/$($this.Id)/Mentions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMailFolder_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$ParentFolderId
    [System.Nullable[int]]$ChildFolderCount
    [System.Nullable[int]]$UnreadItemCount
    [System.Nullable[int]]$TotalItemCount
    [string]$WellKnownName
    [object]Get_messages() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MailFolders/$($this.Id)/Messages"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_childFolders() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MailFolders/$($this.Id)/ChildFolders"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_userConfigurations() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MailFolders/$($this.Id)/UserConfigurations"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_singleValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MailFolders/$($this.Id)/SingleValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_multiValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MailFolders/$($this.Id)/MultiValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphCalendarGroup_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [System.Nullable[guid]]$ClassId
    [string]$ChangeKey
    [object]Get_calendars() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "CalendarGroups/$($this.Id)/Calendars"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphPerson_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$GivenName
    [string]$Surname
    [string]$Birthday
    [string]$PersonNotes
    [System.Nullable[bool]]$IsFavorite
    [GraphRankedEmailAddress_beta[]]$EmailAddresses
    [GraphPhone_beta[]]$Phones
    [GraphLocation_beta[]]$PostalAddresses
    [GraphWebsite_beta[]]$Websites
    [string]$Title
    [string]$CompanyName
    [string]$YomiCompany
    [string]$Department
    [string]$OfficeLocation
    [string]$Profession
    [GraphPersonDataSource_beta[]]$Sources
    [string]$MailboxType
    [string]$PersonType
    [string]$UserPrincipalName
}
Class GraphContact_beta { 
    [string]$id
[string]$RawJSON
    [string]$ParentFolderId
    [System.Nullable[datetime]]$Birthday
    [string]$FileAs
    [string]$DisplayName
    [string]$GivenName
    [string]$Initials
    [string]$MiddleName
    [string]$NickName
    [string]$Surname
    [string]$Title
    [string]$YomiGivenName
    [string]$YomiSurname
    [string]$YomiCompanyName
    [string]$Generation
    [GraphEmailAddress_beta[]]$EmailAddresses
    [GraphWebsite_beta[]]$Websites
    [string[]]$ImAddresses
    [string]$JobTitle
    [string]$CompanyName
    [string]$Department
    [string]$OfficeLocation
    [string]$Profession
    [string]$AssistantName
    [string]$Manager
    [GraphPhone_beta[]]$Phones
    [GraphPhysicalAddress_beta[]]$PostalAddresses
    [string]$SpouseName
    [string]$PersonalNotes
    [string[]]$Children
    [System.Nullable[datetime]]$WeddingAnniversary
    [string]$Gender
    [System.Nullable[bool]]$IsFavorite
    [GraphfollowupFlag_beta]$Flag
    Contact_beta() {
        $this.Flag = New-Object GraphfollowupFlag_beta
    }
    [object]Get_extensions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Contacts/$($this.Id)/Extensions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_singleValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Contacts/$($this.Id)/SingleValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_multiValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Contacts/$($this.Id)/MultiValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_photo() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Contacts/$($this.Id)/Photo"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphContactFolder_beta { 
    [string]$id
[string]$RawJSON
    [string]$ParentFolderId
    [string]$DisplayName
    [string]$WellKnownName
    [object]Get_contacts() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ContactFolders/$($this.Id)/Contacts"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_childFolders() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ContactFolders/$($this.Id)/ChildFolders"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_singleValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ContactFolders/$($this.Id)/SingleValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_multiValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ContactFolders/$($this.Id)/MultiValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphInferenceClassification_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_overrides() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "InferenceClassifications/$($this.Id)/Overrides"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphOfficeGraphInsights_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_trending() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "OfficeGraphInsightss/$($this.Id)/Trending"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDriveItem_beta { 
    [string]$id
[string]$RawJSON
    [GraphidentitySet_beta]$CreatedBy
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Description
    [string]$ETag
    [GraphidentitySet_beta]$LastModifiedBy
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$Name
    [string]$WebUrl
    [Graphaudio_beta]$Audio
    [object]$content		#Edm.Stream
    [string]$CTag
    [Graphdeleted_beta]$Deleted
    [Graphfile_beta]$File
    [GraphfileSystemInfo_beta]$FileSystemInfo
    [Graphfolder_beta]$Folder
    [Graphimage_beta]$Image
    [GraphgeoCoordinates_beta]$Location
    [Graphpackage_beta]$Package
    [GraphitemReference_beta]$ParentReference
    [Graphphoto_beta]$Photo
    [GraphremoteItem_beta]$RemoteItem
    [Graphroot_beta]$Root
    [GraphsearchResult_beta]$SearchResult
    [Graphshared_beta]$Shared
    [GraphsharepointIds_beta]$SharepointIds
    [System.Nullable[int64]]$Size
    [GraphspecialFolder_beta]$SpecialFolder
    [Graphvideo_beta]$Video
    [string]$WebDavUrl
    DriveItem_beta() {
        $this.CreatedBy = New-Object GraphidentitySet_beta
        $this.LastModifiedBy = New-Object GraphidentitySet_beta
        $this.Audio = New-Object Graphaudio_beta
        $this.Deleted = New-Object Graphdeleted_beta
        $this.File = New-Object Graphfile_beta
        $this.FileSystemInfo = New-Object GraphfileSystemInfo_beta
        $this.Folder = New-Object Graphfolder_beta
        $this.Image = New-Object Graphimage_beta
        $this.Location = New-Object GraphgeoCoordinates_beta
        $this.Package = New-Object Graphpackage_beta
        $this.ParentReference = New-Object GraphitemReference_beta
        $this.Photo = New-Object Graphphoto_beta
        $this.RemoteItem = New-Object GraphremoteItem_beta
        $this.Root = New-Object Graphroot_beta
        $this.SearchResult = New-Object GraphsearchResult_beta
        $this.Shared = New-Object Graphshared_beta
        $this.SharepointIds = New-Object GraphsharepointIds_beta
        $this.SpecialFolder = New-Object GraphspecialFolder_beta
        $this.Video = New-Object Graphvideo_beta
    }
    [object]Get_workbook() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DriveItems/$($this.Id)/Workbook"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_createdByUser() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DriveItems/$($this.Id)/CreatedByUser"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_lastModifiedByUser() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DriveItems/$($this.Id)/LastModifiedByUser"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_children() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DriveItems/$($this.Id)/Children"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_permissions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DriveItems/$($this.Id)/Permissions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_thumbnails() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DriveItems/$($this.Id)/Thumbnails"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphTask_beta { 
    [string]$id
[string]$RawJSON
    [string]$CreatedBy
    [string]$AssignedTo
    [string]$PlanId
    [string]$BucketId
    [string]$Title
    [string]$OrderHint
    [string]$AssigneePriority
    [System.Nullable[int]]$PercentComplete
    [System.Nullable[datetime]]$StartDateTime
    [System.Nullable[datetime]]$AssignedDateTime
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$AssignedBy
    [System.Nullable[datetime]]$DueDateTime
    [System.Nullable[bool]]$HasDescription
    [GraphpreviewType_beta]$PreviewType
    [System.Nullable[datetime]]$CompletedDateTime
    [GraphappliedCategoriesCollection_beta]$AppliedCategories
    [string]$ConversationThreadId
    Task_beta() {
        $this.PreviewType = New-Object GraphpreviewType_beta
        $this.AppliedCategories = New-Object GraphappliedCategoriesCollection_beta
    }
    [object]Get_details() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Tasks/$($this.Id)/Details"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_assignedToTaskBoardFormat() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Tasks/$($this.Id)/AssignedToTaskBoardFormat"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_progressTaskBoardFormat() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Tasks/$($this.Id)/ProgressTaskBoardFormat"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_bucketTaskBoardFormat() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Tasks/$($this.Id)/BucketTaskBoardFormat"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphManagedDevice_beta { 
    [string]$id
[string]$RawJSON
    [string]$UserId
    [string]$DeviceName
    [GraphhardwareInformation_beta]$HardwareInformation
    [GraphownerType_beta]$OwnerType
    [GraphDeviceActionResult_beta[]]$DeviceActionResults
    [GraphmanagementState_beta]$ManagementState
    [System.Nullable[datetime]]$EnrolledDateTime
    [System.Nullable[datetime]]$LastSyncDateTime
    [GraphchassisType_beta]$ChassisType
    [string]$OperatingSystem
    [GraphdeviceType_beta]$DeviceType
    [GraphcomplianceState_beta]$ComplianceState
    [string]$JailBroken
    [System.Nullable[int]]$ManagementAgents
    [string]$OsVersion
    [System.Nullable[bool]]$EasActivated
    [string]$EasDeviceId
    [System.Nullable[datetime]]$EasActivationDateTime
    [System.Nullable[bool]]$AadRegistered
    [GraphenrollmentType_beta]$EnrollmentType
    [GraphlostModeState_beta]$LostModeState
    [string]$ActivationLockBypassCode
    [string]$EmailAddress
    ManagedDevice_beta() {
        $this.HardwareInformation = New-Object GraphhardwareInformation_beta
        $this.OwnerType = New-Object GraphownerType_beta
        $this.ManagementState = New-Object GraphmanagementState_beta
        $this.ChassisType = New-Object GraphchassisType_beta
        $this.DeviceType = New-Object GraphdeviceType_beta
        $this.ComplianceState = New-Object GraphcomplianceState_beta
        $this.EnrollmentType = New-Object GraphenrollmentType_beta
        $this.LostModeState = New-Object GraphlostModeState_beta
    }
    [object]Get_detectedApps() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedDevices/$($this.Id)/DetectedApps"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphManagedAppRegistration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$LastSyncDateTime
    [string]$ApplicationVersion
    [string]$ManagementSdkVersion
    [string]$PlatformVersion
    [string]$DeviceType
    [string]$DeviceTag
    [string]$DeviceName
    [GraphManagedAppFlaggedReason_beta[]]$FlaggedReasons
    [string]$UserId
    [GraphmobileAppIdentifier_beta]$AppIdentifier
    [string]$Version
    ManagedAppRegistration_beta() {
        $this.AppIdentifier = New-Object GraphmobileAppIdentifier_beta
    }
    [object]Get_appliedPolicies() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedAppRegistrations/$($this.Id)/AppliedPolicies"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_intendedPolicies() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedAppRegistrations/$($this.Id)/IntendedPolicies"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_operations() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedAppRegistrations/$($this.Id)/Operations"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphAdministrativeUnit_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Description
    [string]$Visibility
    [object]Get_members() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "AdministrativeUnits/$($this.Id)/Members"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_scopedAdministrators() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "AdministrativeUnits/$($this.Id)/ScopedAdministrators"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphBaseItem_beta { 
    [string]$id
[string]$RawJSON
    [GraphidentitySet_beta]$CreatedBy
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Description
    [string]$ETag
    [GraphidentitySet_beta]$LastModifiedBy
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$Name
    [string]$WebUrl
    BaseItem_beta() {
        $this.CreatedBy = New-Object GraphidentitySet_beta
        $this.LastModifiedBy = New-Object GraphidentitySet_beta
    }
    [object]Get_createdByUser() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "BaseItems/$($this.Id)/CreatedByUser"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_lastModifiedByUser() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "BaseItems/$($this.Id)/LastModifiedByUser"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphSite_beta { 
    [string]$id
[string]$RawJSON
    [Graphroot_beta]$Root
    [GraphsiteCollection_beta]$SiteCollection
    [System.Nullable[guid]]$SiteCollectionId
    [System.Nullable[guid]]$SiteId
    Site_beta() {
        $this.Root = New-Object Graphroot_beta
        $this.SiteCollection = New-Object GraphsiteCollection_beta
    }
    [object]Get_drive() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Sites/$($this.Id)/Drive"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_drives() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Sites/$($this.Id)/Drives"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_items() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Sites/$($this.Id)/Items"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_lists() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Sites/$($this.Id)/Lists"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sites() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Sites/$($this.Id)/Sites"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphList_beta { 
    [string]$id
[string]$RawJSON
    [GraphFieldDefinition_beta[]]$Fields
    [GraphlistInfo_beta]$List
    List_beta() {
        $this.List = New-Object GraphlistInfo_beta
    }
    [object]Get_drive() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Lists/$($this.Id)/Drive"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_items() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Lists/$($this.Id)/Items"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphListItem_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$ListItemId
    [object]Get_columnSet() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ListItems/$($this.Id)/ColumnSet"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_driveItem() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ListItems/$($this.Id)/DriveItem"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbook_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_application() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Workbooks/$($this.Id)/Application"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_names() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Workbooks/$($this.Id)/Names"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_tables() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Workbooks/$($this.Id)/Tables"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_worksheets() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Workbooks/$($this.Id)/Worksheets"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_functions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Workbooks/$($this.Id)/Functions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphPermission_beta { 
    [string]$id
[string]$RawJSON
    [GraphidentitySet_beta]$GrantedTo
    [GraphsharingInvitation_beta]$Invitation
    [GraphitemReference_beta]$InheritedFrom
    [GraphsharingLink_beta]$Link
    [string[]]$Roles
    [string]$ShareId
    Permission_beta() {
        $this.GrantedTo = New-Object GraphidentitySet_beta
        $this.Invitation = New-Object GraphsharingInvitation_beta
        $this.InheritedFrom = New-Object GraphitemReference_beta
        $this.Link = New-Object GraphsharingLink_beta
    }
}
Class GraphThumbnailSet_beta { 
    [string]$id
[string]$RawJSON
    [Graphthumbnail_beta]$Large
    [Graphthumbnail_beta]$Medium
    [Graphthumbnail_beta]$Small
    [Graphthumbnail_beta]$Source
    ThumbnailSet_beta() {
        $this.Large = New-Object Graphthumbnail_beta
        $this.Medium = New-Object Graphthumbnail_beta
        $this.Small = New-Object Graphthumbnail_beta
        $this.Source = New-Object Graphthumbnail_beta
    }
}
Class GraphWorkbookApplication_beta { 
    [string]$id
[string]$RawJSON
    [string]$CalculationMode
}
Class GraphWorkbookNamedItem_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [string]$Type
    [GraphJson_beta]$Value
    [System.Nullable[bool]]$Visible
    WorkbookNamedItem_beta() {
        $this.Value = New-Object GraphJson_beta
    }
}
Class GraphWorkbookTable_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$HighlightFirstColumn
    [System.Nullable[bool]]$HighlightLastColumn
    [string]$Name
    [System.Nullable[bool]]$ShowBandedColumns
    [System.Nullable[bool]]$ShowBandedRows
    [System.Nullable[bool]]$ShowFilterButton
    [System.Nullable[bool]]$ShowHeaders
    [System.Nullable[bool]]$ShowTotals
    [string]$Style
    [object]Get_columns() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookTables/$($this.Id)/Columns"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_rows() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookTables/$($this.Id)/Rows"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sort() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookTables/$($this.Id)/Sort"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_worksheet() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookTables/$($this.Id)/Worksheet"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookWorksheet_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [System.Nullable[int]]$Position
    [string]$Visibility
    [object]Get_charts() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookWorksheets/$($this.Id)/Charts"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_pivotTables() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookWorksheets/$($this.Id)/PivotTables"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_protection() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookWorksheets/$($this.Id)/Protection"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_tables() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookWorksheets/$($this.Id)/Tables"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookFunctions_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphWorkbookChart_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[double]]$Height
    [System.Nullable[double]]$Left
    [string]$Name
    [System.Nullable[double]]$Top
    [System.Nullable[double]]$Width
    [object]Get_axes() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookCharts/$($this.Id)/Axes"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_dataLabels() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookCharts/$($this.Id)/DataLabels"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookCharts/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_legend() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookCharts/$($this.Id)/Legend"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_series() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookCharts/$($this.Id)/Series"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_title() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookCharts/$($this.Id)/Title"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_worksheet() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookCharts/$($this.Id)/Worksheet"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartAxes_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_categoryAxis() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxess/$($this.Id)/CategoryAxis"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_seriesAxis() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxess/$($this.Id)/SeriesAxis"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_valueAxis() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxess/$($this.Id)/ValueAxis"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartDataLabels_beta { 
    [string]$id
[string]$RawJSON
    [string]$Position
    [string]$Separator
    [System.Nullable[bool]]$ShowBubbleSize
    [System.Nullable[bool]]$ShowCategoryName
    [System.Nullable[bool]]$ShowLegendKey
    [System.Nullable[bool]]$ShowPercentage
    [System.Nullable[bool]]$ShowSeriesName
    [System.Nullable[bool]]$ShowValue
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartDataLabelss/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartAreaFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_fill() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAreaFormats/$($this.Id)/Fill"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_font() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAreaFormats/$($this.Id)/Font"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartLegend_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$Overlay
    [string]$Position
    [System.Nullable[bool]]$Visible
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartLegends/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartSeries_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartSeriess/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_points() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartSeriess/$($this.Id)/Points"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartTitle_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$Overlay
    [string]$Text
    [System.Nullable[bool]]$Visible
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartTitles/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartFill_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphWorkbookChartFont_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$Bold
    [string]$Color
    [System.Nullable[bool]]$Italic
    [string]$Name
    [System.Nullable[double]]$Size
    [string]$Underline
}
Class GraphWorkbookChartAxis_beta { 
    [string]$id
[string]$RawJSON
    [GraphJson_beta]$MajorUnit
    [GraphJson_beta]$Maximum
    [GraphJson_beta]$Minimum
    [GraphJson_beta]$MinorUnit
    WorkbookChartAxis_beta() {
        $this.MajorUnit = New-Object GraphJson_beta
        $this.Maximum = New-Object GraphJson_beta
        $this.Minimum = New-Object GraphJson_beta
        $this.MinorUnit = New-Object GraphJson_beta
    }
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxiss/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_majorGridlines() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxiss/$($this.Id)/MajorGridlines"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_minorGridlines() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxiss/$($this.Id)/MinorGridlines"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_title() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxiss/$($this.Id)/Title"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartAxisFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_font() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxisFormats/$($this.Id)/Font"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_line() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxisFormats/$($this.Id)/Line"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartGridlines_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$Visible
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartGridliness/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartAxisTitle_beta { 
    [string]$id
[string]$RawJSON
    [string]$Text
    [System.Nullable[bool]]$Visible
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxisTitles/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartLineFormat_beta { 
    [string]$id
[string]$RawJSON
    [string]$Color
}
Class GraphWorkbookChartAxisTitleFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_font() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartAxisTitleFormats/$($this.Id)/Font"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartDataLabelFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_fill() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartDataLabelFormats/$($this.Id)/Fill"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_font() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartDataLabelFormats/$($this.Id)/Font"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartGridlinesFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_line() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartGridlinesFormats/$($this.Id)/Line"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartLegendFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_fill() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartLegendFormats/$($this.Id)/Fill"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_font() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartLegendFormats/$($this.Id)/Font"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartPoint_beta { 
    [string]$id
[string]$RawJSON
    [GraphJson_beta]$Value
    WorkbookChartPoint_beta() {
        $this.Value = New-Object GraphJson_beta
    }
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartPoints/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartPointFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_fill() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartPointFormats/$($this.Id)/Fill"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartSeriesFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_fill() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartSeriesFormats/$($this.Id)/Fill"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_line() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartSeriesFormats/$($this.Id)/Line"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookChartTitleFormat_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_fill() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartTitleFormats/$($this.Id)/Fill"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_font() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookChartTitleFormats/$($this.Id)/Font"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookFilter_beta { 
    [string]$id
[string]$RawJSON
    [GraphworkbookFilterCriteria_beta]$Criteria
    WorkbookFilter_beta() {
        $this.Criteria = New-Object GraphworkbookFilterCriteria_beta
    }
}
Class GraphWorkbookFormatProtection_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$FormulaHidden
    [System.Nullable[bool]]$Locked
}
Class GraphWorkbookFunctionResult_beta { 
    [string]$id
[string]$RawJSON
    [string]$Error
    [GraphJson_beta]$Value
    WorkbookFunctionResult_beta() {
        $this.Value = New-Object GraphJson_beta
    }
}
Class GraphWorkbookPivotTable_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [object]Get_worksheet() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookPivotTables/$($this.Id)/Worksheet"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookRange_beta { 
    [string]$id
[string]$RawJSON
    [string]$Address
    [string]$AddressLocal
    [System.Nullable[int]]$CellCount
    [System.Nullable[int]]$ColumnCount
    [System.Nullable[bool]]$ColumnHidden
    [System.Nullable[int]]$ColumnIndex
    [GraphJson_beta]$Formulas
    [GraphJson_beta]$FormulasLocal
    [GraphJson_beta]$FormulasR1C1
    [System.Nullable[bool]]$Hidden
    [GraphJson_beta]$NumberFormat
    [System.Nullable[int]]$RowCount
    [System.Nullable[bool]]$RowHidden
    [System.Nullable[int]]$RowIndex
    [GraphJson_beta]$Text
    [GraphJson_beta]$ValueTypes
    [GraphJson_beta]$Values
    WorkbookRange_beta() {
        $this.Formulas = New-Object GraphJson_beta
        $this.FormulasLocal = New-Object GraphJson_beta
        $this.FormulasR1C1 = New-Object GraphJson_beta
        $this.NumberFormat = New-Object GraphJson_beta
        $this.Text = New-Object GraphJson_beta
        $this.ValueTypes = New-Object GraphJson_beta
        $this.Values = New-Object GraphJson_beta
    }
    [object]Get_format() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookRanges/$($this.Id)/Format"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sort() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookRanges/$($this.Id)/Sort"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_worksheet() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookRanges/$($this.Id)/Worksheet"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookRangeFormat_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[double]]$ColumnWidth
    [string]$HorizontalAlignment
    [System.Nullable[double]]$RowHeight
    [string]$VerticalAlignment
    [System.Nullable[bool]]$WrapText
    [object]Get_borders() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookRangeFormats/$($this.Id)/Borders"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_fill() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookRangeFormats/$($this.Id)/Fill"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_font() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookRangeFormats/$($this.Id)/Font"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_protection() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookRangeFormats/$($this.Id)/Protection"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookRangeSort_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphWorkbookRangeBorder_beta { 
    [string]$id
[string]$RawJSON
    [string]$Color
    [string]$SideIndex
    [string]$Style
    [string]$Weight
}
Class GraphWorkbookRangeFill_beta { 
    [string]$id
[string]$RawJSON
    [string]$Color
}
Class GraphWorkbookRangeFont_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$Bold
    [string]$Color
    [System.Nullable[bool]]$Italic
    [string]$Name
    [System.Nullable[double]]$Size
    [string]$Underline
}
Class GraphWorkbookRangeView_beta { 
    [string]$id
[string]$RawJSON
    [GraphJson_beta]$CellAddresses
    [System.Nullable[int]]$ColumnCount
    [GraphJson_beta]$Formulas
    [GraphJson_beta]$FormulasLocal
    [GraphJson_beta]$FormulasR1C1
    [System.Nullable[int]]$Index
    [GraphJson_beta]$NumberFormat
    [System.Nullable[int]]$RowCount
    [GraphJson_beta]$Text
    [GraphJson_beta]$ValueTypes
    [GraphJson_beta]$Values
    WorkbookRangeView_beta() {
        $this.CellAddresses = New-Object GraphJson_beta
        $this.Formulas = New-Object GraphJson_beta
        $this.FormulasLocal = New-Object GraphJson_beta
        $this.FormulasR1C1 = New-Object GraphJson_beta
        $this.NumberFormat = New-Object GraphJson_beta
        $this.Text = New-Object GraphJson_beta
        $this.ValueTypes = New-Object GraphJson_beta
        $this.Values = New-Object GraphJson_beta
    }
    [object]Get_rows() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookRangeViews/$($this.Id)/Rows"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookTableColumn_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$Index
    [string]$Name
    [GraphJson_beta]$Values
    WorkbookTableColumn_beta() {
        $this.Values = New-Object GraphJson_beta
    }
    [object]Get_filter() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WorkbookTableColumns/$($this.Id)/Filter"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWorkbookTableRow_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$Index
    [GraphJson_beta]$Values
    WorkbookTableRow_beta() {
        $this.Values = New-Object GraphJson_beta
    }
}
Class GraphWorkbookTableSort_beta { 
    [string]$id
[string]$RawJSON
    [GraphWorkbookSortField_beta[]]$Fields
    [System.Nullable[bool]]$MatchCase
    [string]$Method
}
Class GraphWorkbookWorksheetProtection_beta { 
    [string]$id
[string]$RawJSON
    [GraphworkbookWorksheetProtectionOptions_beta]$Options
    [System.Nullable[bool]]$Protected
    WorkbookWorksheetProtection_beta() {
        $this.Options = New-Object GraphworkbookWorksheetProtectionOptions_beta
    }
}
Class GraphAttachment_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$Name
    [string]$ContentType
    [System.Nullable[int]]$Size
    [System.Nullable[bool]]$IsInline
}
Class GraphUserConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [object]$binaryData		#Edm.Binary
}
Class GraphSingleValueLegacyExtendedProperty_beta { 
    [string]$id
[string]$RawJSON
    [string]$Value
}
Class GraphMultiValueLegacyExtendedProperty_beta { 
    [string]$id
[string]$RawJSON
    [string[]]$Value
}
Class GraphExtension_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphMention_beta { 
    [string]$id
[string]$RawJSON
    [GraphemailAddress_beta]$Mentioned
    [string]$MentionText
    [string]$ClientReference
    [GraphemailAddress_beta]$CreatedBy
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$ServerCreatedDateTime
    [string]$DeepLink
    [string]$Application
    Mention_beta() {
        $this.Mentioned = New-Object GraphemailAddress_beta
        $this.CreatedBy = New-Object GraphemailAddress_beta
    }
}
Class GraphFileAttachment_beta { 
    [string]$id
[string]$RawJSON
    [string]$ContentId
    [string]$ContentLocation
    [object]$contentBytes		#Edm.Binary
}
Class GraphItemAttachment_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_item() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ItemAttachments/$($this.Id)/Item"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphEventMessage_beta { 
    [string]$id
[string]$RawJSON
    [GraphmeetingMessageType_beta]$MeetingMessageType
    [GraphdateTimeTimeZone_beta]$StartDateTime
    [GraphdateTimeTimeZone_beta]$EndDateTime
    [Graphlocation_beta]$Location
    [GrapheventType_beta]$Type
    [GraphpatternedRecurrence_beta]$Recurrence
    [System.Nullable[bool]]$IsOutOfDate
    [System.Nullable[bool]]$IsAllDay
    EventMessage_beta() {
        $this.MeetingMessageType = New-Object GraphmeetingMessageType_beta
        $this.StartDateTime = New-Object GraphdateTimeTimeZone_beta
        $this.EndDateTime = New-Object GraphdateTimeTimeZone_beta
        $this.Location = New-Object Graphlocation_beta
        $this.Type = New-Object GrapheventType_beta
        $this.Recurrence = New-Object GraphpatternedRecurrence_beta
    }
    [object]Get_event() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "EventMessages/$($this.Id)/Event"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphEventMessageRequest_beta { 
    [string]$id
[string]$RawJSON
    [Graphlocation_beta]$PreviousLocation
    [GraphdateTimeTimeZone_beta]$PreviousStartDateTime
    [GraphdateTimeTimeZone_beta]$PreviousEndDateTime
    [System.Nullable[bool]]$ResponseRequested
    EventMessageRequest_beta() {
        $this.PreviousLocation = New-Object Graphlocation_beta
        $this.PreviousStartDateTime = New-Object GraphdateTimeTimeZone_beta
        $this.PreviousEndDateTime = New-Object GraphdateTimeTimeZone_beta
    }
}
Class GraphReferenceAttachment_beta { 
    [string]$id
[string]$RawJSON
    [string]$SourceUrl
    [GraphreferenceAttachmentProvider_beta]$ProviderType
    [string]$ThumbnailUrl
    [string]$PreviewUrl
    [GraphreferenceAttachmentPermission_beta]$Permission
    [System.Nullable[bool]]$IsFolder
    ReferenceAttachment_beta() {
        $this.ProviderType = New-Object GraphreferenceAttachmentProvider_beta
        $this.Permission = New-Object GraphreferenceAttachmentPermission_beta
    }
}
Class GraphOpenTypeExtension_beta { 
    [string]$id
[string]$RawJSON
    [string]$ExtensionName
}
Class GraphPost_beta { 
    [string]$id
[string]$RawJSON
    [GraphitemBody_beta]$Body
    [System.Nullable[datetime]]$ReceivedDateTime
    [System.Nullable[bool]]$HasAttachments
    [Graphrecipient_beta]$From
    [Graphrecipient_beta]$Sender
    [string]$ConversationThreadId
    [GraphRecipient_beta[]]$NewParticipants
    [string]$ConversationId
    Post_beta() {
        $this.Body = New-Object GraphitemBody_beta
        $this.From = New-Object Graphrecipient_beta
        $this.Sender = New-Object Graphrecipient_beta
    }
    [object]Get_extensions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Posts/$($this.Id)/Extensions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_inReplyTo() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Posts/$($this.Id)/InReplyTo"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_attachments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Posts/$($this.Id)/Attachments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_singleValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Posts/$($this.Id)/SingleValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_multiValueExtendedProperties() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Posts/$($this.Id)/MultiValueExtendedProperties"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_mentions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Posts/$($this.Id)/Mentions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphInferenceClassificationOverride_beta { 
    [string]$id
[string]$RawJSON
    [GraphinferenceClassificationType_beta]$ClassifyAs
    [GraphemailAddress_beta]$SenderEmailAddress
    InferenceClassificationOverride_beta() {
        $this.ClassifyAs = New-Object GraphinferenceClassificationType_beta
        $this.SenderEmailAddress = New-Object GraphemailAddress_beta
    }
}
Class GraphSharedDriveItem_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [GraphidentitySet_beta]$Owner
    SharedDriveItem_beta() {
        $this.Owner = New-Object GraphidentitySet_beta
    }
    [object]Get_root() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "SharedDriveItems/$($this.Id)/Root"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_items() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "SharedDriveItems/$($this.Id)/Items"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphFieldValueSet_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphTrending_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[double]]$Weight
    [GraphresourceVisualization_beta]$ResourceVisualization
    [GraphresourceReference_beta]$ResourceReference
    [System.Nullable[datetime]]$LastModifiedDateTime
    Trending_beta() {
        $this.ResourceVisualization = New-Object GraphresourceVisualization_beta
        $this.ResourceReference = New-Object GraphresourceReference_beta
    }
    [object]Get_resource() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Trendings/$($this.Id)/Resource"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphTaskDetails_beta { 
    [string]$id
[string]$RawJSON
    [string]$Description
    [GraphpreviewType_beta]$PreviewType
    [string]$CompletedBy
    [GraphexternalReferenceCollection_beta]$References
    [GraphchecklistItemCollection_beta]$Checklist
    TaskDetails_beta() {
        $this.PreviewType = New-Object GraphpreviewType_beta
        $this.References = New-Object GraphexternalReferenceCollection_beta
        $this.Checklist = New-Object GraphchecklistItemCollection_beta
    }
}
Class GraphTaskBoardTaskFormat_beta { 
    [string]$id
[string]$RawJSON
    [GraphtaskBoardType_beta]$Type
    [string]$OrderHint
    TaskBoardTaskFormat_beta() {
        $this.Type = New-Object GraphtaskBoardType_beta
    }
}
Class GraphBucket_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [string]$PlanId
    [string]$OrderHint
    [object]Get_tasks() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Buckets/$($this.Id)/Tasks"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphPlanDetails_beta { 
    [string]$id
[string]$RawJSON
    [GraphuserIdCollection_beta]$SharedWith
    [string]$Category0Description
    [string]$Category1Description
    [string]$Category2Description
    [string]$Category3Description
    [string]$Category4Description
    [string]$Category5Description
    PlanDetails_beta() {
        $this.SharedWith = New-Object GraphuserIdCollection_beta
    }
}
Class GraphPlanTaskBoard_beta { 
    [string]$id
[string]$RawJSON
    [GraphtaskBoardType_beta]$Type
    PlanTaskBoard_beta() {
        $this.Type = New-Object GraphtaskBoardType_beta
    }
}
Class GraphNotebook_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$IsDefault
    [GraphUserRole_beta]$UserRole
    [System.Nullable[bool]]$IsShared
    [string]$SectionsUrl
    [string]$SectionGroupsUrl
    [GraphnotebookLinks_beta]$Links
    [string]$Name
    [string]$CreatedBy
    [GraphoneNoteIdentitySet_beta]$CreatedByIdentity
    [string]$LastModifiedBy
    [GraphoneNoteIdentitySet_beta]$LastModifiedByIdentity
    [System.Nullable[datetime]]$LastModifiedTime
    [string]$Self
    [System.Nullable[datetime]]$CreatedTime
    Notebook_beta() {
        $this.UserRole = New-Object GraphUserRole_beta
        $this.Links = New-Object GraphnotebookLinks_beta
        $this.CreatedByIdentity = New-Object GraphoneNoteIdentitySet_beta
        $this.LastModifiedByIdentity = New-Object GraphoneNoteIdentitySet_beta
    }
    [object]Get_sections() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Notebooks/$($this.Id)/Sections"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sectionGroups() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Notebooks/$($this.Id)/SectionGroups"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphSection_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$IsDefault
    [string]$PagesUrl
    [string]$Name
    [string]$CreatedBy
    [GraphoneNoteIdentitySet_beta]$CreatedByIdentity
    [string]$LastModifiedBy
    [GraphoneNoteIdentitySet_beta]$LastModifiedByIdentity
    [System.Nullable[datetime]]$LastModifiedTime
    [string]$Self
    [System.Nullable[datetime]]$CreatedTime
    Section_beta() {
        $this.CreatedByIdentity = New-Object GraphoneNoteIdentitySet_beta
        $this.LastModifiedByIdentity = New-Object GraphoneNoteIdentitySet_beta
    }
    [object]Get_parentNotebook() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Sections/$($this.Id)/ParentNotebook"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_parentSectionGroup() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Sections/$($this.Id)/ParentSectionGroup"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_pages() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Sections/$($this.Id)/Pages"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphSectionGroup_beta { 
    [string]$id
[string]$RawJSON
    [string]$SectionsUrl
    [string]$SectionGroupsUrl
    [string]$Name
    [string]$CreatedBy
    [GraphoneNoteIdentitySet_beta]$CreatedByIdentity
    [string]$LastModifiedBy
    [GraphoneNoteIdentitySet_beta]$LastModifiedByIdentity
    [System.Nullable[datetime]]$LastModifiedTime
    [string]$Self
    [System.Nullable[datetime]]$CreatedTime
    SectionGroup_beta() {
        $this.CreatedByIdentity = New-Object GraphoneNoteIdentitySet_beta
        $this.LastModifiedByIdentity = New-Object GraphoneNoteIdentitySet_beta
    }
    [object]Get_parentNotebook() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "SectionGroups/$($this.Id)/ParentNotebook"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_parentSectionGroup() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "SectionGroups/$($this.Id)/ParentSectionGroup"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sections() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "SectionGroups/$($this.Id)/Sections"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_sectionGroups() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "SectionGroups/$($this.Id)/SectionGroups"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphPage_beta { 
    [string]$id
[string]$RawJSON
    [string]$Title
    [string]$CreatedByAppId
    [GraphpageLinks_beta]$Links
    [string]$ContentUrl
    [object]$content		#Edm.Stream
    [System.Nullable[datetime]]$LastModifiedTime
    [System.Nullable[int]]$Level
    [System.Nullable[int]]$Order
    [string]$Self
    [System.Nullable[datetime]]$CreatedTime
    Page_beta() {
        $this.Links = New-Object GraphpageLinks_beta
    }
    [object]Get_parentSection() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Pages/$($this.Id)/ParentSection"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_parentNotebook() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Pages/$($this.Id)/ParentNotebook"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphResource_beta { 
    [string]$id
[string]$RawJSON
    [string]$Self
    [object]$content		#Edm.Stream
    [string]$ContentUrl
}
Class GraphNotesOperation_beta { 
    [string]$id
[string]$RawJSON
    [string]$Status
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$LastActionDateTime
    [string]$ResourceLocation
    [string]$ResourceId
    [GraphnotesOperationError_beta]$Error
    NotesOperation_beta() {
        $this.Error = New-Object GraphnotesOperationError_beta
    }
}
Class GraphSubscription_beta { 
    [string]$id
[string]$RawJSON
    [string]$Resource
    [string]$ChangeType
    [string]$ClientState
    [string]$NotificationUrl
    [System.Nullable[datetime]]$ExpirationDateTime
}
Class GraphIdentityRiskEvent_beta { 
    [string]$id
[string]$RawJSON
    [string]$UserDisplayName
    [string]$UserPrincipalName
    [System.Nullable[datetime]]$RiskEventDateTime
    [string]$RiskEventType
    [GraphriskLevel_beta]$RiskLevel
    [GraphriskEventStatus_beta]$RiskEventStatus
    [System.Nullable[datetime]]$ClosedDateTime
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$UserId
    IdentityRiskEvent_beta() {
        $this.RiskLevel = New-Object GraphriskLevel_beta
        $this.RiskEventStatus = New-Object GraphriskEventStatus_beta
    }
    [object]Get_impactedUser() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "IdentityRiskEvents/$($this.Id)/ImpactedUser"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphLocatedRiskEvent_beta { 
    [string]$id
[string]$RawJSON
    [GraphsignInLocation_beta]$Location
    [string]$IpAddress
    LocatedRiskEvent_beta() {
        $this.Location = New-Object GraphsignInLocation_beta
    }
}
Class GraphImpossibleTravelRiskEvent_beta { 
    [string]$id
[string]$RawJSON
    [string]$UserAgent
    [string]$DeviceInformation
    [System.Nullable[bool]]$IsAtypicalLocation
    [System.Nullable[datetime]]$PreviousSigninDateTime
    [GraphsignInLocation_beta]$PreviousLocation
    [string]$PreviousIpAddress
    ImpossibleTravelRiskEvent_beta() {
        $this.PreviousLocation = New-Object GraphsignInLocation_beta
    }
}
Class GraphLeakedCredentialsRiskEvent_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphAnonymousIpRiskEvent_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphSuspiciousIpRiskEvent_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphUnfamiliarLocationRiskEvent_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphMalwareRiskEvent_beta { 
    [string]$id
[string]$RawJSON
    [string]$DeviceInformation
    [string]$MalwareName
}
Class GraphPrivilegedRole_beta { 
    [string]$id
[string]$RawJSON
    [string]$Name
    [object]Get_settings() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "PrivilegedRoles/$($this.Id)/Settings"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_assignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "PrivilegedRoles/$($this.Id)/Assignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_summary() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "PrivilegedRoles/$($this.Id)/Summary"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphPrivilegedRoleSettings_beta { 
    [string]$id
[string]$RawJSON
    [object]$minElevationDuration		#Edm.Duration
    [object]$maxElavationDuration		#Edm.Duration
    [object]$elevationDuration		#Edm.Duration
    [System.Nullable[bool]]$NotificationToUserOnElevation
    [System.Nullable[bool]]$TicketingInfoOnElevation
    [System.Nullable[bool]]$MfaOnElevation
    [System.Nullable[bool]]$LastGlobalAdmin
    [System.Nullable[bool]]$IsMfaOnElevationConfigurable
}
Class GraphPrivilegedRoleAssignment_beta { 
    [string]$id
[string]$RawJSON
    [string]$UserId
    [string]$RoleId
    [System.Nullable[bool]]$IsElevated
    [System.Nullable[datetime]]$ExpirationDateTime
    [string]$ResultMessage
    [object]Get_roleInfo() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "PrivilegedRoleAssignments/$($this.Id)/RoleInfo"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphPrivilegedRoleSummary_beta { 
    [string]$id
[string]$RawJSON
    [GraphroleSummaryStatus_beta]$Status
    [System.Nullable[int]]$UsersCount
    [System.Nullable[int]]$ManagedCount
    [System.Nullable[int]]$ElevatedCount
    [System.Nullable[bool]]$MfaEnabled
    PrivilegedRoleSummary_beta() {
        $this.Status = New-Object GraphroleSummaryStatus_beta
    }
}
Class GraphPrivilegedOperationEvent_beta { 
    [string]$id
[string]$RawJSON
    [string]$UserId
    [string]$UserName
    [string]$UserMail
    [string]$RoleId
    [string]$RoleName
    [System.Nullable[datetime]]$ExpirationDateTime
    [System.Nullable[datetime]]$CreationDateTime
    [string]$RequestorId
    [string]$RequestorName
    [string]$TenantId
    [string]$RequestType
    [string]$AdditionalInformation
    [string]$ReferenceKey
    [string]$ReferenceSystem
}
Class GraphPrivilegedSignupStatus_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$IsRegistered
    [GraphsetupStatus_beta]$Status
    PrivilegedSignupStatus_beta() {
        $this.Status = New-Object GraphsetupStatus_beta
    }
}
Class GraphTenantSetupInfo_beta { 
    [string]$id
[string]$RawJSON
    [string]$UserRolesActions
    [System.Nullable[bool]]$FirstTimeSetup
    [string[]]$RelevantRolesSettings
    [System.Nullable[bool]]$SkipSetup
    [GraphsetupStatus_beta]$SetupStatus
    TenantSetupInfo_beta() {
        $this.SetupStatus = New-Object GraphsetupStatus_beta
    }
    [object]Get_defaultRolesSettings() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "TenantSetupInfos/$($this.Id)/DefaultRolesSettings"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphConnector_beta { 
    [string]$id
[string]$RawJSON
    [string]$MachineName
    [string]$ExternalIp
    [GraphconnectorStatus_beta]$Status
    Connector_beta() {
        $this.Status = New-Object GraphconnectorStatus_beta
    }
    [object]Get_memberOf() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Connectors/$($this.Id)/MemberOf"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphInvitation_beta { 
    [string]$id
[string]$RawJSON
    [string]$InvitedUserDisplayName
    [string]$InvitedUserType
    [string]$InvitedUserEmailAddress
    [GraphinvitedUserMessageInfo_beta]$InvitedUserMessageInfo
    [System.Nullable[bool]]$SendInvitationMessage
    [string]$InviteRedirectUrl
    [string]$InviteRedeemUrl
    [string]$Status
    Invitation_beta() {
        $this.InvitedUserMessageInfo = New-Object GraphinvitedUserMessageInfo_beta
    }
    [object]Get_invitedUser() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Invitations/$($this.Id)/InvitedUser"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDeviceAppManagement_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$WindowsStoreForBusinessLastSuccessfulSyncDateTime
    [System.Nullable[bool]]$IsEnabledForWindowsStoreForBusiness
    [string]$WindowsStoreForBusinessLanguage
    [System.Nullable[datetime]]$WindowsStoreForBusinessLastCompletedApplicationSyncTime
    [object]Get_mobileApps() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceAppManagements/$($this.Id)/MobileApps"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_mobileAppCategories() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceAppManagements/$($this.Id)/MobileAppCategories"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMobileApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Description
    [string]$Publisher
    [GraphmimeContent_beta]$LargeIcon
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$LastModifiedDateTime
    [System.Nullable[bool]]$IsFeatured
    [string]$PrivacyInformationUrl
    [string]$InformationUrl
    [string]$Owner
    [string]$Developer
    [string]$Notes
    [System.Nullable[int]]$UploadState
    [GraphmobileAppInstallSummary_beta]$InstallSummary
    MobileApp_beta() {
        $this.LargeIcon = New-Object GraphmimeContent_beta
        $this.InstallSummary = New-Object GraphmobileAppInstallSummary_beta
    }
    [object]Get_categories() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MobileApps/$($this.Id)/Categories"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_groupAssignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MobileApps/$($this.Id)/GroupAssignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deviceStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MobileApps/$($this.Id)/DeviceStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_userStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MobileApps/$($this.Id)/UserStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMobileAppCategory_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
}
Class GraphManagedDeviceMobileAppConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$SettingXml
    [GraphAppConfigurationSettingItem_beta[]]$Settings
    [string[]]$TargetedMobileApps
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Description
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$DisplayName
    [System.Nullable[int]]$Version
    [object]Get_groupAssignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedDeviceMobileAppConfigurations/$($this.Id)/GroupAssignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deviceStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedDeviceMobileAppConfigurations/$($this.Id)/DeviceStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_userStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedDeviceMobileAppConfigurations/$($this.Id)/UserStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMdmAppConfigGroupAssignment_beta { 
    [string]$id
[string]$RawJSON
    [string]$AppConfiguration
    [string]$TargetGroupId
}
Class GraphManagedDeviceMobileAppConfigurationDeviceStatus_beta { 
    [string]$id
[string]$RawJSON
    [GraphappConfigComplianceStatus_beta]$Status
    [System.Nullable[datetime]]$LastReportedDateTime
    ManagedDeviceMobileAppConfigurationDeviceStatus_beta() {
        $this.Status = New-Object GraphappConfigComplianceStatus_beta
    }
}
Class GraphManagedDeviceMobileAppConfigurationUserStatus_beta { 
    [string]$id
[string]$RawJSON
    [GraphappConfigComplianceStatus_beta]$Status
    [System.Nullable[datetime]]$LastReportedDateTime
    ManagedDeviceMobileAppConfigurationUserStatus_beta() {
        $this.Status = New-Object GraphappConfigComplianceStatus_beta
    }
}
Class GraphMobileAppGroupAssignment_beta { 
    [string]$id
[string]$RawJSON
    [string]$TargetGroupId
    [GraphappInstallIntent_beta]$InstallIntent
    MobileAppGroupAssignment_beta() {
        $this.InstallIntent = New-Object GraphappInstallIntent_beta
    }
    [object]Get_app() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MobileAppGroupAssignments/$($this.Id)/App"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMobileAppInstallStatus_beta { 
    [string]$id
[string]$RawJSON
    [string]$DeviceName
    [string]$DeviceId
    [System.Nullable[datetime]]$LastSyncDateTime
    [System.Nullable[int]]$MobileAppInstallStatusValue
    [System.Nullable[int]]$ErrorCode
    [System.Nullable[int]]$DeviceType
    [string]$OsVersion
    [object]Get_app() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MobileAppInstallStatuss/$($this.Id)/App"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphUserAppInstallStatus_beta { 
    [string]$id
[string]$RawJSON
    [string]$UserName
    [System.Nullable[int]]$InstalledDeviceCount
    [System.Nullable[int]]$FailedDeviceCount
    [System.Nullable[int]]$NotInstalledDeviceCount
    [object]Get_app() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "UserAppInstallStatuss/$($this.Id)/App"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deviceStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "UserAppInstallStatuss/$($this.Id)/DeviceStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMobileAppContentFile_beta { 
    [string]$id
[string]$RawJSON
    [string]$AzureStorageUri
    [System.Nullable[bool]]$IsCommitted
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Name
    [System.Nullable[int64]]$Size
    [System.Nullable[int64]]$SizeEncrypted
    [System.Nullable[datetime]]$AzureStorageUriExpirationDateTime
}
Class GraphMobileAppVppGroupAssignment_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$UseDeviceLicensing
}
Class GraphManagedApp_beta { 
    [string]$id
[string]$RawJSON
    [GraphmanagedAppAvailability_beta]$AppAvailability
    [string]$Version
    ManagedApp_beta() {
        $this.AppAvailability = New-Object GraphmanagedAppAvailability_beta
    }
}
Class GraphManagedAndroidStoreApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$PackageId
}
Class GraphManagedIOSStoreApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$BundleId
}
Class GraphMobileLobApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$CommittedContentVersion
    [string]$FileName
    [System.Nullable[int64]]$Size
    [string]$IdentityVersion
    [object]Get_contentVersions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MobileLobApps/$($this.Id)/ContentVersions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMobileAppContent_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_files() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MobileAppContents/$($this.Id)/Files"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphAndroidLobApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$IdentityName
    [GraphandroidMinimumOperatingSystem_beta]$MinimumSupportedOperatingSystem
    [object]$manifest		#Edm.Binary
    AndroidLobApp_beta() {
        $this.MinimumSupportedOperatingSystem = New-Object GraphandroidMinimumOperatingSystem_beta
    }
}
Class GraphIosLobApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$BundleId
    [GraphiosDeviceType_beta]$ApplicableDeviceType
    [GraphiosMinimumOperatingSystem_beta]$MinimumSupportedOperatingSystem
    [System.Nullable[datetime]]$ExpirationDateTime
    [object]$manifest		#Edm.Binary
    IosLobApp_beta() {
        $this.ApplicableDeviceType = New-Object GraphiosDeviceType_beta
        $this.MinimumSupportedOperatingSystem = New-Object GraphiosMinimumOperatingSystem_beta
    }
}
Class GraphWebApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$AppUrl
    [System.Nullable[bool]]$UseManagedBrowser
}
Class GraphWindowsPhone81StoreApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$AppStoreUrl
}
Class GraphWindowsStoreApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$AppStoreUrl
}
Class GraphAndroidStoreApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$AppStoreUrl
    [GraphandroidMinimumOperatingSystem_beta]$MinimumSupportedOperatingSystem
    AndroidStoreApp_beta() {
        $this.MinimumSupportedOperatingSystem = New-Object GraphandroidMinimumOperatingSystem_beta
    }
}
Class GraphIosVppApp_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$UsedLicenseCount
    [System.Nullable[int]]$TotalLicenseCount
    [System.Nullable[datetime]]$ReleaseDateTime
    [string]$AppStoreUrl
    [GraphvppLicensingType_beta]$LicensingType
    [GraphiosDeviceType_beta]$ApplicableDeviceType
    IosVppApp_beta() {
        $this.LicensingType = New-Object GraphvppLicensingType_beta
        $this.ApplicableDeviceType = New-Object GraphiosDeviceType_beta
    }
    [object]Get_vppToken() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "IosVppApps/$($this.Id)/VppToken"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphIosStoreApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$BundleId
    [string]$AppStoreUrl
    [GraphiosDeviceType_beta]$ApplicableDeviceType
    [GraphiosMinimumOperatingSystem_beta]$MinimumSupportedOperatingSystem
    IosStoreApp_beta() {
        $this.ApplicableDeviceType = New-Object GraphiosDeviceType_beta
        $this.MinimumSupportedOperatingSystem = New-Object GraphiosMinimumOperatingSystem_beta
    }
}
Class GraphWindowsStoreForBusinessApp_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$UsedLicenseCount
    [System.Nullable[int]]$TotalLicenseCount
}
Class GraphIosMobileAppConfiguration_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphTermsAndConditions_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$ModifiedDateTime
    [string]$DisplayName
    [string]$Description
    [string]$Title
    [string]$BodyText
    [string]$AcceptanceStatement
    [System.Nullable[int]]$Version
    [object]Get_groupAssignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "TermsAndConditionss/$($this.Id)/GroupAssignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_acceptanceStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "TermsAndConditionss/$($this.Id)/AcceptanceStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphTermsAndConditionsGroupAssignment_beta { 
    [string]$id
[string]$RawJSON
    [string]$TargetGroupId
    [object]Get_termsAndConditions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "TermsAndConditionsGroupAssignments/$($this.Id)/TermsAndConditions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphTermsAndConditionsAcceptanceStatus_beta { 
    [string]$id
[string]$RawJSON
    [string]$UserDisplayName
    [System.Nullable[int]]$AcceptedVersion
    [System.Nullable[datetime]]$AcceptedDateTime
    [object]Get_termsAndConditions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "TermsAndConditionsAcceptanceStatuss/$($this.Id)/TermsAndConditions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDeviceManagement_beta { 
    [string]$id
[string]$RawJSON
    [GraphdeviceManagementSettings_beta]$Settings
    DeviceManagement_beta() {
        $this.Settings = New-Object GraphdeviceManagementSettings_beta
    }
    [object]Get_enrollmentProfiles() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/EnrollmentProfiles"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_importedDeviceIdentities() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/ImportedDeviceIdentities"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_importedAppleDeviceIdentities() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/ImportedAppleDeviceIdentities"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deviceConfigurations() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/DeviceConfigurations"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deviceCompliancePolicies() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/DeviceCompliancePolicies"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_remoteActionAudits() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/RemoteActionAudits"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deviceCategories() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/DeviceCategories"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_exchangeConnectors() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/ExchangeConnectors"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_exchangeOnPremisesPolicy() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/ExchangeOnPremisesPolicy"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_roleDefinitions() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/RoleDefinitions"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_roleAssignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/RoleAssignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_resourceOperations() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/ResourceOperations"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_telecomExpenseManagementPartners() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagements/$($this.Id)/TelecomExpenseManagementPartners"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphEnrollmentProfile_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Description
    [System.Nullable[bool]]$RequiresUserAuthentication
    [string]$ConfigurationEndpointUrl
}
Class GraphImportedDeviceIdentity_beta { 
    [string]$id
[string]$RawJSON
    [string]$ImportedDeviceIdentifier
    [GraphimportedDeviceIdentityType_beta]$ImportedDeviceIdentityType
    [System.Nullable[datetime]]$LastModifiedDateTime
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$LastContactedDateTime
    [string]$Description
    [GraphenrollmentState_beta]$EnrollmentState
    [Graphplatform_beta]$Platform
    ImportedDeviceIdentity_beta() {
        $this.ImportedDeviceIdentityType = New-Object GraphimportedDeviceIdentityType_beta
        $this.EnrollmentState = New-Object GraphenrollmentState_beta
        $this.Platform = New-Object Graphplatform_beta
    }
}
Class GraphImportedAppleDeviceIdentity_beta { 
    [string]$id
[string]$RawJSON
    [string]$SerialNumber
    [string]$RequestedEnrollmentProfileId
    [System.Nullable[datetime]]$RequestedEnrollmentProfileAssignmentDateTime
    [System.Nullable[bool]]$IsSupervised
    [GraphdiscoverySource_beta]$DiscoverySource
    [System.Nullable[datetime]]$CreatedDateTime
    [System.Nullable[datetime]]$LastContactedDateTime
    [string]$Description
    [GraphenrollmentState_beta]$EnrollmentState
    [Graphplatform_beta]$Platform
    ImportedAppleDeviceIdentity_beta() {
        $this.DiscoverySource = New-Object GraphdiscoverySource_beta
        $this.EnrollmentState = New-Object GraphenrollmentState_beta
        $this.Platform = New-Object Graphplatform_beta
    }
}
Class GraphDeviceConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$LastModifiedDateTime
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Description
    [string]$DisplayName
    [System.Nullable[int]]$Version
    [object]Get_groupAssignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceConfigurations/$($this.Id)/GroupAssignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deviceStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceConfigurations/$($this.Id)/DeviceStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_userStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceConfigurations/$($this.Id)/UserStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDeviceCompliancePolicy_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Description
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$DisplayName
    [System.Nullable[int]]$Version
    [object]Get_groupAssignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceCompliancePolicys/$($this.Id)/GroupAssignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_scheduledActionsForRule() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceCompliancePolicys/$($this.Id)/ScheduledActionsForRule"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deviceStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceCompliancePolicys/$($this.Id)/DeviceStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_userStatuses() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceCompliancePolicys/$($this.Id)/UserStatuses"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphRemoteActionAudit_beta { 
    [string]$id
[string]$RawJSON
    [string]$DeviceDisplayName
    [string]$UserName
    [GraphremoteAction_beta]$Action
    [System.Nullable[datetime]]$RequestDateTime
    RemoteActionAudit_beta() {
        $this.Action = New-Object GraphremoteAction_beta
    }
}
Class GraphDeviceCategory_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Description
}
Class GraphDeviceManagementExchangeConnector_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[datetime]]$LastSyncDateTime
    [GraphdeviceManagementExchangeConnectorStatus_beta]$Status
    [string]$PrimarySmtpAddress
    [string]$ServerName
    [GraphdeviceManagementExchangeConnectorType_beta]$ExchangeConnectorType
    DeviceManagementExchangeConnector_beta() {
        $this.Status = New-Object GraphdeviceManagementExchangeConnectorStatus_beta
        $this.ExchangeConnectorType = New-Object GraphdeviceManagementExchangeConnectorType_beta
    }
}
Class GraphDeviceManagementExchangeOnPremisesPolicy_beta { 
    [string]$id
[string]$RawJSON
    [object]$notificationContent		#Edm.Binary
    [GraphdeviceManagementExchangeAccessLevel_beta]$DefaultAccessLevel
    [GraphDeviceManagementExchangeAccessRule_beta[]]$AccessRules
    [GraphDeviceManagementExchangeDeviceClass_beta[]]$KnownDeviceClasses
    DeviceManagementExchangeOnPremisesPolicy_beta() {
        $this.DefaultAccessLevel = New-Object GraphdeviceManagementExchangeAccessLevel_beta
    }
    [object]Get_conditionalAccessSettings() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceManagementExchangeOnPremisesPolicys/$($this.Id)/ConditionalAccessSettings"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphRoleDefinition_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Description
    [GraphRolePermission_beta[]]$Permissions
    [System.Nullable[bool]]$IsBuiltInRoleDefinition
    [object]Get_roleAssignments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "RoleDefinitions/$($this.Id)/RoleAssignments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphRoleAssignment_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Description
    [string[]]$Members
    [string[]]$ScopeMembers
    [object]Get_roleDefinition() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "RoleAssignments/$($this.Id)/RoleDefinition"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphResourceOperation_beta { 
    [string]$id
[string]$RawJSON
    [string]$ResourceName
    [string]$ActionName
    [string]$Description
}
Class GraphTelecomExpenseManagementPartner_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Url
    [System.Nullable[bool]]$AppAuthorized
    [System.Nullable[bool]]$Enabled
    [System.Nullable[datetime]]$LastConnectionDateTime
}
Class GraphImportedDeviceIdentityResult_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$Status
}
Class GraphImportedAppleDeviceIdentityResult_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$Status
}
Class GraphDepEnrollmentProfile_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$SupervisedModeEnabled
    [string]$SupportDepartment
    [System.Nullable[bool]]$PassCodeDisabled
    [System.Nullable[bool]]$IsMandatory
    [System.Nullable[bool]]$LocationDisabled
    [string]$SupportPhoneNumber
    [GraphiTunesPairingMode_beta]$ITunesPairingMode
    [System.Nullable[bool]]$ProfileRemovalDisabled
    [GraphManagementCertificateWithThumbprint_beta[]]$ManagementCertificates
    [System.Nullable[bool]]$RestoreBlocked
    [System.Nullable[bool]]$RestoreFromAndroidDisabled
    [System.Nullable[bool]]$AppleIdDisabled
    [System.Nullable[bool]]$TermsAndConditionsDisabled
    [System.Nullable[bool]]$TouchIdDisabled
    [System.Nullable[bool]]$ApplePayDisabled
    [System.Nullable[bool]]$ZoomDisabled
    [System.Nullable[bool]]$SiriDisabled
    [System.Nullable[bool]]$DiagnosticsDisabled
    [System.Nullable[bool]]$MacOSRegistrationDisabled
    [System.Nullable[bool]]$MacOSFileVaultDisabled
    [System.Nullable[bool]]$AwaitDeviceConfiguredConfirmation
    DepEnrollmentProfile_beta() {
        $this.ITunesPairingMode = New-Object GraphiTunesPairingMode_beta
    }
}
Class GraphCloudPkiSubscription_beta { 
    [string]$id
[string]$RawJSON
    [GraphcloudPkiProvider_beta]$CloudPkiProvider
    [System.Nullable[datetime]]$CreatedDateTime
    [string]$Description
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$DisplayName
    [GraphsyncStatus_beta]$SyncStatus
    [string]$LastSyncError
    [System.Nullable[datetime]]$LastSyncDateTime
    [GraphcloudPkiAdministratorCredentials_beta]$Credentials
    [object]$trustedRootCertificate		#Edm.Binary
    [System.Nullable[int]]$Version
    CloudPkiSubscription_beta() {
        $this.CloudPkiProvider = New-Object GraphcloudPkiProvider_beta
        $this.SyncStatus = New-Object GraphsyncStatus_beta
        $this.Credentials = New-Object GraphcloudPkiAdministratorCredentials_beta
    }
}
Class GraphDeviceConfigurationAssignment_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_deviceConfiguration() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceConfigurationAssignments/$($this.Id)/DeviceConfiguration"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDeviceConfigurationGroupAssignment_beta { 
    [string]$id
[string]$RawJSON
    [string]$TargetGroupId
}
Class GraphDeviceConfigurationDeviceStatus_beta { 
    [string]$id
[string]$RawJSON
    [GraphcomplianceStatus_beta]$Status
    [System.Nullable[datetime]]$LastReportedDateTime
    DeviceConfigurationDeviceStatus_beta() {
        $this.Status = New-Object GraphcomplianceStatus_beta
    }
}
Class GraphDeviceConfigurationUserStatus_beta { 
    [string]$id
[string]$RawJSON
    [GraphcomplianceStatus_beta]$Status
    [System.Nullable[datetime]]$LastReportedDateTime
    DeviceConfigurationUserStatus_beta() {
        $this.Status = New-Object GraphcomplianceStatus_beta
    }
}
Class GraphDeviceCompliancePolicyAssignment_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_deviceCompliancePolicy() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceCompliancePolicyAssignments/$($this.Id)/DeviceCompliancePolicy"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDeviceCompliancePolicyGroupAssignment_beta { 
    [string]$id
[string]$RawJSON
    [string]$TargetGroupId
}
Class GraphDeviceComplianceScheduledActionForRule_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_scheduledActionConfigurations() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceComplianceScheduledActionForRules/$($this.Id)/ScheduledActionConfigurations"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDeviceComplianceDeviceStatus_beta { 
    [string]$id
[string]$RawJSON
    [GraphcomplianceStatus_beta]$Status
    [System.Nullable[datetime]]$LastReportedDateTime
    DeviceComplianceDeviceStatus_beta() {
        $this.Status = New-Object GraphcomplianceStatus_beta
    }
}
Class GraphDeviceComplianceUserStatus_beta { 
    [string]$id
[string]$RawJSON
    [GraphcomplianceStatus_beta]$Status
    [System.Nullable[datetime]]$LastReportedDateTime
    DeviceComplianceUserStatus_beta() {
        $this.Status = New-Object GraphcomplianceStatus_beta
    }
}
Class GraphAndroidCertificateProfileBase_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$RenewalThresholdPercentage
    [GraphsubjectNameFormat_beta]$SubjectNameFormat
    [GraphsubjectAlternativeNameType_beta]$SubjectAlternativeNameType
    [System.Nullable[int]]$CertificateValidityPeriodValue
    [GraphcertificateValidityPeriodScale_beta]$CertificateValidityPeriodScale
    [GraphExtendedKeyUsage_beta[]]$ExtendedKeyUsages
    AndroidCertificateProfileBase_beta() {
        $this.SubjectNameFormat = New-Object GraphsubjectNameFormat_beta
        $this.SubjectAlternativeNameType = New-Object GraphsubjectAlternativeNameType_beta
        $this.CertificateValidityPeriodScale = New-Object GraphcertificateValidityPeriodScale_beta
    }
    [object]Get_rootCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "AndroidCertificateProfileBases/$($this.Id)/RootCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphAndroidTrustedRootCertificate_beta { 
    [string]$id
[string]$RawJSON
    [object]$trustedRootCertificate		#Edm.Binary
    [string]$CertFileName
}
Class GraphAndroidPkcsCertificateProfile_beta { 
    [string]$id
[string]$RawJSON
    [string]$CertificationAuthority
    [string]$CertificationAuthorityName
    [string]$CertificateTemplateName
}
Class GraphAndroidScepCertificateProfile_beta { 
    [string]$id
[string]$RawJSON
    [string[]]$ScepServerUrls
    [GraphkeyUsages_beta]$KeyUsage
    [GraphkeySize_beta]$KeySize
    [GraphhashAlgorithms_beta]$HashAlgorithm
    AndroidScepCertificateProfile_beta() {
        $this.KeyUsage = New-Object GraphkeyUsages_beta
        $this.KeySize = New-Object GraphkeySize_beta
        $this.HashAlgorithm = New-Object GraphhashAlgorithms_beta
    }
}
Class GraphAndroidCustomConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GraphOmaSetting_beta[]]$OmaSettings
}
Class GraphAndroidEasEmailProfileConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$AccountName
    [GrapheasAuthenticationMethod_beta]$AuthenticationMethod
    [System.Nullable[bool]]$SyncCalendar
    [System.Nullable[bool]]$SyncContacts
    [System.Nullable[bool]]$SyncTasks
    [System.Nullable[bool]]$SyncNotes
    [GraphemailSyncDuration_beta]$DurationOfEmailToSync
    [GraphuserEmailSource_beta]$EmailAddressSource
    [GraphemailSyncSchedule_beta]$EmailSyncSchedule
    [string]$HostName
    [System.Nullable[bool]]$RequireSmime
    [System.Nullable[bool]]$RequireSsl
    [GraphandroidUsernameSource_beta]$UsernameSource
    AndroidEasEmailProfileConfiguration_beta() {
        $this.AuthenticationMethod = New-Object GrapheasAuthenticationMethod_beta
        $this.DurationOfEmailToSync = New-Object GraphemailSyncDuration_beta
        $this.EmailAddressSource = New-Object GraphuserEmailSource_beta
        $this.EmailSyncSchedule = New-Object GraphemailSyncSchedule_beta
        $this.UsernameSource = New-Object GraphandroidUsernameSource_beta
    }
    [object]Get_identityCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "AndroidEasEmailProfileConfigurations/$($this.Id)/IdentityCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_smimeSigningCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "AndroidEasEmailProfileConfigurations/$($this.Id)/SmimeSigningCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphAndroidForWorkCustomConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GraphOmaSetting_beta[]]$OmaSettings
}
Class GraphAndroidForWorkGeneralDeviceConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$PasswordBlockFingerprintUnlock
    [System.Nullable[bool]]$PasswordBlockTrustAgents
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeScreenTimeout
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [System.Nullable[int]]$PasswordSignInFailureCountBeforeFactoryReset
    [GraphandroidForWorkRequiredPasswordType_beta]$PasswordRequiredType
    [GraphandroidForWorkCrossProfileDataSharingType_beta]$WorkProfileDataSharingType
    [System.Nullable[bool]]$WorkProfileBlockNotificationsWhileDeviceLocked
    [GraphandroidForWorkDefaultAppPermissionPolicyType_beta]$WorkProfileDefaultAppPermissionPolicy
    AndroidForWorkGeneralDeviceConfiguration_beta() {
        $this.PasswordRequiredType = New-Object GraphandroidForWorkRequiredPasswordType_beta
        $this.WorkProfileDataSharingType = New-Object GraphandroidForWorkCrossProfileDataSharingType_beta
        $this.WorkProfileDefaultAppPermissionPolicy = New-Object GraphandroidForWorkDefaultAppPermissionPolicyType_beta
    }
}
Class GraphAndroidGeneralDeviceConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$AppsBlockClipboardSharing
    [System.Nullable[bool]]$AppsBlockCopyPaste
    [System.Nullable[bool]]$AppsBlockYouTube
    [System.Nullable[bool]]$BluetoothBlocked
    [System.Nullable[bool]]$CameraBlocked
    [System.Nullable[bool]]$CellularBlockDataRoaming
    [System.Nullable[bool]]$CellularBlockMessaging
    [System.Nullable[bool]]$CellularBlockVoiceRoaming
    [System.Nullable[bool]]$CellularBlockWiFiTethering
    [GraphAppListItem_beta[]]$CompliantAppsList
    [GraphappListType_beta]$CompliantAppListType
    [System.Nullable[bool]]$DiagnosticDataBlockSubmission
    [System.Nullable[bool]]$LocationServicesBlocked
    [System.Nullable[bool]]$GoogleAccountBlockAutoSync
    [System.Nullable[bool]]$GooglePlayStoreBlocked
    [System.Nullable[bool]]$KioskModeBlockSleepButton
    [System.Nullable[bool]]$KioskModeBlockVolumeButtons
    [string]$KioskModeManagedAppId
    [System.Nullable[bool]]$NfcBlocked
    [System.Nullable[bool]]$PasswordBlockFingerprintUnlock
    [System.Nullable[bool]]$PasswordBlockTrustAgents
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeScreenTimeout
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [System.Nullable[int]]$PasswordSignInFailureCountBeforeFactoryReset
    [GraphandroidRequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[bool]]$PasswordRequired
    [System.Nullable[bool]]$PowerOffBlocked
    [System.Nullable[bool]]$FactoryResetBlocked
    [System.Nullable[bool]]$ScreenCaptureBlocked
    [System.Nullable[bool]]$DeviceSharingBlocked
    [System.Nullable[bool]]$StorageBlockGoogleBackup
    [System.Nullable[bool]]$StorageBlockRemovableStorage
    [System.Nullable[bool]]$StorageRequireDeviceEncryption
    [System.Nullable[bool]]$StorageRequireRemovableStorageEncryption
    [System.Nullable[bool]]$VoiceAssistantBlocked
    [System.Nullable[bool]]$VoiceDialingBlocked
    [System.Nullable[bool]]$WebBrowserAllowPopups
    [System.Nullable[bool]]$WebBrowserBlockAutofill
    [System.Nullable[bool]]$WebBrowserBlockJavaScript
    [System.Nullable[bool]]$WebBrowserBlocked
    [GraphwebBrowserCookieSettings_beta]$WebBrowserCookieSettings
    [System.Nullable[bool]]$WiFiBlocked
    AndroidGeneralDeviceConfiguration_beta() {
        $this.CompliantAppListType = New-Object GraphappListType_beta
        $this.PasswordRequiredType = New-Object GraphandroidRequiredPasswordType_beta
        $this.WebBrowserCookieSettings = New-Object GraphwebBrowserCookieSettings_beta
    }
}
Class GraphAndroidVpnConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$ConnectionName
    [GraphandroidVpnConnectionType_beta]$ConnectionType
    [string]$Role
    [string]$Realm
    [GraphVpnServer_beta[]]$Servers
    [string]$Fingerprint
    [GraphKeyValue_beta[]]$CustomData
    [GraphvpnAuthenticationMethod_beta]$AuthenticationMethod
    AndroidVpnConfiguration_beta() {
        $this.ConnectionType = New-Object GraphandroidVpnConnectionType_beta
        $this.AuthenticationMethod = New-Object GraphvpnAuthenticationMethod_beta
    }
    [object]Get_identityCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "AndroidVpnConfigurations/$($this.Id)/IdentityCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphAndroidWiFiConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$NetworkName
    [string]$Ssid
    [System.Nullable[bool]]$ConnectAutomatically
    [System.Nullable[bool]]$ConnectWhenNetworkNameIsHidden
    [GraphandroidWiFiSecurityType_beta]$WiFiSecurityType
    AndroidWiFiConfiguration_beta() {
        $this.WiFiSecurityType = New-Object GraphandroidWiFiSecurityType_beta
    }
}
Class GraphAndroidEnterpriseWiFiConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GraphandroidEapType_beta]$EapType
    [GraphwiFiAuthenticationMethod_beta]$AuthenticationMethod
    [GraphnonEapAuthenticationMethodForEapTtlsType_beta]$NonEapAuthenticationMethodForEapTtls
    [GraphnonEapAuthenticationMethodForPeap_beta]$NonEapAuthenticationMethodForPeap
    [string]$EnableOuterIdentityPrivacy
    AndroidEnterpriseWiFiConfiguration_beta() {
        $this.EapType = New-Object GraphandroidEapType_beta
        $this.AuthenticationMethod = New-Object GraphwiFiAuthenticationMethod_beta
        $this.NonEapAuthenticationMethodForEapTtls = New-Object GraphnonEapAuthenticationMethodForEapTtlsType_beta
        $this.NonEapAuthenticationMethodForPeap = New-Object GraphnonEapAuthenticationMethodForPeap_beta
    }
    [object]Get_rootCertificateForServerValidation() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "AndroidEnterpriseWiFiConfigurations/$($this.Id)/RootCertificateForServerValidation"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_identityCertificateForClientAuthentication() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "AndroidEnterpriseWiFiConfigurations/$($this.Id)/IdentityCertificateForClientAuthentication"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphIosCertificateProfileBase_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$RenewalThresholdPercentage
    [GraphappleSubjectNameFormat_beta]$SubjectNameFormat
    [GraphsubjectAlternativeNameType_beta]$SubjectAlternativeNameType
    [System.Nullable[int]]$CertificateValidityPeriodValue
    [GraphcertificateValidityPeriodScale_beta]$CertificateValidityPeriodScale
    IosCertificateProfileBase_beta() {
        $this.SubjectNameFormat = New-Object GraphappleSubjectNameFormat_beta
        $this.SubjectAlternativeNameType = New-Object GraphsubjectAlternativeNameType_beta
        $this.CertificateValidityPeriodScale = New-Object GraphcertificateValidityPeriodScale_beta
    }
}
Class GraphIosPkcsCertificateProfile_beta { 
    [string]$id
[string]$RawJSON
    [string]$CertificationAuthority
    [string]$CertificationAuthorityName
    [string]$CertificateTemplateName
}
Class GraphIosScepCertificateProfile_beta { 
    [string]$id
[string]$RawJSON
    [string[]]$ScepServerUrls
    [string]$SubjectNameFormatString
    [GraphkeyUsages_beta]$KeyUsage
    [GraphkeySize_beta]$KeySize
    [GraphExtendedKeyUsage_beta[]]$ExtendedKeyUsages
    IosScepCertificateProfile_beta() {
        $this.KeyUsage = New-Object GraphkeyUsages_beta
        $this.KeySize = New-Object GraphkeySize_beta
    }
    [object]Get_rootCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "IosScepCertificateProfiles/$($this.Id)/RootCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphIosTrustedRootCertificate_beta { 
    [string]$id
[string]$RawJSON
    [object]$trustedRootCertificate		#Edm.Binary
    [string]$CertFileName
}
Class GraphIosCustomConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$PayloadName
    [string]$PayloadFileName
    [object]$payload		#Edm.Binary
}
Class GraphIosEasEmailProfileConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$AccountName
    [GrapheasAuthenticationMethod_beta]$AuthenticationMethod
    [System.Nullable[bool]]$BlockMovingMessagesToOtherEmailAccounts
    [System.Nullable[bool]]$BlockSendingEmailFromThirdPartyApps
    [System.Nullable[bool]]$BlockSyncingRecentlyUsedEmailAddresses
    [GraphemailSyncDuration_beta]$DurationOfEmailToSync
    [GraphuserEmailSource_beta]$EmailAddressSource
    [string]$HostName
    [System.Nullable[bool]]$RequireSmime
    [System.Nullable[bool]]$RequireSsl
    [GraphuserEmailSource_beta]$UsernameSource
    IosEasEmailProfileConfiguration_beta() {
        $this.AuthenticationMethod = New-Object GrapheasAuthenticationMethod_beta
        $this.DurationOfEmailToSync = New-Object GraphemailSyncDuration_beta
        $this.EmailAddressSource = New-Object GraphuserEmailSource_beta
        $this.UsernameSource = New-Object GraphuserEmailSource_beta
    }
    [object]Get_identityCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "IosEasEmailProfileConfigurations/$($this.Id)/IdentityCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_smimeSigningCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "IosEasEmailProfileConfigurations/$($this.Id)/SmimeSigningCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphIosGeneralDeviceConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$AccountBlockModification
    [System.Nullable[bool]]$ActivationLockAllowWhenSupervised
    [System.Nullable[bool]]$AirDropBlocked
    [System.Nullable[bool]]$AirDropForceUnmanagedDropTarget
    [System.Nullable[bool]]$AirPlayForcePairingPasswordForOutgoingRequests
    [System.Nullable[bool]]$AppleWatchBlockPairing
    [System.Nullable[bool]]$AppleWatchForceWristDetection
    [System.Nullable[bool]]$AppleNewsBlocked
    [GraphAppListItem_beta[]]$AppsVisibilityList
    [GraphappListType_beta]$AppsVisibilityListType
    [System.Nullable[bool]]$AppStoreBlockAutomaticDownloads
    [System.Nullable[bool]]$AppStoreBlocked
    [System.Nullable[bool]]$AppStoreBlockInAppPurchases
    [System.Nullable[bool]]$AppStoreBlockUIAppInstallation
    [System.Nullable[bool]]$AppStoreRequirePassword
    [System.Nullable[bool]]$BluetoothBlockModification
    [System.Nullable[bool]]$CameraBlocked
    [System.Nullable[bool]]$CellularBlockDataRoaming
    [System.Nullable[bool]]$CellularBlockGlobalBackgroundFetchWhileRoaming
    [System.Nullable[bool]]$CellularBlockPerAppDataModification
    [System.Nullable[bool]]$CellularBlockVoiceRoaming
    [System.Nullable[bool]]$CertificatesBlockUntrustedTlsCertificates
    [System.Nullable[bool]]$ClassroomAppBlockRemoteScreenObservation
    [GraphAppListItem_beta[]]$CompliantAppsList
    [GraphappListType_beta]$CompliantAppListType
    [System.Nullable[bool]]$ConfigurationProfileBlockChanges
    [System.Nullable[bool]]$DefinitionLookupBlocked
    [System.Nullable[bool]]$DeviceBlockEnableRestrictions
    [System.Nullable[bool]]$DeviceBlockEraseContentAndSettings
    [System.Nullable[bool]]$DeviceBlockNameModification
    [System.Nullable[bool]]$DiagnosticDataBlockSubmission
    [System.Nullable[bool]]$DiagnosticDataBlockSubmissionModification
    [System.Nullable[bool]]$DocumentsBlockManagedDocumentsInUnmanagedApps
    [System.Nullable[bool]]$DocumentsBlockUnmanagedDocumentsInManagedApps
    [string[]]$EmailInDomainSuffixes
    [System.Nullable[bool]]$EnterpriseAppBlockTrust
    [System.Nullable[bool]]$EnterpriseAppBlockTrustModification
    [System.Nullable[bool]]$FaceTimeBlocked
    [System.Nullable[bool]]$FindMyFriendsBlocked
    [System.Nullable[bool]]$GamingBlockGameCenterFriends
    [System.Nullable[bool]]$GamingBlockMultiplayer
    [System.Nullable[bool]]$GameCenterBlocked
    [System.Nullable[bool]]$HostPairingBlocked
    [System.Nullable[bool]]$IBooksStoreBlocked
    [System.Nullable[bool]]$IBooksStoreBlockErotica
    [System.Nullable[bool]]$ICloudBlockActivityContinuation
    [System.Nullable[bool]]$ICloudBlockBackup
    [System.Nullable[bool]]$ICloudBlockDocumentSync
    [System.Nullable[bool]]$ICloudBlockManagedAppsSync
    [System.Nullable[bool]]$ICloudBlockPhotoLibrary
    [System.Nullable[bool]]$ICloudBlockPhotoStreamSync
    [System.Nullable[bool]]$ICloudBlockSharedPhotoStream
    [System.Nullable[bool]]$ICloudRequireEncryptedBackup
    [System.Nullable[bool]]$ITunesBlockExplicitContent
    [System.Nullable[bool]]$ITunesBlockMusicService
    [System.Nullable[bool]]$ITunesBlockRadio
    [System.Nullable[bool]]$KeyboardBlockAutoCorrect
    [System.Nullable[bool]]$KeyboardBlockPredictive
    [System.Nullable[bool]]$KeyboardBlockShortcuts
    [System.Nullable[bool]]$KeyboardBlockSpellCheck
    [System.Nullable[bool]]$KioskModeAllowAssistiveSpeak
    [System.Nullable[bool]]$KioskModeAllowAssistiveTouchSettings
    [System.Nullable[bool]]$KioskModeAllowAutoLock
    [System.Nullable[bool]]$KioskModeAllowColorInversionSettings
    [System.Nullable[bool]]$KioskModeAllowRingerSwitch
    [System.Nullable[bool]]$KioskModeAllowScreenRotation
    [System.Nullable[bool]]$KioskModeAllowSleepButton
    [System.Nullable[bool]]$KioskModeAllowTouchscreen
    [System.Nullable[bool]]$KioskModeAllowVoiceOverSettings
    [System.Nullable[bool]]$KioskModeAllowVolumeButtons
    [System.Nullable[bool]]$KioskModeAllowZoomSettings
    [string]$KioskModeAppStoreUrl
    [System.Nullable[bool]]$KioskModeRequireAssistiveTouch
    [System.Nullable[bool]]$KioskModeRequireColorInversion
    [System.Nullable[bool]]$KioskModeRequireMonoAudio
    [System.Nullable[bool]]$KioskModeRequireVoiceOver
    [System.Nullable[bool]]$KioskModeRequireZoom
    [string]$KioskModeManagedAppId
    [System.Nullable[bool]]$LockScreenBlockControlCenter
    [System.Nullable[bool]]$LockScreenBlockNotificationView
    [System.Nullable[bool]]$LockScreenBlockPassbook
    [System.Nullable[bool]]$LockScreenBlockTodayView
    [GraphmediaContentRatingAustralia_beta]$MediaContentRatingAustralia
    [GraphmediaContentRatingCanada_beta]$MediaContentRatingCanada
    [GraphmediaContentRatingFrance_beta]$MediaContentRatingFrance
    [GraphmediaContentRatingGermany_beta]$MediaContentRatingGermany
    [GraphmediaContentRatingIreland_beta]$MediaContentRatingIreland
    [GraphmediaContentRatingJapan_beta]$MediaContentRatingJapan
    [GraphmediaContentRatingNewZealand_beta]$MediaContentRatingNewZealand
    [GraphmediaContentRatingUnitedKingdom_beta]$MediaContentRatingUnitedKingdom
    [GraphmediaContentRatingUnitedStates_beta]$MediaContentRatingUnitedStates
    [GraphratingAppsType_beta]$MediaContentRatingApps
    [System.Nullable[bool]]$MessagesBlocked
    [System.Nullable[bool]]$NotificationsBlockSettingsModification
    [System.Nullable[bool]]$PasscodeBlockFingerprintUnlock
    [System.Nullable[bool]]$PasscodeBlockModification
    [System.Nullable[bool]]$PasscodeBlockSimple
    [System.Nullable[int]]$PasscodeExpirationDays
    [System.Nullable[int]]$PasscodeMinimumLength
    [System.Nullable[int]]$PasscodeMinutesOfInactivityBeforeLock
    [System.Nullable[int]]$PasscodeMinutesOfInactivityBeforeScreenTimeout
    [System.Nullable[int]]$PasscodeMinimumCharacterSetCount
    [System.Nullable[int]]$PasscodePreviousPasscodeBlockCount
    [System.Nullable[int]]$PasscodeSignInFailureCountBeforeWipe
    [GraphrequiredPasswordType_beta]$PasscodeRequiredType
    [System.Nullable[bool]]$PasscodeRequired
    [System.Nullable[bool]]$PodcastsBlocked
    [System.Nullable[bool]]$SafariBlockAutofill
    [System.Nullable[bool]]$SafariBlockJavaScript
    [System.Nullable[bool]]$SafariBlockPopups
    [System.Nullable[bool]]$SafariBlocked
    [GraphwebBrowserCookieSettings_beta]$SafariCookieSettings
    [string[]]$SafariManagedDomains
    [string[]]$SafariPasswordAutoFillDomains
    [System.Nullable[bool]]$SafariRequireFraudWarning
    [System.Nullable[bool]]$ScreenCaptureBlocked
    [System.Nullable[bool]]$SiriBlocked
    [System.Nullable[bool]]$SiriBlockedWhenLocked
    [System.Nullable[bool]]$SiriBlockUserGeneratedContent
    [System.Nullable[bool]]$SiriRequireProfanityFilter
    [System.Nullable[bool]]$SpotlightBlockInternetResults
    [System.Nullable[bool]]$VoiceDialingBlocked
    [System.Nullable[bool]]$WallpaperBlockModification
    IosGeneralDeviceConfiguration_beta() {
        $this.AppsVisibilityListType = New-Object GraphappListType_beta
        $this.CompliantAppListType = New-Object GraphappListType_beta
        $this.MediaContentRatingAustralia = New-Object GraphmediaContentRatingAustralia_beta
        $this.MediaContentRatingCanada = New-Object GraphmediaContentRatingCanada_beta
        $this.MediaContentRatingFrance = New-Object GraphmediaContentRatingFrance_beta
        $this.MediaContentRatingGermany = New-Object GraphmediaContentRatingGermany_beta
        $this.MediaContentRatingIreland = New-Object GraphmediaContentRatingIreland_beta
        $this.MediaContentRatingJapan = New-Object GraphmediaContentRatingJapan_beta
        $this.MediaContentRatingNewZealand = New-Object GraphmediaContentRatingNewZealand_beta
        $this.MediaContentRatingUnitedKingdom = New-Object GraphmediaContentRatingUnitedKingdom_beta
        $this.MediaContentRatingUnitedStates = New-Object GraphmediaContentRatingUnitedStates_beta
        $this.MediaContentRatingApps = New-Object GraphratingAppsType_beta
        $this.PasscodeRequiredType = New-Object GraphrequiredPasswordType_beta
        $this.SafariCookieSettings = New-Object GraphwebBrowserCookieSettings_beta
    }
}
Class GraphIosWiFiConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$NetworkName
    [string]$Ssid
    [System.Nullable[bool]]$ConnectAutomatically
    [System.Nullable[bool]]$ConnectWhenNetworkNameIsHidden
    [GraphwiFiSecurityType_beta]$WiFiSecurityType
    [GraphwiFiProxySetting_beta]$ProxySettings
    [string]$ProxyManualAddress
    [System.Nullable[int]]$ProxyManualPort
    [string]$ProxyAutomaticConfigurationUrl
    IosWiFiConfiguration_beta() {
        $this.WiFiSecurityType = New-Object GraphwiFiSecurityType_beta
        $this.ProxySettings = New-Object GraphwiFiProxySetting_beta
    }
}
Class GraphIosEnterpriseWiFiConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GrapheapType_beta]$EapType
    [GrapheapFastConfiguration_beta]$EapFastConfiguration
    [string[]]$TrustedServerCertificateNames
    [GraphwiFiAuthenticationMethod_beta]$AuthenticationMethod
    [GraphnonEapAuthenticationMethodForEapTtlsType_beta]$NonEapAuthenticationMethodForEapTtls
    [string]$EnableOuterIdentityPrivacy
    IosEnterpriseWiFiConfiguration_beta() {
        $this.EapType = New-Object GrapheapType_beta
        $this.EapFastConfiguration = New-Object GrapheapFastConfiguration_beta
        $this.AuthenticationMethod = New-Object GraphwiFiAuthenticationMethod_beta
        $this.NonEapAuthenticationMethodForEapTtls = New-Object GraphnonEapAuthenticationMethodForEapTtlsType_beta
    }
    [object]Get_rootCertificatesForServerValidation() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "IosEnterpriseWiFiConfigurations/$($this.Id)/RootCertificatesForServerValidation"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_identityCertificateForClientAuthentication() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "IosEnterpriseWiFiConfigurations/$($this.Id)/IdentityCertificateForClientAuthentication"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMacOSCertificateProfileBase_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$RenewalThresholdPercentage
    [GraphappleSubjectNameFormat_beta]$SubjectNameFormat
    [GraphsubjectAlternativeNameType_beta]$SubjectAlternativeNameType
    [System.Nullable[int]]$CertificateValidityPeriodValue
    [GraphcertificateValidityPeriodScale_beta]$CertificateValidityPeriodScale
    MacOSCertificateProfileBase_beta() {
        $this.SubjectNameFormat = New-Object GraphappleSubjectNameFormat_beta
        $this.SubjectAlternativeNameType = New-Object GraphsubjectAlternativeNameType_beta
        $this.CertificateValidityPeriodScale = New-Object GraphcertificateValidityPeriodScale_beta
    }
}
Class GraphMacOSScepCertificateProfile_beta { 
    [string]$id
[string]$RawJSON
    [string[]]$ScepServerUrls
    [string]$SubjectNameFormatString
    [GraphkeyUsages_beta]$KeyUsage
    [GraphkeySize_beta]$KeySize
    [GraphhashAlgorithms_beta]$HashAlgorithm
    [GraphExtendedKeyUsage_beta[]]$ExtendedKeyUsages
    MacOSScepCertificateProfile_beta() {
        $this.KeyUsage = New-Object GraphkeyUsages_beta
        $this.KeySize = New-Object GraphkeySize_beta
        $this.HashAlgorithm = New-Object GraphhashAlgorithms_beta
    }
    [object]Get_rootCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MacOSScepCertificateProfiles/$($this.Id)/RootCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMacOSTrustedRootCertificate_beta { 
    [string]$id
[string]$RawJSON
    [object]$trustedRootCertificate		#Edm.Binary
    [string]$CertFileName
}
Class GraphMacOSCustomConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$PayloadName
    [string]$PayloadFileName
    [object]$payload		#Edm.Binary
}
Class GraphMacOSGeneralDeviceConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GraphAppListItem_beta[]]$CompliantAppsList
    [GraphappListType_beta]$CompliantAppListType
    [string[]]$EmailInDomainSuffixes
    [System.Nullable[bool]]$PasswordBlockSimple
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumCharacterSetCount
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeLock
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeScreenTimeout
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[bool]]$PasswordRequired
    MacOSGeneralDeviceConfiguration_beta() {
        $this.CompliantAppListType = New-Object GraphappListType_beta
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
    }
}
Class GraphMacOSWiFiConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$NetworkName
    [string]$Ssid
    [System.Nullable[bool]]$ConnectAutomatically
    [System.Nullable[bool]]$ConnectWhenNetworkNameIsHidden
    [GraphwiFiSecurityType_beta]$WiFiSecurityType
    [GraphwiFiProxySetting_beta]$ProxySettings
    [string]$ProxyManualAddress
    [System.Nullable[int]]$ProxyManualPort
    [string]$ProxyAutomaticConfigurationUrl
    MacOSWiFiConfiguration_beta() {
        $this.WiFiSecurityType = New-Object GraphwiFiSecurityType_beta
        $this.ProxySettings = New-Object GraphwiFiProxySetting_beta
    }
}
Class GraphMacOSEnterpriseWiFiConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GrapheapType_beta]$EapType
    [GrapheapFastConfiguration_beta]$EapFastConfiguration
    [string[]]$TrustedServerCertificateNames
    [GraphwiFiAuthenticationMethod_beta]$AuthenticationMethod
    [GraphnonEapAuthenticationMethodForEapTtlsType_beta]$NonEapAuthenticationMethodForEapTtls
    [string]$EnableOuterIdentityPrivacy
    MacOSEnterpriseWiFiConfiguration_beta() {
        $this.EapType = New-Object GrapheapType_beta
        $this.EapFastConfiguration = New-Object GrapheapFastConfiguration_beta
        $this.AuthenticationMethod = New-Object GraphwiFiAuthenticationMethod_beta
        $this.NonEapAuthenticationMethodForEapTtls = New-Object GraphnonEapAuthenticationMethodForEapTtlsType_beta
    }
    [object]Get_rootCertificateForServerValidation() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MacOSEnterpriseWiFiConfigurations/$($this.Id)/RootCertificateForServerValidation"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_identityCertificateForClientAuthentication() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MacOSEnterpriseWiFiConfigurations/$($this.Id)/IdentityCertificateForClientAuthentication"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphAppleVpnConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$ConnectionName
    [GraphappleVpnConnectionType_beta]$ConnectionType
    [string]$LoginGroupOrDomain
    [string]$Role
    [string]$Realm
    [GraphvpnServer_beta]$Server
    [string]$Identifier
    [GraphKeyValue_beta[]]$CustomData
    [System.Nullable[bool]]$EnableSplitTunneling
    [GraphvpnAuthenticationMethod_beta]$AuthenticationMethod
    [System.Nullable[bool]]$EnablePerApp
    [string[]]$SafariDomains
    [GraphVpnOnDemandRule_beta[]]$OnDemandRules
    [GraphvpnProxyServer_beta]$ProxyServer
    AppleVpnConfiguration_beta() {
        $this.ConnectionType = New-Object GraphappleVpnConnectionType_beta
        $this.Server = New-Object GraphvpnServer_beta
        $this.AuthenticationMethod = New-Object GraphvpnAuthenticationMethod_beta
        $this.ProxyServer = New-Object GraphvpnProxyServer_beta
    }
}
Class GraphIosVpnConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_identityCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "IosVpnConfigurations/$($this.Id)/IdentityCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMacOSVpnConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [object]Get_identityCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "MacOSVpnConfigurations/$($this.Id)/IdentityCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWindows10CustomConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GraphOmaSetting_beta[]]$OmaSettings
}
Class GraphWindows10EasEmailProfileConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$AccountName
    [System.Nullable[bool]]$SyncCalendar
    [System.Nullable[bool]]$SyncContacts
    [System.Nullable[bool]]$SyncTasks
    [GraphemailSyncDuration_beta]$DurationOfEmailToSync
    [GraphuserEmailSource_beta]$EmailAddressSource
    [GraphemailSyncSchedule_beta]$EmailSyncSchedule
    [string]$HostName
    [System.Nullable[bool]]$RequireSsl
    [GraphuserEmailSource_beta]$UsernameSource
    Windows10EasEmailProfileConfiguration_beta() {
        $this.DurationOfEmailToSync = New-Object GraphemailSyncDuration_beta
        $this.EmailAddressSource = New-Object GraphuserEmailSource_beta
        $this.EmailSyncSchedule = New-Object GraphemailSyncSchedule_beta
        $this.UsernameSource = New-Object GraphuserEmailSource_beta
    }
}
Class GraphWindows81WifiImportConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$PayloadFileName
    [string]$ProfileName
    [object]$payload		#Edm.Binary
}
Class GraphWindows81TrustedRootCertificate_beta { 
    [string]$id
[string]$RawJSON
    [object]$trustedRootCertificate		#Edm.Binary
    [string]$CertFileName
    [GraphcertificateDestinationStore_beta]$DestinationStore
    Windows81TrustedRootCertificate_beta() {
        $this.DestinationStore = New-Object GraphcertificateDestinationStore_beta
    }
}
Class GraphWindowsPhone81CustomConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GraphOmaSetting_beta[]]$OmaSettings
}
Class GraphWindowsPhone81TrustedRootCertificate_beta { 
    [string]$id
[string]$RawJSON
    [object]$trustedRootCertificate		#Edm.Binary
    [string]$CertFileName
}
Class GraphWindowsPhoneEASEmailProfileConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$AccountName
    [System.Nullable[bool]]$ApplyOnlyToWindowsPhone81
    [System.Nullable[bool]]$SyncCalendar
    [System.Nullable[bool]]$SyncContacts
    [System.Nullable[bool]]$SyncTasks
    [GraphemailSyncDuration_beta]$DurationOfEmailToSync
    [GraphuserEmailSource_beta]$EmailAddressSource
    [GraphemailSyncSchedule_beta]$EmailSyncSchedule
    [string]$HostName
    [System.Nullable[bool]]$RequireSsl
    [GraphuserEmailSource_beta]$UsernameSource
    WindowsPhoneEASEmailProfileConfiguration_beta() {
        $this.DurationOfEmailToSync = New-Object GraphemailSyncDuration_beta
        $this.EmailAddressSource = New-Object GraphuserEmailSource_beta
        $this.EmailSyncSchedule = New-Object GraphemailSyncSchedule_beta
        $this.UsernameSource = New-Object GraphuserEmailSource_beta
    }
}
Class GraphWindowsUpdateForBusinessConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GraphwindowsDeliveryOptimizationMode_beta]$DeliveryOptimizationMode
    [GraphprereleaseFeatures_beta]$PrereleaseFeatures
    [GraphautomaticUpdateMode_beta]$AutomaticUpdateMode
    [System.Nullable[bool]]$MicrosoftUpdateServiceAllowed
    [System.Nullable[bool]]$DriversExcluded
    [GraphwindowsUpdateInstallScheduleType_beta]$InstallationSchedule
    [System.Nullable[int]]$QualityUpdatesDeferralPeriodInDays
    [System.Nullable[int]]$FeatureUpdatesDeferralPeriodInDays
    [System.Nullable[bool]]$QualityUpdatesPaused
    [System.Nullable[bool]]$FeatureUpdatesPaused
    [System.Nullable[datetime]]$QualityUpdatesPauseExpiryDateTime
    [System.Nullable[datetime]]$FeatureUpdatesPauseExpiryDateTime
    [GraphwindowsUpdateType_beta]$BusinessReadyUpdatesOnly
    WindowsUpdateForBusinessConfiguration_beta() {
        $this.DeliveryOptimizationMode = New-Object GraphwindowsDeliveryOptimizationMode_beta
        $this.PrereleaseFeatures = New-Object GraphprereleaseFeatures_beta
        $this.AutomaticUpdateMode = New-Object GraphautomaticUpdateMode_beta
        $this.InstallationSchedule = New-Object GraphwindowsUpdateInstallScheduleType_beta
        $this.BusinessReadyUpdatesOnly = New-Object GraphwindowsUpdateType_beta
    }
}
Class GraphWindowsVpnConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [string]$ConnectionName
    [GraphVpnServer_beta[]]$Servers
    [object]$customXml		#Edm.Binary
}
Class GraphWindows10VpnConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [Graphwindows10VpnConnectionType_beta]$ConnectionType
    [System.Nullable[bool]]$EnableSplitTunneling
    [Graphwindows10VpnAuthenticationMethod_beta]$AuthenticationMethod
    [System.Nullable[bool]]$RememberUserCredentials
    [System.Nullable[bool]]$EnableConditionalAccess
    [System.Nullable[bool]]$EnableSingleSignOnWithAlternateCertificate
    [GraphextendedKeyUsage_beta]$SingleSignOnEku
    [string]$SingleSignOnIssuerHash
    [object]$eapXml		#Edm.Binary
    [Graphwindows10VpnProxyServer_beta]$ProxyServer
    [GraphWindows10AssociatedApps_beta[]]$AssociatedApps
    [System.Nullable[bool]]$OnlyAssociatedAppsCanUseConnection
    [string]$WindowsInformationProtectionDomain
    [GraphVpnTrafficRule_beta[]]$TrafficRules
    [GraphVpnRoute_beta[]]$Routes
    [GraphVpnDnsRule_beta[]]$DnsRules
    Windows10VpnConfiguration_beta() {
        $this.ConnectionType = New-Object Graphwindows10VpnConnectionType_beta
        $this.AuthenticationMethod = New-Object Graphwindows10VpnAuthenticationMethod_beta
        $this.SingleSignOnEku = New-Object GraphextendedKeyUsage_beta
        $this.ProxyServer = New-Object Graphwindows10VpnProxyServer_beta
    }
    [object]Get_identityCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Windows10VpnConfigurations/$($this.Id)/IdentityCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWindows10CertificateProfileBase_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$RenewalThresholdPercentage
    [GraphkeyStorageProviderOption_beta]$KeyStorageProvider
    [GraphsubjectNameFormat_beta]$SubjectNameFormat
    [GraphsubjectAlternativeNameType_beta]$SubjectAlternativeNameType
    [System.Nullable[int]]$CertificateValidityPeriodValue
    [GraphcertificateValidityPeriodScale_beta]$CertificateValidityPeriodScale
    Windows10CertificateProfileBase_beta() {
        $this.KeyStorageProvider = New-Object GraphkeyStorageProviderOption_beta
        $this.SubjectNameFormat = New-Object GraphsubjectNameFormat_beta
        $this.SubjectAlternativeNameType = New-Object GraphsubjectAlternativeNameType_beta
        $this.CertificateValidityPeriodScale = New-Object GraphcertificateValidityPeriodScale_beta
    }
}
Class GraphWindows10PkcsCertificateProfile_beta { 
    [string]$id
[string]$RawJSON
    [string]$CertificationAuthority
    [string]$CertificationAuthorityName
    [string]$CertificateTemplateName
}
Class GraphWindows81VpnConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$ApplyOnlyToWindows81
    [GraphwindowsVpnConnectionType_beta]$ConnectionType
    [string]$LoginGroupOrDomain
    [System.Nullable[bool]]$EnableSplitTunneling
    [Graphwindows81VpnProxyServer_beta]$ProxyServer
    Windows81VpnConfiguration_beta() {
        $this.ConnectionType = New-Object GraphwindowsVpnConnectionType_beta
        $this.ProxyServer = New-Object Graphwindows81VpnProxyServer_beta
    }
}
Class GraphWindowsPhone81VpnConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$BypassVpnOnCompanyWifi
    [System.Nullable[bool]]$BypassVpnOnHomeWifi
    [GraphvpnAuthenticationMethod_beta]$AuthenticationMethod
    [System.Nullable[bool]]$RememberUserCredentials
    [string[]]$DnsSuffixSearchList
    WindowsPhone81VpnConfiguration_beta() {
        $this.AuthenticationMethod = New-Object GraphvpnAuthenticationMethod_beta
    }
    [object]Get_identityCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WindowsPhone81VpnConfigurations/$($this.Id)/IdentityCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWindowsPhone81CertificateProfileBase_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$RenewalThresholdPercentage
    [GraphkeyStorageProviderOption_beta]$KeyStorageProvider
    [GraphsubjectNameFormat_beta]$SubjectNameFormat
    [GraphsubjectAlternativeNameType_beta]$SubjectAlternativeNameType
    [System.Nullable[int]]$CertificateValidityPeriodValue
    [GraphcertificateValidityPeriodScale_beta]$CertificateValidityPeriodScale
    [GraphExtendedKeyUsage_beta[]]$ExtendedKeyUsages
    WindowsPhone81CertificateProfileBase_beta() {
        $this.KeyStorageProvider = New-Object GraphkeyStorageProviderOption_beta
        $this.SubjectNameFormat = New-Object GraphsubjectNameFormat_beta
        $this.SubjectAlternativeNameType = New-Object GraphsubjectAlternativeNameType_beta
        $this.CertificateValidityPeriodScale = New-Object GraphcertificateValidityPeriodScale_beta
    }
}
Class GraphWindowsPhone81SCEPCertificateProfile_beta { 
    [string]$id
[string]$RawJSON
    [string[]]$ScepServerUrls
    [GraphkeyUsages_beta]$KeyUsage
    [GraphkeySize_beta]$KeySize
    [GraphhashAlgorithms_beta]$HashAlgorithm
    WindowsPhone81SCEPCertificateProfile_beta() {
        $this.KeyUsage = New-Object GraphkeyUsages_beta
        $this.KeySize = New-Object GraphkeySize_beta
        $this.HashAlgorithm = New-Object GraphhashAlgorithms_beta
    }
    [object]Get_rootCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "WindowsPhone81SCEPCertificateProfiles/$($this.Id)/RootCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWindows81GeneralConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$AccountsBlockAddingNonMicrosoftAccountEmail
    [System.Nullable[bool]]$ApplyOnlyToWindows81
    [System.Nullable[bool]]$BrowserBlockAutofill
    [System.Nullable[bool]]$BrowserBlockAutomaticDetectionOfIntranetSites
    [System.Nullable[bool]]$BrowserBlockEnterpriseModeAccess
    [System.Nullable[bool]]$BrowserBlockJavaScript
    [System.Nullable[bool]]$BrowserBlockPlugins
    [System.Nullable[bool]]$BrowserBlockPopups
    [System.Nullable[bool]]$BrowserBlockSendingDoNotTrackHeader
    [System.Nullable[bool]]$BrowserBlockSingleWordEntryOnIntranetSites
    [System.Nullable[bool]]$BrowserRequireSmartScreen
    [string]$BrowserEnterpriseModeSiteListLocation
    [GraphinternetSiteSecurityLevel_beta]$BrowserInternetSecurityLevel
    [GraphsiteSecurityLevel_beta]$BrowserIntranetSecurityLevel
    [string]$BrowserLoggingReportLocation
    [System.Nullable[bool]]$BrowserRequireHighSecurityForRestrictedSites
    [System.Nullable[bool]]$BrowserRequireFirewall
    [System.Nullable[bool]]$BrowserRequireFraudWarning
    [GraphsiteSecurityLevel_beta]$BrowserTrustedSitesSecurityLevel
    [System.Nullable[bool]]$CellularBlockDataRoaming
    [System.Nullable[bool]]$DiagnosticsBlockDataSubmission
    [System.Nullable[bool]]$PasswordBlockPicturePasswordAndPin
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeScreenTimeout
    [System.Nullable[int]]$PasswordMinimumCharacterSetCount
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[int]]$PasswordSignInFailureCountBeforeFactoryReset
    [System.Nullable[bool]]$StorageRequireDeviceEncryption
    [GraphupdateClassification_beta]$MinimumAutoInstallClassification
    [System.Nullable[bool]]$UpdatesRequireAutomaticUpdates
    [GraphwindowsUserAccountControlSettings_beta]$UserAccountControlSettings
    [string]$WorkFoldersUrl
    Windows81GeneralConfiguration_beta() {
        $this.BrowserInternetSecurityLevel = New-Object GraphinternetSiteSecurityLevel_beta
        $this.BrowserIntranetSecurityLevel = New-Object GraphsiteSecurityLevel_beta
        $this.BrowserTrustedSitesSecurityLevel = New-Object GraphsiteSecurityLevel_beta
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
        $this.MinimumAutoInstallClassification = New-Object GraphupdateClassification_beta
        $this.UserAccountControlSettings = New-Object GraphwindowsUserAccountControlSettings_beta
    }
}
Class GraphWindows81CertificateProfileBase_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$RenewalThresholdPercentage
    [GraphkeyStorageProviderOption_beta]$KeyStorageProvider
    [GraphsubjectNameFormat_beta]$SubjectNameFormat
    [GraphsubjectAlternativeNameType_beta]$SubjectAlternativeNameType
    [System.Nullable[int]]$CertificateValidityPeriodValue
    [GraphcertificateValidityPeriodScale_beta]$CertificateValidityPeriodScale
    [GraphExtendedKeyUsage_beta[]]$ExtendedKeyUsages
    Windows81CertificateProfileBase_beta() {
        $this.KeyStorageProvider = New-Object GraphkeyStorageProviderOption_beta
        $this.SubjectNameFormat = New-Object GraphsubjectNameFormat_beta
        $this.SubjectAlternativeNameType = New-Object GraphsubjectAlternativeNameType_beta
        $this.CertificateValidityPeriodScale = New-Object GraphcertificateValidityPeriodScale_beta
    }
}
Class GraphWindows81SCEPCertificateProfile_beta { 
    [string]$id
[string]$RawJSON
    [string[]]$ScepServerUrls
    [GraphkeyUsages_beta]$KeyUsage
    [GraphkeySize_beta]$KeySize
    [GraphhashAlgorithms_beta]$HashAlgorithm
    Windows81SCEPCertificateProfile_beta() {
        $this.KeyUsage = New-Object GraphkeyUsages_beta
        $this.KeySize = New-Object GraphkeySize_beta
        $this.HashAlgorithm = New-Object GraphhashAlgorithms_beta
    }
    [object]Get_rootCertificate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "Windows81SCEPCertificateProfiles/$($this.Id)/RootCertificate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphWindowsPhone81GeneralConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$ApplyToWindows10Mobile
    [System.Nullable[bool]]$ApplyOnlyToWindowsPhone81
    [System.Nullable[bool]]$AppsBlockCopyPaste
    [System.Nullable[bool]]$BluetoothBlocked
    [System.Nullable[bool]]$CameraBlocked
    [System.Nullable[bool]]$CellularBlockWifiTethering
    [GraphAppListItem_beta[]]$CompliantAppsList
    [GraphappListType_beta]$CompliantAppListType
    [System.Nullable[bool]]$DiagnosticDataBlockSubmission
    [System.Nullable[bool]]$EmailBlockAddingAccounts
    [System.Nullable[bool]]$LocationServicesBlocked
    [System.Nullable[bool]]$MicrosoftAccountBlocked
    [System.Nullable[bool]]$NfcBlocked
    [System.Nullable[bool]]$PasswordBlockSimple
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeScreenTimeout
    [System.Nullable[int]]$PasswordMinimumCharacterSetCount
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [System.Nullable[int]]$PasswordSignInFailureCountBeforeFactoryReset
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[bool]]$PasswordRequired
    [System.Nullable[bool]]$ScreenCaptureBlocked
    [System.Nullable[bool]]$StorageBlockRemovableStorage
    [System.Nullable[bool]]$StorageRequireEncryption
    [System.Nullable[bool]]$WebBrowserBlocked
    [System.Nullable[bool]]$WifiBlocked
    [System.Nullable[bool]]$WifiBlockAutomaticConnectHotspots
    [System.Nullable[bool]]$WifiBlockHotspotReporting
    [System.Nullable[bool]]$WindowsStoreBlocked
    WindowsPhone81GeneralConfiguration_beta() {
        $this.CompliantAppListType = New-Object GraphappListType_beta
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
    }
}
Class GraphWindows10GeneralConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$AccountsBlockAddingNonMicrosoftAccountEmail
    [System.Nullable[bool]]$AntiTheftModeBlocked
    [GraphautomaticUpdateMode_beta]$AutomaticUpdateMode
    [GraphweeklySchedule_beta]$AutomaticUpdateSchedule
    [object]$automaticUpdateTime		#Edm.TimeOfDay
    [System.Nullable[bool]]$BluetoothBlocked
    [System.Nullable[bool]]$BluetoothBlockAdvertising
    [System.Nullable[bool]]$BluetoothBlockDiscoverableMode
    [System.Nullable[bool]]$CameraBlocked
    [System.Nullable[bool]]$CellularBlockDataWhenRoaming
    [System.Nullable[bool]]$CellularBlockVpn
    [System.Nullable[bool]]$CellularBlockVpnWhenRoaming
    [System.Nullable[bool]]$CertificatesBlockManualRootCertificateInstallation
    [System.Nullable[bool]]$CopyPasteBlocked
    [System.Nullable[bool]]$CortanaBlocked
    [System.Nullable[bool]]$DefenderBlockEndUserAccess
    [System.Nullable[int]]$DefenderDaysBeforeDeletingQuarantinedMalware
    [GraphweeklySchedule_beta]$DefenderSystemScanSchedule
    [string[]]$DefenderFilesAndFoldersToExclude
    [string[]]$DefenderFileExtensionsToExclude
    [System.Nullable[int]]$DefenderScanMaxCpu
    [GraphdefenderMonitorFileActivity_beta]$DefenderMonitorFileActivity
    [string[]]$DefenderProcessesToExclude
    [GraphdefenderPromptForSampleSubmission_beta]$DefenderPromptForSampleSubmission
    [System.Nullable[bool]]$DefenderRequireBehaviorMonitoring
    [System.Nullable[bool]]$DefenderRequireCloudProtection
    [System.Nullable[bool]]$DefenderRequireNetworkInspectionSystem
    [System.Nullable[bool]]$DefenderRequireRealTimeMonitoring
    [System.Nullable[bool]]$DefenderScanArchiveFiles
    [System.Nullable[bool]]$DefenderScanDownloads
    [System.Nullable[bool]]$DefenderScanNetworkFiles
    [System.Nullable[bool]]$DefenderScanIncomingMail
    [System.Nullable[bool]]$DefenderScanMappedNetworkDrivesDuringFullScan
    [System.Nullable[bool]]$DefenderScanRemovableDrivesDuringFullScan
    [System.Nullable[bool]]$DefenderScanScriptsLoadedInInternetExplorer
    [System.Nullable[int]]$DefenderSignatureUpdateIntervalInHours
    [GraphdefenderScanType_beta]$DefenderScanType
    [object]$defenderScheduledScanTime		#Edm.TimeOfDay
    [object]$defenderScheduledQuickScanTime		#Edm.TimeOfDay
    [System.Nullable[bool]]$DeviceManagementBlockFactoryResetOnMobile
    [System.Nullable[bool]]$DeviceManagementBlockManualUnenroll
    [GraphdiagnosticDataSubmissionMode_beta]$DiagnosticsDataSubmissionMode
    [System.Nullable[bool]]$EdgeBlockAutofill
    [System.Nullable[bool]]$EdgeBlocked
    [GraphedgeCookiePolicy_beta]$EdgeCookiePolicy
    [System.Nullable[bool]]$EdgeBlockSendingDoNotTrackHeader
    [System.Nullable[bool]]$EdgeBlockJavaScript
    [System.Nullable[bool]]$EdgeBlockPasswordManager
    [System.Nullable[bool]]$EdgeBlockPopups
    [System.Nullable[bool]]$EdgeBlockSearchSuggestions
    [System.Nullable[bool]]$EdgeBlockSendingIntranetTrafficToInternetExplorer
    [System.Nullable[bool]]$EdgeRequireSmartScreen
    [string]$EdgeEnterpriseModeSiteListLocation
    [System.Nullable[bool]]$InternetSharingBlocked
    [System.Nullable[bool]]$LocationServicesBlocked
    [System.Nullable[bool]]$LockScreenBlockActionCenterNotifications
    [System.Nullable[bool]]$MicrosoftAccountBlocked
    [System.Nullable[bool]]$MicrosoftAccountBlockSettingsSync
    [System.Nullable[bool]]$NfcBlocked
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeScreenTimeout
    [System.Nullable[int]]$PasswordMinimumCharacterSetCount
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [System.Nullable[bool]]$PasswordRequired
    [System.Nullable[bool]]$PasswordRequireWhenResumeFromIdleState
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[int]]$PasswordSignInFailureCountBeforeFactoryReset
    [GraphprereleaseFeatures_beta]$PrereleaseFeatures
    [System.Nullable[bool]]$ResetProtectionModeBlocked
    [System.Nullable[bool]]$ScreenCaptureBlocked
    [System.Nullable[bool]]$StorageBlockRemovableStorage
    [System.Nullable[bool]]$StorageRequireMobileDeviceEncryption
    [System.Nullable[bool]]$UsbBlocked
    [System.Nullable[bool]]$VoiceRecordingBlocked
    [System.Nullable[bool]]$WiFiBlockAutomaticConnectHotspots
    [System.Nullable[bool]]$WiFiBlocked
    [System.Nullable[bool]]$WiFiBlockManualConfiguration
    [System.Nullable[bool]]$WindowsStoreBlocked
    Windows10GeneralConfiguration_beta() {
        $this.AutomaticUpdateMode = New-Object GraphautomaticUpdateMode_beta
        $this.AutomaticUpdateSchedule = New-Object GraphweeklySchedule_beta
        $this.DefenderSystemScanSchedule = New-Object GraphweeklySchedule_beta
        $this.DefenderMonitorFileActivity = New-Object GraphdefenderMonitorFileActivity_beta
        $this.DefenderPromptForSampleSubmission = New-Object GraphdefenderPromptForSampleSubmission_beta
        $this.DefenderScanType = New-Object GraphdefenderScanType_beta
        $this.DiagnosticsDataSubmissionMode = New-Object GraphdiagnosticDataSubmissionMode_beta
        $this.EdgeCookiePolicy = New-Object GraphedgeCookiePolicy_beta
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
        $this.PrereleaseFeatures = New-Object GraphprereleaseFeatures_beta
    }
}
Class GraphWindows10TeamGeneralConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$AzureOperationalInsightsBlockTelemetry
    [string]$AzureOperationalInsightsWorkspaceId
    [string]$AzureOperationalInsightsWorkspaceKey
    [System.Nullable[bool]]$MaintenanceWindowBlocked
    [System.Nullable[int]]$MaintenanceWindowDurationInHours
    [object]$maintenanceWindowStartTime		#Edm.TimeOfDay
    [GraphmiracastChannel_beta]$MiracastChannel
    [System.Nullable[bool]]$MiracastBlocked
    [System.Nullable[bool]]$MiracastRequirePin
    [System.Nullable[bool]]$WelcomeScreenBlockAutomaticWakeUp
    [string]$WelcomeScreenBackgroundImageUrl
    [GraphwelcomeScreenMeetingInformation_beta]$WelcomeScreenMeetingInformation
    Windows10TeamGeneralConfiguration_beta() {
        $this.MiracastChannel = New-Object GraphmiracastChannel_beta
        $this.WelcomeScreenMeetingInformation = New-Object GraphwelcomeScreenMeetingInformation_beta
    }
}
Class GraphEditionUpgradeConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GrapheditionUpgradeLicenseType_beta]$LicenseType
    [Graphwindows10EditionType_beta]$TargetEdition
    [string]$License
    [string]$ProductKey
    EditionUpgradeConfiguration_beta() {
        $this.LicenseType = New-Object GrapheditionUpgradeLicenseType_beta
        $this.TargetEdition = New-Object Graphwindows10EditionType_beta
    }
}
Class GraphDeviceComplianceActionItem_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$GracePeriodHours
    [GraphdeviceComplianceActionType_beta]$ActionType
    DeviceComplianceActionItem_beta() {
        $this.ActionType = New-Object GraphdeviceComplianceActionType_beta
    }
    [object]Get_notificationMessageTemplate() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DeviceComplianceActionItems/$($this.Id)/NotificationMessageTemplate"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphNotificationMessageTemplate_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphLocalizedNotificationMessage_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphAndroidCompliancePolicy_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$PasswordRequired
    [System.Nullable[int]]$PasswordMinimumLength
    [GraphandroidRequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeLock
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [System.Nullable[bool]]$SecurityPreventInstallAppsFromUnknownSources
    [System.Nullable[bool]]$SecurityDisableUsbDebugging
    [System.Nullable[bool]]$RequireAppVerify
    [System.Nullable[bool]]$DeviceThreatProtectionEnabled
    [GraphdeviceThreatProtectionLevel_beta]$DeviceThreatProtectionRequiredSecurityLevel
    [System.Nullable[bool]]$SecurityBlockJailbrokenDevices
    [string]$OsMinimumVersion
    [string]$OsMaximumVersion
    [string]$MinAndroidSecurityPatchLevel
    [System.Nullable[bool]]$StorageRequireEncryption
    AndroidCompliancePolicy_beta() {
        $this.PasswordRequiredType = New-Object GraphandroidRequiredPasswordType_beta
        $this.DeviceThreatProtectionRequiredSecurityLevel = New-Object GraphdeviceThreatProtectionLevel_beta
    }
}
Class GraphIosCompliancePolicy_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$PasscodeBlockSimple
    [System.Nullable[int]]$PasscodeExpirationDays
    [System.Nullable[int]]$PasscodeMinimumLength
    [System.Nullable[int]]$PasscodeMinutesOfInactivityBeforeLock
    [System.Nullable[int]]$PasscodePreviousPasscodeBlockCount
    [System.Nullable[int]]$PasscodeMinimumCharacterSetCount
    [GraphrequiredPasswordType_beta]$PasscodeRequiredType
    [System.Nullable[bool]]$PasscodeRequired
    [string]$OsMinimumVersion
    [string]$OsMaximumVersion
    [System.Nullable[bool]]$SecurityBlockJailbrokenDevices
    [System.Nullable[bool]]$DeviceThreatProtectionEnabled
    [GraphdeviceThreatProtectionLevel_beta]$DeviceThreatProtectionRequiredSecurityLevel
    IosCompliancePolicy_beta() {
        $this.PasscodeRequiredType = New-Object GraphrequiredPasswordType_beta
        $this.DeviceThreatProtectionRequiredSecurityLevel = New-Object GraphdeviceThreatProtectionLevel_beta
    }
}
Class GraphMacOSCompliancePolicy_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$PasswordRequired
    [System.Nullable[bool]]$PasswordBlockSimple
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeLock
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    MacOSCompliancePolicy_beta() {
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
    }
}
Class GraphWindows10CompliancePolicy_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$PasswordRequired
    [System.Nullable[bool]]$PasswordBlockSimple
    [System.Nullable[bool]]$PasswordRequiredToUnlockFromIdle
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeLock
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinimumCharacterSetCount
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [System.Nullable[bool]]$RequireHealthyDeviceReport
    [string]$OsMinimumVersion
    [string]$OsMaximumVersion
    [string]$MobileOsMinimumVersion
    [string]$MobileOsMaximumVersion
    [System.Nullable[bool]]$EarlyLaunchAntiMalwareDriverEnabled
    [System.Nullable[bool]]$BitLockerEnabled
    [System.Nullable[bool]]$SecureBootEnabled
    [System.Nullable[bool]]$CodeIntegrityEnabled
    [System.Nullable[bool]]$StorageRequireEncryption
    Windows10CompliancePolicy_beta() {
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
    }
}
Class GraphWindows10MobileCompliancePolicy_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$PasswordRequired
    [System.Nullable[bool]]$PasswordBlockSimple
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinimumCharacterSetCount
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeLock
    [System.Nullable[bool]]$PasswordRequireToUnlockFromIdle
    [string]$OsMinimumVersion
    [string]$OsMaximumVersion
    [System.Nullable[bool]]$EarlyLaunchAntiMalwareDriverEnabled
    [System.Nullable[bool]]$BitLockerEnabled
    [System.Nullable[bool]]$SecureBootEnabled
    [System.Nullable[bool]]$CodeIntegrityEnabled
    [System.Nullable[bool]]$StorageRequireEncryption
    Windows10MobileCompliancePolicy_beta() {
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
    }
}
Class GraphWindows81CompliancePolicy_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$PasswordRequired
    [System.Nullable[bool]]$PasswordBlockSimple
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeLock
    [System.Nullable[int]]$PasswordMinimumCharacterSetCount
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [string]$OsMinimumVersion
    [string]$OsMaximumVersion
    [System.Nullable[bool]]$StorageRequireEncryption
    Windows81CompliancePolicy_beta() {
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
    }
}
Class GraphWindowsPhone81CompliancePolicy_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$PasswordBlockSimple
    [System.Nullable[int]]$PasswordExpirationDays
    [System.Nullable[int]]$PasswordMinimumLength
    [System.Nullable[int]]$PasswordMinutesOfInactivityBeforeLock
    [System.Nullable[int]]$PasswordMinimumCharacterSetCount
    [GraphrequiredPasswordType_beta]$PasswordRequiredType
    [System.Nullable[int]]$PasswordPreviousPasswordBlockCount
    [System.Nullable[bool]]$PasswordRequired
    [string]$OsMinimumVersion
    [string]$OsMaximumVersion
    [System.Nullable[bool]]$StorageRequireEncryption
    WindowsPhone81CompliancePolicy_beta() {
        $this.PasswordRequiredType = New-Object GraphrequiredPasswordType_beta
    }
}
Class GraphDetectedApp_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Version
    [System.Nullable[int64]]$SizeInByte
    [System.Nullable[int]]$DeviceCount
    [object]Get_managedDevices() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "DetectedApps/$($this.Id)/ManagedDevices"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphManagedDeviceOverview_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$EnrolledDeviceCount
    [System.Nullable[int]]$MdmEnrolledCount
    [System.Nullable[int]]$DualEnrolledDeviceCount
    [GraphdeviceOperatingSystemSummary_beta]$DeviceOperatingSystemSummary
    ManagedDeviceOverview_beta() {
        $this.DeviceOperatingSystemSummary = New-Object GraphdeviceOperatingSystemSummary_beta
    }
}
Class GraphOnPremisesConditionalAccessSettings_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$Enabled
    [System.Nullable[guid][]]$IncludedGroups
    [System.Nullable[guid][]]$ExcludedGroups
}
Class GraphManagedAppPolicy_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Description
    [System.Nullable[datetime]]$LastModifiedTime
    [System.Nullable[int]]$DeployedAppCount
    [string]$Version
    [object]Get_mobileAppIdentifierDeployments() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedAppPolicys/$($this.Id)/MobileAppIdentifierDeployments"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
    [object]Get_deploymentSummary() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "ManagedAppPolicys/$($this.Id)/DeploymentSummary"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphMobileAppIdentifierDeployment_beta { 
    [string]$id
[string]$RawJSON
    [GraphmobileAppIdentifier_beta]$MobileAppIdentifier
    [string]$Version
    MobileAppIdentifierDeployment_beta() {
        $this.MobileAppIdentifier = New-Object GraphmobileAppIdentifier_beta
    }
}
Class GraphManagedAppPolicyDeploymentSummary_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [System.Nullable[int]]$ConfigurationDeployedUserCount
    [System.Nullable[datetime]]$LastRefreshTime
    [GraphManagedAppPolicyDeploymentSummaryPerApp_beta[]]$ConfigurationDeploymentSummaryPerApp
    [string]$Version
}
Class GraphManagedAppOperation_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [System.Nullable[datetime]]$LastModifiedDateTime
    [string]$State
    [string]$Version
}
Class GraphManagedAppStatus_beta { 
    [string]$id
[string]$RawJSON
    [string]$DisplayName
    [string]$Version
}
Class GraphManagedAppProtection_beta { 
    [string]$id
[string]$RawJSON
    [object]$periodOfflineBeforeAccessCheck		#Edm.Duration
    [object]$periodOnlineBeforeAccessCheck		#Edm.Duration
    [GraphmanagedAppDataTransferLevel_beta]$AllowedInboundDataTransferSources
    [GraphmanagedAppDataTransferLevel_beta]$AllowedOutboundDataTransferDestinations
    [System.Nullable[bool]]$OrganizationalCredentialsRequired
    [GraphmanagedAppClipboardSharingLevel_beta]$AllowedOutboundClipboardSharingLevel
    [System.Nullable[bool]]$DataBackupBlocked
    [System.Nullable[bool]]$DeviceComplianceRequired
    [System.Nullable[bool]]$ManagedBrowserToOpenLinksRequired
    [System.Nullable[bool]]$SaveAsBlocked
    [object]$periodOfflineBeforeWipeIsEnforced		#Edm.Duration
    [System.Nullable[bool]]$PinRequired
    [System.Nullable[int]]$MaximumPinRetries
    [System.Nullable[bool]]$SimplePinBlocked
    [System.Nullable[int]]$MinimumPinLength
    [GraphmanagedAppPinCharacterSet_beta]$PinCharacterSet
    [GraphManagedAppDataStorageLocation_beta[]]$AllowedDataStorageLocations
    [System.Nullable[bool]]$ContactSyncBlocked
    [System.Nullable[bool]]$PrintBlocked
    [System.Nullable[bool]]$FingerprintBlocked
    ManagedAppProtection_beta() {
        $this.AllowedInboundDataTransferSources = New-Object GraphmanagedAppDataTransferLevel_beta
        $this.AllowedOutboundDataTransferDestinations = New-Object GraphmanagedAppDataTransferLevel_beta
        $this.AllowedOutboundClipboardSharingLevel = New-Object GraphmanagedAppClipboardSharingLevel_beta
        $this.PinCharacterSet = New-Object GraphmanagedAppPinCharacterSet_beta
    }
}
Class GraphTargetedManagedAppProtection_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$TargetedSecurityGroupsCount
    [string[]]$TargetedSecurityGroupIds
    [object]Get_targetedSecurityGroups() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "TargetedManagedAppProtections/$($this.Id)/TargetedSecurityGroups"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphManagedAppConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [GraphKeyValuePair_beta[]]$CustomSettings
}
Class GraphTargetedManagedAppConfiguration_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[int]]$NumberOfTargetedSecurityGroups
    [object]Get_targetedSecurityGroups() {
        $returnedObject = $null
        try {
            $returnedObject = Invoke-GraphMethod -Version 'beta' -query "TargetedManagedAppConfigurations/$($this.Id)/TargetedSecurityGroups"
        }
        catch {
            Write-GraphLog -Exception $_
        }
        return $returnedObject
    }
}
Class GraphDefaultManagedAppConfiguration_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphDefaultManagedAppProtection_beta { 
    [string]$id
[string]$RawJSON
    [GraphmanagedAppDataEncryptionType_beta]$AppDataEncryptionType
    [System.Nullable[bool]]$ScreenCaptureBlocked
    [System.Nullable[bool]]$EncryptAppData
    [GraphKeyValuePair_beta[]]$CustomSettings
    DefaultManagedAppProtection_beta() {
        $this.AppDataEncryptionType = New-Object GraphmanagedAppDataEncryptionType_beta
    }
}
Class GraphAndroidManagedAppProtection_beta { 
    [string]$id
[string]$RawJSON
    [System.Nullable[bool]]$ScreenCaptureBlocked
    [System.Nullable[bool]]$EncryptAppData
}
Class GraphIosManagedAppProtection_beta { 
    [string]$id
[string]$RawJSON
    [GraphmanagedAppDataEncryptionType_beta]$AppDataEncryptionType
    IosManagedAppProtection_beta() {
        $this.AppDataEncryptionType = New-Object GraphmanagedAppDataEncryptionType_beta
    }
}
Class GraphIosManagedAppRegistration_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphAndroidManagedAppRegistration_beta { 
    [string]$id
[string]$RawJSON
}
Class GraphManagedAppStatusRaw_beta { 
    [string]$id
[string]$RawJSON
    [GraphmanagedAppSummary_beta]$Content
    ManagedAppStatusRaw_beta() {
        $this.Content = New-Object GraphmanagedAppSummary_beta
    }
}
