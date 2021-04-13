# Teal Cloning Script

This script copies every program and episode in the teal database into a local
redis cache, which allows batch reading of teal's data to be performed much
faster. This script was built specifically for the stations's
[GraphQL API](https://github.com/WJRH-Engineering/api) 
so that it can perform arbitrarily complex queries on the teal's data without
waiting for potentially hundreds of http calls to resolve one at a time. 

Teal's data is generally structured as a set of nested javascript style
objects.
