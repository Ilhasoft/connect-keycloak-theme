<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayRegisterScriptsAndStyles=true; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div :class="['input-medium ${messagesPerField.printIfExists('firstName', properties.kcFormGroupErrorClass!)}', { 'has-error': firstName.length && firstName.length < 3, }]">
                <label for="firstName">
                    <div class="label">${msg("firstName")}</div>

                    <div class="input">
                        <div class="icon left">
                            <#include "resources/img/login/single-neutral-actions-1.svg">
                        </div>

                        <input
                            type="text"
                            id="firstName"
                            placeholder="${msg('placeholderRegisterFirstName')}"
                            name="firstName"
                            v-model="firstName"
                        />
                    </div>

                    <div class="${properties.kcInputMessageClass!}">{{ '${messagesPerField.get('firstName')}' || (firstName.length && firstName.length < 3) ? '${msg('minCharacters')}' : null }}</div>
                </label>
            </div>


            <div :class="['input-medium ${messagesPerField.printIfExists('lastName', properties.kcFormGroupErrorClass!)}', { 'has-error': lastName.length && lastName.length < 3, }]">
                <label for="lastName">
                    <div class="label">${msg("lastName")}</div>

                    <div class="input">
                        <div class="icon left">
                            <#include "resources/img/login/single-neutral-actions-1.svg">
                        </div>

                        <input
                            type="text"
                            id="lastName"
                            placeholder="${msg('placeholderRegisterLastName')}"
                            name="lastName"
                            v-model="lastName"
                        />
                    </div>

                    <div class="${properties.kcInputMessageClass!}">{{ '${messagesPerField.get('lastName')}' || (lastName.length && lastName.length < 3) ? '${msg('minCharacters')}' : null }}</div>
                </label>
            </div>


            <div class="input-medium ${messagesPerField.printIfExists('email', properties.kcFormGroupErrorClass!)}">
                <label for="email">
                    <div class="label">${msg("email")}</div>

                    <div class="input">
                        <div class="icon left">
                            <#include "resources/img/login/email-action-unread-1.svg">
                        </div>

                        <input
                            type="text"
                            id="email"
                            placeholder="${msg('placeholderRegisterEmail')}"
                            name="email"
                            v-model="email"
                            autocomplete="email"
                        />
                    </div>

                    <div class="${properties.kcInputMessageClass!}"> ${messagesPerField.get('email')} </div>
                </label>
            </div>


            <#if !realm.registrationEmailAsUsername>
                <div ref="username" class="input-medium ${messagesPerField.printIfExists('username', properties.kcFormGroupErrorClass!)}">
                    <label for="username">
                        <div class="label">${msg("username")}</div>

                        <div class="input">
                            <div class="icon left">
                                <#include "resources/img/login/read-email-at-1.svg">
                            </div>

                            <input
                                type="text"
                                id="username"
                                placeholder="${msg('placeholderRegisterUsername')}"
                                name="username"
                                v-model="username"
                                autocomplete="username"
                            />
                        </div>

                        <div class="${properties.kcInputMessageClass!}"> ${messagesPerField.get('username')} </div>
                    </label>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="input-group">
                    <div class="input-medium ${messagesPerField.printIfExists('password', properties.kcFormGroupErrorClass!)}">
                        <label for="password">
                            <div class="label">${msg("password")}</div>

                            <div class="input">
                                <div class="icon left">
                                    <#include "resources/img/login/lock-2-1.svg">
                                </div>

                                <input
                                    :type="seePassword ? 'text' : 'password'"
                                    id="password"
                                    placeholder="${msg('placeholderRegisterPassword')}"
                                    name="password"
                                    v-model="password"
                                    autocomplete="password"
                                />

                                <div class="icon right clickable" @click="seePassword = !seePassword">
                                    <template v-if="seePassword">
                                        <#include "resources/img/login/view-off-1.svg">
                                    </template>

                                    <template v-else>
                                        <#include "resources/img/login/view-1-1.svg">
                                    </template>
                                </div>
                            </div>

                            <div class="${properties.kcInputMessageClass!}"> ${messagesPerField.get('password')} </div>
                        </label>
                    </div>


                    <div class="input-medium ${messagesPerField.printIfExists('password-confirm', properties.kcFormGroupErrorClass!)}">
                        <label for="password-confirm">
                            <div class="label">${msg("passwordConfirm")}</div>

                            <div class="input">
                                <div class="icon left">
                                    <#include "resources/img/login/lock-2-1.svg">
                                </div>

                                <input
                                    :type="seePasswordConfirm ? 'text' : 'password'"
                                    id="password-confirm"
                                    placeholder="${msg('placeholderRegisterPasswordConfirm')}"
                                    name="password-confirm"
                                    v-model="passwordConfirm"
                                />

                                <div class="icon right clickable" @click="seePasswordConfirm = !seePasswordConfirm">
                                    <template v-if="seePasswordConfirm">
                                        <#include "resources/img/login/view-off-1.svg">
                                    </template>

                                    <template v-else>
                                        <#include "resources/img/login/view-1-1.svg">
                                    </template>
                                </div>
                            </div>

                            <div class="${properties.kcInputMessageClass!}"> ${messagesPerField.get('password-confirm')} </div>
                        </label>
                    </div>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}" :disabled="!canRegister"/>
                </div>
        
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}" style="text-align: right;">
                    <div class="${properties.kcFormButtonsWrapperClass!} login-buttons">
                        <#if realm.password?? && social.providers??>
                            <#list social.providers as p>
                                <a id="zocial-${p.alias}" class="social-link" href="${p.loginUrl}">
                                    <button class="social-button button-control" id="button-${p.alias}">
                                        <img src="${url.resourcesPath}/img/login/icon-${p.alias}.svg" class="icon-image icon-button-left" >
                                        <span>${msg("loginWith")} ${p.displayName} </span>
                                    </button>
                                </a>
                            </#list>
                        </#if>
                    </div>
                </div>

            <div id="kc-info-wrapper" class="back-link">
                <div class="terms-use"> <span>${msg("registerAcceptTerms")}</span> <a target="_blank" href="${properties.urlPrivacyPolicy!}"> ${msg("privacyPolicy")} </a> </div>

                <div class="back-to-login">
                    ${msg("alreadyAccount")}
                    <a href="${url.loginUrl}">${msg("backToLogin")?no_esc}</a>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>