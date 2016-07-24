
1.       plan your gem
2.       start with the project structure – google
3.       start with the entry point – the file run  (create the executable file – watch Avi’s video about 7:30 of the youtube
4.       force that to build the CLI interface
5.       stub out the interface
6.       start making things real
7.       discover objects
8.       program
 
I want to grab cats from the website: http://www.adoptapet.com/shelter80748-cats.html
- Grab all indexes
- Go into each index and get some info about the cat

The CLI - shows a list of cats and you choose the cat you want to know about

user types cats_for_adoption

Show a list of cats

1. Lola
2. Dextoo
3. Peppone

Which cat would you like info on?

 

google - patterns people use to create gems
gems that are libraries
gems that are cli’s 

 


# create a gem – stub out all the structure  - maybe watch the railscast
http://railscasts.com/episodes/245-new-gem-with-bundler
 


What is a Cat?

A cat has a name 
A cat has a breed
A cat has a sex and age
A cat has a story
A cat has a url?



I have successfully scraped a single cats index page 

I need to now refactor or create a method that will allow me to grab entire indexes from this page 
- http://www.aspca.org/nyc/aspca-adoption-center/adoptable-cats

Div container holding all the cats (may need to go levels deeper) - div.view-content
This can nail down to a single URL - doc.css("div.view-content").css("div.link.status-1 a").attribute("href").value
Need the div where I could iterate and grab all of the xml elements with the above code

Can iterate on this and grab them  - iterate on i
doc.css("div.view-content").css("div.views-row-odd.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value


left side cats
i = 0 
while i < 5
puts doc.css("div.view-content").css("div.views-row-odd.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value
i += 1 
end

right side cats
i = 0 
while i < 5
puts doc.css("div.view-content").css("div.views-row-even.listing.contextual-links-region")[i].css("div.link.status-1 a").attribute("href").value
i += 1 
end


