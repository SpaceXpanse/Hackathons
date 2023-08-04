% Return mesh vertices and indices for DeltaGlider artificial horizon
% instrument, either for 2D panel (target='2D') or virtual cockpit
% (target='VC')
% prm contains the transformation parameters to the desired location

function [vtx,idx] = horizon(target,prm)

% texture layout
tex.w =  512;                      % texture width [px]
tex.h = 1024;                      % texture height [px]
tex.hor.w = 154;                   % width of the horizon band in the texture [px]
tex.hor.x0 = tex.w-tex.hor.w-1;    % left edge of the horizon band [px]
tex.hor.x1 = tex.hor.x0+tex.hor.w; % right edge of horizon band [px]
tex.hor.x2 = tex.w-312;            % left edge of bank indicator

u0 = tex.hor.x0/tex.w;             % horizon ribbon tex coords
u1 = tex.hor.x1/tex.w;
ub0 = (tex.hor.x2+0.5)/tex.w;      % bank indicator tex coords
ub1 = (tex.hor.x2+11.5)/tex.w;
vb0 = (tex.h-36)/tex.h;
vb1 = (tex.h-24)/tex.h;
uc0 = 19.5/tex.w;                  % compass ribbon tex coords
uc1 = 0.5/tex.w;
vt0 = (tex.h-20.5)/tex.h;          % readout font tex ccords
vt1 = (tex.h-3.5)/tex.h;
up0 = (tex.w-483)/tex.w;           % cover plate tex coords
up1 = (tex.w-313)/tex.w;
vp0 = (tex.h-1)/tex.h;
vp1 = (tex.h-171)/tex.h;

nml = [0,0,-1];

vtx = [-108,  54,-0.0005,  nml,  u0,0; ...      % horizon display (v-coordinate to be computed dynamically)
        -54, 108,-0.0005,  nml,  u0,0; ...
         54, 108,-0.0005,  nml,  u1,0; ...
        108,  54,-0.0005,  nml,  u1,0; ...
       -108, -54,-0.0005,  nml,  u0,0; ...
        -54,-108,-0.0005,  nml,  u0,0; ...
         54,-108,-0.0005,  nml,  u1,0; ...
        108, -54,-0.0005,  nml,  u1,0; ...
        
         -6,  49,-0.001,   nml,  ub0,vb0; ...   % bank indicator (in 0-deg position)
          6,  49,-0.001,   nml,  ub1,vb0; ...
         -6,  37,-0.001,   nml,  ub0,vb1; ...
          6,  37,-0.001,   nml,  ub1,vb1; ...
          
        -58, -76,-0.001,   nml,  uc0,0; ...     % compass ribbon (v-coordinate to be computed dynamically)
         58, -76,-0.001,   nml,  uc0,0; ...
        -58, -58,-0.001,   nml,  uc1,0; ...
         58, -58,-0.001,   nml,  uc1,0; ...
         
		 28,  58,-0.001,   nml,  0,vt1; ...     % altitude readout (u-coordinate to be computed dynamically)
		 35,  58,-0.001,   nml,  0,vt1; ...
		 28,  70,-0.001,   nml,  0,vt0; ...
		 35,  70,-0.001,   nml,  0,vt0; ...
		 35,  58,-0.001,   nml,  0,vt1; ...
		 42,  58,-0.001,   nml,  0,vt1; ...
		 35,  70,-0.001,   nml,  0,vt0; ...
		 42,  70,-0.001,   nml,  0,vt0; ...
		 42,  58,-0.001,   nml,  0,vt1; ...
		 49,  58,-0.001,   nml,  0,vt1; ...
		 42,  70,-0.001,   nml,  0,vt0; ...
		 49,  70,-0.001,   nml,  0,vt0; ...
		 49,  58,-0.001,   nml,  0,vt1; ...
		 56,  58,-0.001,   nml,  0,vt1; ...
		 49,  70,-0.001,   nml,  0,vt0; ...
		 56,  70,-0.001,   nml,  0,vt0; ...
		 56,  58,-0.001,   nml,  0,vt1; ...
		 63,  58,-0.001,   nml,  0,vt1; ...
		 56,  70,-0.001,   nml,  0,vt0; ...
		 63,  70,-0.001,   nml,  0,vt0; ...
		 63,  58,-0.001,   nml,  0,vt1; ...
		 70,  58,-0.001,   nml,  0,vt1; ...
		 63,  70,-0.001,   nml,  0,vt0; ...
		 70,  70,-0.001,   nml,  0,vt0; ...

		-70,  58,-0.001,   nml,  0,vt1; ...     % speed readout (u-coordinate to be computed dynamically)
		-63,  58,-0.001,   nml,  0,vt1; ...
		-70,  70,-0.001,   nml,  0,vt0; ...
		-63,  70,-0.001,   nml,  0,vt0; ...
		-63,  58,-0.001,   nml,  0,vt1; ...
		-56,  58,-0.001,   nml,  0,vt1; ...
		-63,  70,-0.001,   nml,  0,vt0; ...
		-56,  70,-0.001,   nml,  0,vt0; ...
		-56,  58,-0.001,   nml,  0,vt1; ...
		-49,  58,-0.001,   nml,  0,vt1; ...
		-56,  70,-0.001,   nml,  0,vt0; ...
		-49,  70,-0.001,   nml,  0,vt0; ...
		-49,  58,-0.001,   nml,  0,vt1; ...
		-42,  58,-0.001,   nml,  0,vt1; ...
		-49,  70,-0.001,   nml,  0,vt0; ...
		-42,  70,-0.001,   nml,  0,vt0; ...
		-42,  58,-0.001,   nml,  0,vt1; ...
		-35,  58,-0.001,   nml,  0,vt1; ...
		-42,  70,-0.001,   nml,  0,vt0; ...
		-35,  70,-0.001,   nml,  0,vt0; ...
		-35,  58,-0.001,   nml,  0,vt1; ...
		-28,  58,-0.001,   nml,  0,vt1; ...
		-35,  70,-0.001,   nml,  0,vt0; ...
		-28,  70,-0.001,   nml,  0,vt0; ...
        
		-10.5,-58,-0.001,  nml,  0,vt1; ...     % compass readout (u-coordinate to be computed dynamically)
		 -3.5,-58,-0.001,  nml,  0,vt1; ...
		-10.5,-45,-0.001,  nml,  0,vt0; ...
		 -3.5,-45,-0.001,  nml,  0,vt0; ...
		 -3.5,-58,-0.001,  nml,  0,vt1; ...
		  3.5,-58,-0.001,  nml,  0,vt1; ...
		 -3.5,-45,-0.001,  nml,  0,vt0; ...
		  3.5,-45,-0.001,  nml,  0,vt0; ...
		  3.5,-58,-0.001,  nml,  0,vt1; ...
		 10.5,-58,-0.001,  nml,  0,vt1; ...
		  3.5,-45,-0.001,  nml,  0,vt0; ...
		 10.5,-45,-0.001,  nml,  0,vt0; ...
        
        -85,  -85,-0.002,  nml,  up0,vp0; ...   % cover plate
         85,  -85,-0.002,  nml,  up1,vp0; ...
        -85,   85,-0.002,  nml,  up0,vp1; ...
         85,   85,-0.002,  nml,  up1,vp1];
     
