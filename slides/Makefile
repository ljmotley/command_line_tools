#DEFINITIONS

slides_sections := $(shell grep '\\input' slides.tex | grep -v '%.*input' | grep -o 'sections/[A-Za-z0-9_\-]*\.tex')
slides_inputs := $(shell grep --no-filename 'input/' $(slides_sections) | grep -v '^%' | grep -o 'input/[A-Za-z0-9_\-]*\.[a-z]*')

#RECIPES

all: slides.pdf

clean:
	rm *.log *.aux
	rm *.out

Makefile_dropbox: Makefile
	sed 's/ln \-sf ..\/$$< $$@/cp -p $$< $$@/' $< | grep -v 'Makefile_dropbox' | grep -v "sed 's/ln" > $@

slides.pdf: slides.tex $(slides_sections) $(slides_inputs)
	pdflatex -draftmode $<
	bibtex $(basename $<).aux
	pdflatex -draftmode $<
	pdflatex $<
	rm $(addprefix $(basename $<),.log .aux .out .toc)
	rm $(addprefix $(basename $<),.snm .nav)
	rm $(addprefix $(basename $<),.blg .bbl)

.INTERMEDIATE: slides_notesonly.tex slides_handout.tex slides_healthtalk.tex

slides_notesonly.tex: slides.tex $(slides_sections) $(slides_inputs)
	sed 's/notes=hide/notes=only/' slides.tex  > $@

slides_notesonly.pdf: slides_notesonly.tex
	pdflatex slides_notesonly.tex #This will fail due to natbib's bug with notes-only beamer
	rm slides_notesonly.tex slides_notesonly.log

slides_handout.tex: slides.tex $(slides_sections) $(slides_inputs)
	cat slides.tex | sed 's/notes=hide/handout,notes=hide/' | sed 's/togglefalse{handout}/toggletrue{handout}/' > $@

slides_healthtalk.tex: slides.tex
	cat slides.tex | sed 's/togglefalse{gravitymodeloverview}/toggletrue{gravitymodeloverview}/' | sed 's/togglefalse{skipmedicaredata}/toggletrue{skipmedicaredata}/' > $@

slides_25minutes.tex: slides.tex
	cat slides.tex | sed 's/togglefalse{25minutes}/toggletrue{25minutes}/' | sed 's/toggletrue{90minutes}/togglefalse{90minutes}/' > $@

slides_%.pdf: slides_%.tex $(slides_sections) $(slides_inputs)
	pdflatex -draftmode $<
	bibtex $(basename $<).aux
	pdflatex -draftmode $<
	pdflatex $<
	rm $(addprefix $(basename $<),.log .aux .out .toc)
	rm $(addprefix $(basename $<),.snm .nav)
	rm $(addprefix $(basename $<),.blg .bbl)

#INPUT RECIPES
input/:
	mkdir $@
input/96Atlas_HRRs_map%: ../tasks/dartmouthatlas/output/96Atlas_HRRs_map% | input/
	ln -sf ../$< $@
$(addprefix input/,cbsa_us_2013_southbend.png cbsa_us_2013_bayarea.png EatonKortum2018_table4dot1.pdf CFS_2017_tableA3a_part.png LVAD_Detail.png LVAD_Overview.jpg): input/%: ../tasks/externalexhibits/output/% | input/
	ln -sf ../$< $@
input/pop_elas_prod%.eps: ../tasks/graph_trade_flows_confidential/output/pop_elas_prod%.eps | input/
	ln -sf ../$< $@
$(addprefix input/,$(foreach geo, cbsa hrr,distance_headries_scatter_$(geo).eps distance_EKnormimports_scatter_$(geo).eps trade_distancebins_$(geo).tex)): input/%: ../tasks/gravity_analysis/output/% | input/
	ln -sf ../$< $@
input/HME_CDKW_%_slides.tex:  ../tasks/exhibits_cosmetics/output/HME_CDKW_%_slides.tex | input/
	ln -sf ../$< $@
input/HME_CDKW_%.tex:  ../tasks/gravity_analysis/output/HME_CDKW_%.tex | input/
	ln -sf ../$< $@
input/elas_confidential_%.eps: ../tasks/graph_population_elasticities_confidential/output/elas_confidential_%.eps | input/
	ln -sf ../$< $@
input/pop_elas_prodconstrade_%.eps: ../tasks/graph_trade_flows_confidential/output/pop_elas_prodconstrade_%.eps | input/
	ln -sf ../$< $@
input/pop_elas_tradeflows%.eps: ../tasks/graph_trade_flows_confidential/output/pop_elas_tradeflows%.eps | input/
	ln -sf ../$< $@
