graph:
	@mkdir -p ./.graph_tmp
	@tuist graph --format dot -o ./.graph_tmp
	@chmod +w ./.graph_tmp/graph.dot
	@grep -Ev '(.*DIContainer -> .*)|(.* -> Core.*)|(.* -> Shared.*)' ./.graph_tmp/graph.dot \
	| awk '\
	/->/ { \
		from = $$1; \
		to = $$3; \
		gsub(/"/, "", from); \
		gsub(/"/, "", to); \
		if (from ~ /Tests$$/) { \
			fromPrefix = from; \
			sub(/Tests$$/, "", fromPrefix); \
			toPrefix = to; \
			sub(/Implementation$$/, "", toPrefix); \
			sub(/Testing$$/, "", toPrefix); \
			if (fromPrefix == toPrefix) { \
				print "  " from " -> " to; \
			} \
		} else { \
			print "  " from " -> " to; \
		} \
		next; \
	} \
	{ print $$0 } \
	' > ./.graph_tmp/filtered_graph.dot
	@dot -Tpng ./.graph_tmp/filtered_graph.dot -o graph.png
	@rm -rf ./.graph_tmp
	@open graph.png
