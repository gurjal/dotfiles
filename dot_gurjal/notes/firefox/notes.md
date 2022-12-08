# firefox

  ~/.mozilla/firefox/{release version}/prefs.js

### kill telemetry

  - turn off bacic telemetry in about:preferences

  - add to prefs.js
    ```js
      user_pref("devtools.onboarding.telemetry.logged", false);
      user_pref("toolkit.telemetry.updatePing.enabled", false);
      user_pref("toolkit.telemetry.bhrPing.enabled", false);
      user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
      user_pref("toolkit.telemetry.unified", false);
      user_pref("datareporting.healthreport.uploadEnabled", false);
      user_pref("datareporting.policy.dataSubmissionEnabled", false);
      user_pref("datareporting.sessions.current.clean", true);
      user_pref("browser.ping-centre.telemetry", false);
      user_pref("toolkit.telemetry.archive.enabled", false);
      user_pref("toolkit.telemetry.enabled", false);
      user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
      user_pref("toolkit.telemetry.hybridContent.enabled", false);
      user_pref("toolkit.telemetry.newProfilePing.enabled", false);
      user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
      user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
      user_pref("browser.newtabpage.activity-stream.telemetry", false);
    ```

### compact mode

  - add to prefs.js
    ```js
      user_pref("browser.uidensity", 1);
    ```

### enable userChome.css

  - add to prefs.js
    ```js
      user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
    ```
  - add userChome.css file to ~/.mozilla/firefox/{release version}/chrome/
