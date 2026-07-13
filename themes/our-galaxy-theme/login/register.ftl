cat > ~/Keycloak/keycloak/themes/our-galaxy-theme/login/register.ftl << 'EOF'
<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true displayInfo=(realm.registrationAllowed && !(registrationDisabled!false)); section>
    <#if section = "header">
        ${kcSanitize(msg("registerTitle"))?no_esc}
    <#elseif section = "form">
        <div id="og-register-container" class="og-auth-container">
            <div class="og-auth-card">
                <h2 id="og-reg-title" class="og-title">${kcSanitize(msg("registerTitle"))?no_esc}</h2>

                <#if message?has_content>
                    <div id="og-error-message-reg" class="og-alert og-alert-error">${kcSanitize(message.summary)?no_esc}</div>
                </#if>

                <form id="og-form-register" onsubmit="register.disabled = true; return true;" action="${url.registrationAction}" method="post">
                    <#if !realm.registrationEmailAsUsername>
                        <div class="og-form-group">
                            <label id="og-username-reg-label" for="og-username-reg">${msg("username")}</label>
                            <input id="og-username-reg" class="og-input" type="text" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                        </div>
                    </#if>

                    <div class="og-form-row">
                        <div class="og-form-group">
                            <label id="og-first-name-label" for="og-first-name">${msg("firstName")}</label>
                            <input id="og-first-name" class="og-input" type="text" name="firstName" value="${(register.formData.firstName!'')}" autocomplete="given-name" />
                        </div>
                        <div class="og-form-group">
                            <label id="og-last-name-label" for="og-last-name">${msg("lastName")}</label>
                            <input id="og-last-name" class="og-input" type="text" name="lastName" value="${(register.formData.lastName!'')}" autocomplete="family-name" />
                        </div>
                    </div>

                    <div class="og-form-group">
                        <label id="og-email-label" for="og-email">${msg("email")}</label>
                        <input id="og-email" class="og-input" type="email" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                    </div>

                    <div class="og-form-group">
                        <label id="og-password-reg-label" for="og-password-reg">${msg("password")}</label>
                        <input id="og-password-reg" class="og-input" type="password" name="password" autocomplete="new-password" />
                    </div>

                    <div class="og-form-group">
                        <label id="og-password-confirm-label" for="og-password-confirm">${msg("passwordConfirm")}</label>
                        <input id="og-password-confirm" class="og-input" type="password" name="password-confirm" autocomplete="new-password" />
                    </div>

                    <#if recaptchaRequired??>
                        <div class="og-form-group">
                            <div id="og-recaptcha-container" class="g-recaptcha" data-sitekey="${(recaptchaSiteKey!'')}" data-theme="light"></div>
                        </div>
                    </#if>

                    <div class="og-form-actions">
                        <input id="og-register-btn" class="og-btn og-btn-primary" name="register" type="submit" value="${msg("doRegister")}" />
                    </div>
                </form>

                <div id="og-reg-links" class="og-links">
                    <a id="og-back-to-login-link" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
EOF
