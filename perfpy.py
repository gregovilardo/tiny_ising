import pandas as pd
import matplotlib.pyplot as plt
import re

# Sample data as a multi-line string
data = """28794.62,msec,task-clock:u,28794624220,100.00,0.996,CPUs utilized
0,,context-switches:u,28794624220,100.00,0.000,/sec
0,,cpu-migrations:u,28794624220,100.00,0.000,/sec
1097,,page-faults:u,28794624220,100.00,38.097,/sec
319218186844,,instructions:u,24680525338,85.00,2.62,insn per cycle
,,,,,0.02,stalled cycles per insn
121617078441,,cycles:u,24676893860,85.00,4.224,GHz
5372937733,,stalled-cycles-frontend:u,24686807300,85.00,4.42,frontend cycles idle
34184081989,,branches:u,24682372630,85.00,1.187,G/sec
1042705531,,branch-misses:u,24680766066,85.00,3.05,of all branches
104086724560,,L1-dcache-loads:u,24684747113,85.00,3.615,G/sec
400878826,,L1-dcache-load-misses:u,24675633013,85.00,0.39,of all L1-dcache accesses"""

# Parse the data into a list of dictionaries
parsed_data = []
lines = data.split('\n')

for line in lines:
    # Split the line by commas
    parts = [p.strip() for p in line.split(',')]
    
    # Extract relevant information
    if len(parts) >= 7:
        metric_name = parts[2].split(':')[0] if parts[2] else parts[6]
        value = parts[0] if parts[0] else None
        unit = parts[1] if parts[1] else parts[6]
        
        # Clean up the metric name
        metric_name = re.sub(r'^:|:$', '', metric_name).strip()
        
        # Skip empty lines or summary lines without values
        if value and metric_name:
            parsed_data.append({
                'metric': metric_name,
                'value': float(value) if value.replace('.', '', 1).isdigit() else value,
                'unit': unit
            })

# Create a DataFrame
df = pd.DataFrame(parsed_data)

# Filter out non-numeric values for plotting
plot_df = df[pd.to_numeric(df['value'], errors='coerce').notnull()].copy()
plot_df['value'] = pd.to_numeric(plot_df['value'])

# Create a bar plot
# Modified visualization section
plt.figure(figsize=(12, 8))
bars = plt.barh(plot_df['metric'], plot_df['value'], color='skyblue')

# Add value labels using DataFrame index alignment
for idx, bar in enumerate(bars):
    width = bar.get_width()
    metric_row = plot_df.iloc[idx]
    unit = metric_row['unit'] if pd.notnull(metric_row['unit']) else ''
    plt.text(width, 
             bar.get_y() + bar.get_height()/2,
             f'{width:.2f} {unit}',
             ha='left', 
             va='center')

plt.xlabel('Value')
plt.title('Performance Metrics Visualization')
plt.tight_layout()
plt.show()

# Display the DataFrame for reference
print("\nParsed Data:")
print(df)
