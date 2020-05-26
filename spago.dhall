{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "react", "row-extra", "undefinable" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
