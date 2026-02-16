module app;

import dlangui;
import std.stdio;
import std.path;
import std.file;
import image_indexer_core.indexer;

mixin APP_ENTRY_POINT;

/// Entry point for application
extern (C) int UIAppMain(string[] args) {
    // Create platform window
    Platform.instance.uiLanguage = "en";
    auto window = Platform.instance.createWindow("Image Indexer", null, WindowFlag.Resizable, 800, 600);
    
    // Create UI layout
    auto layout = new VerticalLayout();
    layout.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);

    // Search bar
    auto searchLayout = new HorizontalLayout();
    auto searchInput = new EditLine("SearchQuery", "Enter image description...");
    auto searchBtn = new Button("SearchBtn", "Search"d);
    searchLayout.addChild(searchInput);
    searchLayout.addChild(searchBtn);
    layout.addChild(searchLayout);

    // Results area
    auto resultsList = new StringListWidget("ResultsList");
    layout.addChild(resultsList);

    // Status
    auto statusLabel = new TextWidget("Status", "Ready"d);
    layout.addChild(statusLabel);

    // Logic
    auto indexer = new ImageIndexer("path/to/clip.onnx");

    searchBtn.click = delegate(Widget src) {
        string query = to!string(searchInput.text);
        if (query.length > 0) {
            statusLabel.text = "Searching for: "d ~ to!dstring(query);
            // Simulate results
            auto results = indexer.search(query);
            // Update list (placeholder)
            resultsList.items = ["result1.jpg"d, "result2.png"d]; 
            return true;
        }
        return false;
    };

    window.mainWidget = layout;
    window.show();

    // Run message loop
    return Platform.instance.enterMessageLoop();
}
