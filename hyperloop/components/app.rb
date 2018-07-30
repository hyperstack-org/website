class App < Hyperloop::Component
  render(DIV) do
    H1 { 'Hyperstack.org website'}
    Ac()
  end
end

class Ac < Hyperloop::Component
  render do
    Accordion do
      AccordionItem do
        AccordionItemTitle { H3 { "Installation" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "Documentation *" } }
        AccordionItemBody { SubAc() }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "Tutorials" } }
        AccordionItemBody { P { "body" } }
      end
    end
  end
end

class SubAc < Hyperloop::Component
  render do
    Accordion do
      AccordionItem do
        AccordionItemTitle { H3 { "Components *" } }
        AccordionItemBody { SubSubAc() }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "Stores" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "Models" } }
        AccordionItemBody { P { "body" } }
      end
    end
  end
end

class SubSubAc < Hyperloop::Component
  render do
    Accordion do
      AccordionItem do
        AccordionItemTitle { H3 { "DSL Overview *" } }
        AccordionItemBody { SubSubSubAc() }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "Components and State" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "Multiple Components" } }
        AccordionItemBody { P { "body" } }
      end
    end
  end
end

class SubSubSubAc < Hyperloop::Component
  render(UL) do
    LI { "Hyperloop::Component" }
    LI { "Macros and Class methods" }
    LI { "Data Accessors" }
  end
end

# class SubSubSubAc < Hyperloop::Component
#   render do
#     Accordion do
#       AccordionItem do
#         AccordionItemTitle { H3 { "Hyperloop::Component" } }
#         AccordionItemBody { P { "body" } }
#       end
#       AccordionItem do
#         AccordionItemTitle { H3 { "Macros and Class methods" } }
#         AccordionItemBody { P { "body" } }
#       end
#       AccordionItem do
#         AccordionItemTitle { H3 { "Data Accessors" } }
#         AccordionItemBody { P { "body" } }
#       end
#     end
#   end
# end

# class SubSubSubSubAc < Hyperloop::Component
#   render do
#     Accordion do
#       AccordionItem do
#         AccordionItemTitle { H3 { "A" } }
#         AccordionItemBody { P { "body" } }
#       end
#       AccordionItem do
#         AccordionItemTitle { H3 { "B" } }
#         AccordionItemBody { P { "body" } }
#       end
#       AccordionItem do
#         AccordionItemTitle { H3 { "C" } }
#         AccordionItemBody { P { "body" } }
#       end
#     end
#   end
# end
