SizeOfGame = 7; % no magic numbers
num_gen = 56; % could be integers

% alternative: storing every generation
% Life = zeros(SizeOfGame,SizeOfGame,57);

% initialization
Life1 = zeros(SizeOfGame); % dense, not sparse, matrix
Life1(5,3) = 1; % could be logicals
Life1(5,4) = 1;
Life1(5,5) = 1;
Life1(4,5) = 1;
Life1(3,4) = 1;

Life2 = zeros(SizeOfGame);

Display_time = 0.1;

% display
imagesc(Life1);
% grid('on');
drawnow;
pause(Display_time);

generation = 1;
% computation and animation loop
while generation <= num_gen
%     alternative: storing every generation
%     [Life(:,:,generation),Life(:,:,generation + 1)] = ...
%         advance(Life(:,:,generation),Life(:,:,generation + 1))
    if mod(generation,2) == 1
        [Life1,Life2] = advance(Life1,Life2);
        imagesc(Life2);
        drawnow;
        pause(Display_time);
    else % == 0
        [Life2,Life1] = advance(Life2,Life1);
        imagesc(Life1);
        drawnow;
        pause(Display_time);
    end

    generation = generation + 1;
end

function [Life1,Life2] = advance(Life1,Life2)
% passing by reference
% buffers

% function Life2 = advance(Life1)
% passing by value:
% 1) create a temporary copy of Life1
% 2) creates Life2
% 3) deletes the temporary of Life1

size_univ = size(Life1,1);

living_neighbors = 0;
% cache performance
for row = 1:size_univ
    for col = 1:size_univ
        % counting the living neighbors
        if row - 1 == 0
            new_row = size_univ;
        else
            new_row = row - 1;
        end
        if Life1(new_row,col) == 1
            living_neighbors = living_neighbors + 1;
        end
        if row + 1 == size_univ + 1
            new_row = 1;
        else
            new_row = row + 1;
        end
        if Life1(new_row,col) == 1
            living_neighbors = living_neighbors + 1;
        end
        if col - 1 == 0
            new_col = size_univ;
        else
            new_col = col - 1;
        end
        if Life1(row,new_col) == 1
            living_neighbors = living_neighbors + 1;
        end
        if col + 1 == size_univ + 1
            new_col = 1;
        else
            new_col = col + 1;
        end
        if Life1(row,new_col) == 1
            living_neighbors = living_neighbors + 1;
        end
        if row - 1 == 0
            new_row = size_univ;
        else
            new_row = row - 1;
        end
        if col - 1 == 0
            new_col = size_univ;
        else
            new_col = col - 1;
        end
        if Life1(new_row,new_col) == 1
            living_neighbors = living_neighbors + 1;
        end
        if row - 1 == 0
            new_row = size_univ;
        else
            new_row = row - 1;
        end
        if col + 1 == size_univ + 1
            new_col = 1;
        else
            new_col = col + 1;
        end
        if Life1(new_row,new_col) == 1
            living_neighbors = living_neighbors + 1;
        end
        if row + 1 == size_univ + 1
            new_row = 1;
        else
            new_row = row + 1;
        end
        if col - 1 == 0
            new_col = size_univ;
        else
            new_col = col - 1;
        end
        if Life1(new_row,new_col) == 1
            living_neighbors = living_neighbors + 1;
        end
        if row + 1 == size_univ + 1
            new_row = 1;
        else
            new_row = row + 1;
        end
        if col + 1 == size_univ + 1
            new_col = 1;
        else
            new_col = col + 1;
        end
        if Life1(new_row,new_col) == 1
            living_neighbors = living_neighbors + 1;
        end
        
        % applying the rules
        if Life1(row,col)==1
            if (living_neighbors == 0 || living_neighbors == 1)
                Life2(row,col)=0; %% die underpopulation
            elseif (living_neighbors == 2 || living_neighbors == 3)
                Life2(row,col)=1; %% survival
            elseif (living_neighbors >= 4)
                Life2(row,col)=0; %% death from overpopulation
            end
        else % Life1(row,col)==0
            if (living_neighbors == 3)
                Life2(row,col)=1; %% birth by reproduction
            else
                Life2(row,col)=0;
            end
        end %% ifend
        
        living_neighbors = 0;
    end
end
