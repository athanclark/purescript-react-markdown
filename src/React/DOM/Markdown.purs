module React.DOM.Markdown where

import React (ReactClass, ReactElement, Children, unsafeCreateElement)
import Row.Class (class SubRow)
import Data.Nullable (Nullable)
import Data.Undefinable (Undefinable)
import Effect.Uncurried (EffectFn3, EffectFn1)


foreign import markdownImpl :: forall a. ReactClass a

type RequiredProps renderers =
  ( source :: String
  , renderers :: Record renderers
  )

type OptionalProps o =
  ( className :: String
  , escapeHtml :: Boolean
  , skipHtml :: Boolean
  , sourcePos :: Boolean
  , rawSourcePos :: Boolean
  , includeNodeIndex :: Boolean
  , allowedTypes :: Array String
  , disallowedTypes :: Array String
  , unwrapDisallowed :: Boolean
  -- , allowNode :: EffectFn3 Node Index Parent Boolean
  , linkTarget :: EffectFn3 String String String String
  , transformLinkUri :: Nullable (EffectFn1 String String)
  , transformImageUri :: Nullable (EffectFn1 String String)
  , plugins :: Array Plugin
  , parserOptions :: ParserOptions
  | o )

foreign import data Plugin :: Type
foreign import data ParserOptions :: Type

-- | Warning: you may need to `unsafeCoerce` your props to their actual type -
-- | enumerating all props a 'la W3C would be unreasonable, so use it at your own discretion.
type Renderers =
  ( root :: ReactClass {children :: Children, className :: Nullable String}
  , text :: ReactClass {children :: Children}
  , break :: ReactClass {children :: Children}
  , paragraph :: ReactClass {children :: Children}
  , emphasis :: ReactClass {children :: Children}
  , strong :: ReactClass {children :: Children}
  , thematicBreak :: ReactClass {children :: Children}
  , blockquote :: ReactClass {children :: Children}
  , delete :: ReactClass {children :: Children}
  , link :: ReactClass {children :: Children}
  , image :: ReactClass {children :: Children}
  , linkReference :: ReactClass {children :: Children}
  , imageReference :: ReactClass {children :: Children}
  , table :: ReactClass {children :: Children}
  , tableHead :: ReactClass {children :: Children}
  , tableBody :: ReactClass {children :: Children}
  , tableRow :: ReactClass {children :: Children}
  , tableCell :: ReactClass {children :: Children, align :: Nullable String, isHeader :: Boolean}
  , list :: ReactClass {children :: Children, start :: Undefinable (Nullable Int), ordered :: Boolean}
  , listItem :: ReactClass {children :: Children, checked :: Undefinable (Nullable Boolean)}
  , definition :: ReactClass {children :: Children}
  , heading :: ReactClass {children :: Children, level :: Int}
  , inlineCode :: ReactClass {children :: Children}
  , code :: ReactClass {children :: Children, language :: Nullable String, value :: Children}
  , html :: ReactClass
    { children :: Children
    , skipHtml :: Nullable Boolean
    , isBlock :: Boolean
    , escapeHtml :: Nullable Boolean
    , value :: Children
    }
  , virtualHtml :: ReactClass {children :: Children, tag :: ReactClass {children :: Children}}
  , parsedHtml :: ReactClass {element :: ReactClass {children :: Children}, "data-sourcepos" :: Nullable String}
  )



markdown :: forall props renderers
          . SubRow renderers Renderers
         => SubRow props (OptionalProps (RequiredProps renderers))
         => Record props -> ReactElement
markdown props = unsafeCreateElement markdownImpl props []
