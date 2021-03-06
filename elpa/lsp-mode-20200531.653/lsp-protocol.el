;;; lsp-protocol.el --- Language Sever Protocol Bindings  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Ivan Yonchovski

;; Author: Ivan Yonchovski <yyoncho@gmail.com>
;; Keywords: abbrev, abbrev, abbrev, abbrev

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Autogenerated bindings from lsp4j using
;; https://github.com/victools/jsonschema-generator+scrips to generate
;; scripts/generated.protocol.schema.json and then
;; scripts/lsp-generate-bindings.el

;;; Code:


(defmacro lsp-interface (&rest interfaces)
  "Generates LSP bindings from (Inteface name, Required Fields, Optional Fields) triplet.

Example usage with `dash'.

(-let [(&ApplyWorkspaceEditResponse
  :failure-reason?) (ht (\"failureReason\" \"...\"))]
  failure-reason?) "
  (->> interfaces
       (-map (-lambda ((interface required optional))
               (let ((params (nconc
                              (-map (lambda (param-name)
                                      (cons
                                       (intern (concat ":" (s-dashed-words (symbol-name param-name)) "?"))
                                       param-name))
                                    optional)
                              (-map (lambda (param-name)
                                      (cons (intern (concat ":" (s-dashed-words (symbol-name param-name))))
                                            param-name))
                                    required))))
                 (cl-list*
                  `(defun ,(intern (format "dash-expand:&%s" interface)) (key source)
                     (unless (member key ',(-map #'cl-first params))
                       (error "Unknown key: %s. Available keys: %s" key ',(-map #'cl-first params)))
                     `(gethash ,(substring (symbol-name
                                            (cl-rest (assoc key ',params)))
                                           1)
                               ,source))
                  `(defun ,(intern (format "lsp-%s?" (s-dashed-words (symbol-name interface)))) (object)
                     (if (ht? object)
                         (-all? (lambda (prop)
                                  (ht-get object prop))
                                ',(-map (lambda (field-name)
                                          (substring (symbol-name field-name) 1))
                                        required))
                       (-all? (lambda (prop)
                                (plist-get object prop))
                              ',required)))
                  (-mapcat (-lambda ((label . name))
                             (list
                              `(defun ,(intern (format "lsp:%s-%s"
                                                       (s-dashed-words (symbol-name interface))
                                                       (substring (symbol-name label) 1)))
                                   (object)
                                 (gethash ,(substring (symbol-name name) 1) object))
                              `(defun ,(intern (format "lsp:set-%s-%s"
                                                       (s-dashed-words (symbol-name interface))
                                                       (substring (symbol-name label) 1)))
                                   (object value)
                                 (puthash ,(substring (symbol-name name) 1) value object))))
                           params)))))
       (apply #'append)
       (cl-list* 'progn)))


;; begin autogenerated code

(defconst lsp/completion-item-kind-text 0)
(defconst lsp/completion-item-kind-method 1)
(defconst lsp/completion-item-kind-function 2)
(defconst lsp/completion-item-kind-constructor 3)
(defconst lsp/completion-item-kind-field 4)
(defconst lsp/completion-item-kind-variable 5)
(defconst lsp/completion-item-kind-class 6)
(defconst lsp/completion-item-kind-interface 7)
(defconst lsp/completion-item-kind-module 8)
(defconst lsp/completion-item-kind-property 9)
(defconst lsp/completion-item-kind-unit 10)
(defconst lsp/completion-item-kind-value 11)
(defconst lsp/completion-item-kind-enum 12)
(defconst lsp/completion-item-kind-keyword 13)
(defconst lsp/completion-item-kind-snippet 14)
(defconst lsp/completion-item-kind-color 15)
(defconst lsp/completion-item-kind-file 16)
(defconst lsp/completion-item-kind-reference 17)
(defconst lsp/completion-item-kind-folder 18)
(defconst lsp/completion-item-kind-enum-member 19)
(defconst lsp/completion-item-kind-constant 20)
(defconst lsp/completion-item-kind-struct 21)
(defconst lsp/completion-item-kind-event 22)
(defconst lsp/completion-item-kind-operator 23)
(defconst lsp/completion-item-kind-type-parameter 24)
(defconst lsp/completion-trigger-kind-invoked 0)
(defconst lsp/completion-trigger-kind-trigger-character 1)
(defconst lsp/completion-trigger-kind-trigger-for-incomplete-completions 2)
(defconst lsp/diagnostic-severity-error 0)
(defconst lsp/diagnostic-severity-warning 1)
(defconst lsp/diagnostic-severity-information 2)
(defconst lsp/diagnostic-severity-hint 3)
(defconst lsp/diagnostic-tag-unnecessary 0)
(defconst lsp/diagnostic-tag-deprecated 1)
(defconst lsp/document-highlight-kind-text 0)
(defconst lsp/document-highlight-kind-read 1)
(defconst lsp/document-highlight-kind-write 2)
(defconst lsp/file-change-type-created 0)
(defconst lsp/file-change-type-changed 1)
(defconst lsp/file-change-type-deleted 2)
(defconst lsp/insert-text-format-plain-text 0)
(defconst lsp/insert-text-format-snippet 1)
(defconst lsp/message-type-error 0)
(defconst lsp/message-type-warning 1)
(defconst lsp/message-type-info 2)
(defconst lsp/message-type-log 3)
(defconst lsp/signature-help-trigger-kind-invoked 0)
(defconst lsp/signature-help-trigger-kind-trigger-character 1)
(defconst lsp/signature-help-trigger-kind-content-change 2)
(defconst lsp/symbol-kind-file 0)
(defconst lsp/symbol-kind-module 1)
(defconst lsp/symbol-kind-namespace 2)
(defconst lsp/symbol-kind-package 3)
(defconst lsp/symbol-kind-class 4)
(defconst lsp/symbol-kind-method 5)
(defconst lsp/symbol-kind-property 6)
(defconst lsp/symbol-kind-field 7)
(defconst lsp/symbol-kind-constructor 8)
(defconst lsp/symbol-kind-enum 9)
(defconst lsp/symbol-kind-interface 10)
(defconst lsp/symbol-kind-function 11)
(defconst lsp/symbol-kind-variable 12)
(defconst lsp/symbol-kind-constant 13)
(defconst lsp/symbol-kind-string 14)
(defconst lsp/symbol-kind-number 15)
(defconst lsp/symbol-kind-boolean 16)
(defconst lsp/symbol-kind-array 17)
(defconst lsp/symbol-kind-object 18)
(defconst lsp/symbol-kind-key 19)
(defconst lsp/symbol-kind-null 20)
(defconst lsp/symbol-kind-enum-member 21)
(defconst lsp/symbol-kind-struct 22)
(defconst lsp/symbol-kind-event 23)
(defconst lsp/symbol-kind-operator 24)
(defconst lsp/symbol-kind-type-parameter 25)
(defconst lsp/text-document-save-reason-manual 0)
(defconst lsp/text-document-save-reason-after-delay 1)
(defconst lsp/text-document-save-reason-focus-out 2)
(defconst lsp/text-document-sync-kind-none 0)
(defconst lsp/text-document-sync-kind-full 1)
(defconst lsp/text-document-sync-kind-incremental 2)
(defconst lsp/type-hierarchy-direction-children 0)
(defconst lsp/type-hierarchy-direction-parents 1)
(defconst lsp/type-hierarchy-direction-both 2)
(lsp-interface
 (CallHierarchyCapabilities nil
                            (:dynamicRegistration))
 (CallHierarchyItem
  (:kind :name :range :selectionRange :uri)
  (:detail :tags))
 (ClientCapabilities nil
                     (:experimental :textDocument :workspace))
 (ClientInfo
  (:name)
  (:version))
 (CodeActionCapabilities nil
                         (:codeActionLiteralSupport :dynamicRegistration :isPreferredSupport))
 (CodeActionContext
  (:diagnostics)
  (:only))
 (CodeActionKindCapabilities
  (:valueSet)
  nil)
 (CodeActionLiteralSupportCapabilities nil
                                       (:codeActionKind))
 (CodeActionOptions nil
                    (:codeActionKinds))
 (CodeLensCapabilities nil
                       (:dynamicRegistration))
 (CodeLensOptions
  (:resolveProvider)
  nil)
 (Color
  (:red :green :blue :alpha)
  nil)
 (ColorProviderCapabilities nil
                            (:dynamicRegistration))
 (ColorProviderOptions nil
                       (:documentSelector :id))
 (ColoringInformation
  (:range :styles)
  nil)
 (Command
  (:title :command)
  (:arguments))
 (CompletionCapabilities nil
                         (:completionItem :completionItemKind :contextSupport :dynamicRegistration))
 (CompletionContext
  (:triggerKind)
  (:triggerCharacter))
 (CompletionItem
  (:label)
  (:additionalTextEdits :command :commitCharacters :data :deprecated :detail :documentation :filterText :insertText :insertTextFormat :kind :preselect :sortText :tags :textEdit))
 (CompletionItemCapabilities nil
                             (:commitCharactersSupport :deprecatedSupport :documentationFormat :preselectSupport :snippetSupport :tagSupport))
 (CompletionItemKindCapabilities nil
                                 (:valueSet))
 (CompletionItemTagSupportCapabilities
  (:valueSet)
  nil)
 (CompletionOptions nil
                    (:resolveProvider :triggerCharacters))
 (ConfigurationItem nil
                    (:scopeUri :section))
 (CreateFileOptions nil
                    (:ignoreIfExists :overwrite))
 (DeclarationCapabilities nil
                          (:dynamicRegistration :linkSupport))
 (DefinitionCapabilities nil
   (:dynamicRegistration :linkSupport))
 (DeleteFileOptions nil
                    (:ignoreIfNotExists :recursive))
 (Diagnostic
  (:range :message)
  (:code :relatedInformation :severity :source :tags))
 (DiagnosticRelatedInformation
  (:location :message)
  nil)
 (DiagnosticsTagSupport
  (:valueSet)
  nil)
 (DidChangeConfigurationCapabilities nil
                                     (:dynamicRegistration))
 (DidChangeWatchedFilesCapabilities nil
                                    (:dynamicRegistration))
 (DocumentFilter nil
                 (:language :pattern :scheme))
 (DocumentHighlightCapabilities nil
                                (:dynamicRegistration))
 (DocumentLinkCapabilities nil
                           (:dynamicRegistration :tooltipSupport))
 (DocumentLinkOptions nil
                      (:resolveProvider))
 (DocumentOnTypeFormattingOptions
  (:firstTriggerCharacter)
  (:moreTriggerCharacter))
 (DocumentSymbol
  (:kind :name :range :selectionRange)
  (:children :deprecated :detail))
 (DocumentSymbolCapabilities nil
                             (:dynamicRegistration :hierarchicalDocumentSymbolSupport :symbolKind))
 (Either\(Boolean\,StaticRegistrationOptions\) nil
                                               (:left :right))
 (Either\(String\,MarkupContent\) nil
                                  (:left :right))
 (ExecuteCommandCapabilities nil
                             (:dynamicRegistration))
 (ExecuteCommandOptions
  (:commands)
  nil)
 (FileEvent
  (:type :uri)
  nil)
 (FileSystemWatcher
  (:globPattern)
  (:kind))
 (FoldingRangeCapabilities nil
                           (:dynamicRegistration :lineFoldingOnly :rangeLimit))
 (FoldingRangeProviderOptions nil
                              (:documentSelector :id))
 (FormattingCapabilities nil
                         (:dynamicRegistration))
 (FormattingOptions
  (:loadFactor :threshold :accessOrder)
  nil)
 (HoverCapabilities nil
                    (:contentFormat :dynamicRegistration))
 (ImplementationCapabilities nil
                             (:dynamicRegistration :linkSupport))
 (Location
  (:range :uri)
  nil)
 (MarkedString
  (:language :value)
  nil)
 (MarkupContent
  (:kind :value)
  nil)
 (MessageActionItem
  (:title)
  nil)
 (OnTypeFormattingCapabilities nil
                               (:dynamicRegistration))
 (ParameterInformation
  (:label)
  (:documentation))
 (ParameterInformationCapabilities nil
                                   (:labelOffsetSupport))
 (Position
  (:character :line)
  nil)
 (PublishDiagnosticsCapabilities nil
                                 (:relatedInformation :tagSupport :versionSupport))
 (Range
  (:start :end)
  nil)
 (RangeFormattingCapabilities nil
                              (:dynamicRegistration))
 (ReferenceContext
  (:includeDeclaration)
  nil)
 (ReferencesCapabilities nil
                         (:dynamicRegistration))
 (Registration
  (:method :id)
  (:registerOptions))
 (RenameCapabilities nil
                     (:dynamicRegistration :prepareSupport))
 (RenameFileOptions nil
                    (:ignoreIfExists :overwrite))
 (RenameOptions nil
                (:documentSelector :id :prepareProvider))
 (ResourceChange nil
                 (:current :newUri))
 (ResourceOperation
  (:kind)
  nil)
 (SaveOptions nil
              (:includeText))
 (SelectionRange
  (:range)
  (:parent))
 (SelectionRangeCapabilities nil
                             (:dynamicRegistration))
 (SemanticHighlightingCapabilities nil
                                   (:semanticHighlighting))
 (SemanticHighlightingInformation
  (:line)
  (:tokens))
 (SemanticHighlightingServerCapabilities nil
                                         (:scopes))
 (ServerCapabilities nil
                     (:callHierarchyProvider :codeActionProvider :codeLensProvider :colorProvider :completionProvider :declarationProvider :definitionProvider :documentFormattingProvider :documentHighlightProvider :documentLinkProvider :documentOnTypeFormattingProvider :documentRangeFormattingProvider :documentSymbolProvider :executeCommandProvider :experimental :foldingRangeProvider :hoverProvider :implementationProvider :referencesProvider :renameProvider :selectionRangeProvider :semanticHighlighting :signatureHelpProvider :textDocumentSync :typeDefinitionProvider :typeHierarchyProvider :workspace :workspaceSymbolProvider))
 (ServerInfo
  (:name)
  (:version))
 (SignatureHelp
  (:signatures)
  (:activeParameter :activeSignature))
 (SignatureHelpCapabilities nil
                            (:contextSupport :dynamicRegistration :signatureInformation))
 (SignatureHelpContext
  (:triggerKind :isRetrigger)
  (:activeSignatureHelp :triggerCharacter))
 (SignatureHelpOptions nil
                       (:retriggerCharacters :triggerCharacters))
 (SignatureInformation
  (:label)
  (:documentation :parameters))
 (SignatureInformationCapabilities nil
                                   (:documentationFormat :parameterInformation))
 (StaticRegistrationOptions nil
                            (:documentSelector :id))
 (SymbolCapabilities nil
                     (:dynamicRegistration :symbolKind))
 (SymbolKindCapabilities nil
                         (:valueSet))
 (SynchronizationCapabilities nil
                              (:didSave :dynamicRegistration :willSave :willSaveWaitUntil))
 (TextDocumentClientCapabilities nil
                                 (:callHierarchy :codeAction :codeLens :colorProvider :completion :declaration :definition :documentHighlight :documentLink :documentSymbol :foldingRange :formatting :hover :implementation :onTypeFormatting :publishDiagnostics :rangeFormatting :references :rename :selectionRange :semanticHighlightingCapabilities :signatureHelp :synchronization :typeDefinition :typeHierarchyCapabilities))
 (TextDocumentContentChangeEvent
  (:text)
  (:range :rangeLength))
 (TextDocumentEdit
  (:textDocument :edits)
  nil)
 (TextDocumentIdentifier
  (:uri)
  nil)
 (TextDocumentItem
  (:languageId :text :uri :version)
  nil)
 (TextDocumentSyncOptions nil
                          (:change :openClose :save :willSave :willSaveWaitUntil))
 (TextEdit
  (:newText :range)
  nil)
 (TypeDefinitionCapabilities nil
                             (:dynamicRegistration :linkSupport))
 (TypeHierarchyCapabilities nil
                            (:dynamicRegistration))
 (TypeHierarchyItem
  (:kind :name :range :selectionRange :uri)
  (:children :data :deprecated :detail :parents))
 (Unregistration
  (:method :id)
  nil)
 (VersionedTextDocumentIdentifier
  (:uri)
  (:version))
 (WorkspaceClientCapabilities nil
                              (:applyEdit :configuration :didChangeConfiguration :didChangeWatchedFiles :executeCommand :symbol :workspaceEdit :workspaceFolders))
 (WorkspaceEdit nil
                (:changes :documentChanges :resourceChanges))
 (WorkspaceEditCapabilities nil
                            (:documentChanges :failureHandling :resourceChanges :resourceOperations))
 (WorkspaceFolder
  (:uri)
  (:name))
 (WorkspaceFoldersChangeEvent
  (:removed :added)
  nil)
 (WorkspaceFoldersOptions nil
                          (:changeNotifications :supported))
 (WorkspaceServerCapabilities nil
                              (:workspaceFolders)))

;; end autogenerated

(provide 'lsp-protocol)
;;; lsp-protocol.el ends here
