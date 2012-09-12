# -*- encoding : utf-8 -*-
require 'blacklight/catalog'

class CatalogController < ApplicationController

  include Blacklight::Catalog
  include BlacklightHighlight::ControllerExtension


  configure_blacklight do |config|
    ## Default parameters to send to solr for all search-like requests. See also SolrHelper#solr_search_params
    config.default_solr_params = {
      :qt => 'search',
      :rows => 10
    }

    # solr field configuration for search results/index views
    config.index.show_link = 'title'
    config.index.record_display_type = 'format'
    config.add_index_field 'creator', :label => 'Creator:'
    config.add_index_field 'subject', :label => 'Subject:'
    config.add_index_field 'date', :label => 'Date:'


    # solr field configuration for document/show views
    config.show.html_title = 'title'
    config.show.heading = 'title'
    config.show.display_type = 'format'
    config.add_show_field 'creator', :label => 'Creator:'
    config.add_show_field 'subject', :label => 'Subject:'
    config.add_show_field 'description', :label => 'Description:'
    config.add_show_field 'publisher', :label => 'Publisher:'
    config.add_show_field 'date', :label => 'Date:'
    config.add_show_field 'type', :label => 'Type:'
    config.add_show_field 'format', :label => 'Format:'
    config.add_show_field 'identifier', :label => 'Identifier:'


    # solr fields that will be treated as facets by the blacklight application
    config.add_facet_field 'type_facet', :label => 'Type'
    config.add_facet_field 'format_facet', :label => 'Format'
    config.add_facet_field 'date_facet', :label => 'Date'
    # Have BL send all facet field names to Solr
    config.default_solr_params[:'facet.field'] = config.facet_fields.keys

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    config.add_search_field 'all_fields', :label => 'All Fields'
    config.add_search_field('title') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'title' }
      field.solr_local_parameters = {
        :qf => '$title_qf',
        :pf => '$title_pf'
      }
    end
    config.add_search_field('creator') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'creator' }
      field.solr_local_parameters = {
        :qf => '$creator_qf',
        :pf => '$creator_pf'
      }
    end
    config.add_search_field('subject') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'subject' }
      field.solr_local_parameters = {
        :qf => '$subject_qf',
        :pf => '$subject_pf'
      }
    end

    # "sort results by" select (pulldown)
    config.add_sort_field 'score desc, title_sort asc', :label => 'Relevance'
    config.add_sort_field 'date_sort asc', :label => 'Date'
    config.add_sort_field 'title_sort asc', :label => 'Title'

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5


    # advanced search configuration
    config.advanced_search = {
      :form_solr_parameters => {
        'facet.field' => %w[type_facet format_facet date_facet]
      }
    }

    # fields available only from advanced search
    config.add_search_field('description') do |field|
      field.include_in_simple_select = false
    end
    config.add_search_field('publisher') do |field|
      field.include_in_simple_select = false
    end
    config.add_search_field('source') do |field|
      field.include_in_simple_select = false
    end
    config.add_search_field('relation') do |field|
      field.include_in_simple_select = false
    end

  end

end
