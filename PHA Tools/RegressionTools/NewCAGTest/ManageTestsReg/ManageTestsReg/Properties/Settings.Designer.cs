﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ManageTestsReg.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "12.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute(@"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53;54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76;77,78,79,80,81,82,83,84,85,86,87,88,89,35,36,37,38,39,40,41,42,98,99,100,101,49,50,51,52,53")]
        public string phases {
            get {
                return ((string)(this["phases"]));
            }
            set {
                this["phases"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("call ipybot --exclude Dummy --name PHARegtest")]
        public string runQuery {
            get {
                return ((string)(this["runQuery"]));
            }
            set {
                this["runQuery"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Setup,Test")]
        public string tags {
            get {
                return ((string)(this["tags"]));
            }
            set {
                this["tags"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Static,Dynamic")]
        public string types {
            get {
                return ((string)(this["types"]));
            }
            set {
                this["types"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("dbm8-data111\\inst01;dbm8-data111\\inst02;dbm8-data111\\inst03;dbm8-data112\\inst01;d" +
            "bm8-data112\\inst02;dbm8-data112\\inst03")]
        public string servers {
            get {
                return ((string)(this["servers"]));
            }
            set {
                this["servers"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("dbm8-data112\\inst02")]
        public string lastServer {
            get {
                return ((string)(this["lastServer"]));
            }
            set {
                this["lastServer"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("C:\\PHA\\dbm_Testing\\suites\\NewCAGTest\\")]
        public string pathPHA {
            get {
                return ((string)(this["pathPHA"]));
            }
            set {
                this["pathPHA"] = value;
            }
        }
    }
}