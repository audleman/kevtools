// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';

// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {

	// Use the console to output diagnostic information (console.log) and errors (console.error)
	// This line of code will only be executed once when your extension is activated
	console.log('Congratulations, your extension "kevtools" is now active!');

	// The command has been defined in the package.json file
	// Now provide the implementation of the command with registerCommand
	// The commandId parameter must match the command field in package.json
	let disposable = vscode.commands.registerCommand('kevtools.parseLogs', () => {
		formatLogs(vscode.window.activeTextEditor);
	});
	context.subscriptions.push(disposable);
}

export function formatLogs(editor: vscode.TextEditor|undefined): void {
	if (!editor || !editor.document)
		return;
	try {
		vscode.languages.setTextDocumentLanguage(editor.document, 'json');
		vscode.commands.executeCommand('editor.action.formatDocument');
		vscode.commands.executeCommand('editor.action.startFindReplaceAction', 'ver', 'KEVIN');
		vscode.window.showInformationMessage('parsed');
	} catch (err) {
		console.error(err);
	}
}

// this method is called when your extension is deactivated
export function deactivate() {}