idx = [ 0  5  4;  5  0  1;  1  6  5;  6  1  2;  2  7  6;  7  2  3; ... % horizon display
        8  9 11; 11 10  8; ...                                         % bank indicator
       12 15 13; 15 12 14; ...                                         % compass ribbon
       16 19 17; 19 16 18; 20 23 21; 23 20 22; 24 27 25; 27 24 26; ... % altitude readout
       28 31 29; 31 28 30; 32 35 33; 35 32 34; 36 39 37; 39 36 38; ... %     "
       40 43 41; 43 40 42; 44 47 45; 47 44 46; 48 51 49; 51 48 50; ... % speed readout
       52 55 53; 55 52 54; 56 59 57; 59 56 58; 60 63 61; 63 60 62; ... %     "
       64 67 65; 67 64 66; 68 71 69; 71 68 70; 72 75 73; 75 72 74; ... % compass readout
       76 78 77; 79 77 78];                                            % cover plate

if nargin >= 1 && strcmp(target,'VC')
    disp('Computing horizon instrument for VC');
    vtx = transform_vtx_vc(vtx,prm);    % map vertices
else
    disp('Computing horizon instrument for 2D panel');
    vtx = vtx(1:end-4,:);               % remove cover plate
    vtx = transform_vtx_2d(vtx,prm);    % map vertices
    idx = idx(1:end-2,:);               % remove cover plate
end

end

% ------------------------------------------------------------------------
% Map into virtual cockpit position
function vtx = transform_vtx_vc(vtx,prm)

rad = prm.rad;
tilt = prm.tilt;  % assume tilt around x-axis
cnt = prm.cnt;

scale = rad/108;
cosa = cos(tilt);
sina = sin(tilt);

% transform vertex positions
vtx(:,1) = vtx(:,1)*scale;
vtx(:,2) = vtx(:,2)*scale;
x = vtx(:,1);
y = vtx(:,2)*cosa - vtx(:,3)*sina;
z = vtx(:,2)*sina + vtx(:,3)*cosa;
vtx(:,1) = x + cnt.x;
vtx(:,2) = y + cnt.y;
vtx(:,3) = z + cnt.z;

% transform vertex normals
ny = vtx(:,5)*cosa - vtx(:,6)*sina;
nz = vtx(:,5)*sina + vtx(:,6)*cosa;
vtx(:,5) = ny;
vtx(:,6) = nz;

end

% ------------------------------------------------------------------------
% Map into 2D panel position
function vtx = transform_vtx_2d(vtx,prm)

% coords of horizon instrument centre in panel
xcnt = prm.cnt.x;
ycnt = prm.cnt.y;

% shift position
vtx(:,1) = xcnt+vtx(:,1);
vtx(:,2) = ycnt-vtx(:,2);

% flatten out z-coords
vtx(:,3) = 0;

end
