SRC_DIR := src
HS_FILES := $(sort $(wildcard $(SRC_DIR)/*.hs))
BIN_DIR := bin
EXES := $(patsubst $(SRC_DIR)/%.hs,$(BIN_DIR)/%,$(HS_FILES))

# Use stack because System.Random isn't here
GHC := stack ghc
GHCOPTIONS := -odir $(BIN_DIR) -hidir $(BIN_DIR)

.PHONY: all run clean clean_main

all: $(EXES)

$(BIN_DIR)/%: $(SRC_DIR)/%.hs | $(BIN_DIR)
	$(GHC) -- -o $@ $< && \
	rm $(SRC_DIR)/*.o $(SRC_DIR)/*.hi

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

run: all
	@for exe in $(EXES); do \
		echo "Running $$exe:"; \
		./$$exe; \
		echo ""; \
	done

clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BIN_DIR)
