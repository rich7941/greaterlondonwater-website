#!/bin/bash

# Script to add Help & Advice section to footer of all HTML files

for file in $(find . -name "*.html" -type f ! -name "index.html"); do
    echo "Processing: $file"
    
    # Check if the file already has Help & Advice section
    if grep -q "Help & Advice</h3>" "$file"; then
        echo "  Already has Help & Advice section, skipping..."
        continue
    fi
    
    # Find the line number of Company</h3>
    line_num=$(grep -n "Company</h3>" "$file" | head -1 | cut -d: -f1)
    
    if [ ! -z "$line_num" ]; then
        # Insert Help & Advice section before Company section
        insert_line=$((line_num - 1))
        sed -i "${insert_line}i\\        <div class=\"footer-section\">\\
          <h3>Help & Advice</h3>\\
          <ul>\\
            <li><a href=\"/help-and-advice/vinyl-fence/\">Vinyl Fence</a></li>\\
            <li><a href=\"/help-and-advice/wood-fence/\">Wood Fence</a></li>\\
            <li><a href=\"/help-and-advice/chain-link-fence/\">Chain Link Fence</a></li>\\
            <li><a href=\"/help-and-advice/dog-fence/\">Dog Fence</a></li>\\
            <li><a href=\"/help-and-advice/gates-entry/\">Gates & Entry</a></li>\\
            <li><a href=\"/help-and-advice/commercial-fence/\">Commercial Fence</a></li>\\
            <li><a href=\"/help-and-advice/agricultural-fence/\">Agricultural Fence</a></li>\\
            <li><a href=\"/help-and-advice/steel-fence/\">Steel Fence</a></li>\\
            <li><a href=\"/help-and-advice/aluminum-fence/\">Aluminum Fence</a></li>\\
            <li><a href=\"/help-and-advice/pool-fence/\">Pool Fence</a></li>\\
            <li><a href=\"/help-and-advice/deer-fence/\">Deer Fence</a></li>\\
            <li><a href=\"/help-and-advice/hardwood-fence/\">Hardwood Fence</a></li>\\
            <li><a href=\"/help-and-advice/trex-fence/\">Trex Fence</a></li>\\
          </ul>\\
        </div>" "$file"
        echo "  Added Help & Advice section"
    else
        echo "  No Company section found, skipping..."
    fi
done

echo "Finished processing all files"
