describe "Hanami snippets", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-hanami")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.ruby.hanami")

  it "tokenizes Action class for controller", ->
    controllerAction = '
      class Action
        include Web::Action
        
        def call(params)
        end
      end
    '
    {tokens} = grammar.tokenizeLine controllerAction
    expect(tokens[0]).toEqual value: controllerAction, scopes: ['source.ruby.hanami']
