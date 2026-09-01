# Read every line from the input file and store it as a character vector
input <- readLines("rosalind_tree.txt")


# The first line contains the number of nodes (n)
# Convert it from character to numeric
n <- as.numeric(input[1])


# Initially, assign each node to its own group
# For n = 10: groups = 1, 2, 3, ..., 10
# Nodes with the same group number are considered connected
groups <- 1:n


# Create an empty matrix with 2 columns
# Each row will represent one edge: node1, node2
edges <- matrix(nrow = 0, ncol = 2)


# Start at line 2 because line 1 contains n
# Continue through the last line of the input
for(i in 2:length(input)){
  
  # Take one edge, e.g. "1 2"
  # Split it at the space: "1" and "2"
  # [[1]] extracts the resulting vector from the list
  # as.numeric() converts the values from characters to numbers
  edge <- as.numeric(strsplit(input[i], " ")[[1]])
  
  # Add this edge as a new row to the edges matrix
  edges <- rbind(edges, edge)
}


# Loop through every row of the edges matrix
# Each row represents one edge connecting two nodes
for(i in 1:nrow(edges)){
  
  # Get the first node of the current edge
  a <- edges[i,1]
  
  # Get the second node of the current edge
  b <- edges[i,2]
  
  
  # Check whether nodes a and b are already in the same component
  # If their group numbers are different, they belong to different components
  if (groups[a] != groups[b]) {
    
    # Find every node belonging to b's component
    # Then change those nodes to a's group
    # This merges the two connected components together
    groups[which(groups == groups[b])] <- groups[a]
  }
}


# Count how many different group IDs remain
# Each unique group represents one connected component
component <- length(unique(groups))


# To connect C separate components into one tree,
# we need C - 1 additional edges
number_edges <- component - 1


# Print the final answer
print(number_edges)