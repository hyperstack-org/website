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
        AccordionItemTitle { H3 { "one" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "with sub" } }
        AccordionItemBody { SubAc() }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "three" } }
        AccordionItemBody { P { "body" } }
      end
    end
  end
end

class SubAc < Hyperloop::Component
  render do
    Accordion do
      AccordionItem do
        AccordionItemTitle { H3 { "A" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "with subs" } }
        AccordionItemBody { SubSubAc() }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "C" } }
        AccordionItemBody { P { "body" } }
      end
    end
  end
end

class SubSubAc < Hyperloop::Component
  render do
    Accordion do
      AccordionItem do
        AccordionItemTitle { H3 { "A" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "with subs subs" } }
        AccordionItemBody { SubSubSubAc() }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "C" } }
        AccordionItemBody { P { "body" } }
      end
    end
  end
end

class SubSubSubAc < Hyperloop::Component
  render do
    Accordion do
      AccordionItem do
        AccordionItemTitle { H3 { "A" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "with subs subs subs" } }
        AccordionItemBody { SubSubSubSubAc() }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "C" } }
        AccordionItemBody { P { "body" } }
      end
    end
  end
end

class SubSubSubSubAc < Hyperloop::Component
  render do
    Accordion do
      AccordionItem do
        AccordionItemTitle { H3 { "A" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "B" } }
        AccordionItemBody { P { "body" } }
      end
      AccordionItem do
        AccordionItemTitle { H3 { "C" } }
        AccordionItemBody { P { "body" } }
      end
    end
  end
end
