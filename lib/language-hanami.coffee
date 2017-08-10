LanguageHanamiView = require './language-hanami-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageHanami =
  languageHanamiView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @languageHanamiView = new LanguageHanamiView(state.languageHanamiViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageHanamiView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-hanami:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageHanamiView.destroy()

  serialize: ->
    languageHanamiViewState: @languageHanamiView.serialize()

  toggle: ->
    console.log 'LanguageHanami was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
