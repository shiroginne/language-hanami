describe "Hanami package", ->
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-hanami")

  it "parses the Rails grammar", ->
    grammar = atom.grammars.grammarForScopeName("source.ruby.hanami")
    expect(grammar).toBeDefined()
    expect(grammar.scopeName).toBe "source.ruby.hanami"
