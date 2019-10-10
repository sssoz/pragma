{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}

<main class="container main__content" id="main">
	<div class="row">
		<div class="offset-md-1 col-md-10 offset-lg-2 col-lg-8">
			<header class="main__header">
				<h1 class="main__title">
					<span>{translate key="user.login.resetPassword"}</span>
				</h1>
			</header>

			<p>{translate key="user.login.resetPasswordInstructions"}</p>

			<form id="lostPasswordForm"
			      action="{url page="login" op="requestResetPassword"}" method="post">
				{csrf}
				{if $error}
					{translate key=$error}
				{/if}

				<fieldset>
					<div class="form-group">
						<label for="email">
							{translate key="user.login.registeredEmail"}
							<span class="required">*</span>
							<span class="sr-only">{translate key="common.required"}</span>
						</label>
						<input class="form-control" type="text" name="email" id="email" value="{$email|escape}" required>
					</div>
					<div class="form-group">
						<button class="btn btn-primary" type="submit">
							{translate key="user.login.resetPassword"}
						</button>

						{if !$disableUserReg}
							{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
							<a href="{$registerUrl}" class="btn btn-secondary">
								{translate key="user.login.registerNewAccount"}
							</a>
						{/if}
					</div>
				</fieldset>

			</form>

		</div>
	</div><!-- .row -->
</main>

{include file="frontend/components/footer.tpl"}
