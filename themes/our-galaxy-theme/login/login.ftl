<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true displayInfo=realm.password && realm.registrationAllowed && !(registrationDisabled!false); section>
    <#if section = "header">
    <#elseif section = "form">
        <div class="og-page-container">
            <div class="og-card">
                <div class="og-card-header">
                    <h1 id="og-title" class="og-title">${kcSanitize(msg("loginAccountTitle"))?no_esc}</h1>
                </div>

                <#if message?has_content>
                    <div id="og-error-message" class="og-alert">${kcSanitize(message.summary)?no_esc}</div>
                </#if>

                <form id="og-form-login" class="og-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="og-form-group">
                        <label id="og-username-label" class="og-label" for="username">${msg("username")}</label>
                        <input id="og-username" class="og-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="username" />
                    </div>

                    <div class="og-form-group">
                        <label id="og-password-label" class="og-label" for="password">${msg("password")}</label>
                        <input id="og-password" class="og-input" name="password" type="password" autocomplete="current-password" />
                    </div>

                    <#if realm.rememberMe && !(usernameHidden!false)>
                        <div class="og-form-options">
                            <label id="og-remember-label" class="og-checkbox-label">
                                <input id="og-remember-me" class="og-checkbox" type="checkbox" name="rememberMe">
                                <span>${msg("rememberMe")}</span>
                            </label>
                        </div>
                    </#if>

                    <div class="og-form-actions">
                        <input id="og-login-btn" class="og-btn" name="login" type="submit" value="${msg("doLogIn")}" />
                    </div>
                </form>

                <div id="og-links" class="og-form-footer">
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
