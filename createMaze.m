function createMaze()
    rows = 41; 
    cols = 41; 
    maze = ones(rows, cols);
    start_row = 2;
    start_col = 2;
    maze(start_row, start_col) = 0;
    maze = generateMaze(start_row, start_col, maze, rows, cols);
    maze(1, 2) = 0; 
    maze(rows, cols - 1) = 0;  
    figure;
    imagesc(maze);
    colormap([1 1 1; 0 0 0]); 
    axis equal off;
    saveas(gcf, 'laberinto.png');
end

function maze = generateMaze(row, col, maze, rows, cols)
    directions = [0 2; 2 0; 0 -2; -2 0];
    directions = directions(randperm(4), :);    
    for i = 1:4
        newRow = row + directions(i, 1);
        newCol = col + directions(i, 2);
        if newRow > 1 && newRow < rows && newCol > 1 && newCol < cols && maze(newRow, newCol) == 1
            maze(newRow - directions(i, 1)/2, newCol - directions(i, 2)/2) = 0;
            maze(newRow, newCol) = 0;
            maze = generateMaze(newRow, newCol, maze, rows, cols);
        end
    end
end
