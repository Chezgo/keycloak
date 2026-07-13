<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
    <#elseif section = "form">
        <div id="og-reset-container" class="og-page-container">
            <div id="og-reset-card" class="og-card">
                <div id="og-reset-header" class="og-card-header">
                    <h1 id="og-reset-title" class="og-title">${kcSanitize(msg("emailForgotTitle"))?no_esc}</h1>
                    <p id="og-reset-description" class="og-description">${kcSanitize(msg("emailInstruction"))?no_esc}</p>
                </div>

                <#if message?has_content>
                    <div id="og-reset-message" class="og-alert og-alert-${message.type}">${kcSanitize(message.summary)?no_esc}</div>
                </#if>

                <form id="og-reset-form" class="og-form" action="${url.loginAction}" method="post">
                    <div id="og-reset-username-group" class="og-form-group">
                        <label id="og-reset-username-label" class="og-label" for="og-reset-username">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                        </label>
                        <input id="og-reset-username" class="og-input" name="username" type="text" value="${(auth.attemptedUsername!'')}" autofocus autocomplete="username" />
                    </div>

                    <div id="og-reset-actions" class="og-form-actions">
                        <input id="og-reset-submit" class="og-btn" type="submit" value="${msg("doSubmit")}" />
                    </div>
                </form>

                <div id="og-reset-links" class="og-form-footer og-form-footer-center">
                    <a id="og-reset-back-to-login-link" class="og-link" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
