// --
// Copyright (C) 2019–present Efflux GmbH, https://efflux.de/
// Part of the CustomCSS package.
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (GPL). If you
// did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
// --

'use strict';

var Core = Core || {};
Core.Agent = Core.Agent || {};
Core.Agent.Admin = Core.Agent.Admin || {};

Core.Agent.Admin.CustomCSS = (function(TargetNS) {
	let CSSCodeMirror;

	TargetNS.Init = function () {
		CKEDITOR.on('instanceReady', function(Editor) {
			$('.cke_button__autocomplete').hide()
			$('.cke_button__maximize ').hide()

			CSSCodeMirror = $('.CodeMirror')[0].CodeMirror;
			CSSCodeMirror.setOption('mode', 'text/css');
		});

		$('#TemplatePriority').on('click', function() {
			TargetNS.TemplatePriority();
		});

		$('#TemplateArticle').on('click', function() {
			TargetNS.TemplateArticle();
		});

		$('#ExportCSS').on('click', function() {
			TargetNS.ExportCSS();
		});

	};

	TargetNS.InsertText = function(Text) {
		CSSCodeMirror.replaceRange("\n" + Text, {line: Infinity});
	}

	TargetNS.ExportCSS = function() {
		// Create a download element, run, and delete it afterwards.
		const Value = 'data:text/css;charset=utf-8,' + encodeURIComponent(CSSCodeMirror.getValue());

		let FileString = document.createElement('a');
		$(FileString).attr({'href': Value, 'download': 'Core.Agent.CustomCSS.css'}).hide();;

		$(document.body).append(FileString);
		FileString.click();
		FileString.remove();
	}

	TargetNS.TemplatePriority = function() {
		const CSS = 
			"/* Change the priority colors. */\n" +
			".Flag span.PriorityID-1 {\n" +
			"	background-color: #778ca3;\n" + 
			"}\n" +
			"\n" +
			".Flag span.PriorityID-2 {\n" +
			"	background-color: #20bf6b;\n" + 
			"}\n" +
			"\n" +
			".Flag span.PriorityID-3 {\n" +
			"	background-color: #fed330;\n" + 
			"}\n" +
			"\n" +
			".Flag span.PriorityID-4 {\n" +
			"	background-color: #fa8231;\n" + 
			"}\n" +
			"\n" +
			".Flag span.PriorityID-5 {\n" +
			"	background-color: #eb3b5a;\n" + 
			"}\n";

		TargetNS.InsertText(CSS);
	}

	TargetNS.TemplateArticle = function() {
		const CSS = 
			"/* VisibleForCustomer */\n" +
			".UseArticleColors td,\n" +
			".UseArticleColors tr:nth-child(even) td {\n" +
			"    transition: background ease 0.3s;\n" +
			"    background: #fff;\n" +
			"    border-color: #ccc;\n" +
			"    border-bottom: 1px solid #eee;\n" +
			"}\n" +
			"\n" +
			"/* VisibleForCustomer Active */\n" +
			".UseArticleColors tr.Active > td,\n" +
			".UseArticleColors tr:hover > td {\n" +
			"    background-color: #f2f2f2 !important;\n" +
			"    border-color: #f2f2f2;\n" +
			"    border-right-color: #ccc !important;\n" +
			"}\n" +
			"\n" +
			"/* NotVisibleForCustomer */\n" +
			".UseArticleColors tr.NotVisibleForCustomer > td {\n" +
			"    background: #FFCCCC !important;\n" +
			"    border-bottom-color: #e7abab;\n" +
			"    border-color: #e7abab;\n" +
			"}\n" +
			"\n" +
			"/* NotVisibleForCustomer Active */\n" +
			".UseArticleColors tr.NotVisibleForCustomer.Active > td,\n" +
			".UseArticleColors tr.NotVisibleForCustomer:hover > td {\n" +
			"    background-color: #e7abab !important;\n" +
			"    border-color: #e7abab;\n" +
			"}\n" +
			"\n" +
			"/* System */\n" +
			".UseArticleColors tr.system > td {\n" +
			"    background: #fff7be !important;\n" +
			"    border-bottom-color: #ffef80;\n" +
			"    border-color: #ffef80;\n" +
			"}\n" +
			"\n" +
			"/* System Active */\n" +
			".UseArticleColors tr.system.Active > td,\n" +
			".UseArticleColors tr.system:hover > td {\n" +
			"    background-color: #ffef80 !important;\n" +
			"    border-color: #ffef80;\n" +
			"}\n";

		TargetNS.InsertText(CSS);
	}

	Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

	return TargetNS;
}(Core.Agent.Admin.CustomCSS || {}));
