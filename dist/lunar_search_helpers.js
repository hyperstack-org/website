function getDatas() {
    return AllWebsiteDatas;
}

function Lunrindex(data) {

    //alert(data);

    //ok
  
    var index = lunr(function(){
        this.ref('headingid')
        this.field('headingname')
        this.field('text')
        this.metadataWhitelist = ['position']

        data.forEach(function(item) {
            this.add(item) 
        }, this);

        //this.pipeline.remove(lunr.stemmer);
        //this.searchPipeline.remove(lunr.stemmer);
        //this.pipeline.remove(lunr.stopWordFilter);

    })

    return index;
}


function Searchquery(index, data, querystring){

    // lunrresults returned format
    
    /*
    [{
      "ref": 123,
      "score": 0.123456,
      "metadata": {
        "term": {
          "fieldA": {
            "position": [[0,5], [21,26]]
          },
          "fieldB": {
            "position": [[2,7]]
          }
        }
      }
    }]
    */


    var lunrresults = index.search(querystring);

    // index.query(function (q) {
    //   q.term(term, { boost: 100 }) // exact match
    //   q.term(term, { usePipeline: false, wildcard: lunr.query.wildcard.TRAILING, boost: 10 }) // prefix match, no stemmer
    //   q.term(term, { usePipeline: false, editDistance: 1, boost: 1 }) // fuzzy matching
    // })


    // searchresults wanted format
    //[{"sectionid"=>0, "sectionname"=>"docs", "pageid"=>0, "pagename"=>"Hyperloop Components", "headingid"=>0, "headingslug"=>"components-dsl-overview", "headingname"=>"Components DSL Overview", "text"=>"Hyperloop Components are implemented ..."}]

    var searchresults = []

    lunrresults.forEach(function (result) {

        nbresults = 0;
        positioninheadingname = 0;
        positionintext = 0;
        matchingwords = "";
        correspondingtexts = [];

        correspondingdata = data.filter(item => item.headingid === result.ref);
        correspondingtexts = { "headingname": correspondingdata[0].headingname,
                              "text": correspondingdata[0].text }
                        
        Object.keys(result.matchData.metadata).forEach(function (term) {
             Object.keys(result.matchData.metadata[term]).forEach(function (fieldName) {
                fieldNameKey = result.matchData.metadata[term][fieldName]
                nbresults += fieldNameKey.position.length;
                
                fieldNameKey.position.forEach(function (element) {
                    matchingwords += correspondingtexts[fieldName].substr(element[0], element[1]) + ' ';
                })
                //alert(matchingwords);
                // if (fieldName=="headingname") { positioninheadingname = fieldNameKey.position}
                // if (fieldName=="text") { positionintext = fieldNameKey.position}
             })
        })
        
        searchresultitem = {"ref": result.ref,
                "nbresults": nbresults,
                // "positioninheadingname": positioninheadingname,
                // "positionintext": positionintext,
                "matchingwords": matchingwords.replace(/[^\w\s]|/g, "")}

        searchresults.push(searchresultitem)
    })

    //alert(lunrresults);
    //return lunrresults;
    return searchresults;
}