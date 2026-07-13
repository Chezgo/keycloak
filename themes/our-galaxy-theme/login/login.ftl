<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=realm.password && realm.registrationAllowed && !(registrationDisabled!false); section>
    <#if section = "header">
    <#elseif section = "form">
        <div id="og-login-container" class="og-page-container">
            <div id="og-login-card" class="og-card">
                <div id="og-login-header" class="og-card-header">
                    <h1 id="og-login-title" class="og-title">${kcSanitize(msg("loginAccountTitle"))?no_esc}</h1>
                </div>

                <#if message?has_content>
                    <div id="og-login-message" class="og-alert og-alert-${message.type}">${kcSanitize(message.summary)?no_esc}</div>
                </#if>

                <form id="og-login-form" class="og-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div id="og-login-username-group" class="og-form-group">
                        <label id="og-login-username-label" class="og-label" for="og-login-username">${msg("username")}</label>
                        <input id="og-login-username" class="og-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="username" />
                    </div>

                    <div id="og-login-password-group" class="og-form-group">
                        <label id="og-login-password-label" class="og-label" for="og-login-password">${msg("password")}</label>
                        <input id="og-login-password" class="og-input" name="password" type="password" autocomplete="current-password" />
                    </div>

                    <#if realm.rememberMe && !(usernameHidden!false)>
                        <div id="og-login-options" class="og-form-options">
                            <label id="og-remember-label" class="og-checkbox-label">
                                <input id="og-remember-me" class="og-checkbox" type="checkbox" name="rememberMe">
                                <span>${msg("rememberMe")}</span>
                            </label>
                        </div>
                    </#if>

                    <div id="og-login-actions" class="og-form-actions">
                        <input id="og-login-submit" class="og-btn" name="login" type="submit" value="${msg("doLogIn")}" />
                    </div>
                </form>

                <div id="og-login-links" class="og-form-footer">
                    <#if realm.registrationAllowed && !(registrationDisabled!false)>
                        <a id="og-register-link" class="og-link" href="${url.registrationUrl}">${msg("doRegister")}</a>
                    </#if>
                    <#if realm.resetPasswordAllowed>
                        <a id="og-forgot-password-link" class="og-link" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                    </#if>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
