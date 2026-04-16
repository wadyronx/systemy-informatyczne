function transfer_files(file_list, input_folder, output_folder, operation)

% Ensure the output folder exists
    if ~exist(output_folder, 'dir')
        mkdir(output_folder);
    end
    disp("Start transferring files...");

    % Validate the operation
    if ~ismember(operation, {'copy', 'move'})
        error("Invalid operation. Use 'copy' or 'move'.");
    end

    % Loop through each file in the list
    for i = 1:length(file_list)
        % Construct the full path for the source and destination
        src = fullfile(input_folder, file_list{i});
        dest = fullfile(output_folder, file_list{i});

        % Check if the file exists
        if exist(src, 'file')
            % Copy or move the file based on the provided operation
            if strcmp(operation, 'copy')
                copyfile(src, dest);
            elseif strcmp(operation, 'move')
                movefile(src, dest);
            end
        else
            fprintf('File not found: %s\n', file_list{i});
        end
    end
    disp("Done!");
end