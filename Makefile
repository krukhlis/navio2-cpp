include config.mk
PREFIX="/usr/local"
PROJECT="navio2"

default: libnavio2 navio_examples done

mkdirs:
	@mkdir -p $(LIB_DIR)
	@mkdir -p $(LIB_BUILD_DIR)
	@mkdir -p $(EXAMPLES_BUILD_DIR)
	@mkdir -p $(EXAMPLES_BIN_DIR)

rmdirs:
	@rm -rf $(BUILD_DIR)

libnavio2: mkdirs
	@make -s -C src

navio_examples: mkdirs
	@make -s -C examples

debug: mkdirs
	@make -C src
	@make -C tests

install:
	@echo "installing $(PROJECT) to [$(PREFIX)/lib]"
	@cp .$(LIB_DIR)/lib$(PROJECT).a $(PREFIX)/lib
	@mkdir -p $(PREFIX)/include/$(PROJECT)
	@cp -r include/* $(PREFIX)/include/$(PROJECT)/
	@echo "$(PROJECT) installed!"

uninstall:
	@echo "removing $(PROJECT)"
	@rm $(PREFIX)/lib/lib$(PROJECT).a
	@rm -rf $(PREFIX)/include/$(PROJECT)

clean: rmdirs
	@echo "cleaning ..."
	@echo "done! :)"

done:
	@echo "done! :)"