input/intraprocedure_GLindex_%_mean.eps: ../tasks/graph_intra_procedure_confidential/output/intraprocedure_GLindex_%_mean.eps | input/
	ln -sf ../$< $@
input/imports_consumption_ratio_byprocedure_%.eps: ../tasks/graph_intra_procedure_confidential/output/imports_consumption_ratio_byprocedure_%.eps | input/
	ln -sf ../$< $@
input/hist_share_exports_%.eps: ../tasks/graph_trade_flows_confidential/output/hist_share_exports_%.eps | input/
	ln -sf ../$< $@
input/hist_share_imports_%.eps: ../tasks/graph_trade_flows_confidential/output/hist_share_imports_%.eps | input/
	ln -sf ../$< $@
input/popela_phys_NPPES_%: ../tasks/graph_population_elasticities_NPPES/output/popela_phys_NPPES_% | input/
	ln -sf ../$< $@
input/distance_FWLtrade_binscatter_%.eps: ../tasks/gravity_analysis/output/distance_FWLtrade_binscatter_%.eps | input/
	ln -sf ../$< $@
input/dist_trade_FWLintensive_extensive_%.eps: ../tasks/gravity_analysis/output/dist_trade_FWLintensive_extensive_%.eps | input/
	ln -sf ../$< $@
input/stats_%_summary_by_procedures.tex: ../tasks/graph_trade_flows_confidential/output/stats_%_summary_by_procedures.tex | input/
	ln -sf ../$< $@
input/stats_%_by_procedures.tex: ../tasks/graph_trade_flows_confidential/output/stats_%_by_procedures.tex | input/
	ln -sf ../$< $@
input/procedures_to_market_size_%.eps: ../tasks/sumstats_procedures_confidential/output/procedures_to_market_size_%.eps | input/
	ln -sf ../$< $@
input/stats_picked_procedures.tex: ../tasks/sumstats_procedures_confidential/output/stats_picked_procedures.tex | input/
	ln -sf ../$< $@
input/table_examples_top_procedures_surgeries_GL_%.tex: ../tasks/graph_intra_procedure_confidential/output/table_examples_top_procedures_surgeries_GL_%.tex | input/
	ln -sf ../$< $@
input/GL_overall_mean_%.tex: ../tasks/graph_intra_procedure_confidential/output/GL_overall_mean_%.tex | input/
	ln -sf ../$< $@
input/trade_distancebins_%_zip_to_zip.tex: ../tasks/gravity_analysis/output/trade_distancebins_%_zip_to_zip.tex | input/
	ln -sf ../$< $@
input/demand_supply_%-figure0.pdf: ../tasks/model_graphs/output/demand_supply_%-figure0.pdf | input/
	ln -sf ../$< $@
input/demand_supply_%-figure1.pdf: ../tasks/model_graphs/output/demand_supply_%-figure1.pdf | input/
	ln -sf ../$< $@
input/production_function-figure%.pdf: ../tasks/model_graphs/output/production_function-figure%.pdf | input/
	ln -sf ../$< $@
input/hist_share_%.eps: ../tasks/graph_trade_flows_facility_confidential/output/hist_share_%.eps | input/
	ln -sf ../$< $@
input/pop_elas_%.eps: ../tasks/graph_trade_flows_facility_confidential/output/pop_elas_%.eps | input/
	ln -sf ../$< $@
input/HME_CDKW_cbsa_bedrock_narrow.tex: ../tasks/gravity_analysis_iv/output/HME_CDKW_cbsa_bedrock_narrow.tex | input/
	ln -sf ../$< $@
input/HME_CDKW_iv_diffs_full.tex: ../tasks/gravity_analysis_iv/output/HME_CDKW_iv_diffs_full.tex | input/
	ln -sf ../$< $@
input/exports_physicians%.eps: ../tasks/netexports_factorprices_regressions/output/exports_physicians%.eps | input/
	ln -sf ../$< $@
input/geo_regressions.tex: ../tasks/netexports_factorprices_regressions/output/geo_regressions.tex | input/
	ln -sf ../$< $@
input/corr_hrr_exporterfe_%.eps: ../tasks/correlations_exporter_fe_hospital_quality/output/corr_hrr_exporterfe_%.eps | input/
	ln -sf ../$< $@
input/corr_hrr_resid_exporterfe_%.eps: ../tasks/correlations_exporter_fe_hospital_quality/output/corr_hrr_resid_exporterfe_%.eps | input/
	ln -sf ../$< $@
