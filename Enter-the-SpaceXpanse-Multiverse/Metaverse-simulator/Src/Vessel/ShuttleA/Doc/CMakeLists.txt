# ShuttleA.pdf --------------------------------------------------------

set(document "ShuttleA")
set(outdir ${SPACEXPANSE_BINARY_DOC_DIR})
set(src ${CMAKE_CURRENT_SOURCE_DIR}/${document}.odt)
set(out ${outdir}/${document}.pdf)

add_custom_command(
	OUTPUT ${out}
	COMMAND ${ODT_TO_PDF_COMPILER} --headless --convert-to pdf --outdir ${outdir} ${src}
	DEPENDS ${src}
	JOB_POOL soffice
)
add_custom_target(ShuttleADoc
	DEPENDS ${out}
)
add_dependencies(ShuttleA
	ShuttleADoc
)
set_target_properties(ShuttleADoc
	PROPERTIES
	FOLDER Doc
)
install(FILES ${out}
	DESTINATION ${SPACEXPANSE_INSTALL_DOC_DIR}
)
