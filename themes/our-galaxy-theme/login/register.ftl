<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=(realm.registrationAllowed && !(registrationDisabled!false)); section>
    <#if section = "header">
    <#elseif section = "form">
        <div id="og-register-container" class="og-page-container og-page-container-wide">
            <div id="og-register-card" class="og-card">
                <div id="og-register-header" class="og-card-header">
                    <h1 id="og-register-title" class="og-title">${kcSanitize(msg("registerTitle"))?no_esc}</h1>
                </div>

                <#if message?has_content>
                    <div id="og-register-message" class="og-alert og-alert-${message.type}">${kcSanitize(message.summary)?no_esc}</div>
                </#if>

                <form id="og-register-form" class="og-form" onsubmit="register.disabled = true; return true;" action="${url.registrationAction}" method="post">
                    <#if !realm.registrationEmailAsUsername>
                        <div id="og-register-username-group" class="og-form-group">
                            <label id="og-register-username-label" class="og-label" for="og-register-username">${msg("username")}</label>
                            <input id="og-register-username" class="og-input" type="text" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                        </div>
                    </#if>

                    <div id="og-register-name-row" class="og-form-row">
                        <div id="og-register-first-name-group" class="og-form-group">
                            <label id="og-register-first-name-label" class="og-label" for="og-register-first-name">${msg("firstName")}</label>
                            <input id="og-register-first-name" class="og-input" type="text" name="firstName" value="${(register.formData.firstName!'')}" autocomplete="given-name" />
                        </div>
                        <div id="og-register-last-name-group" class="og-form-group">
                            <label id="og-register-last-name-label" class="og-label" for="og-register-last-name">${msg("lastName")}</label>
                            <input id="og-register-last-name" class="og-input" type="text" name="lastName" value="${(register.formData.lastName!'')}" autocomplete="family-name" />
                        </div>
                    </div>

                    <div id="og-register-email-group" class="og-form-group">
                        <label id="og-register-email-label" class="og-label" for="og-register-email">${msg("email")}</label>
                        <input id="og-register-email" class="og-input" type="email" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                    </div>

                    <#if passwordRequired??>
                        <div id="og-register-password-group" class="og-form-group">
                            <label id="og-register-password-label" class="og-label" for="og-register-password">${msg("password")}</label>
                            <input id="og-register-password" class="og-input" type="password" name="password" autocomplete="new-password" />
                        </div>

                        <div id="og-register-password-confirm-group" class="og-form-group">
                            <label id="og-register-password-confirm-label" class="og-label" for="og-register-password-confirm">${msg("passwordConfirm")}</label>
                            <input id="og-register-password-confirm" class="og-input" type="password" name="password-confirm" autocomplete="new-password" />
                        </div>
                    </#if>

                    <#if recaptchaRequired??>
                        <div id="og-register-recaptcha-group" class="og-form-group">
                            <div id="og-register-recaptcha" class="g-recaptcha" data-sitekey="${(recaptchaSiteKey!'')}" data-theme="dark"></div>
                        </div>
                    </#if>

                    <div id="og-register-actions" class="og-form-actions">
                        <input id="og-register-submit" class="og-btn" name="register" type="submit" value="${msg("doRegister")}" />
                    </div>
                </form>

                <div id="og-register-links" class="og-form-footer og-form-footer-center">
                    <a id="og-back-to-login-link" class="og-link" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