input/map_hrr_noAK_HW_%.png: ../tasks/maps_confidential/output/map_hrr_noAK_HW_%.png | input/
	ln -sf ../$< $@
input/distances_%.eps: ../tasks/graph_distance_traveled/output/distances_%.eps | input/
	ln -sf ../$< $@
input/distance_over_50_100_km_by_samegeo_%.tex: ../tasks/graph_distance_traveled/output/distance_over_50_100_km_by_samegeo_%.tex | input/
	ln -sf ../$< $@
input/trade_shares_by_adjacency_%.tex: ../tasks/trade_share_adjacent_geos/output/trade_shares_by_adjacency_%.tex | input/
	ln -sf ../$< $@

input/exports_physicians.eps: ../tasks/netexports_factorprices_regressions/output/exports_physicians.eps | input/
	ln -sf ../$< $@
input/bedrock_firststage_cbsa.eps: ../tasks/bedrock_stats/output/bedrock_firststage_cbsa.eps | input/
	ln -sf ../$< $@
input/scatter_spec_income_quant.eps: ../tasks/specialty_income_phys_scatterplot/output/scatter_spec_income_quant.eps | input/
	ln -sf ../$< $@
input/elas_weights_%.tex: ../tasks/population_elasticity_healthcare_costs_ACS/output/elas_weights_%.tex | input/
	ln -sf ../$< $@
$(foreach geo,cz cbsa,$(foreach var,lnearn_others lnearn_physicians lnvalueh,input/elas_$(var)_$(geo).pdf)):\
input/elas_%.pdf: ../tasks/population_elasticity_healthcare_costs_ACS/output/elas_%.pdf | input/
	ln -sf ../$< $@
$(foreach geo,cz,$(foreach type,general specialists,$(foreach var, lnearn_physicians,input/elas_$(var)_$(geo)_$(type).pdf))):\
input/elas_%.pdf: ../tasks/population_elasticity_healthcare_costs_ACS/output/elas_%.pdf | input/
	ln -sf ../$< $@
input/equalize_Phi_%.eps: ../tasks/counterfactuals_stata/output/equalize_Phi_%.eps | input/
	ln -sf ../$< $@
input/counterfactual_%: ../tasks/counterfactuals_stata/output/counterfactual_% | input/
	ln -sf ../$< $@
input/elas_confidential_per_capita_%.eps: ../tasks/graph_population_elasticities_per_capita_confidential/output/elas_confidential_per_capita_%.eps | input/
	ln -sf ../$< $@
input/exporterFE_production_scatter_%.eps: ../tasks/scale_elasticity_estimation/output/exporterFE_production_scatter_%.eps | input/
	ln -sf ../$< $@
input/kdensity_%.eps: ../tasks/graph_trade_flows_confidential/output/kdensity_%.eps | input/
	ln -sf ../$< $@
input/binscatter_%.eps: ../tasks/graph_trade_flows_confidential/output/binscatter_%.eps | input/
	ln -sf ../$< $@
input/graph_gravity_%.eps: ../tasks/gravity_analysis/output/graph_gravity_%.eps | input/
	ln -sf ../$< $@
input/gravity_%_byincome_byprocedure_terciles.tex: ../tasks/exhibits_cosmetics/output/gravity_%_byincome_byprocedure_terciles.tex | input/
	ln -sf ../$< $@
input/HME_CDKW_hrr_byfreq_decile.eps: ../tasks/HME_CDWK_byfreq_deciles/output/HME_CDKW_hrr_byfreq_decile.eps | input/
	ln -sf ../$< $@
input/medicare_inc_elas_national.pdf: ../tasks/quantity_earnings_popn_elasticities/output/medicare_inc_elas_national.pdf | input/
	ln -sf ../$< $@
input/rare_common_hcpcs_examples.tex: ../tasks/rare_common_hcpcs/output/rare_common_hcpcs_examples.tex | input/
	ln -sf ../$< $@
input/claimformsamplepage_part%.pdf: ../tasks/claimform/output/claimformsamplepage_part%.pdf | input/
	ln -sf ../$< $@
input/%_marketsize_hrr.eps: ../tasks/graph_trade_flows_confidential/output/%_marketsize_hrr.eps | input/
	ln -sf ../$< $@
input/alpha_%.tex: ../tasks/scale_elasticity_estimation/output/alpha_%.tex | input/
	ln -sf ../$< $@
input/line_trade_flows_by_year.eps: ../tasks/graph_share_traded_by_year/output/line_trade_flows_by_year.eps |input/
	ln -sf ../$< $@
