# IMLS Project Beta Site 

A Rails site utilizing Blacklight and Solr for the purpose of connecting
presidential collections. 

## new development setup

git clone <repo>
bundle install

## open up two tabs, one for jetty/solr, one for rails
# in jetty tab
cd jetty
java -jar start.jar

# in rails tab
bundle exec thin start # or rails s, your choice

## you'll also want two browser tabs open:
# rails
http://localhost:3000
# solr data import window
http://localhost:8389/solr/admin/dataimport.jsp

## to clear out solr index
## ref:
## http://wiki.apache.org/solr/FAQ#How_can_I_delete_all_documents_from_my_index.3F
curl http://localhost:8983/solr/update --data '<delete><query>*:*</query></delete>' -H 'Content-type:text/xml; charset=utf-8'  
curl http://localhost:8983/solr/update --data '<commit/>' -H 'Content-type:text/xml; charset=utf-8'

## Testing

 * To use the development jetty for testing:

```
export TEST_JETTY_PORT=8983  
rake cucumber
```
